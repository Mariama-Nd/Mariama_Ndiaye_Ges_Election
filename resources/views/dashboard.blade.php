<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tableau de Bord</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
        /* Styles généraux */
        body {
            margin: 0;
            font-family: 'Roboto', sans-serif;
            background-color: #f3f4f6;
            color: #333;
            display: flex;
            min-height: 100vh;
            flex-direction: column;
        }

        h1, h2, h3 {
            margin: 0;
        }

        a {
            text-decoration: none;
            color: inherit;
        }

        ul {
            list-style: none;
            padding: 0;
        }

        /* Sidebar */
        .sidebar {
            position: fixed;
            top: 0;
            left: 0;
            width: 250px;
            height: 100%;
            background-color: #1e293b;
            color: white;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            padding: 20px;
        }

        .sidebar h2 {
            font-size: 26px;
            text-align: center;
            margin-bottom: 20px;
        }

        .user-info {
            display: flex;
            flex-direction: column; /* Aligner les éléments verticalement */
            align-items: center;
            gap: 10px;
            margin-bottom: 20px;
        }

        .user-photo {
            width: 120px; /* Augmente la taille de l'image */
            height: 120px; /* Augmente la taille de l'image */
            border-radius: 50%;
            object-fit: cover;
        }

        .user-name {
            text-align: center; /* Centrer le texte sous l'image */
            font-size: 16px;
            color: #fff;
        }


        .menu {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        .menu a {
            font-size: 18px;
            padding: 10px 15px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .menu a:hover {
            background-color: #334155;
        }

        .menu a.active {
            background-color: #475569;
        }

        /* Topbar */
        .topbar {
            height: 60px;
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            padding: 0 20px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            position: fixed;
            left: 250px;
            right: 0;
            z-index: 1000;
        }

        .topbar h1 {
            font-size: 20px;
        }

        .logout {
            background-color: #ef4444;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            border: none;
            transition: background-color 0.3s ease;
        }

        .logout:hover {
            background-color: #dc2626;
        }

        /* Main content */
        .main {
            margin-top: 80px;
            margin-left: 250px;
            padding: 20px;
            flex: 1;
        }

        .main h2 {
            margin-bottom: 20px;
        }

        .cards {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 20px;
        }

        .card {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
        }

        .card h3 {
            font-size: 18px;
            margin-bottom: 10px;
        }

        .card p {
            font-size: 16px;
            color: #666;
        }

        .card a {
            margin-top: 10px;
            display: inline-block;
            padding: 10px 20px;
            background-color: #3b82f6;
            color: white;
            border-radius: 5px;
            font-size: 14px;
            transition: background-color 0.3s ease;
        }

        .card a:hover {
            background-color: #2563eb;
        }

        hr {
            border: none; /* Supprime les bordures par défaut */
            height: 1px; /* Définit une hauteur fine */
            background-color: #334155; /* Couleur de la barre (gris foncé) */
            margin: 15px 0; /* Espacement autour de la barre */
}

    </style>
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <h2>Élection du bureau de l'amicale des étudiants</h2>
        <hr>

        <!-- Section utilisateur -->
        <div class="user-info">
            <img src="{{ asset('storage/' . auth()->user()->photo) }}" alt="Photo de l'utilisateur" class="user-photo">
            <div class="user-name">
                <p>{{ auth()->user()->name }}</p>
                <p>{{ auth()->user()->email }}</p>
            </div>
        </div>
        <hr>


        <nav class="menu">
            @if(auth()->user()->role == 'administrateur')
                <a href="{{ route('etudiants.index') }}" class="{{ request()->routeIs('etudiants.*') ? 'active' : '' }}">Étudiants</a>
                <a href="{{ route('departements.index') }}" class="{{ request()->routeIs('departements.*') ? 'active' : '' }}">Départements</a>
                <a href="{{ route('programmes.index') }}" class="{{ request()->routeIs('programmes.*') ? 'active' : '' }}">Programmes</a>
                <a href="{{ route('votes.index') }}" class="{{ request()->routeIs('votes.*') ? 'active' : '' }}">Votes</a>
            @endif
            <a href="{{ route('candidats.index') }}" class="{{ request()->routeIs('candidats.*') ? 'active' : '' }}">Candidats</a>
            <a href="{{ route('votes.statsView') }}" class="{{ request()->routeIs('votes.statsView') ? 'active' : '' }}">Statistiques</a>
        </nav>
        <hr>

        <footer>
            <p>&copy; {{ date('Y-m-d') }} Élections</p>
        </footer>
    </div>

    <!-- Topbar -->
    <div class="topbar">
        <h1>Tableau de Bord</h1>
        <form id="logout-form" method="POST" action="{{ route('logout') }}" style="display: inline;">
            @csrf
            <button type="submit" class="logout">Déconnexion</button>
        </form>
    </div>

    <!-- Main Content -->
    <div class="main">
        <h2>Bienvenue dans le Tableau de Bord</h2>
        <div class="cards">
            @if(auth()->user()->role == 'administrateur')
                <div class="card">
                    <h3>Étudiants</h3>
                    <p>Gérez tous les étudiants inscrits.</p>
                    <a href="{{ route('etudiants.index') }}">Gérer</a>
                </div>
                <div class="card">
                    <h3>Départements</h3>
                    <p>Gérez les départements académiques.</p>
                    <a href="{{ route('departements.index') }}">Gérer</a>
                </div>
                <div class="card">
                    <h3>Programmes</h3>
                    <p>Gérez les programmes d'études.</p>
                    <a href="{{ route('programmes.index') }}">Gérer</a>
                </div>
                <div class="card">
                    <h3>Votes</h3>
                    <p>Surveillez et administrez les votes.</p>
                    <a href="{{ route('votes.index') }}">Gérer</a>
                </div>
            @endif
            <div class="card">
                <h3>Candidats</h3>
                <p>Gérez les candidatures aux élections.</p>
                <a href="{{ route('candidats.index') }}">Gérer</a>
            </div>
            <div class="card">
                <h3>Statistiques</h3>
                <p>Analysez les résultats en temps réel.</p>
                <a href="{{ route('votes.statsView') }}">Voir</a>
            </div>
        </div>
    </div>
</body>
</html>
