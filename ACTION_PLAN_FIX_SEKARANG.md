# 🎯 ACTION PLAN - FIX DOUBLE-BOOKING SEKARANG

## ⚡ QUICK FIX (5 MENIT)

```bash
# Terminal 1: Backend directory
cd C:\laravel-project\sj-order-api

# Step 1: Clear all cache
php artisan cache:clear
php artisan config:clear
php artisan route:clear

# Step 2: Restart Laravel
php artisan serve
```

**Expected:** Server running di `http://localhost:8000`

---

## 🧪 VERIFY (2 MENIT)

### Check 1: Route tersedia
```bash
php artisan route:list | grep booking
```

**Harus ada baris:**
```
GET|HEAD   /api/bookings/check-availability
```

### Check 2: Test API
```bash
curl -X GET "http://localhost:8000/api/bookings/check-availability" \
  -H "Authorization: Bearer YOUR_BEARER_TOKEN" \
  -G \
  --data-urlencode "booking_type=room" \
  --data-urlencode "room_id=1" \
  --data-urlencode "booking_date=2026-03-31" \
  --data-urlencode "start_time=09:00" \
  --data-urlencode "end_time=10:00"
```

**Expected:** Response 422 dengan message "Ruangan telah terbooking"

---

## 📱 TEST DENGAN FLUTTER APP (5 MENIT)

1. Restart Flutter app
2. Coba buat booking: 
   - Room 1
   - 2026-03-31
   - 09:00-10:00
   - Purpose: "Test"
3. **Expected:** Error notification "Ruangan telah terbooking"

---

## 🔄 WORKFLOW SETELAH FIX

```
User Create Booking
  ↓
Flutter Call: POST /api/bookings
  ↓
BookingController::store()
  ↓
isTimeSlotAvailable() [dari Trait]
  ↓
├─ CONFLICT DITEMUKAN
│   └─ Return 422 Error
│   └─ Flutter show error
│
└─ NO CONFLICT
    └─ Booking::create()
    └─ Return 201 Success
    └─ Flutter show success
```

---

## ✅ FINAL CHECKLIST

- [ ] `php artisan cache:clear` sudah dijalankan
- [ ] `php artisan route:clear` sudah dijalankan
- [ ] Laravel server restart: `php artisan serve`
- [ ] Route `/api/bookings/check-availability` ada
- [ ] Test API dengan curl ✓
- [ ] Flutter app restart
- [ ] Test create booking dengan conflict
- [ ] Expected error 422 muncul
- [ ] Double-booking TIDAK bisa terjadi lagi ✓

---

**EXECUTE THIS NOW dan report hasilnya!**

Jika masih ada issue:
1. Check file: `DEBUG_MASIH_BISA_DOUBLE_BOOKING.md`
2. Follow troubleshooting guide
3. Report error message yang muncul

