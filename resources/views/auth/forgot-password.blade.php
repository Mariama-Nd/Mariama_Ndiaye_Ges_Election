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

    .form p {
        text-align: center;
        color: rgb(0, 255, 200);
        font-size: 1.2em;
    }

    .field {
        display: flex;
        flex-direction: column;
        gap: 5px;
    }

    .input-field {
        padding: 0.8em;
        border-radius: 5px;
        border: none;
        outline: none;
        width: 100%;
        color: rgb(0, 255, 200);
        background-color: #171717;
        box-shadow: inset 2px 5px 10px rgb(5, 5, 5);
    }

    .form .btn {
        display: flex;
        justify-content: center;
        margin-top: 1.5em;
    }

    .button1 {
        padding: 0.5em 1.1em;
        border-radius: 5px;
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

    @media (max-width: 600px) {
        .form {
            padding: 1.5em;
        }

        .input-field, .button1 {
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
        <form class="form" method="POST" action="{{ route('password.email') }}">
            <p>Mot de passe oublié</p>
            <div class="field">
                <label for="email" style="color: rgb(0, 255, 200);">Adresse Email</label>
                <input id="email" class="input-field" type="email" name="email" value="{{ old('email') }}" required autofocus placeholder="Entrez votre email">
            </div>
            <div class="btn">
                <button type="submit" class="button1">Envoyer le lien</button>
            </div>
        </form>
    </div>

    <button type="button" id="toggle-dark-mode" class="button3">🌙</button>

    <script>
        const toggleButton = document.getElementById('toggle-dark-mode');
        const body = document.body;

        toggleButton.addEventListener('click', () => {
            body.classList.toggle('dark-mode');
            body.classList.toggle('light-mode');
        });
    </script>
</body>
