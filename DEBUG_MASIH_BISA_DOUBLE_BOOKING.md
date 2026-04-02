# ✅ DEBUGGING - MASIH BISA DOUBLE-BOOKING?

## 🔍 Kemungkinan Penyebab & Solusi

### 1. ❌ Route tidak ter-register
**Status:** ✅ FIXED - Baru ditambahkan route checkAvailability

Verifikasi:
```bash
php artisan route:list | grep booking
```

Expected output:
```
GET|HEAD   /api/bookings
GET|HEAD   /api/bookings/check-availability ← HARUS ADA INI
POST       /api/bookings
GET|HEAD   /api/bookings/{id}
```

---

### 2. ❌ Cache Laravel masih lama
**Solusi:**
```bash
cd C:\laravel-project\sj-order-api
php artisan cache:clear
php artisan config:clear
php artisan route:clear
```

---

### 3. ❌ Trait belum ter-load
**Verify:**
```bash
# Check apakah trait file ada
ls -la C:\laravel-project\sj-order-api\app\Traits\BookingScheduleValidator.php
```

Expected: File ada dan ter-load

---

### 4. ❌ Status booking tidak 'approved'
**Masalah:** Conflict checking HANYA check booking dengan status 'approved'

**Verifikasi di database:**
```sql
SELECT COUNT(*) FROM bookings WHERE status = 'approved';
```

**Jika tidak ada approved bookings:**
- Approve manual beberapa booking di database
- Atau buat booking baru, lalu approve via API

---

### 5. ❌ Time format salah
**Database time columns harus:**
- Type: `TIME` 
- Format: `HH:mm:ss` atau `HH:mm`

**Verifikasi:**
```sql
DESCRIBE bookings;
-- Lihat kolom: start_time, end_time
-- Harus type TIME
```

---

## 🧪 TESTING LANGKAH DEMI LANGKAH

### Step 1: Clear cache & restart
```bash
cd C:\laravel-project\sj-order-api
php artisan cache:clear
php artisan config:clear
php artisan route:clear
php artisan serve
```

### Step 2: Verify route ada
```bash
php artisan route:list | grep check-availability
```

Expected: Route ada dan endpoint accessible

### Step 3: Test dengan booking yang APPROVED
```bash
# Query database untuk find approved booking
SELECT id, room_id, booking_date, start_time, end_time FROM bookings 
WHERE status = 'approved' LIMIT 1;
```

Expected result: Ada minimal 1 approved booking

### Step 4: Test API check-availability
```bash
curl -X GET "http://localhost:8000/api/bookings/check-availability" \
  -H "Authorization: Bearer YOUR_TOKEN" \
  -G \
  --data-urlencode "booking_type=room" \
  --data-urlencode "room_id=ROOM_ID_DARI_STEP3" \
  --data-urlencode "booking_date=BOOKING_DATE_DARI_STEP3" \
  --data-urlencode "start_time=START_TIME_DARI_STEP3" \
  --data-urlencode "end_time=END_TIME_DARI_STEP3"
```

**Expected:** Response error 422 "Ruangan telah terbooking"

### Step 5: Test create booking dengan conflict
```bash
curl -X POST "http://localhost:8000/api/bookings" \
  -H "Authorization: Bearer YOUR_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "booking_type": "room",
    "room_id": ROOM_ID,
    "booking_date": "BOOKING_DATE",
    "start_time": "START_TIME",
    "end_time": "END_TIME",
    "purpose": "Test conflict",
    "participants_count": 1
  }'
```

**Expected:** Error 422 "Slot tidak tersedia"

---

## 📊 VERIFICATION CHECKLIST

- [ ] Route checkAvailability sudah di routes/api.php
- [ ] php artisan cache:clear sudah dijalankan
- [ ] php artisan serve running
- [ ] Ada minimal 1 approved booking di database
- [ ] Time format benar (HH:mm)
- [ ] Trait BookingScheduleValidator ter-load
- [ ] Method store() punya conflict checking
- [ ] Method checkAvailability() ada

---

## 🔧 DEBUG LOGS

Monitor logs untuk debugging:
```bash
tail -f C:\laravel-project\sj-order-api\storage\logs\laravel.log
```

Cari logs:
```
[Conflict Check] Parameters
[Conflict Check] Query Result
[CONFLICT DETECTED]
[Slot Available]
Time slot not available
```

---

## ⚠️ JIKA MASIH TIDAK BEKERJA

### Kemungkinan:
1. **Bookings tidak ada status 'approved'**
   - Solution: Buat booking baru dan approve via API

2. **Dates tidak match**
   - Solution: Pastikan test date sudah ada di database

3. **Times tidak format HH:mm**
   - Solution: Check database time format

4. **Cache masih tersimpan**
   - Solution: Restart Apache/PHP service

---

## 🚀 AFTER FIXED

Setelah double-booking fixed:
1. ✅ Tidak bisa create booking dengan jam bentrok
2. ✅ Error message jelas "Ruangan telah terbooking"
3. ✅ Show conflict details (jam bentrok, siapa yang booking)
4. ✅ Buffer 30 menit diterapkan

---

**Lakukan testing checklist di atas dan report hasilnya!**

