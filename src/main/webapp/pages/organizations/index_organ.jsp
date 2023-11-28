<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>VoluntariApp Organizaciones</title>
    <!-- Se inserta la foto del logo de la empresa -->
    <link rel="shortcut icon" type="image/png"
          href="${pageContext.request.contextPath}/assets/images/logos_voluntariapp/logo_VOLUNTARIAPP.png"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/styles.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/css/style_dashboard.css">
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
                <a href="${pageContext.request.contextPath}/organ/main" class="text-nowrap logo-img">
                    <!-- Logo parte superior izquierda -->
                    <img src="${pageContext.request.contextPath}/assets/images/logos_voluntariapp/logo_extend.png"
                         style="width:180px"
                         alt=""/><!-- Logo de la barra lateral -->
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

        <!-- Inicio Contenedor (Principal) -->
        <div class="container-fluid">

            <!-- Inicio Contenedor (Central) -->
            <div class="container">
                <h1>Bienvenido a nuestra organización</h1>
                <h4>Permítanos presentarnos y mostrarle cómo podemos asistirle...</h4>
                <p>Nuestra aplicación está diseñada para brindarle el apoyo necesario en la creación y gestión de
                    eventos que involucren a voluntarios. Nosotros nos encargamos de facilitar el proceso, brindándoles
                    a las organizaciones como la suya, el control y acceso necesario para crear eventos y gestionar la
                    información de los voluntarios que decidan participar.</p>
                <p>Como organización, usted tiene la completa libertad de crear los eventos que necesite. Contamos con
                    una sección especializada donde podrá crear eventos y, para cada uno de ellos, tendrá la opción de
                    realizar una encuesta que le permitirá filtrar a los voluntarios que desean participar.</p>
                <h4>¿Qué significa esto?</h4>
                <p>Cuando crea un evento, podrá adjuntar una encuesta destinada a los voluntarios. Una vez que el evento
                    es publicado, los voluntarios interesados en participar deberán responder la encuesta. Esta
                    encuesta, basada en los criterios que usted determine, servirá para identificar a los candidatos más
                    adecuados para su evento. Si no cumplen con los requisitos necesarios, no serán aceptados. De esta
                    forma, tendrá la seguridad de contar con los mejores candidatos posibles.</p>
                <p>Es importante mencionar que la información completa del evento no será visible para los voluntarios
                    hasta que sean aceptados, esto con el objetivo de resguardar la seguridad de la información.</p>
                <p>Para finalizar, le damos la más cordial bienvenida una vez más.</p>
            </div>


            <!-- Inicio Contenedor (Central) -->

            <div class="row">

                <div class="col-md-4">
                    <%-- Después de esto va el botón --%>
                    <a href="${pageContext.request.contextPath}/organ/create_event"
                       class="card align-items-center text-center btn">
                        <div class="card-body">
                            <h3 class="card-title">Crear Eventos</h3>
                            <!-- <h6 class="card-subtitle mb-2 text-muted"></h6> -->
                            <i class="ti ti-circle-plus fs-6"></i>
                        </div>
                    </a>
                </div>

                <div class="col-md-4">
                    <%-- Después de esto va el botón --%>
                    <a href="${pageContext.request.contextPath}/organ/create_forms"
                       class="card align-items-center text-center btn">
                        <div class="card-body">
                            <h3 class="card-title">Crear Encuestas</h3>
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