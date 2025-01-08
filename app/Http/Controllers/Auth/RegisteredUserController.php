<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\Programme;
use App\Models\Etudiant;
use Illuminate\Auth\Events\Registered;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rules;
use Illuminate\View\View;
use App\Models\User;
use Spatie\Permission\Models\Role; // Assurez-vous d'inclure cette ligne

class RegisteredUserController extends Controller
{
    public function create(): View
    {
        $programmes = Programme::all();
        return view('auth.register', compact('programmes'));
    }

    public function store(Request $request): RedirectResponse
{
    // Validation des données
    $request->validate([
        'name' => ['required', 'string', 'max:255'],
        'prenom' => ['required', 'string', 'max:255'],
        'naissance' => ['required', 'date'],
        'lieu' => ['required', 'string', 'max:255'],
        'sexe' => ['required', 'in:Masculin,Feminin'],
        'adresse' => ['required', 'string', 'max:255'],
        'programme_id' => ['required', 'exists:programmes,id'],
        'telephone' => ['required', 'string', 'max:15'],
        'matricule' => ['required', 'string', 'unique:etudiants,matricule'],
        'email' => ['required', 'string', 'email', 'max:255', 'unique:users,email'],
        'password' => ['required', 'confirmed', Rules\Password::defaults()],
        'photo' => ['nullable', 'image', 'mimes:jpeg,png,jpg,gif', 'max:2048'], // Validation de l'image
    ]);

    // Gestion de l'image uploadée
    $photoPath = null;
    if ($request->hasFile('photo')) {
        $photoPath = $request->file('photo')->store('images', 'public'); // Stocker dans storage/app/public/images
    }

    // Création de l'utilisateur
    $user = User::create([
        'name' => $request->name,
        'email' => $request->email,
        'password' => Hash::make($request->password),
        'photo' => $photoPath, // Associer le chemin de l'image à l'utilisateur
    ]);

    // Création de l'étudiant dans la table `etudiants`
    Etudiant::create([
        'nom' => $request->name,
        'prenom' => $request->prenom,
        'naissance' => $request->naissance,
        'lieu' => $request->lieu,
        'sexe' => $request->sexe,
        'adresse' => $request->adresse,
        'programme_id' => $request->programme_id,
        'telephone' => $request->telephone,
        'matricule' => $request->matricule,
        'email' => $request->email,
        'photo' => $photoPath, // Associer le chemin de l'image à l'étudiant
    ]);

    // Événement et connexion de l'utilisateur
    event(new Registered($user));
    Auth::login($user);

    // Redirection vers le tableau de bord
    return redirect(route('dashboard'));
}

}
