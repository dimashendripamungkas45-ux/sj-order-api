# 🔧 FIX REJECT PEMESANAN - ERROR SQLSTATE

## ❌ MASALAH

Saat reject pemesanan, muncul error:
```
SQLSTATE[01000]: Warning: 1265 Data truncated for column 'status'
```

## 🔍 PENYEBAB

Status column di bookings table menggunakan ENUM dengan values:
- `pending_division`
- `pending_ga`
- `approved`
- `rejected` ← Valid value

Masalahnya: Code menggunakan `rejected_ga` yang TIDAK ada di ENUM!

## ✅ SOLUSI DITERAPKAN

**File:** `C:\laravel-project\sj-order-api\app\Http\Controllers\Api\BookingController.php`

**Change di method `approveDivum()`:**

```php
// BEFORE (❌ WRONG):
'status' => 'rejected_ga',

// AFTER (✅ CORRECT):
'status' => 'rejected',
```

---

## 📋 VALID STATUS VALUES

```
Workflow Status:
pending_division → division_approval_by ≤ person can approve/reject
pending_ga → ga_approval_by ≤ admin/ga can approve/reject
approved → Final state
rejected → Final state (rejected by anyone)
```

---

## ✅ FIX APPLIED

- [x] Changed `rejected_ga` → `rejected`
- [x] Added `rejection_reason` field
- [x] Added logging untuk track
- [x] Error handling sudah ada

---

## 🧪 TEST

### Test Reject Pemesanan:
```bash
curl -X PUT "http://localhost:8000/api/bookings/1/approve-divum" \
  -H "Authorization: Bearer ADMIN_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "action": "reject",
    "notes": "Alasan rejection di sini"
  }'
```

Expected: 
```json
{
  "success": true,
  "message": "Booking rejected successfully",
  "data": {...}
}
```

---

## 🚀 LANGKAH BERIKUTNYA

1. Clear cache Laravel:
```bash
cd C:\laravel-project\sj-order-api
php artisan cache:clear
php artisan serve
```

2. Test reject pemesanan via Flutter app

3. Verify status berubah ke `rejected` di database

---

## ✅ STATUS

✅ Backend fix applied
⏳ Test dan verify reject function bekerja
⏳ Approve function juga harus ditambah untuk division approval

---

## 📝 NOTES

### Status Workflow:
```
Create Booking
  ↓
Status: pending_division
  ↓
Division Lead approve/reject → approveDivision() NEEDED
  ↓
If approved → Status: pending_ga
  ↓
GA/Admin approve/reject → approveDivum() ✅ FIXED
  ↓
Final Status: approved OR rejected
```

**Catatan:** Masih perlu buat method `approveDivision()` untuk division leader approval!

