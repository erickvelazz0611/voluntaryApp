package mx.edu.utez.voluntariapp_final.controllers.organization;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import mx.edu.utez.voluntariapp_final.models.Role.Role;
import mx.edu.utez.voluntariapp_final.models.organization.DaoEvent;
import mx.edu.utez.voluntariapp_final.models.organization.DaoOrgan;
import mx.edu.utez.voluntariapp_final.models.organization.Event;
import mx.edu.utez.voluntariapp_final.models.organization.Organ;
import mx.edu.utez.voluntariapp_final.models.user.User;
import mx.edu.utez.voluntariapp_final.models.volunteer.DaoVolunteer;

import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Base64;
import java.util.List;

@WebServlet(name = "organs", urlPatterns = {
        "/organ/main",
        "/organ/register",
        "/organ/organ",
        "/organ/organ-view",
        "/organ/save",
        "/organ/organ-view-update",
        "/organ/update",
        "/organ/delete",
        "/event/events",

        //crear organ admin
        "/organ/crearOrgan",
        "/organ/create-organ",
        "/organ/update-organ",
        "/organ/updateOrgan",

        /*Redirecciones de Organizaciones*/
        "/organ/events",
        "/organ/surveys",
        "/organ/postulations",
        "/organ/aprob",
        "/organ/porfile",

        /*======================================*/
        /*Redirecciones del Formulario y Eventos*/
        "/organ/create_event",                   /*Campos Temporales*/
        "/organ/create_forms",
        /*======================================*/
        "/forms/save"


})
@MultipartConfig
public class ServletOrgan extends HttpServlet {
    private String action;
    private String redirect = "/organ/main";

    private String email;
    private String password;
    private boolean Active;

    private String id;
    private String bussines_name;
    private String street;
    private String cologne;
    private String postal_code;
    private String municipality;
    private String state;
    private String rfc;
    private String phone;


