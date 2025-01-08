<?php

namespace App\Http\Controllers;

use App\Models\Etudiant;
use App\Models\Programme;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class EtudiantController extends Controller
{

    public function index()
    {
        if (Auth::check() && Auth::user()->role !== 'administrateur') {
            return abort(403); // Cela redirige vers la page d'erreur 403
        }

        $etudiants = Etudiant::with('programme')->paginate(10); // 10 étudiants par page
        return view('etudiants.index', compact('etudiants'));
    }

    public function create()
    {
        // Vérification du rôle avant d'afficher le formulaire de création
        if (Auth::check() && Auth::user()->role !== 'administrateur') {
            return redirect()->route('etudiants.index')->with('error', 'Accès interdit');
        }

        $programmes = Programme::all();
        return view('etudiants.create', compact('programmes'));
    }

    public function store(Request $request)
    {
        // Vérification du rôle avant d'enregistrer un étudiant
        if (Auth::check() && Auth::user()->role !== 'administrateur') {
            return redirect()->route('etudiants.index')->with('error', 'Accès interdit');
        }

        $validated = $request->validate([
            'matricule' => 'required|string|unique:etudiants,matricule',
            'nom' => 'required|string|max:255',
            'prenom' => 'required|string|max:255',
            'naissance' => 'required|date',
            'lieu' => 'required|string|max:255',
            'sexe' => 'required|in:Masculin,Feminin',
            'adresse' => 'required|string|max:255',
            'programme_id' => 'required|exists:programmes,id',
            'telephone' => 'nullable|string|max:15',
            'email' => 'nullable|email|unique:etudiants,email',
        ]);

        Etudiant::create($validated);

        return redirect()->route('etudiants.index')->with('success', 'Étudiant ajouté avec succès.');
    }

    public function edit(Etudiant $etudiant)
    {
        // Vérification du rôle avant d'afficher le formulaire d'édition
        if (Auth::check() && Auth::user()->role !== 'administrateur') {
            return redirect()->route('etudiants.index')->with('error', 'Accès interdit');
        }

        $programmes = Programme::all();
        return view('etudiants.edit', compact('etudiant', 'programmes'));
    }

    public function update(Request $request, Etudiant $etudiant)
    {
        // Vérification du rôle avant de mettre à jour l'étudiant
        if (Auth::check() && Auth::user()->role !== 'administrateur') {
            return redirect()->route('etudiants.index')->with('error', 'Accès interdit');
        }

        $validated = $request->validate([
            'matricule' => 'required|string|unique:etudiants,matricule,' . $etudiant->id,
            'nom' => 'required|string|max:255',
            'prenom' => 'required|string|max:255',
            'naissance' => 'required|date',
            'lieu' => 'required|string|max:255',
            'sexe' => 'required|in:Masculin,Feminin',
            'adresse' => 'required|string|max:255',
            'programme_id' => 'required|exists:programmes,id',
            'telephone' => 'nullable|string|max:15',
            'email' => 'nullable|email|unique:etudiants,email',
        ]);

        $etudiant->update($validated);

        return redirect()->route('etudiants.index')->with('success', 'Étudiant modifié avec succès.');
    }

    public function destroy(Etudiant $etudiant)
    {
        // Vérification du rôle avant de supprimer un étudiant
        if (Auth::check() && Auth::user()->role !== 'administrateur') {
            return redirect()->route('etudiants.index')->with('error', 'Accès interdit');
        }

        $etudiant->delete();

        return redirect()->route('etudiants.index')->with('success', 'Étudiant supprimé avec succès.');
    }
}
