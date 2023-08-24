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
<div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
     data-sidebar-position="fixed" data-header-position="fixed">
    <aside class="left-sidebar">
        <div>
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
            <jsp:include page="../../layouts/sidebar.jsp"/>
        </div>
    </aside>
    <div class="body-wrapper">
        <header class="app-header">
            <jsp:include page="../../layouts/navbar.jsp"/>
        </header>

        <!-- Inicio Contenedor (Principal) -->
        <div class="container-fluid">

            <!-- Inicio Contenedor (Central) -->
            <div class="row">
                <div class="row">
                    <h1>Bienvenida organización</h1><br><br><br>
                    <h4>Detalles con los que te podemos ayudar y quienes somos....</h4><br><br>
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
                    <h4>¿A qué me refiero con esto?</h4><br><br>

                    Cuando creas tu evento, tendras la oportuinidad de crear una encuenta al evento para los voluntarios, y al ser publicados, los voluntarios que
                    decidan <br>postularse tendran que responder dicha encuesta, la cual valida a traves de los parametros que tu escojas, cuales son los candidatos a postularse mas capacitados o con mejores caracteristicas para tu evento y si no cumplen con los criterios adecuados, entonces no serán aceptados, y así
                    tendran la tranquilidad <br>de tener un filtro que les otorge tener los mejores candidatos a postularse.
                    <br><br>
                    No se mostrará la información completa de los eventos a los voluntarios hasta ser aceptados, por temas de seguridad.<br><br><br>
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