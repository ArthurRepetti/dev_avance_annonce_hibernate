<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Formulaire Nom</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        .form-card {
            max-width: 500px;
            margin: 0 auto;
            border: none;
            border-radius: 10px;
        }
        .form-title {
            font-weight: 500;
        }
    </style>
</head>
<body class="bg-light">

<%@ include file="navbar.jsp" %>

<div class="container py-4">
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="card shadow-sm form-card">
                <div class="card-header bg-primary text-white">
                    <h3 class="mb-0"><i class="fas fa-user-edit me-2"></i>Formulaire Nom</h3>
                </div>

                <div class="card-body">
                    <c:if test="${not empty message}">
                        <div class="alert alert-info alert-dismissible fade show">
                                ${message}
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    </c:if>

                    <form action="${pageContext.request.contextPath}/hello" method="post">
                        <div class="mb-3">
                            <label for="nom" class="form-label">
                                <i class="fas fa-signature me-2"></i>Entrez votre nom :
                            </label>
                            <input type="text" class="form-control"
                                   id="nom" name="nom"
                                   placeholder="Votre nom complet"
                                   value="${not empty param.nom ? param.nom : ''}"
                                   required>
                        </div>

                        <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                            <button type="submit" class="btn btn-primary px-4">
                                <i class="fas fa-paper-plane me-2"></i>Envoyer
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
