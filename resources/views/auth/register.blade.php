<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inscription</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
            background-color: #e8e8e8;
            font-family: Arial, sans-serif;
            position: relative;
        }

        body.light-mode {
            background-color: #e8e8e8;
            color: black;
        }

        body.dark-mode {
            background-color: #171717;
            color: white;
        }

        .card {
            position: relative;
            width: 100%;
            max-width: 500px;
            padding: 5px;
            border-radius: 22px;
            background: linear-gradient(orange, orangered);
            overflow: hidden;
        }

        .card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-image: linear-gradient(163deg, #00ff75 0%, #ff8c00 100%);
            background-size: 200% 200%;
            background-position: 100% 50%;
            animation: borderAnimation 3s linear infinite;
            z-index: -1;
            border-radius: 22px;
        }

        @keyframes borderAnimation {
            0% {
                background-position: 100% 50%;
            }

            50% {
                background-position: 0% 50%;
            }

            100% {
                background-position: 100% 50%;
            }
        }

        .form {
            display: flex;
            flex-direction: column;
            gap: 10px;
            padding: 2em;
            background-color: #171717;
            border-radius: 20px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
        }

        #heading {
            text-align: center;
            margin: 0;
            color: rgb(0, 255, 200);
            font-size: 1.5em;
        }

        .field {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5em;
            border-radius: 25px;
            padding: 0.6em;
            border: none;
            outline: none;
            color: white;
            background-color: #171717;
            box-shadow: inset 2px 5px 10px rgb(5, 5, 5);
        }

        .input-field {
            background: none;
            border: none;
            outline: none;
            width: 100%;
            color: rgb(0, 255, 200);
        }

        .btn {
            display: flex;
            justify-content: center;
            flex-direction: row;
            margin-top: 2.5em;
        }

        .button1 {
            padding: 0.5em 1.1em;
            border-radius: 5px;
            margin-right: 0.5em;
            border: none;
            outline: none;
            transition: .4s ease-in-out;
            background-image: linear-gradient(163deg, #00ff75 0%, #ff8c00 100%);
            color: rgb(0, 0, 0);
        }

        .button1:hover {
            background-image: linear-gradient(163deg, #00642f 0%, #a65e00 100%);
            color: rgb(0, 255, 200);
        }

        #toggle-dark-mode {
            position: fixed;
            top: 20px;
            right: 20px;
            padding: 0.8em;
            border-radius: 50%;
            background-color: rgba(0, 0, 0, 0.6);
            color: white;
            font-size: 1.5em;
            border: none;
            cursor: pointer;
            z-index: 10;
            transition: background-color 0.3s;
        }

        #toggle-dark-mode:hover {
            background-color: rgba(0, 0, 0, 0.8);
        }
    </style>
</head>

<body id="body" class="light-mode">
    <div class="card">
        <form class="form" method="POST" action="{{ route('register') }}" enctype="multipart/form-data">
            @csrf
            <p id="heading">Inscription</p>

            <!-- Nom -->
            <div class="field">
                <input type="text" class="input-field" name="name" value="{{ old('name') }}" required placeholder="Nom">
            </div>

            <!-- Prénom -->
            <div class="field">
                <input type="text" class="input-field" name="prenom" value="{{ old('prenom') }}" required placeholder="Prénom">
            </div>

            <!-- Naissance -->
            <div class="field">
                <input type="date" class="input-field" name="naissance" value="{{ old('naissance') }}" required>
            </div>

            <!-- Lieu -->
            <div class="field">
                <input type="text" class="input-field" name="lieu" value="{{ old('lieu') }}" required placeholder="Lieu de naissance">
            </div>

            <!-- Sexe -->
            <div class="field">
                <select class="input-field" name="sexe" required>
                    <option value="Masculin" {{ old('sexe') == 'Masculin' ? 'selected' : '' }}>Masculin</option>
                    <option value="Feminin" {{ old('sexe') == 'Feminin' ? 'selected' : '' }}>Féminin</option>
                </select>
            </div>

            <!-- Adresse -->
            <div class="field">
                <input type="text" class="input-field" name="adresse" value="{{ old('adresse') }}" required placeholder="Adresse">
            </div>

            <!-- Programme -->
            <div class="field">
                <select class="input-field" name="programme_id" required>
                    @foreach($programmes as $programme)
                    <option value="{{ $programme->id }}" {{ old('programme_id') == $programme->id ? 'selected' : '' }}>
                        {{ $programme->nom }}
                    </option>
                    @endforeach
                </select>
            </div>

            <!-- Téléphone -->
            <div class="field">
                <input type="text" class="input-field" name="telephone" value="{{ old('telephone') }}" placeholder="Téléphone">
            </div>

            <!-- Matricule -->
            <div class="field">
                <input type="text" class="input-field" name="matricule" value="{{ old('matricule') }}" required placeholder="Matricule">
            </div>

            <!-- Photo -->
            <div class="field">
                <input type="file" class="input-field" name="photo" required>
            </div>

            <!-- Email -->
            <div class="field">
                <input type="email" class="input-field" name="email" value="{{ old('email') }}" required placeholder="Email">
            </div>

            <!-- Password -->
            <div class="field">
                <input type="password" class="input-field" name="password" required placeholder="Mot de passe">
            </div>

            <!-- Confirm Password -->
            <div class="field">
                <input type="password" class="input-field" name="password_confirmation" required placeholder="Confirmer mot de passe">
            </div>

            <div class="btn">
                <button type="submit" class="button1">S'inscrire</button>
            </div>
        </form>
    </div>

    <button id="toggle-dark-mode">🌙</button>

    <script>
        const toggleButton = document.getElementById('toggle-dark-mode');
        const body = document.body;

        toggleButton.addEventListener('click', () => {
            body.classList.toggle('dark-mode');
            body.classList.toggle('light-mode');
        });
    </script>
</body>

</html>
