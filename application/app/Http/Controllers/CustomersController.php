<?php

namespace App\Http\Controllers;

use Illuminate\Contracts\View\View;
use Illuminate\Contracts\View\Factory;
use Illuminate\Contracts\Foundation\Application;

class CustomersController extends Controller
{
    public function index(): Factory|View|Application
    {
        return view('customers.index');
    }
}
