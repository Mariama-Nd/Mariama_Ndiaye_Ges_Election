<?php

namespace App\Http\Controllers;

use App\Models\Candidat;
use App\Models\Etudiant;
use Illuminate\Http\Request;

class CandidatController extends Controller
{
    public function index()
    {
        $candidats = Candidat::paginate(10);
        return view('candidats.index', compact('candidats'));
    }

    public function create()
    {
        $etudiants = Etudiant::all();
        return view('candidats.create', compact('etudiants'));
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'etudiant_id' => 'required|exists:etudiants,id|unique:candidats,etudiant_id',
            'niveau' => 'required|in:Licence,Master,Doctorat',
        ]);

        Candidat::create($validated);

        return redirect()->route('candidats.index')->with('success', 'Candidat ajouté avec succès.');
    }

    public function edit(Candidat $candidat)
    {
        $etudiants = Etudiant::all();
        return view('candidats.edit', compact('candidat', 'etudiants'));
    }

    public function update(Request $request, Candidat $candidat)
    {
        $validated = $request->validate([
            'etudiant_id' => 'required|exists:etudiants,id|unique:candidats,etudiant_id,' . $candidat->id,
            'niveau' => 'required|in:Licence,Master,Doctorat',
        ]);

        $candidat->update($validated);

        return redirect()->route('candidats.index')->with('success', 'Candidat modifié avec succès.');
    }

    public function destroy(Candidat $candidat)
    {
        $candidat->delete();

        return redirect()->route('candidats.index')->with('success', 'Candidat supprimé avec succès.');
    }
}
