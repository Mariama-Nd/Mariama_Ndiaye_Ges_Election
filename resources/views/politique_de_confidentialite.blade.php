
<div class="container py-5">
    <div class="row justify-content-center">
        <div class="col-lg-8 col-md-10">
            <div class="card shadow-sm border-light rounded">
                <div class="card-header text-center">
                    <h2 class="text-dark">Politique de Confidentialité</h2>
                </div>
                <div class="card-body">
                    <p><strong>Dernière mise à jour : {{ date('d M Y') }}</strong></p>
                    <p>Nous accordons une grande importance à la confidentialité et à la sécurité des informations personnelles de nos utilisateurs. Cette politique de confidentialité explique comment nous collectons, utilisons, protégeons et partageons vos informations personnelles lorsque vous utilisez notre application.</p>

                    <h5>1. Collecte d'informations</h5>
                    <p>Nous collectons des informations personnelles lorsque vous vous inscrivez, vous connectez, ou interagissez avec notre application. Les types d'informations que nous collectons incluent :</p>
                    <ul>
                        <li><strong>Informations personnelles</strong> : Nom, adresse e-mail, photo de profil (pour les étudiants).</li>
                        <li><strong>Informations d'utilisation</strong> : Données sur la façon dont vous interagissez avec notre application.</li>
                        <li><strong>Informations de localisation</strong> : Si vous avez activé la géolocalisation sur votre appareil.</li>
                    </ul>

                    <h5>2. Utilisation des informations</h5>
                    <p>Les informations collectées sont utilisées pour les finalités suivantes :</p>
                    <ul>
                        <li>Fournir les services demandés (inscription, connexion, gestion des votes, etc.).</li>
                        <li>Améliorer l'expérience utilisateur (analyser les données d'utilisation pour améliorer l'application).</li>
                        <li>Envoyer des notifications importantes (mises à jour de l'application, informations de sécurité, etc.).</li>
                        <li>Contacter pour des raisons administratives ou légales.</li>
                    </ul>

                    <h5>3. Partage des informations</h5>
                    <p>Nous ne partageons pas vos informations personnelles avec des tiers, sauf dans les circonstances suivantes :</p>
                    <ul>
                        <li><strong>Avec nos partenaires de services</strong> : Nous pouvons partager vos informations avec des prestataires de services de confiance.</li>
                        <li><strong>Obligations légales</strong> : Nous pouvons divulguer vos informations si cela est requis par la loi.</li>
                    </ul>

                    <h5>4. Sécurité des données</h5>
                    <p>Nous mettons en œuvre des mesures de sécurité appropriées pour protéger vos informations personnelles. Cependant, aucune méthode de transmission sur Internet n'est totalement sûre.</p>

                    <h5>5. Cookies et technologies similaires</h5>
                    <p>Notre application utilise des cookies et d'autres technologies similaires pour améliorer l'expérience utilisateur et analyser les comportements. Vous pouvez contrôler l'utilisation des cookies via les paramètres de votre navigateur.</p>

                    <h5>6. Droits des utilisateurs</h5>
                    <p>Conformément aux lois applicables, vous disposez des droits suivants concernant vos informations personnelles :</p>
                    <ul>
                        <li><strong>Droit d'accès</strong> : Vous pouvez demander l'accès aux informations personnelles que nous détenons à votre sujet.</li>
                        <li><strong>Droit de rectification</strong> : Vous pouvez demander la correction de toute information inexacte.</li>
                        <li><strong>Droit à l'effacement</strong> : Vous pouvez demander la suppression de vos informations personnelles.</li>
                        <li><strong>Droit à la portabilité</strong> : Vous pouvez demander à recevoir vos données dans un format lisible par machine.</li>
                        <li><strong>Droit de retrait du consentement</strong> : Vous pouvez retirer votre consentement à tout moment.</li>
                    </ul>

                    <h5>7. Durée de conservation des données</h5>
                    <p>Nous conserverons vos informations personnelles aussi longtemps que nécessaire pour atteindre les objectifs pour lesquels elles ont été collectées.</p>

                    <h5>8. Modifications de la politique de confidentialité</h5>
                    <p>Nous nous réservons le droit de modifier cette politique à tout moment. Toute modification sera publiée sur cette page avec une nouvelle date de mise à jour.</p>

                    <h5>9. Contactez-nous</h5>
                    <p>Si vous avez des questions concernant cette politique, veuillez nous contacter à :</p>
                    <p><strong>Email :</strong> <a href="mailto:email.sn">mariama.ndiaye@uahb.sn</a></p>
                    <p><strong>Adresse :</strong> [Rue BIS-19, 00000 Dakar, Sénégal]</p>

                    <div class="text-center mt-4">
                        <a href="{{ route('welcome') }}" class="btn btn-primary">Retour à l'accueil</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

@section('styles')
    <style>
        .card {
            border-radius: 15px;
            overflow: hidden;
        }
        .card-header {
            background-color: #f8f9fa;
            font-size: 1.5rem;
            font-weight: bold;
        }
        .card-body {
            font-size: 1rem;
            line-height: 1.6;
            color: #343a40;
        }
        h5 {
            margin-top: 20px;
            font-size: 1.2rem;
            font-weight: bold;
        }
        ul {
            padding-left: 20px;
        }
        .text-center a {
            margin-top: 20px;
            font-size: 1rem;
            padding: 10px 30px;
        }
    </style>
