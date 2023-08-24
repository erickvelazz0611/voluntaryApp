<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>VoluntariApp Eventos</title>
    <jsp:include page="/layouts/head.jsp"/>
    <!-- Se inserta la foto del logo de la empresa -->
    <jsp:include page="/layouts/DataTablesCSS.jsp"/>
</head>

<body>
<!-- Incio del copipage Plantilla (DASHBOARD) -->
<!--  Body Wrapper -->
<div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
     data-sidebar-position="fixed" data-header-position="fixed">
    <!-- Sidebar Start -->
    <!-- localizatodo en su lugar -->
    <aside class="left-sidebar"> <!-- COLOR == | Fondo Barra Lateral Izquierdo | ==-->
        <!-- Sidebar scroll-->
        <!-- Localiza la barra superior en su lugar -->
        <div>
            <!-- Imagen del logo de la app -->
            <div class="brand-logo d-flex align-items-center justify-content-between">
                <a href="/organ/main" class="text-nowrap logo-img">
                    <!-- Logo parte superior izquierda -->
                    <img src="../../assets/images/logos_voluntariapp/logo_extend.png" style="width:180px"
                         alt=""/><!-- Logo de la barra lateral -->
                </a>
                <div class="close-btn d-xl-none d-block sidebartoggler cursor-pointer" id="sidebarCollapse">
                    <i class="ti ti-x fs-8"></i>
                </div>
            </div>
            <!-- Fin Imagen del logo de la app -->
            <!-- Sidebar navigation-->
            <nav class="sidebar-nav scroll-sidebar" data-simplebar="">
                <ul id="sidebarnav">
                    <li class="nav-small-cap">
                        <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
                        <span class="hide-menu">Home</span>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="/organ/main" aria-expanded="false">
                <span>
                  <i class="ti ti-layout-dashboard"></i>
                </span>
                            <span class="hide-menu">Panel Organización</span>
                        </a>
                    </li>
                    <li class="nav-small-cap">
                        <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
                        <span class="hide-menu">Administrar</span>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="/organ/events" aria-expanded="false">
                <span>
                  <i class="ti ti-calendar-event"></i>
                </span>
                            <span class="hide-menu">Eventos</span>
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="/organ/surveys" aria-expanded="false">
                <span>
                  <i class="ti ti-clipboard-text"></i>
                </span>
                            <span class="hide-menu">Encuestas</span>
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="/organ/postulations" aria-expanded="false">
                <span>
                  <i class="ti ti-man"></i>
                </span>
                            <span class="hide-menu">Postulados</span>
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="/organ/aprob" aria-expanded="false">
                <span>
                  <i class="ti ti-check"></i>
                </span>
                            <span class="hide-menu">Aprobar</span>
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="/organ/porfile" aria-expanded="false">
                <span>
                  <i class="ti ti-user-circle"></i>
                </span>
                            <span class="hide-menu">Perfil</span>
                        </a>
                    </li>
                </ul>
            </nav>
            <!-- End Sidebar navigation -->
        </div>
        <!-- End Sidebar scroll-->
    </aside>
    <!-- Fin Sidebar navigation-->


    <!--  Main wrapper -->
    <div class="body-wrapper"> <!-- COLOR == | Fondo Central | ==-->
        <!--  Header Start -->
        <header class="app-header"> <!-- COLOR == | Barra Navegacion Superior | ==-->
            <jsp:include page="/layouts/navbar.jsp"/>
        </header>
        <!--  Header End -->
        <!-- Inicio Contenedor (Principal) -->
        <div class="container-fluid">

            <!-- Inicio Contenedor (Central) -->
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
            <!-- Fin Contenedor (Central) -->

            <!-- Inicia la tabla para los eventos -->
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
                                            <h6 class="fw-semibold mb-0">Descricpión</h6>
                                        </th>
                                        <th class="border-bottom-0">
                                            <h6 class="fw-semibold mb-0">Fecha del evento</h6>
                                        </th>
                                        <th class="border-bottom-0">
                                            <h6 class="fw-semibold mb-0">Hora del evento</h6>
                                        </th>
                                        <th class="border-bottom-0">
                                            <h6 class="fw-semibold mb-0">Categoria</h6>
                                        </th>

                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="eventito" items="${events2}">
                                        <tr>
                                            <td class="border-bottom-0">
                                                <h6 class="fw-semibold mb-0">

                                                </h6>
                                            </td>
                                            <td class="border-bottom-0">
                                                <h6 class="fw-semibold mb-0">
                                                    <c:out value="${eventito.name}"/>
                                                </h6>
                                            </td>
                                            <td class="border-bottom-0">
                                                <h6 class="fw-semibold mb-1">
                                                    <c:out value="${eventito.description}"/>
                                                </h6>
                                            </td>
                                            <td class="border-bottom-0">
                                                <p class="mb-0 fw-normal">
                                                    <c:out value="${eventito.event_date}"/>
                                                </p>
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
                                                <div class="col">
                                                    <button type="button" class="btn btn-warning"
                                                            data-bs-toggle="modal"
                                                            data-bs-target="#exampleModal"
                                                            onclick="editEvent(${eventito.id})"
                                                            id="editEvent${eventito.id}"
                                                            data-id="${eventito.id}"
                                                            data-name="${eventito.name}"
                                                            data-event_date="${eventito.event_date}"
                                                            data-event_time="${eventito.event_time}"
                                                            data-description="${eventito.description}"
                                                            data-street="${eventito.street}"
                                                            data-cologne="${eventito.cologne}"
                                                            data-postal_code="${eventito.postal_code}"
                                                            data-state="${eventito.state}"
                                                    >


                                                        Editar
                                                    </button>
                                                </div>
                                            </td>
                                            <td class="border-bottom-0">
                                                <form method="post" action="">
                                                    <input hidden value="${organ.user.id_user}" name="id"/>
                                                    <button type="button" class="btn btn-danger">Eliminar</button>
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
                                      action="/event/update" method="post">
                                    <%--<input hidden value="${events2.id}" name="id">--%>
                                    <div class="row ">
                                        <!-- Muestra elid del organizacion-->
                                        <div class="col-md-6 mb-4">
                                            <div class="form-floating">
                                                <input type="text" name="id" id="id"
                                                       class="form-control"
                                                       required>
                                                <label for="id">Numero de Evento</label>
                                            </div>
                                        </div><div class="col-md-6 mb-4">
                                        <div class="form-floating">
                                            <input type="text" name="name" id="name"
                                                   class="form-control"
                                                   required>
                                            <label for="name">Nombre del Evento </label>
                                        </div>
                                    </div>
                                        <div class="col-md-6 mb-4">
                                            <div class="form-floating">
                                                <input type="date" name="event_date"
                                                       id="event_date" class="form-control"
                                                       required>
                                                <label for="name">Fecha del Evento  </label>
                                            </div>
                                        </div>
                                        <div class="col-md-6 mb-4">
                                            <div class="form-floating">
                                                <input type="time" name="event_time"
                                                       id="event_time" class="form-control" required>
                                                <label for="event_time">Hora del Evento  </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 mb-4">
                                            <div class="form-floating">
                                                <input type="text" name="description"
                                                       id="description"

                                                       class="form-control"
                                                       placeholder="description"
                                                       required>
                                                <label for="event_time">Descripcion del Evento</label>
                                            </div>
                                        </div>
                                        <div class="col-md-6 mb-4">
                                            <div class="form-floating">
                                                <input type="text" name="municypaly"
                                                       id="municypaly"
                                                       value=""
                                                       class="form-control"
                                                       placeholder="municypaly"
                                                       required>
                                                <label for="municypaly">Municipio</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
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
                                        <div class="col-md-6 mb-4">
                                            <div class="form-floating">
                                                <input type="text" name="cologne" id="cologne"
                                                       class="form-control"
                                                       placeholder="cologne"
                                                       value="" required>
                                                <label for="cologne">Colonia</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
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
                                        <div class="col-md-6 mb-4">
                                            <div class="form-floating">
                                                <input type="text" name="state" id="state"
                                                       value=""
                                                       class="form-control" required>
                                                <label for="state">Estado</label>
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
                    <a class="event-action add-button" href="/organ/create_event" aria-expanded="false">
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
<jsp:include page="/layouts/DataTablesJS.jsp"/>

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
    // ... Tu código JavaScript anterior ...

    // Función para mostrar la alerta de confirmación de actualización
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

    // ... Tu código JavaScript posterior ...
