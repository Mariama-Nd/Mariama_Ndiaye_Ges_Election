<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Page d'Accueil | Amicale des Étudiants</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
    <style>
        /* Background et mise en page générale */
        body {
            background: linear-gradient(135deg, #4e73df, #1cc88a);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #fff;
            margin: 0;
            padding: 0;
        }

        /* Section principale */
        .hero-section {
            height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            background-image: url('https://source.unsplash.com/1600x900/?student,university');
            background-size: cover;
            background-position: center;
            padding: 0 20px;
        }

        .hero-section h1 {
            font-size: 3.5rem;
            font-weight: 700;
        }

        .hero-section p {
            font-size: 1.25rem;
            max-width: 600px;
            margin: 0 auto;
        }

        /* Styles pour les boutons */
        .btn-custom {
            font-size: 1.1rem;
            padding: 12px 40px;
            margin-top: 20px;
            border-radius: 30px;
            font-weight: 600;
            text-transform: uppercase;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        .btn-register {
            background-color: #4e73df;
            color: #fff;
        }

        .btn-register:hover {
            background-color: #2e59d9;
        }

        .btn-login {
            background-color: #1cc88a;
            color: #fff;
        }

        .btn-login:hover {
            background-color: #17a673;
        }

        /* Style pour les icônes */
        .hero-icons i {
            font-size: 2rem;
            color: rgba(255, 255, 255, 0.8);
            margin-top: 10px;
            transition: color 0.3s;
        }

        .hero-icons i:hover {
            color: #fff;
        }

        /* Texte en bas */
        .footer-text {
            position: absolute;
            bottom: 20px;
            text-align: center;
            font-size: 1rem;
            color: rgba(255, 255, 255, 0.7);
        }

        .footer-text a {
            color: rgba(255, 255, 255, 0.8);
            text-decoration: none;
        }

        .footer-text a:hover {
            color: #1cc88a;
        }
    </style>
</head>

<body>

    <div class="hero-section">
        <h1>Bienvenue à l'Amicale des Étudiants</h1>
        <p>Rejoignez-nous pour gérer vos votes, explorer les programmes et profiter de l'intégration étudiante de manière interactive.</p>

        <div>
            <a href="{{ route('register') }}" class="btn btn-custom btn-register">
                <i class="bi bi-person-plus"></i> S'inscrire
            </a>
            <a href="{{ route('login') }}" class="btn btn-custom btn-login">
                <i class="bi bi-box-arrow-in-right"></i> Se connecter
            </a>
        </div>

        <div class="hero-icons">
            <a href="#!" title="En savoir plus">
                <i class="bi bi-info-circle"></i>
            </a>
            <a href="#!" title="Contactez-nous">
                <i class="bi bi-envelope"></i>
            </a>
        </div>
    </div>

    <div class="footer-text">
        <p>© 2025 Amicale des Étudiants. <a href="{{ route('politique_de_confidentialite') }}">Politique de confidentialité</a></p>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
