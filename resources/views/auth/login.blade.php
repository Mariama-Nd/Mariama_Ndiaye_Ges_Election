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

body.dark-mode .card {
    background-image: linear-gradient(163deg, #00ff75 0%, #ff8c00 100%);
}

body.dark-mode .form {
    background-color: #171717;
}

body.dark-mode .button1 {
    background-image: linear-gradient(163deg, #00642f 0%, #a65e00 100%);
    color: rgb(0, 255, 200);
}

body.dark-mode .button3 {
    background-image: linear-gradient(163deg, #00ff75 0%, #ff8c00 100%);
    color: rgb(255, 255, 255);
}

#toggle-dark-mode {
    position: fixed; /* Fixer le bouton en haut à droite */
    top: 20px;
    right: 20px;
    background-color: transparent;
    border: none;
    font-size: 1.5em;
    cursor: pointer;
    color: white;
    transition: color 0.3s ease;
    z-index: 9999; /* S'assurer que le bouton est au-dessus des autres éléments */
}

#toggle-dark-mode:hover {
    color: #00ff75; /* Color change on hover */
}

.card {
    background-image: linear-gradient(163deg, #00ff75 0%, rgb(255, 85, 0) 100%);
    border-radius: 22px;
    transition: all .3s;
    width: 100%;
    max-width: 500px;
    box-sizing: border-box;
    padding: 5px;
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

.input-icon {
    height: 1.3em;
    width: 1.3em;
    fill: rgb(0, 255, 200);
}

.input-field {
    background: none;
    border: none;
    outline: none;
    width: 100%;
    color: rgb(0, 255, 200);
}

.form .btn {
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

.button3 {
    margin-bottom: 3em;
    padding: 0.5em;
    border-radius: 5px;
    border: none;
    outline: none;
    transition: .4s ease-in-out;
    background-image: linear-gradient(163deg, #00ff75 0%, #ff8c00 100%);
    color: rgb(0, 0, 0);
}

.button3:hover {
    background-image: linear-gradient(163deg, #00ff75 0%, #ff8c00 100%);
    color: rgb(255, 255, 255);
}

@media (max-width: 600px) {
    .form {
        padding: 1.5em;
    }

    #heading {
        font-size: 1.2em;
    }

    .input-field, .button1, .button3 {
        padding: 0.7em;
        font-size: 0.9em;
    }

    .card {
        max-width: 100%;
        margin: 0 10px;
    }
}


    </style>

<body id="body" class="light-mode">
    <div class="card">
        <div class="card2">
            <form class="form" method="POST" action="{{ route('login') }}">
                <p id="heading">Sign In</p>
                @csrf
                <!-- Email Address -->
                <div class="field">
                    <svg viewBox="0 0 16 16" fill="currentColor" height="16" width="16" xmlns="http://www.w3.org/2000/svg" class="input-icon">
                        <path d="M13.106 7.222c0-2.967-2.249-5.032-5.482-5.032-3.35 0-5.646 2.318-5.646 5.702 0 3.493 2.235 5.708 5.762 5.708.862 0 1.689-.123 2.304-.335v-.862c-.43.199-1.354.328-2.29.328-2.926 0-4.813-1.88-4.813-4.798 0-2.844 1.921-4.881 4.594-4.881 2.735 0 4.608 1.688 4.608 4.156 0 1.682-.554 2.769-1.416 2.769-.492 0-.772-.28-.772-.76V5.206H8.923v.834h-.11c-.266-.595-.881-.964-1.6-.964-1.4 0-2.378 1.162-2.378 2.823 0 1.737.957 2.906 2.379 2.906.8 0 1.415-.39 1.709-1.087h.11c.081.67.703 1.148 1.503 1.148 1.572 0 2.57-1.415 2.57-3.643zm-7.177.704c0-1.197.54-1.907 1.456-1.907.93 0 1.524.738 1.524 1.907S8.308 9.84 7.371 9.84c-.895 0-1.442-.725-1.442-1.914z"></path>
                    </svg>
                    <input type="email" class="input-field" name="email" value="{{ old('email') }}" required autofocus placeholder="E-mail" autocomplete="username">
                </div>

                <!-- Password -->
                <div class="field">
                    <svg viewBox="0 0 16 16" fill="currentColor" height="16" width="16" xmlns="http://www.w3.org/2000/svg" class="input-icon">
                        <path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2z"></path>
                    </svg>
                    <input type="password" class="input-field" name="password" required placeholder="Password" autocomplete="current-password">
                </div>

                <!-- Remember Me -->
                <div style="justify-content: flex-start; gap: 0.3em;">
                    <input type="checkbox" name="remember" id="remember_me" class="input-field" />
                    <label for="remember_me" style="color: white;">Remember me</label>
                </div>

                <!-- Login Button -->
                <div class="btn">
                    <button type="submit" class="button1">Login</button>
                </div>

                <!-- Forgot Password -->
                <button type="button" class="button3"><a href="{{ route('password.request') }}" class="button3">{{ __('Forgot your password?') }}</a></button>

                <!-- Dark Mode Toggle -->
                <button type="button" id="toggle-dark-mode" class="button3">Toggle Dark Mode</button>
            </form>
        </div>
    </div>

    <script>
        // Sélectionne le bouton et le body
        const toggleButton = document.getElementById('toggle-dark-mode');
        const body = document.body;

        // Ajoute un événement de clic sur le bouton
        toggleButton.addEventListener('click', () => {
            // Vérifie si le body a la classe 'dark-mode'
            if (body.classList.contains('dark-mode')) {
                // Change le texte du bouton pour le soleil (mode clair)
                toggleButton.textContent = '🌞';
                // Passe en mode clair
                body.classList.remove('dark-mode');
                body.classList.add('light-mode');
            } else {
                // Change le texte du bouton pour la lune (mode sombre)
                toggleButton.textContent = '🌙';
                // Passe en mode sombre
                body.classList.remove('light-mode');
                body.classList.add('dark-mode');
            }
        });

    </script>
</body>
