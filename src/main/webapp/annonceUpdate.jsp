<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Modifier Annonce</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        .form-container {
            max-width: 600px;
        }
        .card-header {
            font-weight: 500;
        }
    </style>
</head>
<body class="bg-light">

<%@ include file="navbar.jsp" %>

<div class="container py-4">
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="card shadow-sm">
                <div class="card-header bg-primary text-white">
                    <h3 class="mb-0"><i class="fas fa-edit me-2"></i>Modifier l'annonce</h3>
                </div>

                <div class="card-body">
                    <c:if test="${not empty errors}">
                        <div class="alert alert-danger">
                            <ul class="mb-0">
                                <c:forEach items="${errors}" var="error">
                                    <li>${error.value}</li>
                                </c:forEach>
                            </ul>
                        </div>
                    </c:if>

                    <form action="${pageContext.request.contextPath}/annonce/update" method="post">
                        <input type="hidden" name="id" value="${annonce.id}">

                        <div class="mb-3">
                            <label class="form-label" for="titre">Titre :</label>
                            <input class="form-control ${not empty errors.titre ? 'is-invalid' : ''}"
                                   name="titre" id="titre"
                                   value="${not empty param.titre ? param.titre : annonce.title}"
                                   required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label" for="description">Description :</label>
                            <textarea class="form-control ${not empty errors.description ? 'is-invalid' : ''}"
                                      name="description" id="description"
                                      required>${not empty param.description ? param.description : annonce.description}</textarea>
                        </div>

                        <div class="mb-3">
                            <label class="form-label" for="adresse">Adresse :</label>
                            <input class="form-control ${not empty errors.adresse ? 'is-invalid' : ''}"
                                   name="adresse" id="adresse"
                                   value="${not empty param.adresse ? param.adresse : annonce.adresse}"
                                   required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label" for="mail">Email :</label>
                            <input class="form-control ${not empty errors.mail ? 'is-invalid' : ''}"
                                   type="email" name="mail" id="mail"
                                   value="${not empty param.mail ? param.mail : annonce.email}"
                                   required>
                        </div>

                        <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                            <a href="${pageContext.request.contextPath}/annonce/list"
                               class="btn btn-outline-secondary me-md-2">
                                <i class="fas fa-arrow-left me-2"></i>Retour
                            </a>
                            <button type="submit" class="btn btn-primary">
                                <i class="fas fa-save me-2"></i>Enregistrer
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