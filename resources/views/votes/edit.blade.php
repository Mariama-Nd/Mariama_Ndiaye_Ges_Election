<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modifier le Vote</title>
    <style>
        /* Bouton Dark Mode */
        #dark-mode-toggle {
            position: fixed;
            top: 10px;
            right: 10px;
            background-color: #3b82f6;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 10px;
            cursor: pointer;
            z-index: 1000;
            font-size: 16px;
            transition: all 0.3s ease;
        }

        #dark-mode-toggle:hover {
            background-color: #2563eb;
        }

        /* Formulaire */
        body {
            background-color: #f3f4f6;
            color: #333;
            font-family: 'Roboto', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .form {
            display: flex;
            align-items: center;
            flex-direction: column;
            gap: 20px;
            background-color: #475569; /* Gris foncé */
            border-radius: 15px;
            padding: 40px;
            width: 500px;
            position: relative;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.2);
            border: 3px solid #3b82f6;
        }

        .button {
            font-size: 17px;
            background: #3b82f6;
            color: white;
            padding: 0.7em 4em;
            border: none;
            border-radius: 5px;
            transition: all 0.2s ease-in-out;
            cursor: pointer;
        }

        .button:hover {
            background: #2563eb;
        }

        .button.cancel {
            background: #ef4444;
        }

        .button.cancel:hover {
            background: #dc2626;
        }

        .input {
            width: calc(100% - 20px);
            padding: 8px;
            border: none;
            border-bottom: 2px solid #3b82f6;
            background-color: transparent;
            color: #eff1f5;
            transition: 0.3s ease;
            outline: none;
        }

        .input::placeholder {
            color: #94a3b8;
        }

        .input:focus {
            border-bottom: 2px solid #2563eb;
            color: #2563eb;
        }

        .label {
            color: white;
            font-size: 14px;
            font-weight: bold;
        }

        /* Mode Sombre */
        body.dark-mode {
            background-color: #1e293b;
            color: #fff;
        }

        body.dark-mode .form {
            background-color: #475569;
            border: 3px solid #2563eb;
        }

        body.dark-mode .button {
            background-color: #3b82f6;
        }

        body.dark-mode .button.cancel {
            background-color: #ef4444;
        }

        /* Mode Clair */
        body.light-mode {
            background-color: #f3f4f6;
            color: #333;
        }

        body.light-mode .form {
            background-color: #475569;
            border: 3px solid #3b82f6;
        }

        /* Alerte verte */
        .alert-green {
            background-color: #28a745 !important;
            color: white !important;
            padding: 15px !important;
            border-radius: 5px !important;
            margin-bottom: 20px !important;
            font-size: 16px !important;
            display: flex !important;
            justify-content: space-between !important;
            align-items: center !important;
        }

        .alert-green .close {
            cursor: pointer;
            font-weight: bold;
            color: white;
            font-size: 20px;
            margin-left: 10px;
        }

        /* Centrer le texte "Modifier le Vote" */
        h1 {
            text-align: center;
            color: white;
            font-size: 2em;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <!-- Bouton de Mode Sombre -->
    <button id="dark-mode-toggle">🌙</button>

    <div class="container">
        <!-- Alerte Verte -->
        @if(session('success'))
            <div class="alert-green">
                {{ session('success') }}
                <span class="close" onclick="this.parentElement.style.display='none';">×</span>
            </div>
        @endif

        <!-- Formulaire -->
        <form class="form" action="{{ route('votes.update', $vote->id) }}" method="POST">
            @csrf
            @method('PUT')

            <!-- Étudiant -->
            <label for="etudiant_id" class="label">Étudiant</label>
            <select id="etudiant_id" name="etudiant_id" class="input" required>
                @foreach ($etudiants as $etudiant)
                    <option value="{{ $etudiant->id }}" {{ $vote->etudiant_id == $etudiant->id ? 'selected' : '' }}>
                        {{ $etudiant->prenom }}  {{ $etudiant->nom }}
                    </option>
                @endforeach
            </select>

            <!-- Candidat -->
            <label for="candidat_id" class="label">Candidat</label>
            <select id="candidat_id" name="candidat_id" class="input" required>
                @foreach ($candidats as $candidat)
                    <option value="{{ $candidat->id }}" {{ $vote->candidat_id == $candidat->id ? 'selected' : '' }}>
                        {{ $candidat->etudiant->prenom }} {{ $candidat->etudiant->nom }}
                    </option>
                @endforeach
            </select>

            <!-- Date -->
            <label for="date" class="label">Date</label>
            <input type="date" id="date" name="date" class="input" value="{{ $vote->date }}" required>

            <!-- Boutons -->
            <button type="submit" class="button">Mettre à jour</button>
            <a href="{{ route('votes.index') }}" class="button cancel" style="text-decoration: none; text-align: center;">Annuler</a>
        </form>
    </div>

    <script>
        // Fonctionnalité de Mode Sombre et Clair
        const toggleButton = document.getElementById('dark-mode-toggle');

        toggleButton.addEventListener('click', () => {
            if (document.body.classList.contains('dark-mode')) {
                document.body.classList.remove('dark-mode');
                document.body.classList.add('light-mode');
                toggleButton.textContent = '🌙';
            } else if (document.body.classList.contains('light-mode')) {
                document.body.classList.remove('light-mode');
                document.body.classList.add('dark-mode');
                toggleButton.textContent = '☀️';
            } else {
                document.body.classList.add('dark-mode');
                toggleButton.textContent = '☀️';
            }
        });
    </script>
</body>
</html>
