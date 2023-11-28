<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Crear Formulario</title>
    <link rel="shortcut icon" type="image/png"
          href="${pageContext.request.contextPath}/assets/images/logos_voluntariapp/logo_VOLUNTARIAPP.png"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/css/register.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
</head>

<body>

<div class="text-md-start p-4">
    <img src="${pageContext.request.contextPath}/assets/images/logos_voluntariapp/logo_extend.png" width="200" alt="">
</div>

<div class="container-fluid d-flex align-items-center justify-content-center">
    <div class="container bg-white rounded shadow">
        <div class="row align-items-stretch">

            <div class="col bg-white p-5 rounded-end">
                <h3 class="fw-bold text-center p-4">Crear Formulario</h3>

                <form class="needs-validation" action="${pageContext.request.contextPath}/forms/save" method="post">

                    <div class="form-floating">
                        <input type="hidden" id="organ_id" name="organ_id" value="<%= session.getAttribute("organId")%>" class="form-control">
                    </div>

                    <div class="row">
                        <div class="col mb-3">
                            <div class="form-floating">
                                <input type="text" id="name_form" name="name_form" class="form-control" required>
                                <label for="name_form">Nombre del Formulario</label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col mb-3">
                            <div class="form-floating">
                                <textarea class="form-control" id="instructions" name="instructions"
                                          required></textarea>
                                <label for="instructions">Descripción</label>
                            </div>
                        </div>
                    </div>

                    <div class="row ">
                        <button type="submit" class="btn btn-outline-primary mb-3">Guardar</button>

                        <a href="${pageContext.request.contextPath}/organ/surveys" class="btn btn-outline-danger">
                            <span>Cancelar</span>
                        </a>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    (function () {
        'use strict'
        // Fetch all the forms we want to apply custom Bootstrap validation styles to
        var forms = document.querySelectorAll('.needs-validation')
        // Loop over them and prevent submission
        Array.prototype.slice.call(forms)
            .forEach(function (form) {
                form.addEventListener('submit', function (event) {
                    if (!form.checkValidity()) {
                        event.preventDefault()
                        event.stopPropagation()
                    }
                    form.classList.add('was-validated')
                }, false)
            })
    })();
</script>

</body>

</html>