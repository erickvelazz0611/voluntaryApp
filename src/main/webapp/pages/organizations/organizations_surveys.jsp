<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>VoluntariApp Encuestas</title>
    <link rel="shortcut icon" type="image/png"
          href="${pageContext.request.contextPath}/assets/images/logos_voluntariapp/logo_VOLUNTARIAPP.png"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/styles.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/css/style_dashboard.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@tabler/icons-webfont@latest/tabler-icons.min.css">
    <!-- Se inserta la foto del logo de la empresa -->
    <jsp:include page="/layouts/DataTablesCSS.jsp"/>
</head>
<body>
<div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
     data-sidebar-position="fixed" data-header-position="fixed">
    <aside class="left-sidebar">
        <div>
            <div class="brand-logo d-flex align-items-center justify-content-between">
                <a href="${pageContext.request.contextPath}/organ/main" class="text-nowrap logo-img">
                    <!-- Logo parte superior izquierda -->
                    <img src="${pageContext.request.contextPath}/assets/images/logos_voluntariapp/logo_extend.png"
                         style="width:180px"
                         alt=""/>
                </a>
                <div class="close-btn d-xl-none d-block sidebartoggler cursor-pointer" id="sidebarCollapse">
                    <i class="ti ti-x fs-8"></i>
                </div>
            </div>
            <jsp:include page="/layouts/sidebar.jsp"/>
        </div>
    </aside>
    <div class="body-wrapper">
        <header class="app-header">
            <jsp:include page="/layouts/navbar.jsp"/>
        </header>

        <div class="container-fluid d-block">
            <div class="row">
                <div class="col">
                    <div class="d-flex align-items-center gap-2 dropdown-item text-b">
                        <i class="ti ti-clipboard-text fs-8"></i>
                        <h3 class="mb-0 text-b">Tus Encuestas</h3>
                        <br><br>
                    </div>
                </div>
            </div>
            <hr>

            <div class="form-floating">
                <input type="hidden" id="organ_id" name="organ_id" value="<%= session.getAttribute("organId")%>"
                       class="form-control">
            </div>

            <div class="row">
                <div class="col-lg-12 d-flex align-items-stretch">
                    <div class="card w-100">
                        <div class="card-body p-3">
                            <div class="table-responsive">
                                <table id="example" class="table text-nowrap mb-0 align-middle">
                                    <thead class="text-dark fs-4">
                                    <tr>
                                        <th class="border-bottom-0">
                                            <h6 class="fw-semibold mb-0">Formulario</h6>
                                        </th>
                                        <th class="border-bottom-0">
                                            <h6 class="fw-semibold mb-0">Instrucciones</h6>
                                        </th>
                                        <th class="border-bottom-0">
                                            <h6 class="fw-semibold mb-0">Status</h6>
                                        </th>
                                        <%--<th class="border-bottom-0">
                                            <h6 class="fw-semibold mb-0">Id_organ</h6>
                                        </th>--%>
                                        <th class="border-bottom-0">
                                            <h6 class="fw-semibold mb-0"></h6>
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="formulario" items="${forms}">
                                        <tr>
                                            <td class="border-bottom-0">
                                                <h6 class="fw-semibold mb-0">
                                                    <c:out value="${formulario.name_form}"/>
                                                </h6>
                                            </td>
                                            <td class="border-bottom-0">
                                                <h6 class="fw-semibold mb-0 short-description"
                                                    data-description="${formulario.instructions}">
                                                    <c:out value="${formulario.instructions}"/>
                                                </h6>
                                            </td>
                                            <td class="border-bottom-0">
                                                <h6 class="fw-semibold mb-0">
                                                    <c:out value="${formulario.enable ? 'Activo' : 'Inactivo'}"/>
                                                </h6>
                                            </td>

                                                <%--<td class="border-bottom-0">
                                                    <p class="mb-0 fw-normal">
                                                        <c:out value="${formulario.id_organ}"/>
                                                    </p>
                                                </td>--%>
                                            <td class="border-bottom-0">
                                                <form method="GET"
                                                      action="${pageContext.request.contextPath}/forms/create-question">
                                                    <input type="hidden" name="id" value="${formulario.id_forms}">
                                                    <button type="submit" class="btn btn-success btn-sm">
                                                        Agregar Preguntas
                                                    </button>
                                                </form>
                                            </td>
                                            <td class="border-bottom-0">
                                                <div class="col">
                                                    <button type="button" class="btn btn-warning"
                                                            data-bs-toggle="modal"
                                                            data-bs-target="#exampleModal"
                                                            onclick="editForm(${formulario.id_forms})"
                                                            id="editForm${formulario.id_forms}"
                                                            data-id_forms="${formulario.id_forms}"
                                                            data-name_form="${formulario.name_form}"
                                                            data-instructions="${formulario.instructions}">
                                                        Editar
                                                    </button>
                                                </div>
                                            </td>
                                            <td class="border-bottom-0">
                                                <form <%--id="deleteForm"--%> method="post" action="/forms/delete">
                                                    <input type="hidden" name="id" value="${formulario.id_forms}"/>
                                                    <button type="submit" class="btn btn-danger"> Eliminar
                                                    </button>
                                                </form>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row pt-8">
                <div class="modal fade" id="exampleModal" tabindex="-1"
                     aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Actualización del Formulario
                                </h5>
                                <button type="button" class="btn-close"
                                        data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>

                            <div class="modal-body">
                                <form class="needs-validation" id="form-form" novalidate
                                      action="${pageContext.request.contextPath}/forms/update" method="post">
                                    <%-- <input hidden value="${formulario.id}" name="id">--%>
                                    <!-- Muestra elid del organizacion-->
                                    <input type="hidden" name="form_id" id="id" class="form-control" required>


                                    <div class="row ">
                                        <div class="col-md-0 mb-4">
                                            <div class="form-floating">
                                                <input type="text" name="name_form" id="name_form"
                                                       class="form-control"
                                                       required>
                                                <label for="name_form">Nombre del Formulario </label>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-0 mb-4">
                                            <div class="form-floating">
                                                <input type="text" name="instructions"
                                                       id="instructions"
                                                       class="form-control"
                                                       required>
                                                <label for="instructions">Instrucciones</label>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-danger btn-sm"
                                                data-bs-dismiss="modal" aria-label="Close">
                                            Cancelar
                                        </button>
                                        <button type="button" class="btn btn-warning btn-sm"
                                                onclick="mostrarConfirmacion()">
                                            Actualizar
                                        </button>
                                    </div>
                                </form>

                            </div>
                        </div>
                    </div>
                </div>
                <!--  ===============       Fin del Modal de Actualizar      ===============  -->
            </div>


            <div class="row">
                <div class="col container barra-pading text-center">
                    <div class="event-card card ">
                        <a class="event-action add-button" href="${pageContext.request.contextPath}/organ/create_forms"
                           aria-expanded="false">
                                <span>
                                    <i class="ti ti-circle-plus"></i>
                                </span>
                        </a>
                    </div>
                </div>
            </div>

        </div>
        <!-- Fin Contenedor (Principal) -->
    </div>
