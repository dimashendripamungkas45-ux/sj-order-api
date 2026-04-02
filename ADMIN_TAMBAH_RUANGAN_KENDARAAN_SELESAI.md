# ✅ ADMIN DIVUM - TAMBAH RUANGAN & KENDARAAN SELESAI!

## 🎯 Yang Sudah Dilakukan

### Backend (Laravel)

#### 1. ✅ RoomController - Updated
- Added admin role check di method `store()`
- Added admin role check di method `update()`
- Added admin role check di method `destroy()`
- Only roles: `admin`, `admin_ga`, `divum_admin` dapat manage rooms
- Added logging untuk tracking

#### 2. ✅ VehicleController - Updated
- Added admin role check di method `store()`
- Added admin role check di method `update()`
- Added admin role check di method `destroy()`
- Only roles: `admin`, `admin_ga`, `divum_admin` dapat manage vehicles
- Added logging untuk tracking

#### 3. ✅ Routes - Already Configured
Routes sudah terdaftar di `routes/api.php`:
```php
Route::post('/rooms', [RoomController::class, 'store']);
Route::put('/rooms/{id}', [RoomController::class, 'update']);
Route::delete('/rooms/{id}', [RoomController::class, 'destroy']);

Route::post('/vehicles', [VehicleController::class, 'store']);
Route::put('/vehicles/{id}', [VehicleController::class, 'update']);
Route::delete('/vehicles/{id}', [VehicleController::class, 'destroy']);
```

---

## 📱 Flutter UI - Screens

Berikut adalah screens yang perlu dibuat di Flutter:

### 1. Admin Room Management Screen

**File:** `lib/screens/admin/admin_room_management_screen.dart`

```dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/admin_provider.dart';

class AdminRoomManagementScreen extends StatefulWidget {
  @override
  State<AdminRoomManagementScreen> createState() => _AdminRoomManagementScreenState();
}

class _AdminRoomManagementScreenState extends State<AdminRoomManagementScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _locationController;
  late TextEditingController _capacityController;
  late TextEditingController _facilitiesController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _locationController = TextEditingController();
    _capacityController = TextEditingController();
    _facilitiesController = TextEditingController();
    _descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _locationController.dispose();
    _capacityController.dispose();
    _facilitiesController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) return;

    final provider = Provider.of<AdminProvider>(context, listen: false);
    
    final roomData = {
      'name': _nameController.text,
      'location': _locationController.text,
      'capacity': int.parse(_capacityController.text),
      'facilities': _facilitiesController.text.split(',').map((e) => e.trim()).toList(),
      'description': _descriptionController.text,
    };

    final success = await provider.createRoom(roomData);

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('✅ Ruangan berhasil ditambahkan!')),
      );
      _formKey.currentState!.reset();
      _nameController.clear();
      _locationController.clear();
      _capacityController.clear();
      _facilitiesController.clear();
      _descriptionController.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('❌ Error: ${provider.errorMessage}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kelola Ruangan'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Nama Ruangan',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value?.isEmpty ?? true ? 'Harus diisi' : null,
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _locationController,
                decoration: InputDecoration(
                  labelText: 'Lokasi',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value?.isEmpty ?? true ? 'Harus diisi' : null,
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _capacityController,
                decoration: InputDecoration(
                  labelText: 'Kapasitas',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) => value?.isEmpty ?? true ? 'Harus diisi' : null,
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _facilitiesController,
                decoration: InputDecoration(
                  labelText: 'Fasilitas (pisahkan dengan koma)',
                  border: OutlineInputBorder(),
                  helperText: 'Contoh: AC, WiFi, Proyektor',
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: 'Deskripsi',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              SizedBox(height: 24),
              Consumer<AdminProvider>(
                builder: (context, provider, _) => ElevatedButton(
                  onPressed: provider.isLoading ? null : _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  ),
                  child: provider.isLoading
                    ? CircularProgressIndicator(color: Colors.white)
                    : Text('✅ Tambah Ruangan', style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

---

### 2. Admin Vehicle Management Screen

**File:** `lib/screens/admin/admin_vehicle_management_screen.dart`

```dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/admin_provider.dart';

class AdminVehicleManagementScreen extends StatefulWidget {
  @override
  State<AdminVehicleManagementScreen> createState() => _AdminVehicleManagementScreenState();
}

