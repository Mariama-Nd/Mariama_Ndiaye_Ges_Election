<?php

namespace App\Http\Controllers;

use App\Models\Programme;
use App\Models\Departement;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ProgrammeController extends Controller
{
    public function index()
    {

        if (Auth::check() && Auth::user()->role !== 'administrateur') {
            return abort(403);
        }

        $programmes = Programme::paginate(10);
        return view('programmes.index', compact('programmes'));
    }

    public function create()
    {
        $departements = Departement::all(); // Récupère tous les départements pour le formulaire
        return view('programmes.create', compact('departements'));
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'nom' => 'required|string|unique:programmes,nom',
            'departement_id' => 'required|exists:departements,id',
        ]);

        Programme::create($validated);

        return redirect()->route('programmes.index')->with('success', 'Programme créé avec succès.');
    }

    public function edit(Programme $programme)
    {
        $departements = Departement::all();
        return view('programmes.edit', compact('programme', 'departements'));
    }

    public function update(Request $request, Programme $programme)
    {
        $validated = $request->validate([
            'nom' => 'required|string|unique:programmes,nom,' . $programme->id,
            'departement_id' => 'required|exists:departements,id',
        ]);

        $programme->update($validated);

        return redirect()->route('programmes.index')->with('success', 'Programme modifié avec succès.');
    }

    public function destroy(Programme $programme)
    {
        $programme->delete();

        return redirect()->route('programmes.index')->with('success', 'Programme supprimé avec succès.');
    }
}
