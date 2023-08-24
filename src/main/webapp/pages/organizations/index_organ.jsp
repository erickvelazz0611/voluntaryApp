<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>VoluntariApp Organizaciones</title>
    <!-- Se inserta la foto del logo de la empresa -->
    <link rel="shortcut icon" type="image/png" href="../../assets/images/logos_voluntariapp/logo_VOLUNTARIAPP.png"/>
    <link rel="stylesheet" href="../../assets/css/styles.min.css"/>
    <link rel="stylesheet" href="../../assets/css/css/style_dashboard.css">
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/@tabler/icons-webfont@latest/tabler-icons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/css/sweetalert2.min.css">
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
                                <i class="ti ti-search"></i>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link nav-icon-hover" href="javascript:void(0)">
                                <i class="ti ti-bell-ringing"></i>
                                <div class="notification bg-primary rounded-circle"></div>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link nav-icon-hover">
                                <i class="ti ti-question-mark"></i>
                            </a>
                        </li>
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
                                    <a href="/organ/porfile" class="d-flex align-items-center gap-2 dropdown-item">
                                        <i class="ti ti-user fs-6"></i>
                                        <p class="mb-0 fs-3">Mi perfil</p>
                                    </a>
                                    <a href="javascript:void(0)" class="d-flex align-items-center gap-2 dropdown-item">
                                        <i class="ti ti-tools fs-6"></i>
                                        <p class="mb-0 fs-3">Perzonalizar</p>
                                    </a>
                                    <a href="javascript:void(0)" class="d-flex align-items-center gap-2 dropdown-item">
                                        <i class="ti ti-list-check fs-6"></i>
                                        <p class="mb-0 fs-3">Otros</p>
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

            <!-- Inicio Contenedor (Central) -->
            <div class="row">
                <div class="row">
                    <h1>Bienvenida organización</h1>
                    <br>
                    <br>
                    <br>


                    <h4>Te explico brevemente que puedes hacer con nosotros y quienes somo....</h4>
                    <br>
                    <br>

                    <p>Somos una aplicación que te brindrá el apoyo para que puedas crear Eventos y estos
                        tengan con ellos voluntarios.<br>



                        Esta aplicación está pensada para apoyar a ustedes, las organizaciónes
                        a tener un control y acceso a crear dichos <br>eventos y con ellos poder manipular la información
                        de quien aceptan como apoyo.
                        <br>
                        <br>

                        Usted como organización tiene la libertad de poder crear los eventos que necesite, tenemos nuestro apartado de <br>eventos
                        donde podra crearlos,y con ellos, tendra la posibilidad de por cada evento, poder realizar una encuenta <br>que filtrara con ella
                        los voluntarios, <br>
                        <br>
                        <br>
                    <h4>¿A qué me refiero con esto?</h4>
                    <br>
                    <br>

                    Cuando creas tu evento, tendras la oportuinidad de crear una encuenta al evento para los voluntarios, y al ser publicados, los voluntarios que
                    decidan <br>postularse tendran que responder dicha encuesta, la cual valida a traves de los parametros que tu escojas, cuales son los candidatos a postularse mas capacitados o con mejores caracteristicas para tu evento y si no cumplen con los criterios adecuados, entonces no serán aceptados, y así
                    tendran la tranquilidad <br>de tener un filtro que les otorge tener los mejores candidatos a postularse.

                    <br>
                    <br>

                    No se mostrará la información completa de los eventos a los voluntarios hasta ser aceptados, por temas de seguridad.
                    <br>
                    <br>
                    <br>
                    Sin más que decir, BIENVENIDO NUEVAMENTE.
                    <br>
                    <br>
                </div>
            </div>
            <!-- Inicio Contenedor (Central) -->

            <div class="row">

                <div class="col-md-4">
                    <%-- Después de esto va el botón --%>
                    <a href="/organ/create_event" class="card align-items-center text-center btn">
                        <div class="card-body">
                            <h3 class="card-title">Crear   Eventos</h3>
                            <!-- <h6 class="card-subtitle mb-2 text-muted"></h6> -->
                            <i class="ti ti-circle-plus fs-6"></i>
                        </div>
                    </a>
                </div>

                <div class="col-md-4">
                    <%-- Después de esto va el botón --%>
                    <a href="/organ/create_forms" class="card align-items-center text-center btn">
                        <div class="card-body">
                            <h3 class="card-title">Crear   Encuestas</h3>
                            <!-- <h6 class="card-subtitle mb-2 text-muted"></h6> -->
                            <i class="ti ti-circle-plus fs-6"></i>
                        </div>
                    </a>
                </div>

            </div>
        </div>
        <!-- Fin Contenedor (Principal) -->
    </div>
</div>
<!-- JS -->
<!-- JS -->
<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/sidebarmenu.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/app.min.js"></script>
<!-- Estadisticas Library -->
<script src="${pageContext.request.contextPath}/assets/js/apexcharts.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/dashboard.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/sweetalert2.js"></script>
</body>

</html>