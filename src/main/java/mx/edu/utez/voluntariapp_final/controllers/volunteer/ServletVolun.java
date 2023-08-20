package mx.edu.utez.voluntariapp_final.controllers.volunteer;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import mx.edu.utez.voluntariapp_final.models.Role.Role;

import mx.edu.utez.voluntariapp_final.models.administrators.Admin;
import mx.edu.utez.voluntariapp_final.models.administrators.DaoAdmin;
import mx.edu.utez.voluntariapp_final.models.organization.DaoEvent;
import mx.edu.utez.voluntariapp_final.models.organization.Event;
import mx.edu.utez.voluntariapp_final.models.user.User;
import mx.edu.utez.voluntariapp_final.models.volunteer.DaoVolunteer;
import mx.edu.utez.voluntariapp_final.models.volunteer.Volunteer;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Base64;
import java.util.List;
import java.util.UUID;

@WebServlet(name = "volunteers ", urlPatterns = {

        "/volunteer/register",
        "/volunteer/main",
        "/volunteer/volunteer-view",
        "/volunteer/save",
        "/volunteer/volunteer-view-update",
        "/volunteer/update",
        "/volunteer/delete",

        //crear voluntario ADMIN
        "/volunteer/crearVolun",
        "/volunteer/create-volunteer",
        "/volunteer/updateVol",
        "/volunteer/update-volunteer",

        /*Redirecciones de los Voluntarios*/
        "/volunteer/events",
        "/volunteer/forms",
        "/volunteer/porfile",
        "/volunteer/postulates"

})

