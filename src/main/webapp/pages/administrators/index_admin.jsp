<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>VoluntariApp Admin</title>
    <!-- Se inserta la foto del logo de la empresa -->
    <link rel="shortcut icon" type="image/png" href="../../assets/images/logos_voluntariapp/logo_VOLUNTARIAPP.png"/>
    <link rel="stylesheet" href="../../assets/css/styles.min.css"/>
    <link rel="stylesheet" href="../../assets/css/css/style_dashboard.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@tabler/icons-webfont@latest/tabler-icons.min.css">
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


                        <!-- Foto de perfil -->
                        <li class="nav-item dropdown">
                            <a class="nav-link nav-icon-hover" href="javascript:void(0)" id="drop2"
                               data-bs-toggle="dropdown"
                               aria-expanded="false">
                                <img src="data:image/jpeg;base64, ${base64Image}" alt="" class="rounded-circle"
                                     style="width:35px; height:35px"/>
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
        </header>
        <!--  Header End -->
        <!-- Inicio Contenedor (Principal) -->
        <div class="container-fluid">
            <!--  Row 1 -->
            <div class="row">
                <div class="col-md-12">
                    <div class="d-flex align-items-center gap-2 dropdown-item">
                        <i class="ti ti-users-group fs-6"></i>
                        <p class="mb-0 fs-3">Usuarios</p>
                        <br><br>
                    </div>
                </div>
            </div>
            <hr>
            <!-- Fin Row 1 -->
            <!-- Inicio Contenedor (Central) -->
            <div>
                <!-- Total de usuarios -->
                <!--  Row 2 -->
                <div class="row">
                    <div class="col-md-4">
                        <div class="card-body text-center alert alert-info">
                            <h1 class="card-title">Administradores</h1>
                            <!-- <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6> -->
                            <h1>
                                <c:out value="${totalAdmin}"/>
                            </h1>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card-body text-center alert alert-success">
                            <h1 class="card-title">Organizaciones</h1>
                            <!-- <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6> -->
                            <h1>
                                <c:out value="${totalOrgan}"/>
                            </h1>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card-body text-center alert alert-info">
                            <h1 class="card-title">Voluntarios</h1>
                            <!-- <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6> -->
                            <h1>
                                <c:out value="${totalVolunt}"/>
                            </h1>
                        </div>
                    </div>
                </div>
                <!-- Fin Row 2 -->
                <!-- Fin Total de usuarios -->

                <!--  Row 3 -->
                <!--  Fin Row 3 -->

                <div class="row">
                    <div class="col-md-12">
                        <div class="d-flex justify-content-end">
                            <button class="btn btn-outline-dark btn-sm rounded-3 mt-2 ml-auto">
                                <a href="/admin/crearAdmin" class="btn">Añadir Administrador</a>
                            </button>
                        </div>
                        <a class="d-flex align-items-center gap-2 dropdown-item">
                            <i class="ti ti-user-star fs-6"></i>
                            <p class="mb-0 fs-3">Administradores</p>
                        </a>

                    </div>
                </div>
                <hr>

                <!-- Inicia la tabla de Reportes (CRUD) -->
                <div class="col-lg- d-flex align-items-stretch">
                    <div class="card w-100">
                        <div class="card-body p-3">
                            <div class="table-responsive">
                                <!-- Tabla -->
                                <table id="example" class="table text-nowrap mb-0 align-middle">
                                    <thead class="text-dark fs-4">
                                    <tr>
                                        <th class="border-bottom-0">
                                            <h6 class="fw-semibold mb-0">Nombre</h6>
                                        </th>
                                        <th class="border-bottom-0">
                                            <h6 class="fw-semibold mb-0">Email</h6>
                                        </th>
                                        <th class="border-bottom-0">
                                            <h6 class="fw-semibold mb-0">Status</h6>
                                        </th>
                                        <th class="border-bottom-0">
                                            <h6 class="fw-semibold mb-0">Activar / Desactivar</h6>
                                        </th>
                                        <td class="border-bottom-0">
                                            <h6 class="fw-semibold mb-0">Actualizar</h6>
                                        </td>

                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="adm" items="${admin2}">
                                        <tr>
                                            <td class="border-bottom-0">
                                                <h6 class="fw-semibold mb-0">
                                                    <c:out value="${adm.name}"/>
                                                </h6>
                                            </td>
                                            <td class="border-bottom-0">
                                                <h6 class="fw-semibold mb-0">
                                                    <c:out value="${adm.user.email}"/>
                                                </h6>
                                            </td>
                                            <td class="border-bottom-0">
                                                <div class="d-flex align-items-center gap-2">
                                                    <span class="badge bg-primary rounded-3 fw-semibold">
                                                        <c:choose>
                                                            <c:when test="${adm.user.status eq true}">
                                                        <span class="bg-custom-success">
                                                            Activo
                                                        </span>
                                                            </c:when>
                                                            <c:when test="${adm.user.status eq false}">
                                                        <span class="bg-custom-danger">
                                                            Inactivo
                                                        </span>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <c:out value="${adm.user.status}"/>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </span>
                                                </div>
                                            </td>
                                            <td class="border-bottom-0">
                                                <div class="col">
                                                    <form method="post" action="/admin/active-status">
                                                        <input hidden value="${adm.user.id_user}" name="id"/>
                                                        <c:if test="${adm.user.status == false}">
                                                            <button type="submit"
                                                                    class="btn btn-outline-dark btn-sm rounded-3 mt-2">
                                                                ACTIVAR
                                                            </button>
                                                        </c:if>
                                                    </form>
                                                    <form method="post" action="/admin/inactive-status">
                                                        <input hidden value="${adm.user.id_user}" name="id"/>
                                                        <c:if test="${adm.user.status == true}">
                                                            <button type="submit"
                                                                    class="btn btn-outline-dark btn-sm rounded-3 mt-2">
                                                                DESACTIVAR
                                                            </button>
                                                        </c:if>
                                                    </form>
                                                </div>
                                            </td>

                                            <td class="border-bottom-0">

                                                <button type="button" class="btn btn-warning col-lg-6" data-bs-toggle="modal"
                                                        data-bs-target="#exampleModal"
                                                        data-bs-whatever="@getbootstrap">
                                                    Editar
                                                </button>


                                                <!-- <a href="edit?id=-->
                                            </td>
                                        </tr>
                                        <div class="row pt-8">
                                            <div class="modal fade" id="exampleModal" tabindex="-1"
                                                 aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="exampleModalLabel">Actualización de
                                                                Perfil
                                                            </h5>
                                                            <button type="button" class="btn-close"
                                                                    data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>

                                                        <div class="modal-body">
                                                            <form class="needs-validation" id="admin-form"
                                                                  novalidate action="/admin/update-admin" method="post" >
                                                                <input hidden value="${user.id_user}" name="id_user">
                                                                <div class="row">
                                                                    <!-- Muestra el id del voluntario
                                                                    <div class="col-md-6 mb-4">
                                                                          <div class="form-floating">
                                                                              <input type="text" name="id" id="id" class="form-control" value="" placeholder="name" disabled>

                                                                              <label for="id">Id</label>
                                                                          </div>
                                                                     </div>-->
                                                                    <div class="col-md-0 mb-4">
                                                                        <div class="form-floating">
                                                                            <input type="text" name="name" id="name"
                                                                                   class="form-control"
                                                                                   value="${adm.name}"
                                                                                   placeholder="name"
                                                                                   required>
                                                                            <label for="name">Nombre
                                                                                completo</label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-md-0 mb-4">
                                                                        <div class="form-floating">
                                                                            <input type="email" name="email" id="email"
                                                                                   class="form-control"
                                                                                   value="${adm.user.email}"
                                                                                   placeholder="email" required>
                                                                            <label for="email">Email</label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-md-0 mb-4">
                                                                        <div class="form-floating form-control-icon">
                                                                            <input name="password" type="password"
                                                                                   id="password" value="${adm.user.password}"
                                                                                   class="form-control"
                                                                                   placeholder="Contraseña" required/>
                                                                            <span class="password-toggle"
                                                                                  onclick="togglePasswordVisibility('password')">
                                                                            <i id="password-toggle-icon"
                                                                               class="bi bi-eye-slash"></i>
                                                                        </span>
                                                                            <label for="password">Contraseña</label>
                                                                        </div>
                                                                    </div>

                                                                </div>
                                                                <div class="modal-footer">
                                                                    <button type="button" class="btn btn-danger btn-sm"
                                                                            data-bs-dismiss="modal" aria-label="Close">
                                                                        Cancelar
                                                                    </button>
                                                                    <button type="submit" class="btn btn-warning btn-sm">
                                                                        Actualizar
                                                                    </button>
                                                                </div>
                                                            </form>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="d-flex justify-content-end">
                            <button class="btn btn-outline-dark btn-sm rounded-3 mt-2 ml-auto">
                                <a href="/organ/crearOrgan" class="btn">Añadir Organización</a>
                            </button>
                        </div>
                        <a href="" class="d-flex align-items-center gap-2 dropdown-item">
                            <i class="ti ti-user-star fs-6"></i>
                            <br>
                            <p class="mb-0 fs-3">Organizaciones</p>
                        </a>
                    </div>
                </div>
                <hr>

                <!-- Inicia la tabla de Reportes (CRUD) -->
                <div class="col-lg- d-flex align-items-stretch">
                    <div class="card w-100">
                        <div class="card-body p-3">
                            <div class="table-responsive">
                                <!-- Tabla -->
                                <table id="example2" class="table text-nowrap mb-0 align-middle">
                                    <thead class="text-dark fs-4">
                                    <tr>
                                        <th class="border-bottom-0">
                                            <h6 class="fw-semibold mb-0">Nombre</h6>
                                        </th>
                                        <th class="border-bottom-0">
                                            <h6 class="fw-semibold mb-0">Email</h6>
                                        </th>
                                        <th class="border-bottom-0">
                                            <h6 class="fw-semibold mb-0">Status</h6>
                                        </th>
                                        <th class="border-bottom-0">
                                            <h6 class="fw-semibold mb-0"></h6>
                                        </th>
                                        <th class="border-bottom-0">
                                            <h6 class="fw-semibold mb-0">Actualizar</h6>
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="organ" items="${organ2}">
                                        <tr>
                                            <td class="border-bottom-0">
                                                <h6 class="fw-semibold mb-0">
                                                    <c:out value="${organ.bussines_name}"/>
                                                </h6>
                                            </td>
                                            <td class="border-bottom-0">
                                                <h6 class="fw-semibold mb-0">
                                                    <c:out value="${organ.user.email}"/>
                                                </h6>
                                            </td>
                                            <td class="border-bottom-0">
                                                <div class="d-flex align-items-center gap-2">
                                                    <span class="badge bg-primary rounded-3 fw-semibold">
                                                        <c:choose>
                                                            <c:when test="${organ.user.status eq true}">
                                                        <span class="bg-custom-success">
                                                            Activo
                                                        </span>
                                                            </c:when>
                                                            <c:when test="${organ.user.status eq false}">
                                                        <span class="bg-custom-danger">
                                                            Inactivo
                                                        </span>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <c:out value="${organ.user.status}"/>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </span>
                                                </div>
                                            </td>
                                            <td class="border-bottom-0">
                                                <div class="col">
                                                    <form method="post" action="/admin/active-status-organ">
                                                        <input hidden value="${organ.user.id_user}" name="id"/>
                                                        <c:if test="${organ.user.status == false}">
                                                            <button type="submit"
                                                                    class="btn btn-outline-dark btn-sm rounded-3 mt-2">
                                                                ACTIVAR
                                                            </button>
                                                        </c:if>
                                                    </form>
                                                    <form method="post" action="/admin/inactive-status-organ">
                                                        <input hidden value="${organ.user.id_user}" name="id"/>
                                                        <c:if test="${organ.user.status == true}">
                                                            <button type="submit"
                                                                    class="btn btn-outline-dark btn-sm rounded-3 mt-2">
                                                                DESACTIVAR
                                                            </button>
                                                        </c:if>
                                                    </form>
                                                </div>
                                            </td>
                                            <td class="border-bottom-0">

                                                <button type="button" class="btn btn-warning col-lg-6" data-bs-toggle="modal"
                                                        data-bs-target="#exampleModal2"
                                                        data-bs-whatever="@getbootstrap">
                                                    Editar
                                                </button>
                                            </td>
                                            <div class="row pt-8">
                                                <div class="modal fade" id="exampleModal2" tabindex="-1"
                                                     aria-labelledby="exampleModalLabel2" aria-hidden="true">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="exampleModalLabel2">Actualización de
                                                                    Perfil
                                                                </h5>
                                                                <button type="button" class="btn-close"
                                                                        data-bs-dismiss="modal" aria-label="Close"></button>
                                                            </div>

                                                            <div class="modal-body">
                                                                <form class="needs-validation" id="organ-form"
                                                                      novalidate action="/admin/update-admin" method="post" >
                                                                    <input hidden value="${user.id_user}" name="id_user">
                                                                    <div class="row">
                                                                        <!-- Muestra el id del voluntario
                                                                        <div class="col-md-6 mb-4">
                                                                              <div class="form-floating">
                                                                                  <input type="text" name="id" id="id" class="form-control" value="" placeholder="name" disabled>

                                                                                  <label for="id">Id</label>
                                                                              </div>
                                                                         </div>-->
                                                                        <div class="col-md-0 mb-4">
                                                                            <div class="form-floating">
                                                                                <input type="text" name="name" id="nameG"
                                                                                       class="form-control"
                                                                                       value="${adm.name}"
                                                                                       placeholder="name"
                                                                                       required>
                                                                                <label for="name">Nombre
                                                                                    completo</label>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="col-md-0 mb-4">
                                                                            <div class="form-floating">
                                                                                <input type="email" name="email" id="emailG"
                                                                                       class="form-control"
                                                                                       value="${adm.user.email}"
                                                                                       placeholder="email" required>
                                                                                <label for="email">Email</label>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="col-md-0 mb-4">
                                                                            <div class="form-floating form-control-icon">
                                                                                <input name="password" type="password"
                                                                                       id="passwordG" value="${adm.user.password}"
                                                                                       class="form-control"
                                                                                       placeholder="Contraseña" required/>
                                                                                <span class="password-toggle"
                                                                                      onclick="togglePasswordVisibility('password')">
                                                                            <i id="password-toggle-iconG"
                                                                               class="bi bi-eye-slash"></i>
                                                                        </span>
                                                                                <label for="password">Contraseña</label>
                                                                            </div>
                                                                        </div>

                                                                    </div>
                                                                    <div class="modal-footer">
                                                                        <button type="button" class="btn btn-danger btn-sm"
                                                                                data-bs-dismiss="modal" aria-label="Close">
                                                                            Cancelar
                                                                        </button>
                                                                        <button type="submit" class="btn btn-warning btn-sm">
                                                                            Actualizar
                                                                        </button>
                                                                    </div>
                                                                </form>
                                                            </div>

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="d-flex justify-content-end">
                            <button class="btn btn-outline-dark btn-sm rounded-3 mt-2 ml-auto">
                                <a href="/volunteer/crearVolun" class="btn">Añadir Voluntario</a>
                            </button>
                        </div>
                        <a href="" class="d-flex align-items-center gap-2 dropdown-item">
                            <i class="ti ti-user-star fs-6"></i>
                            <br>
                            <p class="mb-0 fs-3">Voluntarios</p>
                        </a>
                    </div>
                </div>
                <hr>

                <!-- Inicia la tabla de Reportes (CRUD) -->
                <div class="col-lg- d-flex align-items-stretch">
                    <div class="card w-100">
                        <div class="card-body p-3">
                            <div class="table-responsive">
                                <!-- Tabla -->
                                <table id="example3" class="table text-nowrap mb-0 align-middle">
                                    <thead class="text-dark fs-4">
                                    <tr>
                                        <th class="border-bottom-0">
                                            <h6 class="fw-semibold mb-0">Nombre</h6>
                                        </th>
                                        <th class="border-bottom-0">
                                            <h6 class="fw-semibold mb-0">Email</h6>
                                        </th>
                                        <th class="border-bottom-0">
                                            <h6 class="fw-semibold mb-0">Status</h6>
                                        </th>
                                        <th class="border-bottom-0">
                                            <h6 class="fw-semibold mb-0">Actualizar</h6>
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="volun" items="${volunteer2}">
                                        <tr>
                                            <td class="border-bottom-0">
                                                <h6 class="fw-semibold mb-0">
                                                    <c:out value="${volun.name}"/>
                                                </h6>
                                            </td>
                                            <td class="border-bottom-0">
                                                <h6 class="fw-semibold mb-0">
                                                    <c:out value="${volun.user.email}"/>
                                                </h6>
                                            </td>
                                            <td class="border-bottom-0">
                                                <div class="d-flex align-items-center gap-2">
                                                    <span class="badge bg-primary rounded-3 fw-semibold">
                                                        <c:choose>
                                                            <c:when test="${volun.user.status eq true}">
                                                        <span class="bg-custom-success">
                                                            Activo
                                                        </span>
                                                            </c:when>
                                                            <c:when test="${volun.user.status eq false}">
                                                        <span class="bg-custom-danger">
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
                                                <div class="col">
                                                    <form method="post" action="/admin/active-status-volunt">
                                                        <input hidden value="${volun.user.id_user}" name="id"/>
                                                        <c:if test="${volun.user.status == false}">
                                                            <button type="submit"
                                                                    class="btn btn-outline-dark btn-sm rounded-3 mt-2">
                                                                ACTIVAR
                                                            </button>
                                                        </c:if>
                                                    </form>
                                                    <form method="post" action="/admin/inactive-status-volunt">
                                                        <input hidden value="${volun.user.id_user}" name="id"/>
                                                        <c:if test="${volun.user.status == true}">
                                                            <button type="submit"
                                                                    class="btn btn-outline-dark btn-sm rounded-3 mt-2">
                                                                DESACTIVAR
                                                            </button>
                                                        </c:if>
                                                    </form>
                                                </div>
                                            </td>
                                            <td class="border-bottom-0">

                                                <button type="button" class="btn btn-warning col-lg-6" data-bs-toggle="modal"
                                                        data-bs-target="#exampleModal4"
                                                        data-bs-whatever="@getbootstrap">
                                                    Editar
                                                </button>
                                            </td>
                                            <div class="row pt-8">
                                                <div class="modal fade" id="exampleModal4" tabindex="-1"
                                                     aria-labelledby="exampleModalLabel4" aria-hidden="true">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="exampleModalLabel4">Actualización de
                                                                    Perfil
                                                                </h5>
                                                                <button type="button" class="btn-close"
                                                                        data-bs-dismiss="modal" aria-label="Close"></button>
                                                            </div>

                                                            <div class="modal-body">
                                                                <form class="needs-validation" id="volunt-form"
                                                                      novalidate action="/admin/update-admin" method="post" >
                                                                    <input hidden value="${user.id_user}" name="id_user">
                                                                    <div class="row">
                                                                        <!-- Muestra el id del voluntario
                                                                        <div class="col-md-6 mb-4">
                                                                              <div class="form-floating">
                                                                                  <input type="text" name="id" id="id" class="form-control" value="" placeholder="name" disabled>

                                                                                  <label for="id">Id</label>
                                                                              </div>
                                                                         </div>-->
                                                                        <div class="col-md-0 mb-4">
                                                                            <div class="form-floating">
                                                                                <input type="text" name="name" id="nameV"
                                                                                       class="form-control"
                                                                                       value="${adm.name}"
                                                                                       placeholder="name"
                                                                                       required>
                                                                                <label for="name">Nombre
                                                                                    completo</label>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="col-md-0 mb-4">
                                                                            <div class="form-floating">
                                                                                <input type="email" name="email" id="emailV"
                                                                                       class="form-control"
                                                                                       value="${adm.user.email}"
                                                                                       placeholder="email" required>
                                                                                <label for="email">Email</label>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="col-md-0 mb-4">
                                                                            <div class="form-floating form-control-icon">
                                                                                <input name="password" type="password"
                                                                                       id="passwordV" value="${adm.user.password}"
                                                                                       class="form-control"
                                                                                       placeholder="Contraseña" required/>
                                                                                <span class="password-toggle"
                                                                                      onclick="togglePasswordVisibility('password')">
                                                                            <i id="password-toggle-iconV"
                                                                               class="bi bi-eye-slash"></i>
                                                                        </span>
                                                                                <label for="password">Contraseña</label>
                                                                            </div>
                                                                        </div>

                                                                    </div>
                                                                    <div class="modal-footer">
                                                                        <button type="button" class="btn btn-danger btn-sm"
                                                                                data-bs-dismiss="modal" aria-label="Close">
                                                                            Cancelar
                                                                        </button>
                                                                        <button type="submit" class="btn btn-warning btn-sm">
                                                                            Actualizar
                                                                        </button>
                                                                    </div>
                                                                </form>
                                                            </div>

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Fin de la tabla de Reportes (CRUD) -->
            </div>
            <!-- Fin Contenedor (Central) -->

            <div class="py-6 px-6 text-center">
                <p class="mb-0 fs-4">Pagina para eventos sin fines de lucro <a href="" target="_blank"
                                                                               class="pe-1 text-primary text-decoration-underline">VoluntariApp.com</a>Derechos
                    reservados
            </div>
        </div>
        <!-- Fin Contenedor (Principal) -->
    </div>
    <!-- Fin Body Wrapper -->
</div>
<!-- JS -->
<jsp:include page="/layouts/DataTablesJS.jsp"/>
<script src="../../assets/js/jquery.min.js"></script>
<script src="../../assets/js/bootstrap.bundle.min.js"></script>
<script src="../../assets/js/sidebarmenu.js"></script>
<script src="../../assets/js/app.min.js"></script>
<!-- Estadisticas Library -->
<script src="../../assets/js/apexcharts.min.js"></script>
<script src="../../assets/js/dashboard.js"></script>
</body>
</html>
