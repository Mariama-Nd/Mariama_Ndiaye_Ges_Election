@extends('layouts.app')

@section('content')
<div class="container">
    <h1>Ajouter un Étudiant</h1>

    <form action="{{ route('etudiants.store') }}" method="POST">
        @csrf
        <div class="mb-3">
            <label for="matricule" class="form-label">Matricule</label>
            <input type="text" name="matricule" id="matricule" class="form-control" value="{{ old('matricule') }}" required>
            @error('matricule')
                <small class="text-danger">{{ $message }}</small>
            @enderror
        </div>
        <div class="mb-3">
            <label for="nom" class="form-label">Nom</label>
            <input type="text" name="nom" id="nom" class="form-control" value="{{ old('nom') }}" required>
            @error('nom')
                <small class="text-danger">{{ $message }}</small>
            @enderror
        </div>
        <div class="mb-3">
            <label for="prenom" class="form-label">Prénom</label>
            <input type="text" name="prenom" id="prenom" class="form-control" value="{{ old('prenom') }}" required>
            @error('prenom')
                <small class="text-danger">{{ $message }}</small>
            @enderror
        </div>
        <div class="mb-3">
            <label for="naissance" class="form-label">Date de Naissance</label>
            <input type="date" name="naissance" id="naissance" class="form-control" value="{{ old('naissance') }}" required>
            @error('naissance')
                <small class="text-danger">{{ $message }}</small>
            @enderror
        </div>
        <div class="mb-3">
            <label for="lieu" class="form-label">Lieu</label>
            <input type="text" name="lieu" id="lieu" class="form-control" value="{{ old('lieu') }}" required>
            @error('lieu')
                <small class="text-danger">{{ $message }}</small>
            @enderror
        </div>
        <div class="mb-3">
            <label for="sexe" class="form-label">Sexe</label>
            <select name="sexe" id="sexe" class="form-control" required>
                <option value="">-- Sélectionnez --</option>
                <option value="Masculin" {{ old('sexe') == 'Masculin' ? 'selected' : '' }}>Masculin</option>
                <option value="Feminin" {{ old('sexe') == 'Feminin' ? 'selected' : '' }}>Feminin</option>
            </select>
            @error('sexe')
                <small class="text-danger">{{ $message }}</small>
            @enderror
        </div>

        <div class="mb-3">
            <label for="adresse" class="form-label">Adresse</label>
            <input type="text" name="adresse" id="adresse" class="form-control" value="{{ old('adresse') }}" required>
            @error('adresse')
                <small class="text-danger">{{ $message }}</small>
            @enderror
        </div>

        <div class="mb-3">
            <label for="telephone" class="form-label">Telephone</label>
            <input type="text" name="telephone" id="telephone" class="form-control" value="{{ old('telephone') }}" required>
            @error('telephone')
                <small class="text-danger">{{ $message }}</small>
            @enderror
        </div>

        <div class="mb-3">
            <label for="email" class="form-label">Email</label>
            <input type="email" name="email" id="email" class="form-control" value="{{ old('email') }}" required>
            @error('email')
                <small class="text-danger">{{ $message }}</small>
            @enderror
        </div>

        <div class="mb-3">
            <label for="programme_id" class="form-label">Programme</label>
            <select name="programme_id" id="programme_id" class="form-control" required>
                <option value="">-- Sélectionnez un programme --</option>
                @foreach($programmes as $programme)
                    <option value="{{ $programme->id }}">{{ $programme->nom }}</option>
                @endforeach
            </select>
            @error('programme_id')
                <small class="text-danger">{{ $message }}</small>
            @enderror
        </div>
        <button type="submit" class="btn btn-primary">Enregistrer</button>
    </form>
</div>
@endsection
