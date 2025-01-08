<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modifier le Département</title>
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
            background-color: #475569; /* Gris foncé pour le mode sombre */
            border: 3px solid #2563eb; /* Bordure bleu foncé */
        }

        body.dark-mode .button {
            background-color: #3b82f6;
        }

        body.dark-mode .button.cancel {
            background-color: #ef4444;
        }

        body.dark-mode .input {
            color: #3b82f6;
            border-bottom: 2px solid #3b82f6;
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

        /* Centrer le titre */
        h1 {
            text-align: center;
            color: #3b82f6;
            font-size: 2em;
            margin-bottom: 20px;
        }

        /* Alerte verte */
        .alert-green {
            background-color: #28a745;
            color: white;
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 20px;
            font-size: 16px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .alert-green .close {
            cursor: pointer;
            font-weight: bold;
            color: white;
            font-size: 20px;
            margin-left: 10px;
        }
    </style>
</head>
<body class="light-mode">
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
        <form class="form" action="{{ route('departements.update', $departement) }}" method="POST">
            @csrf
            @method('PUT')

            <!-- Nom du Département -->
            <label for="nom" class="label">Nom du département:</label>
            <input type="text" name="nom" id="nom" class="input" value="{{ old('nom', $departement->nom) }}" required>
            @error('nom')
                <small class="text-danger">{{ $message }}</small>
            @enderror

            <button type="submit" class="button">Modifier le Département</button>
            <a href="{{ route('departements.index') }}" class="button cancel" style="text-decoration: none; text-align: center;">Annuler</a>
        </form>
    </div>

    <!-- Script Dark Mode -->
    <script>
        document.getElementById('dark-mode-toggle').addEventListener('click', function () {
            const body = document.body;

            // Bascule entre les classes light-mode et dark-mode
            if (body.classList.contains('light-mode')) {
                body.classList.remove('light-mode');
                body.classList.add('dark-mode');
            } else {
                body.classList.remove('dark-mode');
                body.classList.add('light-mode');
            }
        });
    </script>
</body>
</html>
