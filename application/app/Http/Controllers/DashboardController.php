<?php

namespace App\Http\Controllers;

use Illuminate\Contracts\View\View;
use Illuminate\Contracts\View\Factory;
use Illuminate\Contracts\Foundation\Application;

class DashboardController
{
    public function index(): Factory|View|Application
    {
        return view('dashboard.index');
    }
}
