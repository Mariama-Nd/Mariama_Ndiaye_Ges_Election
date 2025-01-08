<?php

use App\Http\Controllers\ProfileController;
use App\Http\Controllers\DepartementController;
use App\Http\Controllers\ProgrammeController;
use App\Http\Controllers\EtudiantController;
use App\Http\Controllers\CandidatController;
use App\Http\Controllers\VoteController;
use App\Http\Controllers\StatistiqueController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\PolitiqueConfidentialiteController;

// Page d'accueil
Route::get('/', function () {
    return view('welcome');
})->name('home');

// Tableau de bord
Route::get('/dashboard', function () {
    return view('dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

//page d'accueil
Route::get('/welcome', function () {
    return view('welcome');
})->name('welcome');

//deconnexion
Route::post('/logout', [AuthenticatedSessionController::class, 'destroy'])->name('logout');

// Groupe de routes protégées par le middleware "auth"
Route::middleware('auth')->group(function () {
    // Gestion des profils utilisateurs
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');

    // Routes des ressources principales
    Route::resource('departements', DepartementController::class)->except(['show']);
    Route::resource('programmes', ProgrammeController::class)->except(['show']);
    Route::resource('etudiants', EtudiantController::class)->except(['show']);
    Route::resource('candidats', CandidatController::class)->except(['show']);
    Route::resource('votes', VoteController::class)->except(['show']);

    // Route pour voter
    Route::post('/voter', [VoteController::class, 'voter'])->name('votes.voter');

    // Routes pour les statistiques
    Route::get('/votes/stats', [StatistiqueController::class, 'stats'])->name('votes.stats'); // Statistiques globales des votes par candidats
    Route::get('/votes/stats-departements', [StatistiqueController::class, 'statsDepartements'])->name('votes.statsDepartements'); // Statistiques par départements
    Route::get('/votes/stats-programmes', [StatistiqueController::class, 'statsProgrammes'])->name('votes.statsProgrammes'); // Statistiques par programmes
    Route::get('/votes/stats-view', [StatistiqueController::class, 'statsView'])->name('votes.statsView'); // Vue consolidée des statistiques

    // Statistiques des étudiants par programme et des programmes par département
    Route::get('/stats/etudiants-par-programme', [StatistiqueController::class, 'statsEtudiantsParProgramme'])->name('stats.etudiantsParProgramme');
    Route::get('/stats/programmes-par-departement', [StatistiqueController::class, 'statsProgrammesParDepartement'])->name('stats.programmesParDepartement');
});

//routes pour les fonctionnalités d'export
Route::get('/export/csv/{type}', [StatistiqueController::class, 'exportCSV'])->name('export.csv');
Route::get('/export/pdf/{type}', [StatistiqueController::class, 'exportPDF'])->name('export.pdf');

require __DIR__ . '/auth.php';

//route pour politiques de confidentialite
Route::get('/politique-de-confidentialite', [PolitiqueConfidentialiteController::class, 'show'])->name('politique_de_confidentialite');
