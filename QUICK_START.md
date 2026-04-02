# 📖 PANDUAN SINGKAT - Mulai Aplikasi dalam 10 Menit

File ini adalah ringkasan cepat. Untuk tutorial LENGKAP, baca: **SETUP_GUIDE.md**

---

## ⚡ Quick Start (10 Menit)

### Terminal 1: Mulai Backend (5 menit)

```bash
cd C:\laravel-project\sj-order-api

# Install dependencies
composer install

# Setup environment
copy .env.example .env

# Generate key
php artisan key:generate

# Setup database (pastikan MySQL running)
php artisan migrate

# Start server
php artisan serve
```

**Expected:** Server running at http://localhost:8000

---

### Terminal 2: Mulai Frontend (5 menit)

```bash
cd C:\Users\dimas\AndroidStudioProjects\sj_order_app

# Get dependencies
flutter pub get

# Setup environment
copy .env.example .env

# Run app
flutter run
```

**Expected:** App launch di emulator

---

## 🔐 Default Login

```
Email: admin@example.com
Password: password
```

---

## ✅ Verify Both Running

**Backend:** Open http://localhost:8000/api/user
- Should show: `{"message":"Unauthenticated."}` ✅

**Frontend:** App should open on emulator ✅

---

## 🧪 Test Features (5 menit)

1. **Login** → Click "Masuk"
2. **Create Booking** → Click "Buat Pemesanan"
3. **Check Availability** → Select room & time
4. **Submit** → Booking created ✅

---

## 🐛 Quick Troubleshooting

| Problem | Solution |
|---------|----------|
| "Connection refused" | Ensure backend running: `php artisan serve` |
| "Database error" | Check .env database settings |
| "App stuck" | Check backend is running, then: `flutter clean && flutter pub get && flutter run` |
| "Port 8000 in use" | Use different port: `php artisan serve --port=8001` |

---

## 📁 File Structure

```
Backend: C:\laravel-project\sj-order-api\
Frontend: C:\Users\dimas\AndroidStudioProjects\sj_order_app\
```

---

## 📚 For Full Documentation

👉 **Read: SETUP_GUIDE.md** (600+ lines dengan detail lengkap)

---

**That's it! Happy coding!** 🚀