    private Organ organ;
    private Event event;


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        action = request.getServletPath();
        switch (action) {
            case "/organ/main":
                //List<Admin> admins = new DaoAdmin().findAll();
                // request.setAttribute("organs", admins);
                redirect = "/pages/organizations/index_organ.jsp";
                break;
            /*Redirecciones del Organizador*/
            case "/organ/events":
                List<Event> events2 = new DaoEvent().relacion_Organ();
                request.setAttribute("events2", events2);
                System.out.println("Listado de eventos" + events2);

                redirect = "/pages/organizations/organizations_events.jsp";
                break;
            case "/organ/surveys":
                redirect = "/pages/organizations/organizations_surveys.jsp";
                break;
            case "/organ/postulations":
                redirect = "/pages/organizations/organizations_postulates.jsp";
                break;
            case "/organ/aprob":
                redirect = "/pages/organizations/organizations_aprob.jsp";
                break;
            case "/organ/porfile":
                HttpSession session = request.getSession();
                User user = (User) session.getAttribute("user");
                organ = new DaoOrgan().findOneByUser(user.getId_user());
                System.out.println(organ);
                if (organ != null) {
                    System.out.println("Entró a la organización");
                    request.setAttribute("organ", organ);
                    byte[] imageBytes = organ.getImageUser();
                    System.out.println("Bytes de imagen: " + (imageBytes == null ? "null" : imageBytes.length));
                    if (imageBytes != null && imageBytes.length > 0) {
                        String base64Image = Base64.getEncoder().encodeToString(imageBytes);
                        //System.out.println("Imagen en Base64: " + base64Image);
                        request.setAttribute("base64Image", base64Image);
                    }
                    redirect = "/pages/organizations/organizations_porfile.jsp";
                } else {
                    System.out.println("No se encontró");
                    redirect = "/organ/main";
                }
                break;
            case "/organ/organ-view":
                redirect = "/pages/accounts/organization.jsp";
                break;
            case "/organ/organ-view-update":
                id = request.getParameter("id");
                organ = new DaoOrgan().findOne(id != null ? Long.parseLong(id) : 0);
                if (organ != null) {
                    request.setAttribute("organ", organ);
                    redirect = "/pages/accounts/organizations/update_organ.jsp";
                } else {
                    redirect = "/organ/organs?result" + false + "&message" + URLEncoder.encode("", StandardCharsets.UTF_8);
                }
                break;
            /*===================================*/
            /*Eventos*/
            case "/event/events":
                List<Event> events = new DaoEvent().findAll();
                request.setAttribute("event", events);
                redirect = "/organ/events";

                break;

            /*====================================================*/
            /*Redirecciones del Formulario y Eventos*/
            case "/organ/create_event":
                redirect = "/pages/organizations/create_event.jsp";
                break;
            case "/organ/create_forms":
                redirect = "/pages/organizations/create_forms.jsp";
                break;
            /*=====================================================*/
            case "/organ/crearOrgan":
                redirect = "/pages/administrators/crearOrganization.jsp";
                break;
            case "/organ/updateOrgan":
                redirect = "/pages/administrators/updateOrgan.jsp";
                break;
            default:
                System.out.println(action);
        }
        request.getRequestDispatcher(redirect).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html");
        action = request.getServletPath();
        switch (action) {
           /* case "/organ/organ-view-update":
                id = request.getParameter("id");
                Admin admin = new DaoAdmin().findOne(id != null ? Long.parseLong(id) : 0);
                if (admin != null) {
                    request.setAttribute("organ", organ);
                    redirect = "/pages/organizations/update_organ.jsp";
                } else {
                    redirect = "/organ/organs?result" + false + "&message" + URLEncoder.encode("", StandardCharsets.UTF_8);
                }
                break;*/
            case "/organ/save":
                // Obtener los valores de los parámetros del formulario
                email = request.getParameter("email");
                password = request.getParameter("password");
                bussines_name = request.getParameter("bussines_name");
                street = request.getParameter("street");
                cologne = request.getParameter("cologne");
                postal_code = request.getParameter("postal_code");
                municipality = request.getParameter("municipality");
                state = request.getParameter("state");
                rfc = request.getParameter("rfc");
                phone = request.getParameter("phone");
                // Crear y configurar el objeto "User"
                User user1 = new User();
                user1.setEmail(email);
                user1.setPassword(password);
                user1.setStatus(false);
                // Crear y configurar el objeto "Organ"
                Organ organ1 = new Organ();
                organ1.setId(0L);
                organ1.setBussines_name(bussines_name);
                organ1.setStreet(street);
                organ1.setCologne(cologne);
                organ1.setPostal_code(postal_code);
                organ1.setMunicipality(municipality);
                organ1.setState(state);
                organ1.setRfc(rfc);
                organ1.setPhone(phone);
                organ1.setUser(user1);
                // Configurar el rol (asumiendo que 2 es el ID del rol para organizaciones)
                organ1.setRole(new Role(2, ""));
                try {
                    // Guardar el objeto "Organ" en la base de datos
                    if (new DaoOrgan().save(organ1)) {
                        redirect = "/user/login?result=true&message=" + URLEncoder.encode("Organizacion guardada correctamente", StandardCharsets.UTF_8);
                    } else {
                        throw new Exception("Error");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    redirect = "/user/login?result=false&message=" + URLEncoder.encode("No se pudo guardar la organización", StandardCharsets.UTF_8);
                }
                break;
            case "/organ/update":
                Organ organ2 = new Organ();
                // Obtener los valores de los parámetros del formulario
                id = request.getParameter("id");
                bussines_name = request.getParameter("bussines_name");
                municipality = request.getParameter("municipality");
                state = request.getParameter("state");
                postal_code = request.getParameter("postal_code");
                cologne = request.getParameter("cologne");
                street = request.getParameter("street");
                phone = request.getParameter("phone");
                email = request.getParameter("email");
                password = request.getParameter("password");
                System.out.println(id + bussines_name + street + cologne + postal_code + municipality + state + phone + email + password);

                Part filePart = request.getPart("profilePic");

                if (filePart != null && filePart.getSize() > 0) {
                    InputStream fileContent = filePart.getInputStream();
                    byte[] imageBytes = fileContent.readAllBytes();
                    organ2.setImageUser(imageBytes);
                    System.out.println("Imagen cargada correctamente. Tamaño: " + imageBytes.length + " bytes.");
                }
                // Crear y configurar el objeto "organ"

                organ2.setId(Long.valueOf(id));
                organ2.setBussines_name(bussines_name);
                organ2.setMunicipality(municipality);
                organ2.setState(state);
                organ2.setPostal_code(postal_code);
                organ2.setCologne(cologne);
                organ2.setStreet(street);
                organ2.setPhone(phone);

                // Crear y configurar el objeto "User"
                User user = new User();
                user.setEmail(email);
                user.setPassword(password);
                organ.setUser(user);
                try {
                    if (new DaoOrgan().update(organ2)) {
                        redirect = "/organ/porfile";
                    } else {
                        redirect = "/organ/porfile";
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    redirect = "/organ/porfile";
                }
                response.sendRedirect(redirect);
                return;

            case "/forms/save":

                break;

            case "/organ/create-organ":
                // Obtener los valores de los parámetros del formulario
                email = request.getParameter("email");
                password = request.getParameter("password");
                bussines_name = request.getParameter("bussines_name");
                street = request.getParameter("street");
                cologne = request.getParameter("cologne");
                postal_code = request.getParameter("postal_code");
                municipality = request.getParameter("municipality");
                state = request.getParameter("state");
                rfc = request.getParameter("rfc");
                phone = request.getParameter("phone");
                // Crear y configurar el objeto "User"
                User userCreate = new User();
                userCreate.setEmail(email);
                userCreate.setPassword(password);
                userCreate.setStatus(false);
                // Crear y configurar el objeto "Organ"
                Organ organC = new Organ();
                organC.setId(0L);
                organC.setBussines_name(bussines_name);
                organC.setStreet(street);
                organC.setCologne(cologne);
                organC.setPostal_code(postal_code);
                organC.setMunicipality(municipality);
                organC.setState(state);
                organC.setRfc(rfc);
                organC.setPhone(phone);
                organC.setUser(userCreate);
                // Configurar el rol (asumiendo que 2 es el ID del rol para organizaciones)
                organC.setRole(new Role(2, ""));
                try {
                    // Guardar el objeto "Organ" en la base de datos
                    if (new DaoOrgan().save(organC)) {
                        redirect = "/admin/main?result=true&message=" + URLEncoder.encode("Organizacion guardada correctamente", StandardCharsets.UTF_8);
                    } else {
                        throw new Exception("Error");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    redirect = "/admin/main?result=false&message=" + URLEncoder.encode("No se pudo guardar la organización", StandardCharsets.UTF_8);
                }
                break;
            case "/organ/update-organ":
                // Obtener los valores de los parámetros del formulario
                id = request.getParameter("id");
                bussines_name = request.getParameter("bussines_name");
                municipality = request.getParameter("municipality");
                state = request.getParameter("state");
                postal_code = request.getParameter("postal_code");
                cologne = request.getParameter("cologne");
                street = request.getParameter("street");
                phone = request.getParameter("phone");
                email = request.getParameter("email");
                password = request.getParameter("password");
                System.out.println(id + bussines_name + street + cologne + postal_code + municipality + state + phone + email + password);
                // Crear y configurar el objeto "Voluntario"
                Organ organU = new Organ();
                organU.setId(Long.valueOf(id));
                organU.setBussines_name(bussines_name);
                organU.setMunicipality(municipality);
                organU.setState(state);
                organU.setPostal_code(postal_code);
                organU.setCologne(cologne);
                organU.setStreet(street);
                organU.setPhone(phone);

                // Crear y configurar el objeto "User"
                User userU = new User();
                userU.setEmail(email);
                userU.setPassword(password);
                organU.setUser(userU);
                try {
                    // Guardar el objeto "Organ" en la base de datos
                    if (new DaoOrgan().update(organU)) {
                        redirect = "/organ/main?result=true&message=" + URLEncoder.encode("Organizacion actualizada correctamente", StandardCharsets.UTF_8);
                    } else {
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    redirect = "/organ/porfile?result=false&message=" + URLEncoder.encode("No se pudo guardar la organización", StandardCharsets.UTF_8);
                }
                break;



           /* case "/organ/delete":
                id = request.getParameter("id");
                if (new DaoAdmin().delete(Long.parseLong(id))) {
                    redirect = "/organ/organs?result=" + true + "&message=" + URLEncoder.encode("Administrador eliminado correctamente", StandardCharsets.UTF_8);
                } else {
                    redirect = "/organ/organs?result=" + false + "&message=" + URLEncoder.encode("No se pudo eliminar el administrador", StandardCharsets.UTF_8);
                }
                redirect = "/organ/organs";
                break;*/
            default:
                redirect = "/organ/organs";
        }
        response.sendRedirect(request.getContextPath() + redirect);
    }
}
