<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bienvenido a VoluntariApp</title>
    <!-- Se inserta la foto del logo de la empresa -->
    <link rel="shortcut icon" type="image/png" href="../../assets/images/logos_voluntariapp/logo_VOLUNTARIAPP.png" />
    <link rel="stylesheet" href="../../assets/css/styles.min.css" />
    <link rel="stylesheet" href="../../assets/css/css/style_dashboard.css">
    <link rel="stylesheet" href="{pageContext.request.contextPath}https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link rel="stylesheet" href="{pageContext.request.contextPath}https://cdn.jsdelivr.net/npm/@tabler/icons-webfont@latest/tabler-icons.min.css">
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
                <a href="/volunteer/main" class="text-nowrap logo-img">
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
                        <a class="sidebar-link" href="/volunteer/main" aria-expanded="false">
                <span>
                  <i class="ti ti-layout-dashboard"></i>
                </span>
                            <span class="hide-menu">Panel Principal</span>
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="/volunteer/events" aria-expanded="false">
                <span>
                  <i class="ti ti-calendar-event"></i>
                </span>
                            <span class="hide-menu">Eventos</span>
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="/volunteer/forms" aria-expanded="false">
                <span>
                  <i class="ti ti-clipboard-text"></i>
                </span>
                            <span class="hide-menu">Encuestas</span>
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="/volunteer/porfile" aria-expanded="false">
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
            <nav class="navbar navbar-expand-lg navbar-light">
                <ul class="navbar-nav">
                    <li class="nav-item d-block d-xl-none">
                        <a class="nav-link sidebartoggler nav-icon-hover" id="headerCollapse" href="javascript:void(0)">
                            <i class="ti ti-menu-2"></i>
                        </a>
                    </li>
                </ul>
                <!-- Nav parte superior de iconos -->
                <div class="navbar-collapse justify-content-end px-0" id="navbarNav">
                    <ul class="navbar-nav flex-row ms-auto align-items-center justify-content-end">
                        <!-- Etiqueta para meter cosas -->

                        <!-- Foto de perfil -->
                        <li class="nav-item dropdown">
                            <a class="nav-link nav-icon-hover" href="javascript:void(0)" id="drop2"
                               data-bs-toggle="dropdown"
                               aria-expanded="false">
                                <img src="../../assets/images/user-1.jpg" alt="" style="width:35px; height:35px"
                                     class="rounded-circle">
                            </a>
                            <!-- Menu desplegable del la Foto fe perfil -->
                            <div class="dropdown-menu dropdown-menu-end dropdown-menu-animate-up"
                                 aria-labelledby="drop2">
                                <!-- COLOR == | Fondo Desplegable Foto Perfil | ==    (Codigo de arriba)  -->
                                <div class="message-body">
                                    <a href="/volunteer/porfile" class="d-flex align-items-center gap-2 dropdown-item">
                                        <i class="ti ti-user fs-6"></i>
                                        <p class="mb-0 fs-3">Mi perfil</p>
                                    </a>

                                    <a href="/api/auth/logout" class="btn btn-outline-primary mx-3 mt-2 d-block">Cerrar
                                        Sesion</a>
                                </div>
                            </div>
                            <!-- Fin del Menu desplegable del la Foto fe perfil -->
                        </li>
                        <!-- Fin Foto de perfil -->
                    </ul>
                </div>
            </nav>
        </header>
        <!--  Header End -->
        <!-- Incio contenedor principal -->
        <div class="container-fluid">

            <div class="row">
                <div class="col-md-12">
                    <div class="d-flex align-items-center gap-2 dropdown-item text-b">
                        <i class="ti ti-calendar-event fs-8"></i>
                        <h3 class="mb-0 text-b">Eventos</h3>
                        <br><br>
                    </div>
                </div>
            </div>
            <hr>

            <div class="row mt-2 mb-2">
                <div class="col">
                    <label for="opciones">Seleccionar evento</label>
                    <select name="opciones" id="opciones" class="form-select" onchange="getallForms()">
                        <option value="">Seleccione...</option>
                        <c:forEach var="event" items="${postulantes}">
                            <option value="${event.id}">
                                <c:out value="${event.name}"/>
                                <c:out value="${event.event_date}"/>
                            </option>
                        </c:forEach>
                    </select>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="d-flex align-items-center gap-2 dropdown-item">
                        <i class="ti ti-building fs-6"></i>
                        <p class="mb-0 fs-3">Listado de Eventos</p>
                    </div>
                </div>

            </div>
            <hr><br><br>

            <!-- Inicia la tabla para los usarios -->
            <div class="row">
                <!-- Aqui inicia el codigo 242 -->
                <div class="col-lg- d-flex align-items-stretch">
                    <div class="card w-100">
                        <div class="card-body p-3">
                            <div class="table-responsive">
                                <table class="table text-nowrap mb-0 align-middle">
                                    <!--  -->
                                    <thead class="text-dark fs-4">
                                    <tr>
                                        <th class="border-bottom-0">
                                            <h6 class="fw-semibold mb-0">Foto</h6>
                                        </th>
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
                                            <h6 class="fw-semibold mb-0">Estado</h6>
                                        </th>
                                        <th class="border-bottom-0">
                                            <h6 class="fw-semibold mb-0">Calle</h6>
                                        </th>
                                        <th class="border-bottom-0">
                                            <h6 class="fw-semibold mb-0">Colonia</h6>
                                        </th>
                                        <th class="border-bottom-0">
                                            <h6 class="fw-semibold mb-0">Tipo de evento</h6>
                                        </th>
                                        <th class="border-bottom-0">
                                            <h6 class="fw-semibold mb-0">Editar</h6>
                                        </th>
                                        <th class="border-bottom-0">
                                            <h6 class="fw-semibold mb-0">Eliminar</h6>
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="eventito" items="${event1}">
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
                                                    <c:out value="${eventito.event_day}"/>
                                                </p>
                                            </td>
                                            <td class="border-bottom-0">
                                                <p class="mb-0 fw-normal">
                                                    <c:out value="${eventito.event_time}"/>
                                                </p>
                                            </td>
                                            <td class="border-bottom-0">
                                                <p class="mb-0 fw-normal">
                                                    <c:out value="${eventito.state}"/>
                                                </p>
                                            </td>
                                            <td class="border-bottom-0">
                                                <h6 class="fw-semibold mb-0">
                                                    <c:out value="${eventito.municipality}"/>
                                                </h6>
                                            </td>
                                            <td class="border-bottom-0">
                                                <h6 class="fw-semibold mb-0">
                                                    <c:out value="${eventito.postal_code}"/>
                                                </h6>
                                            </td>
                                            <td class="border-bottom-0">
                                                <h6 class="fw-semibold mb-0">
                                                    <c:out value="${eventito.street}"/>
                                                </h6>
                                            </td>
                                            <td class="border-bottom-0">
                                                <h6 class="fw-semibold mb-0">
                                                    <c:out value="${eventito.cologne}"/>
                                                </h6>
                                            </td>

                                                <%--                     Aqui esta el STATUS                       --%>
                                                <%--                                            <td class="border-bottom-0">--%>
                                                <%--                                                <div class="d-flex align-items-center gap-2">--%>
                                                <%--                                                        <span--%>
                                                <%--                                                                class="badge bg-danger rounded-3 fw-semibold"> <c:out value="${orga.user.status}"/>--%>
                                                <%--                                                        </span>--%>
                                                <%--                                                </div>--%>
                                                <%--                                            </td>--%>
                                            <td class="border-bottom-0">
                                                <p class="mb-0 fw-normal">
                                                    <c:out value="${eventito.category}"/>
                                                </p>
                                            </td>
                                            <td class="border-bottom-0">
                                                <p class="mb-0 fw-normal">

                                                </p>
                                            </td>
                                            <td class="border-bottom-0">
                                                <p class="mb-0 fw-normal">

                                                </p>
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

        </div>
    </div>
</div>
<!-- JS -->
<script src="../../assets/js/jquery.min.js"></script>
<script src="../../assets/js/bootstrap.bundle.min.js"></script>
<script src="../../assets/js/sidebarmenu.js"></script>
<script src="../../assets/js/app.min.js"></script>
<!-- Estadisticas Library -->
<script src="../../assets/js/apexcharts.min.js"></script>
<script src="../../assets/js/dashboard.js"></script>
</body>
</html>