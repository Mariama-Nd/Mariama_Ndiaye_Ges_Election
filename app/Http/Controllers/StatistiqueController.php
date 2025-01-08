<?php

namespace App\Http\Controllers;

use App\Models\Vote;
use App\Models\Candidat;
use App\Models\Etudiant;
use App\Models\Departement;
use App\Models\Programme;
use Illuminate\Support\Facades\Response;
use Barryvdh\DomPDF\Facade\Pdf;

class StatistiqueController extends Controller
{
    public function stats()
    {
        // Statistiques des votes par candidat
        $stats = Vote::selectRaw('candidat_id, COUNT(*) as votes')
                    ->groupBy('candidat_id')
                    ->get();

        $result = $stats->map(function ($vote) {
            $etudiant = Etudiant::find($vote->candidat_id);
            return [
                'candidat' => $etudiant ? $etudiant->nom . ' ' . $etudiant->prenom : 'Candidat inconnu',
                'votes' => $vote->votes,
            ];
        });

        return response()->json($result);
    }

    public function statsDepartements()
    {
        // Statistiques des votes groupés par département via programmes
        $stats = Vote::join('etudiants', 'votes.etudiant_id', '=', 'etudiants.id')
                    ->join('programmes', 'etudiants.programme_id', '=', 'programmes.id')
                    ->join('departements', 'programmes.departement_id', '=', 'departements.id')
                    ->selectRaw('departements.nom as departement, COUNT(*) as votes')
                    ->groupBy('departements.nom')
                    ->get();

        return response()->json($stats);
    }


    public function statsProgrammes()
    {
        // Statistiques des votes groupés par programme
        $stats = Vote::join('etudiants', 'votes.etudiant_id', '=', 'etudiants.id')
                     ->join('programmes', 'etudiants.programme_id', '=', 'programmes.id')
                     ->selectRaw('programmes.nom as programme, COUNT(*) as votes')
                     ->groupBy('programmes.nom')
                     ->get();

        return response()->json($stats);
    }

    public function statsView()
    {
        // Statistiques des votes par candidat
        $stats = Vote::selectRaw('candidat_id, COUNT(*) as votes')
                    ->groupBy('candidat_id')
                    ->get();

        $candidats = [];
        $votes = [];

        foreach ($stats as $stat) {
            $candidat = Candidat::find($stat->candidat_id);
            if ($candidat) {
                $candidats[] = $candidat->nom . ' ' . $candidat->prenom;
                $votes[] = $stat->votes;
            }
        }

        return view('votes.stats', ['candidats' => $candidats, 'votes' => $votes]);
    }

    // Statistiques des étudiants par programme
    public function statsEtudiantsParProgramme()
    {
        $stats = Programme::withCount('etudiants')->get();

        $result = $stats->map(function ($programme) {
            return [
                'programme' => $programme->nom,
                'etudiants' => $programme->etudiants_count,
            ];
        });

        return response()->json($result);
    }

    // Statistiques des programmes par département
    public function statsProgrammesParDepartement()
    {
        $stats = Departement::withCount('programmes')->get();

        $result = $stats->map(function ($departement) {
            return [
                'departement' => $departement->nom,
                'programmes' => $departement->programmes_count,
            ];
        });

        return response()->json($result);
    }

    //fonction pour l'exportation CVS
    public function exportCSV($type)
    {
        $data = $this->getStatisticsData($type);

        // Créer le contenu CSV
        $csvContent = implode(',', array_keys($data[0])) . "\n"; // En-tête
        foreach ($data as $row) {
            $csvContent .= implode(',', $row) . "\n";
        }

        // Retourner un fichier CSV en téléchargement
        return Response::make($csvContent, 200, [
            'Content-Type' => 'text/csv',
            'Content-Disposition' => "attachment; filename=stats_$type.csv",
        ]);
    }

    //fonction pour l'exportation PDF
    public function exportPDF($type)
    {
        $data = $this->getStatisticsData($type);

        $pdf = Pdf::loadView('exports.stats_pdf', ['data' => $data, 'type' => $type]);
        return $pdf->download("stats_$type.pdf");
    }


    //méthode privée pour récupérer les données des statistiques selon le type
    private function getStatisticsData($type)
{
    switch ($type) {
        case 'candidats':
            return Vote::join('etudiants', 'votes.candidat_id', '=', 'etudiants.id')
                ->selectRaw('CONCAT(etudiants.nom, " ", etudiants.prenom) as candidat, COUNT(*) as votes')
                ->groupBy('etudiants.nom', 'etudiants.prenom')
                ->get()
                ->toArray();
        case 'departements':
            return Vote::join('etudiants', 'votes.etudiant_id', '=', 'etudiants.id')
                ->join('programmes', 'etudiants.programme_id', '=', 'programmes.id')
                ->join('departements', 'programmes.departement_id', '=', 'departements.id')
                ->selectRaw('departements.nom as departement, COUNT(*) as votes')
                ->groupBy('departements.nom')
                ->get()
                ->toArray();
        case 'programmes':
            return Vote::join('etudiants', 'votes.etudiant_id', '=', 'etudiants.id')
                ->join('programmes', 'etudiants.programme_id', '=', 'programmes.id')
                ->selectRaw('programmes.nom as programme, COUNT(*) as votes')
                ->groupBy('programmes.nom')
                ->get()
                ->toArray();
        case 'etudiantsParProgramme':
            return Programme::withCount('etudiants')
                ->get(['nom', 'etudiants_count as etudiants'])
                ->toArray();
        case 'programmesParDepartement':
            return Departement::withCount('programmes')
                ->get(['nom', 'programmes_count as programmes'])
                ->toArray();
        default:
            throw new \Exception("Type de statistique invalide");
    }
}

}
