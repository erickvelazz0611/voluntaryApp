<%--
  Created by IntelliJ IDEA.
  User: Blanch
  Date: 20/08/2023
  Time: 03:48 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Contestar Formulario</title>
  <!-- Se inserta la foto del logo de la empresa -->
  <link rel="shortcut icon" type="image/png" href="../../assets/images/logos_voluntariapp/logo_VOLUNTARIAPP.png" />
  <link rel="stylesheet" href="../../assets/css/css/bootstrap.min.css">
  <link rel="stylesheet" href="../../assets/css/css/register.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
</head>
<body>
<br><br><br>

<div class="container-fluid d-flex align-items-center justify-content-center">
  <div class="container bg-white rounded shadow">
    <div class="row align-items-stretch">
      <div class="col bg-white p-5 rounded-end">
        <h3 class="fw-bold text-center">Formulario</h3>

        <br>
        <%--        <!-- Contestar -->--%>
        <%--        <input hidden value="${forms.id}" name="id">--%>
        <form action="#">
          <div class="row">
            <div class="row">
              <h4 class="col-md-0 mb-4"> "/></h4>

              <div class=" p-0 my-0 ">
                <div class="d-flex align-items-center mb-2">
                </div>
                <p class="text-extra-justify">Este es un formulario de muestra para demostración. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus laoreet libero et tincidunt. Duis vitae lectus vel urna cursus fermentum a ut libero.</p>
              </div>
            </div>

            <div class="col-md-12 mb-4"  style="min-width: 200px">
              <!-- Pregunta 1 -->
              <div class="border p-3 my-3 rounded">
                <div class="d-flex align-items-center mb-2">
                  <h5 class="text-extra-justify">Pregunta 1</h5>
                </div>
                <div class="form-check">
                  <input class="form-check-input" type="radio" name="radio1" id="radio1Option1"
                         value="option1" required>
                  <label class="form-check-label text-extra-justify" for="radio1Option1">
                    Respuesta 1
                  </label>
                </div>
                <div class="form-check">
                  <input class="form-check-input" type="radio" name="radio1" id="radio1Option2"
                         value="option2" required>
                  <label class="form-check-label text-extra-justify" for="radio1Option2">
                    Respuesta 2
                  </label>
                </div>
                <!-- Agrega más opciones de respuesta aquí si es necesario -->
              </div>

              <!-- Pregunta 2 -->
              <div class="border p-3 my-3 rounded">
                <div class="d-flex align-items-center mb-2">
                  <h5 class="text-extra-justify">Pregunta 2</h5>
                </div>
                <div class="form-check">
                  <input class="form-check-input" type="radio" name="radio2" id="radio2Option1"
                         value="option1" required>
                  <label class="form-check-label text-extra-justify" for="radio2Option1">
                    Respuesta 1
                  </label>
                </div>
                <div class="form-check">
                  <input class="form-check-input" type="radio" name="radio2" id="radio2Option2"
                         value="option2" required>
                  <label class="form-check-label text-extra-justify" for="radio2Option2">
                    Respuesta 2
                  </label>
                </div>
                <!-- Agrega más opciones de respuesta aquí si es necesario -->
              </div>

              <!-- ... Agrega más preguntas aquí ... -->
            </div>
          </div>

          <div class="row">
            <div class="col-md-0 mb-2 text-center">
              <button type="submit" class="btn btn-outline-primary">Enviar Respuestas</button>
            </div>
            <div class="col-md-0 mb-0 text-center">
              <button type="button" class="btn btn-outline-danger">Cancelar</button>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

<!-- Agregamos las referencias a las bibliotecas de Bootstrap y Popper.js -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.7/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>
