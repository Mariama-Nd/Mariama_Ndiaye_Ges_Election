@extends('layouts.app')

@section('content')
<div class="container mx-auto p-4 border-4 border-orange-500 rounded-lg">
    <div class="bg-white rounded-lg shadow-md p-6">
        <!-- Header -->
        <div class="text-center mb-4">
            <h1 class="text-2xl font-semibold text-gray-800">Liste des Départements</h1>
        </div>

        <div class="flex justify-between items-center mb-4">
            <a href="{{ route('dashboard') }}" class="bg-gray-800 text-white px-4 py-2 rounded-lg hover:bg-gray-900">
                Retour à la Dashboard
            </a>
            <a href="{{ route('departements.create') }}" class="bg-gray-800 text-white px-4 py-2 rounded-lg hover:bg-gray-900">
                Ajouter un Département
            </a>
        </div>

        <!-- Barre de recherche -->
        <div class="mb-4">
            <input
                type="text"
                id="search-bar"
                placeholder="Rechercher un département..."
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
                        <th class="px-4 py-3">Nom</th>
                        <th class="px-4 py-3">Actions</th>
                    </tr>
                </thead>
                <tbody id="departements-table">
                    @forelse($departements as $departement)
                        <tr class="bg-white border-b hover:bg-gray-50">
                            <td class="px-4 py-3">{{ $departement->nom }}</td>
                            <td class="px-4 py-3 flex items-center justify-center space-x-2">
                                <!-- Bouton Modifier -->
                                <a href="{{ route('departements.edit', $departement) }}" class="btn-orange">
                                    Modifier
                                </a>
                                <!-- Bouton Supprimer -->
                                <form action="{{ route('departements.destroy', $departement) }}" method="POST" class="inline">
                                    @csrf
                                    @method('DELETE')
                                    <button type="submit" class="btn-red" onclick="return confirm('Êtes-vous sûr de vouloir supprimer ce département ?')">
                                        Supprimer
                                    </button>
                                </form>
                            </td>
                        </tr>
                    @empty
                        <tr>
                            <td colspan="3" class="px-4 py-3 text-center text-gray-500">
                                Aucun département trouvé.
                            </td>
                        </tr>
                    @endforelse
                </tbody>
            </table>
        </div>

        <!-- Pagination -->


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

    .btn-orange, .btn-red {
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

    .btn-orange:active {
        box-shadow: inset 4px 4px 12px #c5c5c5, inset -4px -4px 12px #ffffff;
        color: #666;
    }

    .btn-red:hover {
        background: #e74c3c;
        color: white;
    }

    .btn-red:active {
        box-shadow: inset 4px 4px 12px #c5c5c5, inset -4px -4px 12px #ffffff;
        color: #666;
    }
</style>

<script>
    document.getElementById('search-bar').addEventListener('input', function() {
        const searchText = this.value.toLowerCase();
        const rows = document.querySelectorAll('#departements-table tr');

        rows.forEach(row => {
            const rowText = row.innerText.toLowerCase();
            row.style.display = rowText.includes(searchText) ? '' : 'none';
        });
    });
</script>
@endsection
