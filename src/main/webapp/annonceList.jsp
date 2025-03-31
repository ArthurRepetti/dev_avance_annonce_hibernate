<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Liste des annonces</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        .table-container {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
            overflow: hidden;
        }
        .table th {
            white-space: nowrap;
        }
        .action-buttons .btn {
            padding: 0.375rem 0.75rem;
        }
    </style>
</head>
<body class="bg-light">

<%@ include file="navbar.jsp" %>

<div class="container py-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="text-primary mb-0"><i class="fas fa-list me-2"></i>Liste des annonces</h2>
        <a href="${pageContext.request.contextPath}/annonce/add" class="btn btn-primary">
            <i class="fas fa-plus-circle me-2"></i>Nouvelle annonce
        </a>
    </div>

    <c:if test="${not empty successMessage}">
        <div class="alert alert-success alert-dismissible fade show">
                ${successMessage}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </c:if>

    <c:choose>
        <c:when test="${empty annonces}">
            <div class="card">
                <div class="card-body text-center py-5">
                    <i class="fas fa-info-circle fa-3x text-muted mb-3"></i>
                    <h4 class="text-muted">Aucune annonce disponible</h4>
                    <p class="mb-0">Commencez par créer une nouvelle annonce</p>
                </div>
            </div>
        </c:when>
        <c:otherwise>
            <div class="table-container shadow-sm">
                <table class="table table-hover mb-0">
                    <thead class="table-primary">
                    <tr>
                        <th>Titre</th>
                        <th>Description</th>
                        <th>Adresse</th>
                        <th>Email</th>
                        <th>Date</th>
                        <th class="text-center">Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${annonces}" var="annonce">
                        <tr>
                            <td class="align-middle">${annonce.title}</td>
                            <td class="align-middle">${annonce.description}</td>
                            <td class="align-middle">${annonce.adresse}</td>
                            <td class="align-middle">${annonce.email}</td>
                            <td class="align-middle">${annonce.dateCreation}</td>
                            <td class="align-middle action-buttons">
                                <div class="d-flex justify-content-center gap-2">
                                    <a href="${pageContext.request.contextPath}/annonce/update?id=${annonce.id}"
                                       class="btn btn-sm btn-outline-success">
                                        <i class="fas fa-edit"></i>
                                    </a>
                                    <form action="${pageContext.request.contextPath}/annonce/delete" method="post"
                                          onsubmit="return confirm('Êtes-vous sûr de vouloir supprimer cette annonce ?');">
                                        <input type="hidden" name="id" value="${annonce.id}">
                                        <button type="submit" class="btn btn-sm btn-outline-danger">
                                            <i class="fas fa-trash-alt"></i>
                                        </button>
                                    </form>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </c:otherwise>
    </c:choose>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>