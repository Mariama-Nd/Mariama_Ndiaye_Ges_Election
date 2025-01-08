<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modifier un Candidat</title>
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
            background-color: #475569; /* Marron doux */
            border-radius: 15px;
            padding: 40px;
            width: 500px;
            position: relative;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.2);
            border: 3px solid #3b82f6; /* Bordure bleue */
        }

        .button {
            font-size: 17px;
            background: #3b82f6; /* Bleu */
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
            background: #ef4444; /* Rouge pour le bouton Annuler */
        }

        .button.cancel:hover {
            background: #dc2626;
        }

        .input,
        .select {
            width: calc(100% - 20px);
            padding: 8px;
            border: none;
            border-bottom: 2px solid #3b82f6;
            background-color: transparent;
            color: #eff1f5;
            transition: 0.3s ease;
            outline: none;
        }

        .input::placeholder,
        .select {
            color: #94a3b8;
        }

        .input:focus,
        .select:focus {
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
    </style>
</head>
<body>
    <!-- Bouton de Mode Sombre -->
    <button id="dark-mode-toggle">🌙</button>

    <!-- Formulaire de modification -->
    <form class="form" action="{{ route('candidats.update', $candidat->id) }}" method="POST">
        @csrf
        @method('PUT')

        <!-- Sélection Étudiant -->
        <label for="etudiant_id" class="label">Étudiant:</label>
        <select name="etudiant_id" id="etudiant_id" class="select">
            <option value="">Sélectionner un étudiant</option>
            @foreach ($etudiants as $etudiant)
                <option value="{{ $etudiant->id }}" {{ $candidat->etudiant_id == $etudiant->id ? 'selected' : '' }}>
                    {{ $etudiant->nom }} {{ $etudiant->prenom }}
                </option>
            @endforeach
        </select>

        <!-- Niveau -->
        <label for="niveau" class="label">Niveau:</label>
        <select name="niveau" id="niveau" class="select">
            <option value="Licence" {{ $candidat->niveau == 'Licence' ? 'selected' : '' }}>Licence</option>
            <option value="Master" {{ $candidat->niveau == 'Master' ? 'selected' : '' }}>Master</option>
            <option value="Doctorat" {{ $candidat->niveau == 'Doctorat' ? 'selected' : '' }}>Doctorat</option>
        </select>

        <!-- Boutons -->
        <button type="submit" class="button">Mettre à jour</button>
        <a href="{{ route('candidats.index') }}" class="button cancel" style="text-decoration: none; text-align: center;">Annuler</a>
    </form>

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
