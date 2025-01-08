<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ajouter un Programme</title>
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
        .select option {
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
            background-color: #475569; /* Gris foncé pour le mode sombre */
            border: 3px solid #2563eb; /* Bordure bleu foncé */
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
            background-color: #475569; /* Marron clair */
            border: 3px solid #3b82f6; /* Bordure bleue */
        }
    </style>
</head>
<body>
    <!-- Bouton de Mode Sombre -->
    <button id="dark-mode-toggle">🌙</button>

    <!-- Formulaire -->
    <form class="form" action="{{ route('programmes.store') }}" method="POST">
        @csrf

        <!-- Nom du Programme -->
        <label for="nom" class="label">Nom du Programme:</label>
        <input type="text" name="nom" id="nom" class="input" value="{{ old('nom') }}" required>
        @error('nom')
            <small class="text-danger">{{ $message }}</small>
        @enderror

        <!-- Sélection Département -->
        <label for="departement_id" class="label">Département:</label>
        <select name="departement_id" id="departement_id" class="select" required>
            <option value="">-- Sélectionnez un département --</option>
            @foreach($departements as $departement)
                <option value="{{ $departement->id }}">{{ $departement->nom }}</option>
            @endforeach
        </select>
        @error('departement_id')
            <small class="text-danger">{{ $message }}</small>
        @enderror

        <!-- Boutons -->
        <button type="submit" class="button">Enregistrer</button>
        <a href="{{ route('departements.index') }}" class="button cancel" style="text-decoration: none; text-align: center;">Annuler</a>
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