</script>

<script>
    function mostrarConfirmacionEliminar() {
        Swal.fire({
            title: '¿Estás seguro de eliminar este evento?',
            text: "Esta acción no se puede deshacer.",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#d33',
            cancelButtonColor: '#3085d6',
            confirmButtonText: 'Sí, eliminar',
            cancelButtonText: 'No, cancelar'
        }).then((result) => {
            if (result.isConfirmed) {
                // Aquí puedes colocar la lógica para eliminar el evento
                // Por ejemplo, puedes hacer una petición AJAX al servidor
                Swal.fire(
                    'Eliminado',
                    'El evento ha sido eliminado.',
                    'success'
                );
            }
        });
    }

    /*Conseguir el id del evento mediante Java script */

    // Función para extraer el ID del modal

    // Para probar la función, puedes invocarla y mostrar el resultado en la consola:


    //Editacion de un evento
    const editEvent = (id) => {
        const btn = document.getElementById("editEvent" + id)
        const idEvent = btn.dataset.id;
        const nameEvent = btn.dataset.name;
        const eventDate=btn.dataset.event_date
        const  eventTime =btn.dataset.event_time;
        const descripcionEvent=btn.dataset.description;
        const streetEvent =btn.dataset.street;
        const cologneEvent=btn.dataset.cologne;
        const postal_codeEvent= btn.dataset.postal_code;
        // const municypalyEvent=btn.dataset.municypaly;
        const stateEvent=btn.dataset.state;

        document.getElementById("id").value = idEvent;
        document.getElementById("name").value = nameEvent;
        document.getElementById("event_date").value=eventDate;
        document.getElementById("event_time").value=eventTime;
        document.getElementById("description").value= descripcionEvent;
        document.getElementById("street").value=streetEvent;
        document.getElementById("cologne").value=cologneEvent;
        document.getElementById("postal_code").value=postal_codeEvent;
        // document.getElementById("municypaly").value=municypalyEvent;
        document.getElementById("state").value=stateEvent;
    }
</script>
</body>

</html>