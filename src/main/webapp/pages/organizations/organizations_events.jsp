<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>VoluntariApp Eventos</title>
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
<!-- Incio del copipage Plantilla (DASHBOARD) -->
<!--  Body Wrapper -->
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

        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="d-flex align-items-center gap-2 dropdown-item text-b">
                        <i class="ti ti-calendar-event fs-6"></i>
                        <h3 class="mb-0 text-b">Tus Eventos</h3>
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
                                            <h6 class="fw-semibold mb-0">Nombre del evento</h6>
                                        </th>
                                        <th class="border-bottom-0">
                                            <h6 class="fw-semibold mb-0">Descripción</h6>
                                        </th>
                                        <th class="border-bottom-0">
                                            <h6 class="fw-semibold mb-0">Fecha del evento</h6>
                                        </th>
                                        <th class="border-bottom-0">
                                            <h6 class="fw-semibold mb-0">Hora del evento</h6>
                                        </th>
                                        <th class="border-bottom-0">
                                            <h6 class="fw-semibold mb-0">Categoría</h6>
                                        </th>
                                        <th class="border-bottom-0">
                                            <h6 class="fw-semibold mb-0">Formulario</h6>
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="eventito" items="${events2}">
                                        <tr>
                                            <td class="border-bottom-0">
                                                <h6 class="fw-semibold mb-0">
                                                    <c:out value="${eventito.name}"/>
                                                </h6>
                                            </td>
                                            <td class="border-bottom-0">
                                                <h6 class="fw-semibold mb-0 short-description"
                                                    data-description="${eventito.description}">
                                                    <c:out value="${eventito.description}"/>
                                                </h6>
                                            </td>
                                            <td class="border-bottom-0">
                                                <h6 class="fw-semibold mb-1">
                                                    <c:out value="${eventito.event_date}"/>
                                                </h6>
                                            </td>
                                            <td class="border-bottom-0">
                                                <p class="mb-0 fw-normal">
                                                    <c:out value="${eventito.event_time}"/>
                                                </p>
                                            </td>
                                            <td class="border-bottom-0">
                                                <p class="mb-0 fw-normal">
                                                    <c:out value="${eventito.category}"/>
                                                </p>
                                            </td>
                                            <td class="border-bottom-0">
                                                <p class="mb-0 fw-normal">
                                                    <c:choose>
                                                        <c:when test="${not empty eventito.forms.name_form}">
                                                            <c:out value="${eventito.forms.name_form}"/>
                                                        </c:when>
                                                        <c:otherwise>
                                                            Sin Formulario
                                                        </c:otherwise>
                                                    </c:choose>
                                                </p>
                                            </td>
                                            <td class="border-bottom-0">
                                                <div class="col">
                                                    <button type="button" class="btn btn-warning"
                                                            data-bs-toggle="modal"
                                                            data-bs-target="#exampleModal"
                                                            onclick="editEvent(${eventito.id})"
                                                            id="editEvent${eventito.id}"
                                                            data-id="${eventito.id}"
                                                            data-name="${eventito.name}"
                                                            data-description="${eventito.description}"
                                                            data-event_date="${eventito.event_date}"
                                                            data-event_time="${eventito.event_time}"
                                                            data-state="${eventito.state}"
                                                            data-municipality="${eventito.municipality}"
                                                            data-postal_code="${eventito.postal_code}"
                                                            data-street="${eventito.street}"
                                                            data-cologne="${eventito.cologne}"
                                                            data-category="${eventito.category}"
                                                            data-id_form="${eventito.id_form}">
                                                        Editar
                                                    </button>
                                                </div>
                                            </td>
                                            <td class="border-bottom-0">
                                                <form id="deleteForm" method="post" action="/event/delete">
                                                    <input type="hidden" name="id" value="${eventito.id}"/>
                                                    <button type="button" onclick="confirmDelete()"
                                                            class="btn btn-danger">Eliminar
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
                                <h5 class="modal-title" id="exampleModalLabel">Actualización del Evento
                                </h5>
                                <button type="button" class="btn-close"
                                        data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>

                            <div class="modal-body">
                                <form class="needs-validation" id="organ-form" novalidate
                                      action="${pageContext.request.contextPath}/event/update" method="post">
                                    <%--<input hidden value="${formulario.id}" name="id">--%>
                                    <!-- Muestra elid del organizacion-->
                                    <div class="row">
                                        <div class="col-md-6 mb-4">
                                            <div class="form-floating">
                                                <input type="text" name="id" id="id"
                                                       class="form-control"
                                                       required>
                                                <label for="id">Numero de Evento</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row ">
                                        <div class="col-md-0 mb-4">
                                            <div class="form-floating">
                                                <input type="text" name="name" id="name"
                                                       class="form-control"
                                                       required>
                                                <label for="name">Nombre del Evento </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-0 mb-4">
                                            <div class="form-floating">
                                                <input type="text" name="description"
                                                       id="description"
                                                       class="form-control"
                                                       placeholder="description"
                                                       required>
                                                <label for="event_time">Descripcion del Evento</label>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6 mb-4">
                                            <div class="form-floating">
                                                <input type="date" name="event_date"
                                                       id="event_date" class="form-control"
                                                       required>
                                                <label for="name">Fecha del Evento </label>
                                            </div>
                                        </div>
                                        <div class="col-md-6 mb-4">
                                            <div class="form-floating">
                                                <input type="time" name="event_time"
                                                       id="event_time" class="form-control" required>
                                                <label for="event_time">Hora del Evento </label>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6 mb-4">
                                            <div class="form-floating">
                                                <input type="text" name="municipality"
                                                       id="municipality"
                                                       value=""
                                                       class="form-control"
                                                       placeholder="municipality"
                                                       required>
                                                <label for="municipality">Municipio</label>
                                            </div>
                                        </div>
                                        <div class="col-md-6 mb-4">
                                            <div class="form-floating">
                                                <input type="text" name="postal_code"
                                                       id="postal_code"
                                                       value=""
                                                       pattern="[0-9]{5}"
                                                       class="form-control"
                                                       required>
                                                <label for="postal_code">Código postal</label>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6 mb-4">
                                            <div class="form-floating">
                                                <input type="text" name="cologne" id="cologne"
                                                       class="form-control"
                                                       placeholder="cologne"
                                                       value="" required>
                                                <label for="cologne">Colonia</label>
                                            </div>
                                        </div>
                                        <div class="col-md-6 mb-4">
                                            <div class="form-floating">
                                                <input type="text" name="street" id="street"
                                                       class="form-control"
                                                       value=""
                                                       placeholder="street"
                                                       required>
                                                <label for="street">Calle</label>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6 mb-4">
                                            <div class="form-floating">
                                                <input type="text" name="state" id="state"
                                                       value=""
                                                       class="form-control" required>
                                                <label for="state">Estado</label>
                                            </div>
                                        </div>
                                        <div class="col-md-6 mb-4">
                                            <div class="form-floating">
                                                <label for="category" class="form-label"></label>
                                                <select class="form-select" name="category" id="category" required>
                                                    <option selected disabled value="">Selecciona la Categoria...
                                                    </option>
                                                    <option value="Benefico">Benefico</option>
                                                    <option value="Caridad">Caridad</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 mb-4">
                                            <div class="form-floating">
                                                <input type="number" id="id_form" name="id_form" class="form-control"
                                                       placeholder="Numero del Formulario">
                                                <label for="id_form">Formulario</label>
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
        </div>

        <div class="row">
            <div class="container barra-pading text-center">
                <div class="event-card card ">
                    <a class="event-action add-button" href="${pageContext.request.contextPath}/organ/create_event"
                       aria-expanded="false">
                                <span>
                                    <i class="ti ti-circle-plus"></i>
                                </span>
                    </a>
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

    function confirmDelete() {
        Swal.fire({
            title: '¿Estás seguro?',
            text: "¡No podrás revertir esto!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Sí, eliminar!'
        }).then((result) => {
            if (result.isConfirmed) {
                document.getElementById('deleteForm').submit();
            }
        });
    }

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

    const editEvent = (id) => {
        const btn = document.getElementById("editEvent" + id)
        const idEvent = btn.dataset.id;
        const nameEvent = btn.dataset.name;
        const descripcionEvent = btn.dataset.description;
        const eventDate = btn.dataset.event_date
        const eventTime = btn.dataset.event_time;
        const stateEvent = btn.dataset.state;
        const municipalityEvent = btn.dataset.municipality;
        const postal_codeEvent = btn.dataset.postal_code;
        const streetEvent = btn.dataset.street;
        const cologneEvent = btn.dataset.cologne;
        const categoryEvent = btn.dataset.category;
        const id_formEvent = btn.dataset.id_form;

        document.getElementById("id").value = idEvent;
        document.getElementById("name").value = nameEvent;
        document.getElementById("description").value = descripcionEvent;
        document.getElementById("event_date").value = eventDate;
        document.getElementById("event_time").value = eventTime;
        document.getElementById("state").value = stateEvent;
        document.getElementById("municipality").value = municipalityEvent;
        document.getElementById("postal_code").value = postal_codeEvent;
        document.getElementById("street").value = streetEvent;
        document.getElementById("cologne").value = cologneEvent;
        document.getElementById("category").value = categoryEvent;
        document.getElementById("id_form").value = id_formEvent;

    }
</script>
<script>
    function mostrarConfirmacion() {
        if (document.getElementById("organ-form").checkValidity()) {
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
                    document.getElementById('organ-form').submit();
                }
            });
        } else {
            document.getElementById("organ-form").classList.add('was-validated');
        }
    }

    function enviarFormulario() {
        const xhr = new XMLHttpRequest();
        xhr.open("POST", "/event/update", true);
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
<script>
    window.addEventListener('DOMContentLoaded', (event) => {
        const descriptions = document.querySelectorAll('.short-description');
        descriptions.forEach(desc => {
            const fullDescription = desc.getAttribute('data-description');
            if (fullDescription.length > 50) { // Cambia 50 al número de caracteres que quieras mostrar
                const shortened = fullDescription.substr(0, 50) + "...";
                desc.innerText = shortened;
            }
        });
    });

</script>
</body>
