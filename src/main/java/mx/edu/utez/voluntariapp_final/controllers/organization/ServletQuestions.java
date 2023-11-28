package mx.edu.utez.voluntariapp_final.controllers.organization;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.voluntariapp_final.models.organization.DaoForms;
import mx.edu.utez.voluntariapp_final.models.organization.DaoQuestion;
import mx.edu.utez.voluntariapp_final.models.organization.Forms;
import mx.edu.utez.voluntariapp_final.models.organization.Question;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

@WebServlet
        (name = "question", urlPatterns = {
                "/forms/create-question",
                "/questions/create-answer",
                "/questions/create-question",
                "/questions/save",
                "/question"
        })
public class ServletQuestions extends HttpServlet {
    private String action;
    private String redirect = "/questions";
    private String formId;
    private Question question;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        action = request.getServletPath();
        request.setCharacterEncoding("UTF-8" );
        response.setCharacterEncoding("UTF-8" );
        response.setContentType("text/html" );
        switch (action) {
            case "/forms/create-question":
                System.out.println("/* =================================== */"
                        +"\n/*             Formulario             */"
                        +"\n/* =================================== */" );
                // Obtén el ID del formulario de la consulta de parámetros
                String formularioId = request.getParameter("id");

                // Asegúrate de manejar el caso en que el formularioId sea nulo o vacío según sea necesario

                if (formularioId != null && !formularioId.isEmpty()) {
                    long id = Long.parseLong(formularioId);
                    DaoForms daoForms = new DaoForms();
                    Forms formulario = daoForms.findOne(id);

                    // Puedes verificar si el formulario no es nulo antes de enviarlo
                    if (formulario != null) {
                        request.setAttribute("formulario", formulario);
                        redirect = "/pages/organizations/create_question.jsp";
                    } else {
                        // Manejar el caso en que no se encuentra el formulario con el ID proporcionado
                        // Puedes redirigir o mostrar un mensaje de error, según tus necesidades.
                        // Por ejemplo:
                        redirect = "/organ/surveys";
                    }
                } else {
                    // Manejar el caso en que el parámetro "id" es nulo o vacío
                    // Puedes redirigir o mostrar un mensaje de error, según tus necesidades.
                    // Por ejemplo:
                    redirect = "/organ/main";
                }

                break;

            case "/forms/view":
                break;
            default:
                System.out.println(action);
        }
        request.getRequestDispatcher(redirect).forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8" );
        response.setContentType("text/html" );
        action = request.getServletPath();
        switch (action) {
            case "/questions/save":
                System.out.println("/* =================================== */" + "\n/*           Save Questions           */" + "\n/* =================================== */");

                String questionText = request.getParameter("questionText");
                String formIdStr = request.getParameter("form_Id");

                // Agregar mensaje de depuración
                System.out.println("Valor de form_Id recibido: " + formIdStr);

                Integer formId = null;
                try {
                    if (formIdStr != null && !formIdStr.isEmpty()) {
                        formId = Integer.parseInt(formIdStr);
                    } else {
                        // Agregar mensaje de depuración
                        System.out.println("form_Id es nulo o una cadena vacía");

                        response.sendRedirect("/organ/surveys?result=false&message=" + URLEncoder.encode("form_Id no es un número válido", StandardCharsets.UTF_8));
                        return; // Terminar la ejecución del método para evitar problemas
                    }
                } catch (NumberFormatException e) {
                    // Agregar mensajes de depuración
                    System.out.println("Error al convertir form_Id a entero: " + e.getMessage());
                    System.out.println("Valor de form_Id que causó el error: " + formIdStr);

                    response.sendRedirect("/organ/surveys?result=false&message=" + URLEncoder.encode("form_Id no es un número válido", StandardCharsets.UTF_8));
                    return; // Terminar la ejecución del método para evitar problemas
                }

                question = new Question();  // Crear una nueva instancia de la pregunta
                question.setQuestion(questionText);
                question.setForm_id(String.valueOf(formId));
                System.out.println("Pregunta:" + questionText + "\nId_Form: " + formId);

                try {
                    DaoQuestion daoQuestion = new DaoQuestion();
                    if (daoQuestion.save(question)) {
                        // Éxito: Redirigir con mensaje de éxito
                        response.sendRedirect("/organ/surveys?result=true&message=" + URLEncoder.encode("Pregunta guardada correctamente", StandardCharsets.UTF_8));
                    } else {
                        throw new Exception("Error al guardar la pregunta");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    // Error: Redirigir con mensaje de error
                    response.sendRedirect("/organ/surveys?result=false&message=" + URLEncoder.encode("Ocurrió un error", StandardCharsets.UTF_8));
                }
                break;


        }
        // No necesitas esta línea aquí:
        // response.sendRedirect(request.getContextPath() + redirect);
    }


}
