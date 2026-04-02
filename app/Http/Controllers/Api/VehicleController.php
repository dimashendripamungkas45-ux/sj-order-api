<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Vehicle;
use Illuminate\Http\Request;

class VehicleController extends Controller
{
    /**
     * Get all active vehicles
     */
    public function index(Request $request)
    {
        $user = auth('sanctum')->user();

        if (!$user) {
            return response()->json([
                'success' => false,
                'message' => 'Unauthorized'
            ], 401);
        }

        try {
            $vehicles = Vehicle::where('is_active', true)
                ->select('id', 'name', 'type', 'capacity', 'description', 'driver_name', 'driver_phone', 'license_plate')
                ->get();

            return response()->json([
                'success' => true,
                'data' => $vehicles,
                'message' => 'Vehicles fetched successfully'
            ], 200);

        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Error: ' . $e->getMessage()
            ], 500);
        }
    }

    /**
     * Create a new vehicle (ADMIN ONLY)
     */
    public function store(Request $request)
    {
        $user = auth('sanctum')->user();

        if (!$user) {
            return response()->json([
                'success' => false,
                'message' => 'Unauthorized'
            ], 401);
        }

        // ✅ CHECK: Only admin can create vehicles
        if ($user->role !== 'admin' && $user->role !== 'admin_ga' && $user->role !== 'divum_admin') {
            return response()->json([
                'success' => false,
                'message' => 'Only admins can create vehicles'
            ], 403);
        }

        try {
            $validated = $request->validate([
                'name' => 'required|string|max:100|unique:vehicles',
                'type' => 'required|string|max:50',
                'capacity' => 'required|integer|min:1',
                'license_plate' => 'required|string|unique:vehicles',
                'driver_name' => 'nullable|string|max:100',
                'driver_phone' => 'nullable|string|max:20',
                'description' => 'nullable|string',
            ]);

            // Set default is_active to true
            $validated['is_active'] = true;

            $vehicle = Vehicle::create($validated);

            \Log::info('✅ Vehicle created', [
                'vehicle_id' => $vehicle->id,
                'vehicle_name' => $vehicle->name,
                'license_plate' => $vehicle->license_plate,
                'created_by' => $user->id,
            ]);

            return response()->json([
                'success' => true,
                'data' => $vehicle,
                'message' => 'Vehicle created successfully'
            ], 201);

        } catch (\Exception $e) {
            \Log::error('❌ Error creating vehicle', [
                'error' => $e->getMessage(),
                'user_id' => $user->id,
            ]);

            return response()->json([
                'success' => false,
                'message' => 'Error: ' . $e->getMessage()
            ], 500);
        }
    }

    /**
     * Update a vehicle (ADMIN ONLY)
     */
    public function update(Request $request, $id)
    {
        $user = auth('sanctum')->user();

        if (!$user) {
            return response()->json([
                'success' => false,
                'message' => 'Unauthorized'
            ], 401);
        }

        // ✅ CHECK: Only admin can update vehicles
        if ($user->role !== 'admin' && $user->role !== 'admin_ga' && $user->role !== 'divum_admin') {
            return response()->json([
                'success' => false,
                'message' => 'Only admins can update vehicles'
            ], 403);
        }

        try {
            $vehicle = Vehicle::find($id);

            if (!$vehicle) {
                return response()->json([
                    'success' => false,
                    'message' => 'Vehicle not found'
                ], 404);
            }

            $validated = $request->validate([
                'name' => 'sometimes|string|max:100',
                'type' => 'sometimes|string|max:50',
                'capacity' => 'sometimes|integer|min:1',
                'license_plate' => 'sometimes|string|unique:vehicles,license_plate,' . $id,
                'driver_name' => 'nullable|string|max:100',
                'driver_phone' => 'nullable|string|max:20',
                'description' => 'nullable|string',
                'is_active' => 'nullable|boolean',
            ]);

            $vehicle->update($validated);

            \Log::info('✅ Vehicle updated', [
                'vehicle_id' => $vehicle->id,
                'updated_by' => $user->id,
            ]);

            return response()->json([
                'success' => true,
                'data' => $vehicle,
                'message' => 'Vehicle updated successfully'
            ], 200);

        } catch (\Exception $e) {
            \Log::error('❌ Error updating vehicle', [
                'error' => $e->getMessage(),
                'user_id' => $user->id,
            ]);

            return response()->json([
                'success' => false,
                'message' => 'Error: ' . $e->getMessage()
            ], 500);
        }
    }

    /**
     * Delete a vehicle (ADMIN ONLY) - soft delete
     */
    public function destroy(Request $request, $id)
    {
        $user = auth('sanctum')->user();

        if (!$user) {
            return response()->json([
                'success' => false,
                'message' => 'Unauthorized'
            ], 401);
        }

        // ✅ CHECK: Only admin can delete vehicles
        if ($user->role !== 'admin' && $user->role !== 'admin_ga' && $user->role !== 'divum_admin') {
            return response()->json([
                'success' => false,
                'message' => 'Only admins can delete vehicles'
            ], 403);
        }

        try {
            $vehicle = Vehicle::find($id);

            if (!$vehicle) {
                return response()->json([
                    'success' => false,
                    'message' => 'Vehicle not found'
                ], 404);
            }

            $vehicle->update(['is_active' => false]);

            return response()->json([
                'success' => true,
                'message' => 'Vehicle deleted successfully'
            ], 200);

        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Error: ' . $e->getMessage()
            ], 500);
        }
    }
}

