<?php

namespace App\Http\Controllers;

use App\Models\Departement;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class DepartementController extends Controller
{

    public function index()
    {

        if (Auth::check() && Auth::user()->role !== 'administrateur') {
            return abort(403);
        }

        $departements = Departement::all();
        return view('departements.index', compact('departements'));
    }

    public function create()
    {
        return view('departements.create');
    }

    public function store(Request $request)
    {
        $request->validate(['nom' => 'required|unique:departements,nom']);
        Departement::create($request->only('nom'));
        return redirect()->route('departements.index')->with('success', 'Département ajouté avec succès.');
    }

    public function edit(Departement $departement)
    {
        return view('departements.edit', compact('departement'));
    }

    public function update(Request $request, Departement $departement)
    {
        $request->validate(['nom' => 'required|unique:departements,nom,' . $departement->id]);
        $departement->update($request->only('nom'));
        return redirect()->route('departements.index')->with('success', 'Département modifié avec succès.');
    }

    public function destroy(Departement $departement)
    {
        $departement->delete();
        return redirect()->route('departements.index')->with('success', 'Département supprimé avec succès.');
    }
}
