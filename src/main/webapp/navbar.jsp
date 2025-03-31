<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary shadow-sm">
    <div class="container">
        <a class="navbar-brand d-flex align-items-center" href="#">
            <i class="fas fa-ad fa-lg me-2"></i>
            <span class="fw-bold">EAnnonce</span>
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item mx-1">
                    <a class="nav-link active d-flex align-items-center" href="#">
                        <i class="fas fa-home me-1"></i> Accueil
                    </a>
                </li>
                <li class="nav-item mx-1">
                    <a class="nav-link d-flex align-items-center" href="formulaireNom">
                        <i class="fas fa-user-edit me-1"></i> Formulaire
                    </a>
                </li>
                <li class="nav-item mx-1">
                    <a class="nav-link d-flex align-items-center" href="annonceAdd">
                        <i class="fas fa-plus-circle me-1"></i> Ajouter
                    </a>
                </li>
                <li class="nav-item mx-1">
                    <a class="nav-link d-flex align-items-center" href="annonceList">
                        <i class="fas fa-list me-1"></i> Liste
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>