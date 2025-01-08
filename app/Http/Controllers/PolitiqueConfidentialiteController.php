<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class PolitiqueConfidentialiteController extends Controller
{
    public function show()
    {
        return view('politique_de_confidentialite');
    }
}