</div>
<!-- JS -->
<jsp:include page="/layouts/footer.jsp"/>

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

<script>
    function mostrarAlertaActualizacion() {
        Swal.fire({
            title: '¿Estás seguro?',
            text: 'Se realizarán los cambios. ¿Estás seguro de continuar?',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Sí',
            cancelButtonText: 'Cancelar',
        }).then((result) => {
            if (result.isConfirmed) {
                // Si el usuario hace clic en "Sí", procedemos a enviar el formulario manualmente.
                enviarFormulario();
            }
        });
    }
</script>
<script>
    /*Conseguir el id del evento mediante Java script */

    // Función para extraer el ID del modal

    // Para probar la función, puedes invocarla y mostrar el resultado en la consola:
    const editForm = (id) => {
        const btn = document.getElementById("editForm" + id);
        console.log("ID:", id);
        const idForm = btn.dataset.id_forms;
        console.log("ID Forms:", idForm);
        const nameForm = btn.dataset.name_form;
        console.log("Name Form:", nameForm);
        const instructionsForm = btn.dataset.instructions;
        console.log("Instructions:", instructionsForm);

        document.getElementById("id").value = idForm;
        document.getElementById("name_form").value = nameForm;
        document.getElementById("instructions").value = instructionsForm;
    }

</script>

<script>
    function mostrarConfirmacion() {
        if (document.getElementById("form-form").checkValidity()) {
            Swal.fire({
                title: '¿Estás seguro?',
                text: 'Se realizarán los cambios. ¿Estás seguro de continuar?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Sí',
                cancelButtonText: 'Cancelar',
            }).then((result) => {
                if (result.isConfirmed) {
                    // Si el usuario hace clic en "Sí", procedemos a enviar el formulario manualmente.
                    document.getElementById('form-form').submit();
                }
            });
        } else {
            document.getElementById("form-form").classList.add('was-validated');
        }
    }

    function enviarFormulario() {
        const xhr = new XMLHttpRequest();
        xhr.open("POST", "/form/update", true);
        xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
        xhr.onload = function () {
            if (xhr.status === 200) {
                // La solicitud se ha completado correctamente.
                // Aquí manejamos la respuesta del servidor y mostramos la alerta de éxito o error.
                if (xhr.responseText.includes("success")) {
                    mostrarAlerta('¡Éxito! Organización actualizada correctamente.', 'success', true);
                } else {
                    mostrarAlerta('¡Error! Acción no realizada correctamente.', 'error', false);
                }
            } else {
                // Ha ocurrido un error al realizar la solicitud.
                mostrarAlerta('Error al enviar el formulario', 'error', false);
            }
        }
    }
</script>
</body>
</html>