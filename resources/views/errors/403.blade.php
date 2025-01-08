<!-- resources/views/errors/403.blade.php -->
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Accès Interdit</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f7f7f7;
            margin: 0;
        }
        .error-container {
            text-align: center;
            padding: 30px;
            border: 2px solid #ff0000;
            border-radius: 8px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .error-container h1 {
            color: #ff0000;
            font-size: 48px;
        }
        .error-container p {
            font-size: 18px;
            margin: 20px 0;
        }
        .error-container .btn {
            display: inline-block;
            padding: 10px 20px;
            margin-top: 20px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-size: 16px;
        }
        .error-container .btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="error-container">
        <h1>Accès Interdit</h1>
        <p>Désolée, vous n'avez pas accès à cette page.</p>
        <a href="{{ route('dashboard') }}" class="btn">Retour à la Dashboard</a>
    </div>
</body>
</html>
