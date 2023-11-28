<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
  Created by IntelliJ IDEA.
  User: pccom
  Date: 04/08/2023
  Time: 11:28 a. m.
  To change this template use File | Settings | File Templates.
--%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Crear Formulario</title>
    <link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/assets/images/logos_voluntariapp/logo_VOLUNTARIAPP.png"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/css/register.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/styles.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/css/style_dashboard.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@tabler/icons-webfont@latest/tabler-icons.min.css">
    <jsp:include page="/layouts/DataTablesCSS.jsp"/>
</head>
<body>

<div class="text-md-start p-4">
    <img src="${pageContext.request.contextPath}/assets/images/logos_voluntariapp/logo_extend.png" style="width:200px"
         alt="">
</div>

<c:if test="${not empty formulario}">
    <div class="container-fluid d-flex align-items-center justify-content-center">
        <div class="container  rounded shadow p-4">
            <div class="row align-items-stretch">
                <div class="col  p-4 rounded-end">
                    <h3 class="text-center">${formulario.id_forms}${formulario.name_form}</h3>
                </div>
            </div>
            <div class="row align-items-stretch">
                <div class="col">
                    <p class="text-justify">
                            ${formulario.instructions}
                    </p>
                </div>
            </div>
        </div>
    </div>
</c:if>

<div class="container-fluid d-block">
    <div class="row">
        <div class="col barra-pading text-center">
            <div class="event-card card border-0">
                <button type="button" class="btn btn-outline-secondary event-action add-button" data-bs-toggle="modal"
                        data-bs-target="#myModal" aria-expanded="false">
                    <span>
                        <i class="ti ti-circle-plus"></i>
                    </span>
                </button>
            </div>
        </div>
    </div>
</div>


<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Crear pregunta</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">

                <form class="needs-validation" id="question-question" novalidate
                      action="${pageContext.request.contextPath}/questions/save" method="post">

                    <input type="hidden" id="form_id" name="form_Id" value="<%= session.getAttribute("form_Id") != null ? session.getAttribute("form_Id") : "" %>" class="form-control">

                    <div class="row mb-3">
                        <div class="col-md-0 mb-4">
                            <div class="form-floating">
                                <textarea class="form-control" id="questionText" name="questionText"
                                          required></textarea>
                                <label for="questionText">Pregunta:</label>
                            </div>
                        </div>
                    </div>


                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                        <button type="submit" class="btn btn-primary">Actualizar</button>
                    </div>
                </form>

            </div>
        </div>
    </div>
</div>


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
<jsp:include page="/layouts/footer.jsp"/>
</body>

</html>
