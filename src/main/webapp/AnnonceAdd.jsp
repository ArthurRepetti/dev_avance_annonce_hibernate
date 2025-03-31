<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Ajouter une annonce</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        .form-container {
            max-width: 600px;
            margin: 0 auto;
        }
        .form-label {
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
                    <h2 class="h4 mb-0"><i class="fas fa-plus-circle me-2"></i>Ajouter une annonce</h2>
                </div>

                <div class="card-body">
                    <c:if test="${not empty successMessage}">
                        <div class="alert alert-success alert-dismissible fade show">
                                ${successMessage}
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    </c:if>

                    <c:if test="${not empty errors}">
                        <div class="alert alert-danger">
                            <ul class="mb-0">
                                <c:forEach items="${errors}" var="error">
                                    <li>${error.value}</li>
                                </c:forEach>
                            </ul>
                        </div>
                    </c:if>

                    <form action="${pageContext.request.contextPath}/annonce/add" method="post">
                        <div class="mb-3">
                            <label for="titre" class="form-label">Titre :</label>
                            <input type="text" class="form-control ${not empty errors.titre ? 'is-invalid' : ''}"
                                   id="titre" name="titre"
                                   value="${not empty formData.titre[0] ? formData.titre[0] : ''}"
                                   placeholder="Entrez le titre de l'annonce" required>
                        </div>

                        <div class="mb-3">
                            <label for="description" class="form-label">Description :</label>
                            <textarea class="form-control ${not empty errors.description ? 'is-invalid' : ''}"
                                      id="description" name="description" rows="4"
                                      placeholder="Ajoutez une description" required>${not empty formData.description[0] ? formData.description[0] : ''}</textarea>
                        </div>

                        <div class="mb-3">
                            <label for="adresse" class="form-label">Adresse :</label>
                            <input type="text" class="form-control ${not empty errors.adresse ? 'is-invalid' : ''}"
                                   id="adresse" name="adresse"
                                   value="${not empty formData.adresse[0] ? formData.adresse[0] : ''}"
                                   placeholder="Saisissez l'adresse" required>
                        </div>

                        <div class="mb-3">
                            <label for="mail" class="form-label">Email :</label>
                            <input type="email" class="form-control ${not empty errors.mail ? 'is-invalid' : ''}"
                                   id="mail" name="mail"
                                   value="${not empty formData.mail[0] ? formData.mail[0] : ''}"
                                   placeholder="exemple@mail.com" required>
                        </div>

                        <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                            <button type="submit" class="btn btn-primary px-4">
                                <i class="fas fa-paper-plane me-2"></i>Publier l'annonce
                            </button>
                            <a href="${pageContext.request.contextPath}/annonce/list" class="btn btn-outline-secondary">
                                <i class="fas fa-times me-2"></i>Annuler
                            </a>
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
