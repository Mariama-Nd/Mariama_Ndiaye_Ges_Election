@extends('layouts.app')

@section('content')
<div class="container">
    <h1>Ajouter un Vote</h1>

    <form action="{{ route('votes.store') }}" method="POST">
        @csrf
        <div class="mb-3">
            <label for="etudiant_id" class="form-label">Étudiant</label>
            <select id="etudiant_id" name="etudiant_id" class="form-select" required>
                <option value="">Choisir un étudiant</option>
                @foreach ($etudiants as $etudiant)
                    <option value="{{ $etudiant->id }}">{{ $etudiant->nom }}</option>
                @endforeach
            </select>
        </div>
        <div class="mb-3">
            <label for="candidat_id" class="form-label">Candidat</label>
            <select id="candidat_id" name="candidat_id" class="form-select" required>
                <option value="">Choisir un candidat</option>
                @foreach ($candidats as $candidat)
                    <option value="{{ $candidat->id }}">{{ $candidat->etudiant->nom }}</option>
                @endforeach
            </select>
        </div>
        <div class="mb-3">
            <label for="date" class="form-label">Date</label>
            <input type="date" id="date" name="date" class="form-control" required>
        </div>
        <button type="submit" class="btn btn-primary">Enregistrer</button>
        <a href="{{ route('votes.index') }}" class="btn btn-secondary">Annuler</a>
    </form>
</div>
@endsection
