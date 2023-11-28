package mx.edu.utez.voluntariapp_final.controllers.organization;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.voluntariapp_final.models.organization.DaoForms;
import mx.edu.utez.voluntariapp_final.models.organization.Forms;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

@WebServlet(name = "forms", urlPatterns = {
        "/forms/delete",
        "/forms/update",
        "/forms/save",
        "/forms/view"
})
public class ServletForms extends HttpServlet {
    private String action;
    private String redirect = "/forms/create-question";
    private String id;
    private String name_form;
    private String instructions;
    private String organ_id;
    private String enable;
    private Forms forms;
    private DaoForms daoForms=new DaoForms();


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        action = req.getServletPath();
        req.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html");
        switch (action) {
            case "/forms/view":
                id = req.getParameter("id");
                forms = daoForms.findForm(Integer.parseInt(id));
                req.setAttribute("forms", forms);
                redirect = "/pages/organizations/view_form.jsp";
                break;

            default:
                System.out.println(action);
        }
        req.getRequestDispatcher(redirect).forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html");
        action = request.getServletPath();

        switch (action) {
            case "/forms/save":
                System.out.println("/* =================================== */" + "\n/*              Save Forms             */" + "\n/* =================================== */");

                // Obtener los parámetros del formulario
                name_form = request.getParameter("name_form");
                instructions = request.getParameter("instructions");
                String organIdStr = request.getParameter("organ_id");

                // Crear un nuevo objeto Forms
                Forms forms = new Forms();
                forms.setName_form(name_form);
                forms.setInstructions(instructions);
                forms.setEnable(false);

                // Convertir organ_id a Integer
                Integer organId = null;
                try {
                    organId = Integer.parseInt(organIdStr);
                } catch (NumberFormatException e) {
                    System.out.println("id_organ no es un número válido o está vacío");
                }

                forms.setId_organ(organId);

                System.out.println("Formulario:" + name_form + "\nInstrucciones: " + instructions + "\nActivo: " + enable + "\nId_Organ: " + organ_id);
                System.out.println("/* =================================== */" + "\n/*            Fin Save Forms           */" + "\n/* =================================== */");

                try {
                    // Guardar el formulario
                    DaoForms daoForms = new DaoForms();
                    if (daoForms.save(forms)) {
                        // Éxito: Redirigir a la página de encuestas con un mensaje de éxito
                        response.sendRedirect("/organ/surveys?result=true&message=" + URLEncoder.encode("Formulario guardado correctamente", StandardCharsets.UTF_8));
                        return; // Importante agregar un return para salir del método después de la redirección
                    } else {
                        throw new Exception("Error al guardar el formulario");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    // Error: Redirigir a la página de encuestas con un mensaje de error
                    response.sendRedirect("/organ/surveys?result=false&message=" + URLEncoder.encode("Ocurrió un error", StandardCharsets.UTF_8));
                    return; // Importante agregar un return para salir del método después de la redirección
                }
            case "/forms/update":
                // Obtener los valores de los parámetros del formulario
                id = request.getParameter("form_id");
                name_form = request.getParameter("name_form");
                instructions = request.getParameter("instructions");
                enable = request.getParameter("enable");
                organ_id = request.getParameter("organ_id"); // Obtener el id_organ como String

                Forms form = new Forms();
                form.setId_forms(Long.valueOf(id));
                form.setName_form(name_form);
                form.setInstructions(instructions);
                form.setEnable(Boolean.parseBoolean(enable)); // Convertir el string a boolean

                try {
                    // Actualizar el objeto "Forms" en la base de datos
                    if (new DaoForms().update(form)) {
                        // Establecer atributo de éxito en el request
                        request.setAttribute("updateSuccess", true);
                        // Redirigir directamente a la página de encuestas después de la actualización exitosa
                        response.sendRedirect(request.getContextPath() + "/organ/surveys");
                        return;
                    } else {
                        // Establecer atributo de error en el request
                        request.setAttribute("updateError", true);
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    // Redirigir con mensaje de error
                    response.sendRedirect("/organ/surveys?result=false&message=" + URLEncoder.encode("Ocurrió un error", StandardCharsets.UTF_8));
                }
                break;

            case "/forms/delete":
                id = request.getParameter("id");
                Forms forms1 = new Forms();

                try {
                    if (id != null && !id.isEmpty()) {
                        forms1.setId_forms(Long.valueOf(id));
                    } else {
                        // Manejo para el caso en que id es nulo o vacío
                        // Puedes lanzar una excepción, imprimir un mensaje de error o realizar otra acción según tus necesidades.
                        throw new IllegalArgumentException("Id del formulario es nulo o vacío");
                    }

                    if (new DaoForms().delete(id)) {
                        // Redirigir con mensaje de éxito
                        response.sendRedirect("/organ/surveys?result=true&message=Evento%20eliminado%20correctamente");
                    } else {
                        // Redirigir con mensaje de error
                        response.sendRedirect("/organ/surveys?result=false&message=No%20se%20pudo%20eliminar%20el%20evento");
                    }
                } catch (IllegalArgumentException e) {
                    // Manejo para el caso en que id no es un número válido o es nulo/vacío
                    e.printStackTrace();
                    response.sendRedirect("/organ/surveys?result=false&message=" + URLEncoder.encode("Id del formulario no válido", StandardCharsets.UTF_8));
                } catch (Exception e) {
                    e.printStackTrace();
                    // Redirigir con mensaje de error
                    response.sendRedirect("/organ/surveys?result=false&message=No%20se%20pudo%20eliminar%20el%20evento");
                }
                break;
            default:
                System.out.println("Acción no válida: " + action);
                request.setAttribute("errorOccurred", true);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/organ/surveys");
                dispatcher.forward(request, response);
                return;
        }
    }

}
