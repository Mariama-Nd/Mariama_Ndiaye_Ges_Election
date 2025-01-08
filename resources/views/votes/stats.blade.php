<div class="container mt-5">
    <!-- Bouton de retour au Dashboard -->
    <div class="d-flex justify-content-start mb-4">
        <a href="{{ route('dashboard') }}" class="btn btn-outline-secondary shadow-sm">
            <i class="bi bi-arrow-left"></i> Retour au Dashboard
        </a>
    </div>

    <!-- Titre principal -->
    <div class="text-center mb-5">
        <h1 class="display-5 fw-bold text-primary">Statistiques des Votes et Entités</h1>
        <p class="lead text-muted">Visualisez et exportez les statistiques des votes et des entités dans un format clair et interactif.</p>
    </div>

    <!-- Section des choix -->
    <div class="row mb-4">
        <!-- Choix du type de statistique -->
        <div class="col-md-6 mb-3">
            <label for="typeGraph" class="form-label fw-semibold">Type de Statistiques</label>
            <select id="typeGraph" class="form-select shadow-sm" onchange="loadGraph()">
                <option value="candidats">Votes par candidat</option>
                <option value="departements">Votes par département</option>
                <option value="programmes">Votes par programme</option>
                <option value="etudiantsParProgramme">Étudiants par programme</option>
                <option value="programmesParDepartement">Programmes par département</option>
            </select>
        </div>

        <!-- Choix du type de graphique -->
        <div class="col-md-6 mb-3">
            <label for="chartType" class="form-label fw-semibold">Type de Graphique</label>
            <select id="chartType" class="form-select shadow-sm" onchange="changeChartType()">
                <option value="bar">Barres</option>
                <option value="pie">Camembert</option>
                <option value="line">Lignes</option>
            </select>
        </div>
    </div>

    <!-- Section des boutons d'export -->
    <div class="text-center mb-4">
        <button class="btn btn-outline-primary shadow-sm me-2" onclick="exportData('csv')">
            <i class="bi bi-file-earmark-spreadsheet"></i> Exporter en CSV
        </button>
        <button class="btn btn-outline-danger shadow-sm" onclick="exportData('pdf')">
            <i class="bi bi-file-earmark-pdf"></i> Exporter en PDF
        </button>
    </div>

    <!-- Conteneur du graphique -->
    <div class="card shadow-sm border-0">
        <div class="card-body">
            <canvas id="chartContainer" width="350" height="150"></canvas>
        </div>
    </div>
</div>

<!-- Chart.js CDN -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    let ctx = document.getElementById('chartContainer').getContext('2d');
    let chartType = 'bar'; // Type de graphique par défaut
    let myChart = null;

    // Fonction pour charger les données du graphique
    function loadGraph() {
        const type = document.getElementById('typeGraph').value;
        let url = '';

        switch (type) {
            case 'candidats':
                url = "{{ route('votes.stats') }}";
                break;
            case 'departements':
                url = "{{ route('votes.statsDepartements') }}";
                break;
            case 'programmes':
                url = "{{ route('votes.statsProgrammes') }}";
                break;
            case 'etudiantsParProgramme':
                url = "{{ route('stats.etudiantsParProgramme') }}";
                break;
            case 'programmesParDepartement':
                url = "{{ route('stats.programmesParDepartement') }}";
                break;
            default:
                console.error('Type de statistique inconnu');
                return;
        }

        // Récupération des données depuis le backend
        fetch(url)
            .then(response => response.json())
            .then(data => {
                const labels = data.map(item => item.programme || item.departement || item.candidat);
                const values = data.map(item => item.etudiants || item.programmes || item.votes);

                renderChart(labels, values);
            })
            .catch(error => console.error('Erreur lors de la récupération des données :', error));
    }

    // Fonction pour changer le type de graphique
    function changeChartType() {
        chartType = document.getElementById('chartType').value;
        loadGraph(); // Recharge le graphique avec le nouveau type
    }

    // Fonction pour rendre le graphique
    function renderChart(labels, data) {
        if (myChart) {
            myChart.destroy(); // Détruit l'ancien graphique avant d'en créer un nouveau
        }

        myChart = new Chart(ctx, {
            type: chartType,
            data: {
                labels: labels,
                datasets: [{
                    label: 'Statistiques',
                    data: data,
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(153, 102, 255, 0.2)',
                        'rgba(255, 159, 64, 0.2)'
                    ],
                    borderColor: [
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        display: true,
                        position: 'top'
                    }
                },
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    }

    // Charger les données au démarrage
    loadGraph();

    function exportData(format) {
        const type = document.getElementById('typeGraph').value; // Récupère le type sélectionné
        const url = `/export/${format}/${type}`; // Construit l'URL d'exportation
        window.location.href = url; // Redirige vers l'URL pour télécharger le fichier
    }
</script>

<!-- Bootstrap Icons -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
