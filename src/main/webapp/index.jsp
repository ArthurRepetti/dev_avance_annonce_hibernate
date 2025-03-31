<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Accueil - EAnnonce</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        .hero-section {
            background: linear-gradient(135deg, #007bff 0%, #00b4ff 100%);
            color: white;
            border-radius: 0 0 20px 20px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }
        .welcome-card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 6px 10px rgba(0,0,0,0.08);
            transition: transform 0.3s;
        }
        .welcome-card:hover {
            transform: translateY(-5px);
        }
    </style>
</head>
<body>
<%@ include file="navbar.jsp" %>

<div class="hero-section py-5 mb-5">
    <div class="container text-center py-4">
        <h1 class="display-4 fw-bold"><i class="fas fa-home me-3"></i>Bienvenue sur EAnnonce</h1>
        <p class="lead">La plateforme de petites annonces de Arthur</p>
    </div>
</div>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="welcome-card card p-4 text-center">
                <div class="card-body">
                    <i class="fas fa-bullhorn fa-4x text-primary mb-4"></i>
                    <h2 class="card-title">Découvrez nos annonces</h2>
                    <p class="card-text">Ajoutez, consultez et gérez vos annonces en toute simplicité</p>
                    <a href="annonceList" class="btn btn-primary btn-lg mt-3">
                        <i class="fas fa-list me-2"></i>Voir les annonces
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
