# 📱 SJ ORDER APP - SETUP GUIDE LENGKAP

Panduan lengkap untuk setup dan menjalankan aplikasi SJ Order (Flutter + Laravel Backend).

## 📋 Daftar Isi

1. [Prerequisites](#prerequisites)
2. [Setup Backend Laravel](#setup-backend-laravel)
3. [Setup Frontend Flutter](#setup-frontend-flutter)
4. [Database Configuration](#database-configuration)
5. [Running the Application](#running-the-application)
6. [Testing Features](#testing-features)
7. [Troubleshooting](#troubleshooting)

---

## Prerequisites

Pastikan Anda sudah menginstall:

### Backend Requirements
- **PHP** 8.1 atau lebih tinggi
  - Download: https://www.php.net/downloads
  - Atau gunakan: XAMPP, WAMP, atau Laragon
  
- **Composer** (Package Manager PHP)
  - Download: https://getcomposer.org/download/
  
- **MySQL** 5.7 atau lebih tinggi
  - Included dalam XAMPP/WAMP/Laragon
  - Atau download: https://www.mysql.com/downloads/mysql/

### Frontend Requirements
- **Flutter SDK** 3.10 atau lebih tinggi
  - Download: https://flutter.dev/docs/get-started/install
  
- **Android Studio** atau **VS Code**
  - Android Studio: https://developer.android.com/studio
  - VS Code: https://code.visualstudio.com/

- **Git**
  - Download: https://git-scm.com/download/win

### Verify Installations

Buka Command Prompt dan cek:

```bash
# Check PHP
php -v

# Check Composer
composer -v

# Check MySQL
mysql --version

# Check Flutter
flutter --version

# Check Git
git --version
```

---

## Setup Backend Laravel

### Step 1: Clone atau Download Repository

**Option A: Clone dari GitHub**
```bash
git clone https://github.com/naya030326-del/sj-order-api.git
cd sj-order-api
```

**Option B: Download ZIP**
1. Download dari GitHub
2. Extract ke: `C:\laravel-project\sj-order-api`
3. Buka Command Prompt di folder tersebut

### Step 2: Install Dependencies

```bash
composer install
```

**Expected output:**
```
Loading composer repositories with package cache
Installing dependencies...
```

### Step 3: Setup Environment File

```bash
# Copy environment example
copy .env.example .env

# Atau jika menggunakan Linux/Mac:
cp .env.example .env
```

Edit file `.env` dan sesuaikan konfigurasi database:

```env
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=bookingappdb
DB_USERNAME=root
DB_PASSWORD=
```

### Step 4: Generate Application Key

```bash
php artisan key:generate
```

**Expected output:**
```
Application key set successfully.
```

### Step 5: Create Database

Buka phpMyAdmin atau MySQL command:

**Via phpMyAdmin (XAMPP):**
1. Buka: http://localhost/phpmyadmin
2. Click "New"
3. Database name: `bookingappdb`
4. Collation: `utf8mb4_unicode_ci`
5. Click "Create"

**Via MySQL Command:**
```bash
mysql -u root -p
# Masukkan password jika ada (default kosong)

CREATE DATABASE bookingappdb CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
EXIT;
```

### Step 6: Run Migrations

```bash
php artisan migrate
```

**Expected output:**
```
Migration table created successfully.
Migrating: 2024_01_01_000000_create_users_table
...
Migrated successfully.
```

### Step 7: Seed Database (Optional)

```bash
php artisan db:seed
```

### Step 8: Generate Sanctum Token Secret

```bash
php artisan migrate:fresh --seed
```

### Step 9: Start Laravel Server

```bash
php artisan serve
```

**Expected output:**
```
Starting Laravel development server: http://127.0.0.1:8000
```

Server sekarang berjalan di: **http://localhost:8000**

---

## Setup Frontend Flutter

### Step 1: Clone atau Download Repository

**Option A: Clone dari GitHub**
```bash
git clone https://github.com/naya030326-del/sj-order-app.git
cd sj_order_app
```

**Option B: Download ZIP**
1. Download dari GitHub
2. Extract ke folder
3. Buka Command Prompt di folder tersebut

### Step 2: Get Flutter Dependencies

```bash
flutter pub get
```

**Expected output:**
```
Running "flutter pub get" in sj_order_app...
Running pub upgrade...
Process finished with exit code 0
```

### Step 3: Setup Environment File

```bash
# Copy dari contoh
copy .env.example .env

# Edit .env
```

Edit file `.env`:

```env
API_BASE_URL=http://localhost:8000/api
API_TIMEOUT=30
```

**PENTING:** Untuk Android emulator, gunakan:
```env
API_BASE_URL=http://10.0.2.2:8000/api
```

### Step 4: Check Flutter Setup

```bash
flutter doctor
```

**Expected output:**
```
Doctor summary (to see all details, run flutter doctor -v):
[✓] Flutter (Channel stable, 3.10.0, ...)
[✓] Android toolchain - develop for Android devices
[✓] VS Code (version 1.xx)
[✓] Connected device (1 available)
```

Pastikan semua item berTanda ✓

### Step 5: Create Android Virtual Device (Jika belum ada)

```bash
flutter emulators
```

Jika belum ada emulator:
```bash
flutter emulators --launch Pixel_4_API_30
```

---

## Database Configuration

### Database Structure

Aplikasi ini menggunakan 7 tabel utama:

1. **users** - Data user (karyawan, admin)
2. **divisions** - Data divisi/departemen
3. **rooms** - Data ruangan kantor
4. **vehicles** - Data kendaraan kantor
5. **bookings** - Data pemesanan
6. **bookings_approval** - History approval
7. **personal_access_tokens** - Token untuk authentication

### Default User (Seeding)

Jika sudah run seeder, ada default users:

| Email | Password | Role |
|-------|----------|------|
| admin@example.com | password | admin |
| staff@example.com | password | staff |
| leader@example.com | password | head_division |

---

## Running the Application

### Terminal 1: Start Laravel Backend

```bash
cd C:\laravel-project\sj-order-api
php artisan serve
```

Server akan berjalan di: **http://localhost:8000**

### Terminal 2: Start Flutter App

```bash
cd C:\Users\naya\AndroidStudioProjects\sj_order_app
flutter run
```

Aplikasi akan launch di emulator atau device yang connected.

### Verify Backend is Running

Buka browser:
```
http://localhost:8000/api/user
```

Expected error (normal, butuh token):
```json
{
  "message": "Unauthenticated."
}
```

Ini berarti backend berjalan dengan benar ✅

---

## Testing Features

### Login Test

1. **Open Flutter App**
2. **Click "Login"**
3. **Enter credentials:**
   - Email: `admin@example.com`
   - Password: `password`
4. **Click "Masuk"**

Expected: Login berhasil, masuk ke dashboard

### Create Booking Test

1. **After login, click "Buat Pemesanan"**
2. **Fill form:**
   - Booking Type: Ruangan
   - Select Room
   - Select Date
   - Select Time
   - Purpose: Test booking
   - Participants: 5
3. **Click "Kirim"**

Expected: Booking created successfully

### Test Double-Booking Prevention

1. **Try create booking di room yang sama dengan time overlap**
2. **Expected:** Error message "Ruangan telah terbooking"

### Admin Approval Test

1. **Login as admin** (admin@example.com)
2. **Open "Dashboard Admin"**
3. **Click booking yang pending**
4. **Click "Approve"**
5. **Expected:** Booking status changed to approved

### Test Reject

1. **Click booking lain**
2. **Click "Reject"**
3. **Enter rejection reason**
4. **Click "Tolak"**
5. **Expected:** Booking status changed to rejected

---

## Troubleshooting

### Error: "Connection refused" pada login

**Masalah:** Backend tidak running

**Solusi:**
```bash
# Ensure backend server running
cd C:\laravel-project\sj-order-api
php artisan serve
```

### Error: "SQLSTATE[28000]: Invalid authorization specification"

**Masalah:** Database credentials salah

**Solusi:**
1. Check `.env` database settings
2. Verify MySQL running
3. Restart Laravel server

```bash
php artisan cache:clear
php artisan serve
```

### Error: "Undefined class 'Timer'" di Flutter

**Masalah:** Missing import

**Solusi:** Add di file yang error:
```dart
import 'dart:async';
```

### Flutter App tidak bisa connect ke Backend

**Masalah:** API URL salah

**Solusi:**
1. Check `.env` file
2. Untuk Android emulator, gunakan: `http://10.0.2.2:8000/api`
3. Untuk physical device, gunakan IP address komputer

### Database Error saat Migration

**Masalah:** MySQL tidak running

**Solusi:**
```bash
# Jalankan XAMPP Control Panel
# Start MySQL dari sana

# Atau cek MySQL service running
```

### Port 8000 already in use

**Masalah:** Port 8000 sudah digunakan

**Solusi:**
```bash
# Gunakan port lain
php artisan serve --port=8001
```

---

## Project Structure

```
sj-order-api/ (Backend)
├── app/
│   ├── Models/
│   ├── Controllers/
│   ├── Traits/
│   └── Providers/
├── database/
│   ├── migrations/
│   └── seeders/
├── routes/
│   └── api.php
├── .env
├── artisan
└── composer.json

sj_order_app/ (Frontend)
├── lib/
│   ├── screens/
│   ├── providers/
│   ├── models/
│   └── main.dart
├── android/
├── ios/
├── pubspec.yaml
└── .env
```

---

## Important Notes

1. **Keep Backend Running:** Backend harus selalu running untuk app berfungsi
2. **Clear Cache:** Jika ada error, coba: `php artisan cache:clear`
3. **Rebuild Flutter:** Jika ada error: `flutter clean && flutter pub get && flutter run`
4. **Database:** Jangan hapus `.env` file
5. **Tokens:** Token expire setelah beberapa jam, harus login ulang

---

## Additional Resources

- Flutter Documentation: https://flutter.dev/docs
- Laravel Documentation: https://laravel.com/docs
- PHP Documentation: https://www.php.net/docs.php
- MySQL Documentation: https://dev.mysql.com/doc/

---

## Need Help?

Jika mengalami masalah:

1. Check error message di console
2. Review troubleshooting section
3. Ensure semua prerequisites sudah installed
4. Try `flutter doctor` dan `php artisan tinker`

---

**Happy coding!** 🚀