@MultipartConfig
public class ServletVolun extends HttpServlet {
    private String action;
    private String redirect = "/volunteer/main";
    private String email, password, id, name, surname, lastanme, birthday, address, phone, curp;
    private Volunteer volunteer;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        action = req.getServletPath();
        switch (action) {
            case "/volunteer/main":
                HttpSession session = req.getSession();
                User user = (User) session.getAttribute("user");
                volunteer = new DaoVolunteer().findOneByUser(user.getId_user());
                System.out.println(volunteer);
                if (volunteer != null) {
                    System.out.println("Entró al voluntario");
                    req.setAttribute("volunteer", volunteer);
                    byte[] imageBytes = volunteer.getImageUser();
                    System.out.println("Bytes de imagen: " + (imageBytes == null ? "null" : imageBytes.length));
                    if (imageBytes != null && imageBytes.length > 0) {
                        String base64Image = Base64.getEncoder().encodeToString(imageBytes);
                        //System.out.println("Imagen en Base64: " + base64Image);
                        req.setAttribute("base64Image", base64Image);
                    }
                }

                redirect = "/pages/volunteers/index_volunt.jsp";
                break;
            /*Redirecciones de Voluntarios*/
            case "/volunteer/events":
               /* List<Event> event1 = new DaoEvent().Volunteer_accept();
                req.setAttribute("event1", event1);
                System.out.println("Listado eventos"+event1);*/
                HttpSession sessionE = req.getSession();
                User userE = (User) sessionE.getAttribute("user");
                volunteer = new DaoVolunteer().findOneByUser(userE.getId_user());
                System.out.println(volunteer);
                if (volunteer != null) {
                    System.out.println("Entró al voluntario");
                    req.setAttribute("volunteer", volunteer);
                    byte[] imageBytes = volunteer.getImageUser();
                    System.out.println("Bytes de imagen: " + (imageBytes == null ? "null" : imageBytes.length));
                    if (imageBytes != null && imageBytes.length > 0) {
                        String base64Image = Base64.getEncoder().encodeToString(imageBytes);
                        //System.out.println("Imagen en Base64: " + base64Image);
                        req.setAttribute("base64Image", base64Image);
                    }
                }

                redirect = "/pages/volunteers/volunteer_events.jsp";
                break;
            case "/volunteer/forms":
                HttpSession sessionF = req.getSession();
                User userF = (User) sessionF.getAttribute("user");
                volunteer = new DaoVolunteer().findOneByUser(userF.getId_user());
                System.out.println(volunteer);
                if (volunteer != null) {
                    System.out.println("Entró al voluntario");
                    req.setAttribute("volunteer", volunteer);
                    byte[] imageBytes = volunteer.getImageUser();
                    System.out.println("Bytes de imagen: " + (imageBytes == null ? "null" : imageBytes.length));
                    if (imageBytes != null && imageBytes.length > 0) {
                        String base64Image = Base64.getEncoder().encodeToString(imageBytes);
                        //System.out.println("Imagen en Base64: " + base64Image);
                        req.setAttribute("base64Image", base64Image);
                    }
                }
                redirect = "/pages/volunteers/volunteer_forms.jsp";
                break;
            case "/volunteer/postulates":
                HttpSession sessionP = req.getSession();
                User userP = (User) sessionP.getAttribute("user");
                volunteer = new DaoVolunteer().findOneByUser(userP.getId_user());
                System.out.println(volunteer);
                if (volunteer != null) {
                    System.out.println("Entró al voluntario");
                    req.setAttribute("volunteer", volunteer);
                    byte[] imageBytes = volunteer.getImageUser();
                    System.out.println("Bytes de imagen: " + (imageBytes == null ? "null" : imageBytes.length));
                    if (imageBytes != null && imageBytes.length > 0) {
                        String base64Image = Base64.getEncoder().encodeToString(imageBytes);
                        //System.out.println("Imagen en Base64: " + base64Image);
                        req.setAttribute("base64Image", base64Image);
                    }
                }
                redirect = "/pages/volunteers/volunteer_postulates.jsp";
                break;
           /* case "/volunteer/volunteer-view-update":
                id = req.getParameter("id");
                volunteer = new DaoVolunteer().findOne(
                        id != null ? Long.parseLong(id) : 0
                );
                if (volunteer != null) {
                    req.setAttribute("volunteer", volunteer);
                    redirect = "/views/volunteer/volunteer_profile.jsp";
                } else {
                    redirect = "/volunteer/profile?result" + false +
                            "&message=" +
                            URLEncoder.encode("Recurso no encontrado", StandardCharsets.UTF_8);
                }
                break;*/
            case "/volunteer/porfile":
                HttpSession sessionPr = req.getSession();
                User userPr = (User) sessionPr.getAttribute("user");
                volunteer = new DaoVolunteer().findOneByUser(userPr.getId_user());
                System.out.println(volunteer);
                if (volunteer != null) {
                    System.out.println("Entró al voluntario");
                    req.setAttribute("volunteer", volunteer);
                    byte[] imageBytes = volunteer.getImageUser();
                    System.out.println("Bytes de imagen: " + (imageBytes == null ? "null" : imageBytes.length));
                    if (imageBytes != null && imageBytes.length > 0) {
                        String base64Image = Base64.getEncoder().encodeToString(imageBytes);
                        //System.out.println("Imagen en Base64: " + base64Image);
                        req.setAttribute("base64Image", base64Image);
                    }
                    redirect = "/pages/volunteers/volunteer_porfile.jsp";
                    } else {
                    System.out.println("No se encontró el administrador");
                    redirect = "/volunteer/main";

                }
                break;
                case "/volunteer/crearVolun":
                redirect = "/pages/administrators/crearVoluntario.jsp";
                break;

            case "/volunteer/updateVol":
                redirect = "/pages/administrators/updateVolun.jsp";
                break;

            default:
                System.out.println(action);
        }
        req.getRequestDispatcher(redirect).forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html");
        action = req.getServletPath();
        switch (action) {
            //case "/volunteer/volunteer-view-update":
            //  id = req.getParameter("id");
            //volunteer = new DaoVolunteer().findOne(
            //      id != null ? Long.parseLong(id) : 0
            //);
            //if (volunteer != null) {
            //   req.setAttribute("volunteer", volunteer);
            //  redirect = "/views/volunteer/volunteer_profile.jsp";
            //} else {
            //  redirect = "/volunteer/porfile?result" + false +
            //        "&message=" +
            //      URLEncoder.encode("Recurso no encontrado", StandardCharsets.UTF_8);
            //}
            //break;
            case "/volunteer/save":
                // Obtener los valores de los parámetros del formulario
                email = req.getParameter("email");
                password = req.getParameter("password");
                name = req.getParameter("name");
                surname = req.getParameter("surname");
                lastanme = req.getParameter("lastanme");
                birthday = req.getParameter("birthday");
                address = req.getParameter("address");
                phone = req.getParameter("phone");
                curp = req.getParameter("curp");

                // Crear y configurar el objeto "User"
                User user1 = new User();
                user1.setEmail(email);
                user1.setPassword(password);
                user1.setStatus(false);
                // Crear y configurar el objeto "Voluntario"S
                Volunteer volunteer1 = new Volunteer();
                volunteer1.setId(0L);
                volunteer1.setName(name);
                volunteer1.setSurname(surname);
                volunteer1.setLastanme(lastanme);
                volunteer1.setBirthday(birthday);
                volunteer1.setAddress(address);
                volunteer1.setPhone(phone);
                volunteer1.setCurp(curp);
                volunteer1.setUser(user1);
                // Configurar el rol (asumiendo que 3 es el ID del rol para voluntarios)
                volunteer1.setRole(new Role(3, ""));
                try {
                    // Guardar el objeto "Volunteer" en la base de datos
                    if (new DaoVolunteer().save(volunteer1)) {
                        redirect = "/index.jsp?result=true&message=" + URLEncoder.encode("Voluntario guardado correctamente", StandardCharsets.UTF_8);
                    } else {
                        throw new Exception("Error");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    redirect = "/index.jsp?result=false&message=" + URLEncoder.encode("No se pudo guardar el voluntario", StandardCharsets.UTF_8);
                }
                break;
            case "/volunteer/update":
                    Volunteer volunteer2 = new Volunteer();
                    // Obtener los valores de los parámetros del formulario
                    id = req.getParameter("id");
                    address = req.getParameter("address");
                    phone = req.getParameter("phone");
                    email = req.getParameter("email");
                    password = req.getParameter("password");
                    System.out.println(id + address + phone + email + password);

                    Part filePart = req.getPart("profilePic");

                    if (filePart != null && filePart.getSize() > 0) {
                    InputStream fileContent = filePart.getInputStream();
                    byte[] imageBytes = fileContent.readAllBytes();
                    volunteer2.setImageUser(imageBytes);
                    System.out.println("Imagen cargada correctamente. Tamaño: " + imageBytes.length + " bytes.");
                    }
                    // Crear y configurar el objeto "Voluntario"

                    volunteer2.setId(Long.valueOf(id));
                    volunteer2.setAddress(address);
                    volunteer2.setPhone(phone);
                    // Crear y configurar el objeto "User"
                    User user = new User();
                    user.setEmail(email);
                    user.setPassword(password);
                    volunteer2.setUser(user);
                try {
                    if (new DaoVolunteer().update(volunteer2)) {
                        redirect = "/volunteer/porfile";
                    } else {
                        redirect = "/volunteer/porfile";
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    redirect = "/volunteer/porfile";
                }
                response.sendRedirect(redirect);
                return;
                case "/volunteer/create-volunteer":
                    // Obtener los valores de los parámetros del formulario
                    email = req.getParameter("email");
                    password = req.getParameter("password");
                    name = req.getParameter("name");
                    surname = req.getParameter("surname");
                    lastanme = req.getParameter("lastanme");
                    birthday = req.getParameter("birthday");
                    address = req.getParameter("address");
                    phone = req.getParameter("phone");
                    curp = req.getParameter("curp");

                    // Crear y configurar el objeto "User"
                    User userC = new User();
                    userC.setEmail(email);
                    userC.setPassword(password);
                    userC.setStatus(false);
                    // Crear y configurar el objeto "Voluntario"S
                    Volunteer volunteerC = new Volunteer();
                    volunteerC.setId(0L);
                    volunteerC.setName(name);
                    volunteerC.setSurname(surname);
                    volunteerC.setLastanme(lastanme);
                    volunteerC.setBirthday(birthday);
                    volunteerC.setAddress(address);
                    volunteerC.setPhone(phone);
                    volunteerC.setCurp(curp);
                    volunteerC.setUser(userC);
                    // Configurar el rol (asumiendo que 3 es el ID del rol para voluntarios)
                    volunteerC.setRole(new Role(3, ""));
                    try {
                        // Guardar el objeto "Volunteer" en la base de datos
                        if (new DaoVolunteer().save(volunteerC)) {
                            redirect = "/admin/main?result=true&message=" + URLEncoder.encode("Voluntario guardado correctamente", StandardCharsets.UTF_8);
                        } else {
                            throw new Exception("Error");
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                        redirect = "/admin/main?result=false&message=" + URLEncoder.encode("No se pudo guardar el voluntario", StandardCharsets.UTF_8);
                    }
                    break;
            case "/volunteer/update-volunteer":
                // Obtener los valores de los parámetros del formulario
                id = req.getParameter("id");
                address = req.getParameter("address");
                phone = req.getParameter("phone");
                email = req.getParameter("email");
                password = req.getParameter("password");
                System.out.println(id + address + phone + email + password);
                // Crear y configurar el objeto "Voluntario"
                Volunteer volunteerU = new Volunteer();
                volunteerU.setId(Long.valueOf(id));
                volunteerU.setAddress(address);
                volunteerU.setPhone(phone);
                // Crear y configurar el objeto "User"
                User userU = new User();
                userU.setEmail(email);
                userU.setPassword(password);
                volunteerU.setUser(userU);
                try {
                    if (new DaoVolunteer().update(volunteerU))
                        redirect = "/admin/main?result=false&message=" + URLEncoder.encode("¡Error! Acción no realizada correctamente.", StandardCharsets.UTF_8);
                    else{

                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    redirect = "/admin/main?result=false&message=" + URLEncoder.encode("No se pudo guardar la organización", StandardCharsets.UTF_8);
                }
                break;

            case "/volunteer/delete":
                try {
                    id = req.getParameter("id");
                    System.out.println(id);
                    if (!new DaoVolunteer().delete(null, id)) {
                        redirect = "/admin/main-volunt?result=" + true + "&message=" + URLEncoder.encode("Voluntario eliminado correctamente", StandardCharsets.UTF_8);
                    } else {
                        throw new Exception("Error");
                    }
                } catch (Exception e) {
                    redirect = "/admin/main-volunt?result=" + false + "&message=" + URLEncoder.encode("No se pudo eliminar el Voluntario", StandardCharsets.UTF_8);
                    e.printStackTrace();
                }
                break;


            default:
                redirect = "/volunteer/main";

        }

        response.sendRedirect(req.getContextPath() + redirect);
    }


}