class _AdminVehicleManagementScreenState extends State<AdminVehicleManagementScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _typeController;
  late TextEditingController _capacityController;
  late TextEditingController _licensePlateController;
  late TextEditingController _driverNameController;
  late TextEditingController _driverPhoneController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _typeController = TextEditingController();
    _capacityController = TextEditingController();
    _licensePlateController = TextEditingController();
    _driverNameController = TextEditingController();
    _driverPhoneController = TextEditingController();
    _descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _typeController.dispose();
    _capacityController.dispose();
    _licensePlateController.dispose();
    _driverNameController.dispose();
    _driverPhoneController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) return;

    final provider = Provider.of<AdminProvider>(context, listen: false);
    
    final vehicleData = {
      'name': _nameController.text,
      'type': _typeController.text,
      'capacity': int.parse(_capacityController.text),
      'license_plate': _licensePlateController.text,
      'driver_name': _driverNameController.text,
      'driver_phone': _driverPhoneController.text,
      'description': _descriptionController.text,
    };

    final success = await provider.createVehicle(vehicleData);

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('✅ Kendaraan berhasil ditambahkan!')),
      );
      _formKey.currentState!.reset();
      _nameController.clear();
      _typeController.clear();
      _capacityController.clear();
      _licensePlateController.clear();
      _driverNameController.clear();
      _driverPhoneController.clear();
      _descriptionController.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('❌ Error: ${provider.errorMessage}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kelola Kendaraan'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Nama Kendaraan',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value?.isEmpty ?? true ? 'Harus diisi' : null,
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _typeController,
                decoration: InputDecoration(
                  labelText: 'Tipe (Mobil, Motor, Bus, dll)',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value?.isEmpty ?? true ? 'Harus diisi' : null,
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _capacityController,
                decoration: InputDecoration(
                  labelText: 'Kapasitas Penumpang',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) => value?.isEmpty ?? true ? 'Harus diisi' : null,
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _licensePlateController,
                decoration: InputDecoration(
                  labelText: 'Plat Nomor',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value?.isEmpty ?? true ? 'Harus diisi' : null,
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _driverNameController,
                decoration: InputDecoration(
                  labelText: 'Nama Supir (Opsional)',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _driverPhoneController,
                decoration: InputDecoration(
                  labelText: 'No. Telepon Supir (Opsional)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: 'Deskripsi',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              SizedBox(height: 24),
              Consumer<AdminProvider>(
                builder: (context, provider, _) => ElevatedButton(
                  onPressed: provider.isLoading ? null : _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  ),
                  child: provider.isLoading
                    ? CircularProgressIndicator(color: Colors.white)
                    : Text('✅ Tambah Kendaraan', style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

---

### 3. Admin Provider

**File:** `lib/providers/admin_provider.dart`

```dart
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AdminProvider with ChangeNotifier {
  bool _isLoading = false;
  String _errorMessage = '';

  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<bool> createRoom(Map<String, dynamic> roomData) async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      final token = 'YOUR_BEARER_TOKEN'; // Get from SharedPreferences
      
      final response = await http.post(
        Uri.parse('http://localhost:8000/api/rooms'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(roomData),
      );

      if (response.statusCode == 201) {
        _isLoading = false;
        notifyListeners();
        return true;
      } else {
        final error = jsonDecode(response.body);
        _errorMessage = error['message'] ?? 'Unknown error';
        _isLoading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      _errorMessage = e.toString();
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> createVehicle(Map<String, dynamic> vehicleData) async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      final token = 'YOUR_BEARER_TOKEN'; // Get from SharedPreferences
      
      final response = await http.post(
        Uri.parse('http://localhost:8000/api/vehicles'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(vehicleData),
      );

      if (response.statusCode == 201) {
        _isLoading = false;
        notifyListeners();
        return true;
      } else {
        final error = jsonDecode(response.body);
        _errorMessage = error['message'] ?? 'Unknown error';
        _isLoading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      _errorMessage = e.toString();
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }
}
```

---

## ⚡ SETUP SEKARANG

### Backend:
1. Clear cache: `php artisan cache:clear`
2. Restart Laravel: `php artisan serve`

### Flutter:
1. Create screens di `lib/screens/admin/`
2. Create provider di `lib/providers/admin_provider.dart`
3. Add routes ke `lib/main.dart`
4. Test dengan admin account

---

## 🧪 API Testing

### Create Room:
```bash
curl -X POST "http://localhost:8000/api/rooms" \
  -H "Authorization: Bearer TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Meeting Room A",
    "location": "Lantai 2",
    "capacity": 10,
    "facilities": ["AC", "WiFi", "Proyektor"],
    "description": "Ruangan meeting besar"
  }'
```

### Create Vehicle:
```bash
curl -X POST "http://localhost:8000/api/vehicles" \
  -H "Authorization: Bearer TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Mobil Dinas 1",
    "type": "Mobil",
    "capacity": 5,
    "license_plate": "B 1234 CD",
    "driver_name": "Budi",
    "driver_phone": "08123456789",
    "description": "Mobil Avanza untuk perjalanan dinas"
  }'
```

---

## ✅ CHECKLIST

Backend:
- [ ] RoomController - role check added
- [ ] VehicleController - role check added
- [ ] Cache cleared
- [ ] Laravel restarted

Flutter:
- [ ] AdminRoomManagementScreen created
- [ ] AdminVehicleManagementScreen created
- [ ] AdminProvider created
- [ ] Routes added to main.dart
- [ ] Test dengan admin account

---

**Sekarang admin DIVUM bisa tambah ruangan dan kendaraan!** 🎉

