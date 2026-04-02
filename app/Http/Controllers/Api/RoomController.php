<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Room;

class RoomController extends Controller
{
    /**
     * Get all active rooms
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
            $rooms = Room::where('is_active', true)
                ->select('id', 'name', 'location', 'capacity', 'facilities', 'description')
                ->get();

            return response()->json([
                'success' => true,
                'data' => $rooms,
                'message' => 'Rooms fetched successfully'
            ], 200);

        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Error: ' . $e->getMessage()
            ], 500);
        }
    }

    /**
     * Create a new room (ADMIN ONLY)
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

        // ✅ CHECK: Only admin can create rooms
        if ($user->role !== 'admin' && $user->role !== 'admin_ga' && $user->role !== 'divum_admin') {
            return response()->json([
                'success' => false,
                'message' => 'Only admins can create rooms'
            ], 403);
        }

        try {
            $validated = $request->validate([
                'name' => 'required|string|max:100|unique:rooms',
                'location' => 'required|string|max:200',
                'capacity' => 'required|integer|min:1',
                'facilities' => 'nullable|array',
                'description' => 'nullable|string',
            ]);

            if (isset($validated['facilities'])) {
                $validated['facilities'] = json_encode($validated['facilities']);
            }

            // Set default is_active to true
            $validated['is_active'] = true;

            $room = Room::create($validated);

            \Log::info('✅ Room created', [
                'room_id' => $room->id,
                'room_name' => $room->name,
                'created_by' => $user->id,
            ]);

            return response()->json([
                'success' => true,
                'data' => $room,
                'message' => 'Room created successfully'
            ], 201);

        } catch (\Exception $e) {
            \Log::error('❌ Error creating room', [
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
     * Update a room (ADMIN ONLY)
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

        // ✅ CHECK: Only admin can update rooms
        if ($user->role !== 'admin' && $user->role !== 'admin_ga' && $user->role !== 'divum_admin') {
            return response()->json([
                'success' => false,
                'message' => 'Only admins can update rooms'
            ], 403);
        }

        try {
            $room = Room::find($id);

            if (!$room) {
                return response()->json([
                    'success' => false,
                    'message' => 'Room not found'
                ], 404);
            }

            $validated = $request->validate([
                'name' => 'sometimes|string|max:100',
                'location' => 'sometimes|string|max:200',
                'capacity' => 'sometimes|integer|min:1',
                'facilities' => 'nullable|array',
                'description' => 'nullable|string',
                'is_active' => 'nullable|boolean',
            ]);

            if (isset($validated['facilities'])) {
                $validated['facilities'] = json_encode($validated['facilities']);
            }

            $room->update($validated);

            \Log::info('✅ Room updated', [
                'room_id' => $room->id,
                'updated_by' => $user->id,
            ]);

            return response()->json([
                'success' => true,
                'data' => $room,
                'message' => 'Room updated successfully'
            ], 200);

        } catch (\Exception $e) {
            \Log::error('❌ Error updating room', [
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
     * Delete a room (ADMIN ONLY) - soft delete
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

        // ✅ CHECK: Only admin can delete rooms
        if ($user->role !== 'admin' && $user->role !== 'admin_ga' && $user->role !== 'divum_admin') {
            return response()->json([
                'success' => false,
                'message' => 'Only admins can delete rooms'
            ], 403);
        }

        try {
            $room = Room::find($id);

            if (!$room) {
                return response()->json([
                    'success' => false,
                    'message' => 'Room not found'
                ], 404);
            }

            $room->update(['is_active' => false]);

            return response()->json([
                'success' => true,
                'message' => 'Room deleted successfully'
            ], 200);

        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Error: ' . $e->getMessage()
            ], 500);
        }
    }
}

