<?php

use Illuminate\Support\Facades\Route;

Route::get('/cek-db', function () {
    return DB::connection()->getDatabaseName();
});
