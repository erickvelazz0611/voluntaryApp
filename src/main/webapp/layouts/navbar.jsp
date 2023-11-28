<%--
  Created by IntelliJ IDEA.
  User: Blanch
  Date: 16/08/2023
  Time: 10:58 a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                    <img src="data:image/jpeg;base64, ${base64Image}" alt="" style="width:35px; height:35px"
                         class="rounded-circle">
                </a>

                <!-- Menu desplegable del la Foto fe perfil -->
                <div class="dropdown-menu dropdown-menu-end dropdown-menu-animate-up"
                     aria-labelledby="drop2">
                    <!-- COLOR == | Fondo Desplegable Foto Perfil | ==    (Codigo de arriba)  -->
                    <div class="message-body">
                        <a href="${pageContext.request.contextPath}/organ/porfile" class="d-flex align-items-center gap-2 dropdown-item">
                            <i class="ti ti-user fs-6"></i>
                            <p class="mb-0 fs-3">Mi perfil</p>
                        </a>
                        <a href="${pageContext.request.contextPath}/api/auth/logout" class="btn btn-outline-primary mx-3 mt-2 d-block">Cerrar
                            Sesion</a>
                    </div>
                </div>
                <!-- Fin del Menu desplegable del la Foto fe perfil -->
            </li>
            <!-- Fin Foto de perfil -->
        </ul>
    </div>
</nav>
