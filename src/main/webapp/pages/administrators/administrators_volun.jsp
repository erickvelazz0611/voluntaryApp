
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>VoluntariApp Voluntarios</title>
    <!-- Se inserta la foto del logo de la empresa -->
    <link rel="shortcut icon" type="image/png" href="../../assets/images/logos_voluntariapp/logo_VOLUNTARIAPP.png" />
    <link rel="stylesheet" href="../../assets/css/styles.min.css" />
    <link rel="stylesheet" href="../../assets/css/css/style_dashboard.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@tabler/icons-webfont@latest/tabler-icons.min.css"></head>

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
                <a href="/admin/main" class="text-nowrap logo-img">
                    <!-- Logo parte superior izquierda -->
                    <img src="../../assets/images/logos_voluntariapp/logo_extend.png" style="width:180px" alt=""/>
                    <!-- Logo de la barra lateral -->
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
                        <a class="sidebar-link" href="/admin/main" aria-expanded="false">
                <span>
                  <i class="ti ti-layout-dashboard"></i>
                </span>
                            <span class="hide-menu">Panel Administrador</span>
                        </a>
                    </li>
                    <li class="nav-small-cap">
                        <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
                        <span class="hide-menu">Usuarios</span>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="/admin/administrators" aria-expanded="false">
                <span>
                  <i class="ti ti-user-star"></i>
                </span>
                            <span class="hide-menu">Administradores</span>
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="/admin/main-organ" aria-expanded="false">
                <span>
                  <i class="ti ti-building"></i>
                </span>
                            <span class="hide-menu">Organizaciones</span>
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="/admin/main-volunt" aria-expanded="false">
                <span>
                  <i class="ti ti-fall"></i>
                </span>
                            <span class="hide-menu">Voluntarios</span>
                        </a>
                    </li>
                    <li class="nav-small-cap">
                        <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
                        <span class="hide-menu">Otros</span>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="/admin/aprobe" aria-expanded="false">
                <span>
                  <i class="ti ti-check"></i>
                </span>
                            <span class="hide-menu">Aprobar</span>
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="/admin/porfile" aria-expanded="false">
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
    <!-- Sidebar End -->

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

                        <li class="nav-item d-none d-lg-block">
                            <a class="nav-link nav-icon-hover" href="javascript:void(0)" data-bs-toggle="modal"
                               data-bs-target="#exampleModal">
                                <input type="text" name="textBuscar" class="form-control">
                                <i class="ti ti-search"></i>
                            </a>
                        </li>
                        <!-- Foto de perfil -->
                        <li class="nav-item dropdown">
                            <a class="nav-link nav-icon-hover" href="javascript:void(0)" id="drop2"
                               data-bs-toggle="dropdown"
                               aria-expanded="false">
                                <img src="data:image/jpeg;base64, ${base64Image}" alt="" class="rounded-circle" style="width:35px; height:35px" />
                            </a>
                            <!-- Menu desplegable del la Foto fe perfil -->
                            <div class="dropdown-menu dropdown-menu-end dropdown-menu-animate-up"
                                 aria-labelledby="drop2">
                                <!-- COLOR == | Fondo Desplegable Foto Perfil | ==    (Codigo de arriba)  -->
                                <div class="message-body">
                                    <a href="/admin/porfile" class="d-flex align-items-center gap-2 dropdown-item">
                                        <i class="ti ti-user fs-6"></i>
                                        <p class="mb-0 fs-3">Mi perfil</p>
                                    </a>
                                    <a href="/user/login" class="btn btn-outline-primary mx-3 mt-2 d-block">Cerrar
                                        Sesion</a>
                                </div>
                            </div>
                            <!-- Fin del Menu desplegable del la Foto fe perfil -->
                        </li>
                        <!-- Fin Foto de perfil -->
                    </ul>
                </div>
            </nav>
        </header>        <!--  Header End -->
        <div class="container-fluid">
            <!--  Row 1 -->
            <div class="row">
                <div class="col-md-12">
                    <div class="d-flex align-items-center gap-2 dropdown-item">
                        <i class="ti ti-fall fs-6"></i>
                        <p class="mb-0 fs-3">Listado de Voluntarios</p>
                        <br><br>
                    </div>
                </div>
            </div>
            <hr>
            <br><br>
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
                                            <h6 class="fw-semibold mb-0">Nombres</h6>
                                        </th>
                                        <th class="border-bottom-0">
                                            <h6 class="fw-semibold mb-0">Cumpleaños</h6>
                                        </th>
                                        <th class="border-bottom-0">
                                            <h6 class="fw-semibold mb-0">Curp</h6>
                                        </th>
                                        <th class="border-bottom-0">
                                            <h6 class="fw-semibold mb-0">Direccion</h6>
                                        </th>
                                        <th class="border-bottom-0">
                                            <h6 class="fw-semibold mb-0">Telefono</h6>
                                        </th>

                                        <th class="border-bottom-0">
                                            <h6 class="fw-semibold mb-0">Email</h6>
                                        </th>
                                        <th class="border-bottom-0">
                                            <h6 class="fw-semibold mb-0">Status</h6>
                                        </th>
                                        <th class="border-bottom-0">
                                            <h6 class="fw-semibold mb-0">Eliminar</h6>
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="volun" items="${volunteers}">

                                    <tr>
                                        <td class="border-bottom-0">
                                            <h6 class="fw-semibold mb-0">
                                            <c:out value="${volun.name}"/>
                                            <c:out value="${volun.surname}"/>
                                            <c:out value="${volun.lastanme}"/>
                                            </h6>
                                        </td>
                                        <td class="border-bottom-0">
                                            <h6 class="fw-semibold mb-0">
                                            <c:out value="${volun.birthday}"/>
                                            </h6>
                                        </td>
                                        <td class="border-bottom-0">
                                            <h6 class="fw-semibold mb-0">
                                            <c:out value="${volun.curp}"/>
                                            </h6>
                                        </td>
                                        <td class="border-bottom-0">
                                            <h6 class="fw-semibold mb-0">
                                            <c:out value="${volun.address}"/>
                                            </h6>
                                        </td>
                                        <td class="border-bottom-0">
                                            <h6 class="fw-semibold mb-1">
                                            <c:out value="${volun.phone}"/>
                                            </h6>
                                        </td>

                                        <td class="border-bottom-0">
                                            <h6 class="fw-semibold mb-1">
                                            <c:out value="${volun.user.email}"/>
                                            </h6>
                                        </td>
                                        <td class="border-bottom-0">
                                            <div class="d-flex align-items-center gap-2">
                                                    <span class="badge bg-primary rounded-3 fw-semibold">
                                                        <c:choose>
                                                            <c:when test="${volun.user.status eq true}">
                                                        <span>
                                                            Activo
                                                        </span>
                                                            </c:when>
                                                            <c:when test="${volun.user.status eq false}">
                                                        <span>
                                                            Inactivo
                                                        </span>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <c:out value="${volun.user.status}"/>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </span>
                                            </div>
                                        </td>
                                        <td class="border-bottom-0">
                                            <form action="/volunteer/delete" method="post">
                                                <input hidden value="${volun.user.id_user}" name="id"/>
                                                <button class="btn btn-outline-dark btn-sm rounded-3 mt-2 ">
                                                    Eliminar
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
            <div class="py-6 px-6 text-center">
                <p class="mb-0 fs-4">Pagina para eventos sin fines de lucro <a href="" target="_blank"
                                                                               class="pe-1 text-primary text-decoration-underline">VoluntariApp.com</a>
                    Derechos reservados
                    <!-- <a href="https://themewagon.com">ThemeWagon</a></p> -->
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