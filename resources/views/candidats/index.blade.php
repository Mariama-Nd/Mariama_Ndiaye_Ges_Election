@extends('layouts.app')

@section('content')
<div class="container mx-auto p-4 border-4 border-orange-500 rounded-lg">
    <div class="bg-white rounded-lg shadow-md p-6">
        <!-- Header -->
        <div class="text-center mb-4">
            <h1 class="text-2xl font-semibold text-gray-800">Liste des Candidats</h1>
        </div>

        <div class="flex justify-between items-center mb-4">
            <a href="{{ route('dashboard') }}" class="bg-gray-800 text-white px-4 py-2 rounded-lg hover:bg-gray-900">
                Retour à la Dashboard
            </a>
            @if(auth()->user()->role !== 'etudiant') <!-- Afficher ce bouton seulement si l'utilisateur n'est pas étudiant -->
                <a href="{{ route('candidats.create') }}" class="bg-gray-800 text-white px-4 py-2 rounded-lg hover:bg-gray-900">
                    Ajouter un Candidat
                </a>
            @endif
        </div>

        <!-- Barre de recherche -->
        <div class="mb-4">
            <input
                type="text"
                id="search-bar"
                placeholder="Rechercher un candidat..."
                class="w-full px-4 py-2 rounded-lg border border-gray-300 focus:outline-none focus:ring-2 focus:ring-gray-800">
        </div>

        <!-- Success Message -->
        @if(session('success'))
            <div class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded mb-4">
                {{ session('success') }}
            </div>
        @endif

        <!-- Table -->
        <div class="overflow-x-auto">
            <table class="w-full text-md text-left text-gray-700">
                <thead class="bg-gray-50 text-gray-700 uppercase text-sm">
                    <tr>
                        <th class="px-4 py-3">Prénom</th>
                        <th class="px-4 py-3">Nom</th>
                        <th class="px-4 py-3">Niveau</th>
                        <th class="px-4 py-3">Actions</th>
                    </tr>
                </thead>
                <tbody id="candidats-table">
                    @forelse($candidats as $candidat)
                        <tr class="bg-white border-b hover:bg-gray-50">
                            <td class="px-4 py-3">{{ $candidat->etudiant->prenom }}</td>
                            <td class="px-4 py-3">{{ $candidat->etudiant->nom }}</td>
                            <td class="px-4 py-3">{{ $candidat->niveau }}</td>
                            <td class="px-4 py-3 flex items-center justify-center space-x-2">
                                @if(auth()->user()->role !== 'etudiant') <!-- Cacher les boutons pour les étudiants -->
                                    <!-- Bouton Modifier -->
                                    <a href="{{ route('candidats.edit', $candidat) }}" class="btn-orange">
                                        Modifier
                                    </a>
                                    <!-- Bouton Supprimer -->
                                    <form action="{{ route('candidats.destroy', $candidat) }}" method="POST" class="inline">
                                        @csrf
                                        @method('DELETE')
                                        <button type="submit" class="btn-red" onclick="return confirm('Êtes-vous sûr de vouloir supprimer ce candidat ?')">
                                            Supprimer
                                        </button>
                                    </form>
                                @endif

                                @if(auth()->user()->role === 'etudiant') <!-- Cacher le bouton Voter pour les administrateurs -->
                                    <!-- Bouton Voter -->
                                    <button class="btn-blue btn-sm" data-candidat-id="{{ $candidat->id }}" onclick="voter({{ $candidat->id }})">
                                        Voter
                                    </button>
                                @endif
                            </td>
                        </tr>
                    @empty
                        <tr>
                            <td colspan="6" class="px-4 py-3 text-center text-gray-500">
                                Aucun candidat trouvé.
                            </td>
                        </tr>
                    @endforelse
                </tbody>
            </table>
        </div>

        <!-- Pagination -->
        <div class="mt-6">
            {{ $candidats->links() }}
        </div>
    </div>
</div>

<!-- Styles personnalisés -->
<style>
    /* Style général pour aligner verticalement les éléments */
    table th,
    table td {
        text-align: center; /* Alignement horizontal */
        vertical-align: middle; /* Alignement vertical */
        padding: 0.5em; /* Espacement équilibré */
    }

    .btn-orange, .btn-red, .btn-blue {
        color: #090909;
        padding: 0.3em 1em; /* Hauteur encore plus réduite */
        font-size: 14px; /* Texte plus petit pour des boutons compacts */
        border-radius: 0.5em;
        background: #e8e8e8;
        border: 1px solid #e8e8e8;
        transition: all 0.3s;
        box-shadow: 6px 6px 12px #c5c5c5, -6px -6px 12px #ffffff;
        margin-right: 10px;
    }

    .btn-orange:hover {
        background: #f39c12;
        color: white;
    }

    .btn-red:hover {
        background: #e74c3c;
        color: white;
    }

    .btn-blue {
        background-color: #0073ff;
        color: white;
    }

    .btn-blue:hover {
        background-color: #0088ff;
    }

    .btn-orange:active, .btn-red:active, .btn-blue:active {
        box-shadow: inset 4px 4px 12px #c5c5c5, inset -4px -4px 12px #ffffff;
        color: #666;
    }
</style>

<script>
    function voter(candidatId) {
        const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

        fetch("{{ route('votes.voter') }}", {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
                "X-CSRF-TOKEN": token,
            },
            body: JSON.stringify({ candidat_id: candidatId }),
        })
        .then(response => response.json())
        .then(data => {
            if (data.message) {
                alert(data.message);
            }
        })
        .catch(error => {
            console.error("Erreur:", error);
        });
    }

    // Recherche en temps réel
    document.getElementById('search-bar').addEventListener('input', function() {
        const searchText = this.value.toLowerCase();
        const rows = document.querySelectorAll('#candidats-table tr');

        rows.forEach(row => {
            const rowText = row.innerText.toLowerCase();
            row.style.display = rowText.includes(searchText) ? '' : 'none';
        });
    });
</script>
@endsection
