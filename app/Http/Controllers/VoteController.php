<?php

namespace App\Http\Controllers;

use App\Models\Vote;
use App\Models\Etudiant;
use App\Models\Candidat;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;


class VoteController extends Controller
{
    // Afficher la liste des votes
    public function index()
    {

        if (Auth::check() && Auth::user()->role !== 'administrateur') {
            return abort(403);
        }

        $votes = Vote::with(['etudiant', 'candidat'])->get();
        return view('votes.index', compact('votes'));
    }


    // Afficher le formulaire d'édition
    public function edit(Vote $vote)
    {
        $etudiants = Etudiant::all();
        $candidats = Candidat::all();
        return view('votes.edit', compact('vote', 'etudiants', 'candidats'));
    }

    // Mettre à jour un vote
    public function update(Request $request, Vote $vote)
    {
        $validated = $request->validate([
            'etudiant_id' => 'required|exists:etudiants,id|unique:votes,etudiant_id,' . $vote->id,
            'candidat_id' => 'required|exists:candidats,id',
            'date' => 'required|date',
        ]);

        $vote->update($validated);
        return redirect()->route('votes.index')->with('success', 'Vote mis à jour avec succès.');
    }

    // Supprimer un vote
    public function destroy(Vote $vote)
    {
        $vote->delete();
        return redirect()->route('votes.index')->with('success', 'Vote supprimé avec succès.');
    }

    // Ajouter un nouveau vote via la liste des candidats
    public function voter(Request $request)
    {
        $request->validate([
            'candidat_id' => 'required|exists:candidats,id',
        ]);

        // Récupérer l'étudiant connecté
        $etudiantConnecte = Etudiant::where('email', auth()->user()->email)->first();

        if (!$etudiantConnecte) {
            return response()->json(['message' => 'Étudiant non trouvé'], 404);
        }

        // Vérifier si l'utilisateur a déjà voté
        $dejaVote = Vote::where('etudiant_id', $etudiantConnecte->id)->exists();

        if ($dejaVote) {
            return response()->json(['message' => 'Vous avez déjà voté'], 403);
        }

        // Enregistrer le vote
        $vote = Vote::create([
            'etudiant_id' => $etudiantConnecte->id,
            'candidat_id' => $request->candidat_id,
            'date' => now()->format('Y-m-d'),
            'temps' => now()->format('H:i:s'),
        ]);

        return response()->json(['message' => 'Votre vote a été enregistré avec succès']);
    }

    public function stats()
    {
        // Récupérer les votes groupés par candidat_id
        $stats = Vote::selectRaw('candidat_id, COUNT(*) as votes')
                    ->groupBy('candidat_id')
                    ->get();

        // Construire la réponse avec les noms et prénoms des candidats
        $result = $stats->map(function ($vote) {
            // Récupérer l'étudiant associé au candidat
            $etudiant = Etudiant::find($vote->candidat_id); // Le candidat est un étudiant ici
            return [
                'candidat' => $etudiant ? $etudiant->nom . ' ' . $etudiant->prenom : 'Candidat inconnu', // Nom et prénom de l'étudiant
                'votes' => $vote->votes,    // Nombre de votes
            ];
        });

        return response()->json($result);
    }

    public function statsView()
    {
        // Récupérer les votes groupés par candidat et récupérer les informations du candidat
        $stats = Vote::selectRaw('candidat_id, COUNT(*) as votes')
                    ->groupBy('candidat_id')
                    ->get();

        // Créer des tableaux pour les noms des candidats et les votes
        $candidats = [];
        $votes = [];

        foreach ($stats as $stat) {
            $candidat = Candidat::find($stat->candidat_id);
            if ($candidat) {
                $candidats[] = $candidat->nom . ' ' . $candidat->prenom; // Nom du candidat
                $votes[] = $stat->votes; // Nombre de votes
            }
        }

        // Passer ces données à la vue
        return view('votes.stats', ['candidats' => $candidats, 'votes' => $votes]);
    }


}
