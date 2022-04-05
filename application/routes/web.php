<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CustomersController;
use App\Http\Controllers\DashboardController;

Route::get('test', static function() {
    dd(\App\Models\Customer::with('defaultAddress')->get()->toArray());
});


Route::get('/', function () {
    return view('welcome');
});

Route::middleware([
    'auth:sanctum',
    config('jetstream.auth_session'),
    'verified'
])->group(function ()
{
    // Dashboard
    Route::prefix('dashboard')->group(function() {
        Route::get('/', [DashboardController::class, 'index'])->name('dashboard');
    });

    // Dashboard
    Route::prefix('customers')->group(function() {
        Route::get('/', [CustomersController::class, 'index'])->name('customers');
    });
});
