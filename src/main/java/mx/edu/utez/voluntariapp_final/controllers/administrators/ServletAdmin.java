package mx.edu.utez.voluntariapp_final.controllers.administrators;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import mx.edu.utez.voluntariapp_final.models.Role.Role;
import mx.edu.utez.voluntariapp_final.models.administrators.Admin;
import mx.edu.utez.voluntariapp_final.models.administrators.DaoAdmin;
import mx.edu.utez.voluntariapp_final.models.organization.DaoEvent;
import mx.edu.utez.voluntariapp_final.models.organization.DaoOrgan;
import mx.edu.utez.voluntariapp_final.models.organization.Event;
import mx.edu.utez.voluntariapp_final.models.organization.Organ;
import mx.edu.utez.voluntariapp_final.models.user.DaoUser;
import mx.edu.utez.voluntariapp_final.models.user.User;
import mx.edu.utez.voluntariapp_final.models.volunteer.DaoVolunteer;
import mx.edu.utez.voluntariapp_final.models.volunteer.Volunteer;

import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.sql.SQLException;
import java.util.Base64;
import java.util.List;

@WebServlet(name = "admins", urlPatterns = {
        "/admin/main",
        "/admin/porfile",
        "/admin/admin-view",
        "/admin/save",
        "/admin/admin-view-update",
        "/admin/update",
        "/admin/delete",
        // crear usuarios
        "/admin/crearAdmin",
        "/admin/create-admin",
        "/admin/updateAdmin",
        "/admin/update-admin",

        // delete usuarios
        "/admin/volunteer/delete",
        "/admin/organ/delete",
        "/admin/deleteprofile",

        "/admin/administrators",
        "/admin/main-organ",
        "/admin/main-volunt",
        "/admin/organizations",
        "/admin/volunteers",
        "/admin/surveys",
        "/admin/stadist",
        "/admin/aprobe",
        "/admin/active-status",
        "/admin/inactive-status",
        "/admin/active-status-organ",
        "/admin/inactive-status-organ",
        "/admin/active-status-volunt",
        "/admin/inactive-status-volunt",

})
@MultipartConfig

public class ServletAdmin extends HttpServlet {
    public String action;
    private String redirect = "/admin/main";

    private Admin admin;


    private String email, password, id_admin, name, id_user;
    private byte[] imageUser;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        action = req.getServletPath();

        switch (action) {
            case "/admin/main":

                // Listado de Usuarios
                List<Admin> admin2 = new DaoAdmin().findAll();
                req.setAttribute("admin2", admin2);
                List<Organ> organ2 = new DaoOrgan().findAll();
                req.setAttribute("organ2", organ2);
                List<Volunteer> volunteer2 = new DaoVolunteer().findAll();
                req.setAttribute("volunteer2", volunteer2);



                // Total de Usuarios
                int totalAdmin = new DaoAdmin().findAll().size();
                req.setAttribute("totalAdmin", totalAdmin);

                int totalOrgan = new DaoOrgan().findAll().size();
                req.setAttribute("totalOrgan", totalOrgan);

                int totalVolunt = new DaoVolunteer().findAll().size();
                req.setAttribute("totalVolunt", totalVolunt);

                String id_user = req.getParameter("id_user");

                // Foto
                /*
                HttpSession sessionM = req.getSession();
                User userM = (User) sessionM.getAttribute("user");
                admin = new DaoAdmin().findOneByUser(userM.getId_user());
                System.out.println(admin);
                if (admin != null) {
                    System.out.println("Entró al admin");
                    req.setAttribute("admin", admin);
                    byte[] imageBytes = admin.getImageUser();
                    System.out.println("Bytes de imagen: " + (imageBytes == null ? "null" : imageBytes.length));
                    if (imageBytes != null && imageBytes.length > 0) {
                        String base64Image = Base64.getEncoder().encodeToString(imageBytes);
                        //System.out.println("Imagen en Base64: " + base64Image);
                        req.setAttribute("base64Image", base64Image);
                    }
                }

                 */
                redirect = "/pages/administrators/index_admin.jsp";
                break;
            case "/admin/admin-view":
                redirect = "/pages/accounts/admin.jsp";
                break;
           /*case "/admin/admin-view-update":
                id = req.getParameter("id");
                admin = new DaoAdmin().findOne(id != null ? Long.parseLong(id) : 0);
                if (admin != null) {
                    req.setAttribute("admin", admin);
                    redirect = "/pages/accounts/administrators/update_admin.jsp";
                } else {
                    redirect = "/admin/main?result" + false + "&message" + URLEncoder.encode("", StandardCharsets.UTF_8);
                }
                break;*/
            case "/admin/administrators":
                List<Admin> admins = new DaoAdmin().findAll();
                req.setAttribute("admins", admins);
                System.out.println("Datos de la Vista" + admins);

                // Foto
                HttpSession sessionA = req.getSession();
                User userA = (User) sessionA.getAttribute("user");
                admin = new DaoAdmin().findOneByUser(userA.getId_user());
                System.out.println(admin);
                if (admin != null) {
                    System.out.println("Entró al admin");
                    req.setAttribute("admin", admin);
                    byte[] imageBytes = admin.getImageUser();
                    System.out.println("Bytes de imagen: " + (imageBytes == null ? "null" : imageBytes.length));
                    if (imageBytes != null && imageBytes.length > 0) {
                        String base64Image = Base64.getEncoder().encodeToString(imageBytes);
                        //System.out.println("Imagen en Base64: " + base64Image);
                        req.setAttribute("base64Image", base64Image);
                    }
                }
                redirect = "/pages/administrators/administrators_admin.jsp";
                break;

            case "/admin/main-organ":
                List<Organ> organs = new DaoOrgan().findAll();
                req.setAttribute("organs", organs);

                // Foto
                HttpSession sessionO = req.getSession();
                User userO = (User) sessionO.getAttribute("user");
                admin = new DaoAdmin().findOneByUser(userO.getId_user());
                System.out.println(admin);
                if (admin != null) {
                    System.out.println("Entró al admin");
                    req.setAttribute("admin", admin);
                    byte[] imageBytes = admin.getImageUser();
                    System.out.println("Bytes de imagen: " + (imageBytes == null ? "null" : imageBytes.length));
                    if (imageBytes != null && imageBytes.length > 0) {
                        String base64Image = Base64.getEncoder().encodeToString(imageBytes);
                        //System.out.println("Imagen en Base64: " + base64Image);
                        req.setAttribute("base64Image", base64Image);
                    }
                }
                /*
                List<Event> events = new DaoEvent().relacionEvnt();
                req.setAttribute("events", events);
                System.out.println("Datos de la Vista" + events);

                 */
                redirect = "/pages/administrators/administrators_organization.jsp";
                break;

            case "/admin/main-volunt":
                List<Volunteer> volunteers = new DaoVolunteer().findAll();
                req.setAttribute("volunteers", volunteers);
                System.out.println("Datos de la Vista" + volunteers);
                HttpSession sessionV = req.getSession();
                User userV = (User) sessionV.getAttribute("user");
                admin = new DaoAdmin().findOneByUser(userV.getId_user());
                System.out.println(admin);
                if (admin != null) {
                    System.out.println("Entró al admin");
                    req.setAttribute("admin", admin);
                    byte[] imageBytes = admin.getImageUser();
                    System.out.println("Bytes de imagen: " + (imageBytes == null ? "null" : imageBytes.length));
                    if (imageBytes != null && imageBytes.length > 0) {
                        String base64Image = Base64.getEncoder().encodeToString(imageBytes);
                        //System.out.println("Imagen en Base64: " + base64Image);
                        req.setAttribute("base64Image", base64Image);
                    }
                }

                redirect = "/pages/administrators/administrators_volun.jsp";
                break;

            case "/admin/surveys":
                redirect = "/pages/administrators/administrators_surveys.jsp";
                break;

            case "/admin/stadist":
                redirect = "/pages/administrators/administrators_stadist.jsp";
                break;

            case "/admin/aprobe":
                //Lista de aprobacion de los voluntarios
                List<Volunteer> volunteer = new DaoVolunteer().findAllinactive();
                req.setAttribute("volunteer", volunteer);
                System.out.println("Datos de la Vista Volunteer " + volunteer);

                //Lista de aprobacion de las organizaciones
                List<Organ> organ = new DaoOrgan().findAllInactive();
                req.setAttribute("organ", organ);
                System.out.println("Datos de la Vista Organ " + organ);

                //Listado de aprobaion de los administradores
                List<Admin> admin3 = new DaoAdmin().findAllInactive();
                req.setAttribute("admin3", admin3);

                // Foto

                HttpSession sessionA3 = req.getSession();
                User userA3 = (User) sessionA3.getAttribute("user");
                admin = new DaoAdmin().findOneByUser(userA3.getId_user());

                if (admin != null) {
                    System.out.println("Entró al admin");
                    req.setAttribute("admin", admin);
                    byte[] imageBytes = admin.getImageUser();
                    System.out.println("Bytes de imagen: " + (imageBytes == null ? "null" : imageBytes.length));
                    if (imageBytes != null && imageBytes.length > 0) {
                        String base64Image = Base64.getEncoder().encodeToString(imageBytes);
                        //System.out.println("Imagen en Base64: " + base64Image);
                        req.setAttribute("base64Image", base64Image);
                    }
                }

                redirect = "/pages/administrators/administrators_aprob.jsp";
                break;

            case "/admin/porfile":

                System.out.println("Entrando al caso /admin/porfile");
                HttpSession session = req.getSession();
                User user = (User) session.getAttribute("user");
                admin = new DaoAdmin().findOneByUser(user.getId_user());
                System.out.println(admin);
                if (admin != null) {
                    System.out.println("Entró al admin");
                    req.setAttribute("admin", admin);
                    byte[] imageBytes = admin.getImageUser();
                    System.out.println("Bytes de imagen: " + (imageBytes == null ? "null" : imageBytes.length));
                    if (imageBytes != null && imageBytes.length > 0) {
                        String base64Image = Base64.getEncoder().encodeToString(imageBytes);
                        //System.out.println("Imagen en Base64: " + base64Image);
                        req.setAttribute("base64Image", base64Image);
                    }
                    redirect = "/pages/administrators/administrator_porfile.jsp";
                } else {
                    System.out.println("No se encontró el administrador");
                    redirect = "/admin/main";
                }
                break;
            case "/admin/crearAdmin":
                redirect = "/pages/administrators/crearAdmin.jsp";
                break;

            case "/admin/updateAdmin":
               /* HttpSession session11 = req.getSession();
                User user11 = (User) session11.getAttribute("user");
                admin = new DaoAdmin().findOneByUser(user11.getId_user());
                System.out.println(admin);
                if (admin != null) {
                    System.out.println("Entró al admin");
                    req.setAttribute("admin", admin);
                    }

                */

                redirect = "/pages/administrators/updateAdmin.jsp";
                break;




            default:
                System.out.println(action);
        }
        req.getRequestDispatcher(redirect).forward(req, resp);
    }



    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        action = req.getServletPath();

        switch (action) {
            case "/admin/save":
                email = req.getParameter("email");
                password = req.getParameter("password");
                name = req.getParameter("name");
                User user = new User();
                user.setEmail(email);
                user.setPassword(password);
                user.setStatus(false);

                Admin admin = new Admin();
                admin.setId_admin(0L);
                admin.setName(name);
                admin.setUser(user);

                admin.setRole(new Role(1, ""));
                if (new DaoAdmin().save(admin)) {
                    redirect = "/index.jsp?result=true&message=" + URLEncoder.encode("Administrador guardado correctamente", StandardCharsets.UTF_8);
                } else {
                    redirect = "/index.jsp?result=false&message=" + URLEncoder.encode("No se pudo guardar el administrador", StandardCharsets.UTF_8);
                }
                resp.sendRedirect(req.getContextPath() + redirect);
                return;

            case "/admin/update":
                Admin admin1 = new Admin();
                id_admin = req.getParameter("id_admin");
                name = req.getParameter("name");
                email = req.getParameter("email");
                password = req.getParameter("password");

                Part filePart = req.getPart("profilePic");
                if (filePart != null && filePart.getSize() > 0) {
                    InputStream fileContent = filePart.getInputStream();
                    byte[] imageBytes = fileContent.readAllBytes();
                    admin1.setImageUser(imageBytes);
                }

                admin1.setId_admin(Long.valueOf(id_admin));
                admin1.setName(name);

                User user1 = new User();
                user1.setEmail(email);
                user1.setPassword(password);
                admin1.setUser(user1);

                try {
                    if (new DaoAdmin().update(admin1)) {
                        redirect = "/admin/porfile";
                    } else {
                        redirect = "/admin/porfile";
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    redirect = "/admin/porfile";
                }
                resp.sendRedirect(redirect);
                return;

            case "/admin/active-status":
                id_user = req.getParameter("id");
                System.out.println(id_user);
                if (new DaoAdmin().active(Long.valueOf(id_user))) {
                    redirect = "/admin/main?result= " + true + "&message=" + URLEncoder.encode("Administrador activado correctamente", StandardCharsets.UTF_8);
                } else {
                    redirect = "/admin/main?result= " + false + "&message=" + URLEncoder.encode("error", StandardCharsets.UTF_8);
                }
                break;

            case "/admin/inactive-status":
                id_user = req.getParameter("id");
                System.out.println(id_user);
                if (new DaoAdmin().inactive(Long.valueOf(id_user))) {
                    redirect = "/admin/main?result= " + true + "&message=" + URLEncoder.encode("Administrador desactivado correctamente", StandardCharsets.UTF_8);
                } else {
                    redirect = "/admin/main?result= " + false + "&message=" + URLEncoder.encode("error", StandardCharsets.UTF_8);
                }
                break;

            case "/admin/active-status-organ":
                id_user = req.getParameter("id");
                System.out.println(id_user);
                if (new DaoAdmin().activeOrg(Long.valueOf(id_user))) {
                    redirect = "/admin/main?result= " + true + "&message=" + URLEncoder.encode("Organizacion activada correctamente", StandardCharsets.UTF_8);
                } else {
                    redirect = "/admin/main?result= " + false + "&message=" + URLEncoder.encode("error", StandardCharsets.UTF_8);
                }
                break;

            case "/admin/inactive-status-organ":
                id_user = req.getParameter("id");
                System.out.println(id_user);
                if (new DaoAdmin().inactiveOrg(Long.valueOf(id_user))) {
                    redirect = "/admin/main?result= " + true + "&message=" + URLEncoder.encode("Organizacion desactivada correctamente", StandardCharsets.UTF_8);
                } else {
                    redirect = "/admin/main?result= " + false + "&message=" + URLEncoder.encode("error", StandardCharsets.UTF_8);
                }
                break;

            case "/admin/active-status-volunt":
                id_user = req.getParameter("id");
                System.out.println(id_user);
                if (new DaoAdmin().activeVol(Long.valueOf(id_user))) {
                    redirect = "/admin/main?result= " + true + "&message=" + URLEncoder.encode("Voluntario activado correctamente", StandardCharsets.UTF_8);
                } else {
                    redirect = "/admin/main?result= " + false + "&message=" + URLEncoder.encode("error", StandardCharsets.UTF_8);
                }
                break;

            case "/admin/inactive-status-volunt":
                id_user = req.getParameter("id");
                System.out.println(id_user);
                if (new DaoAdmin().inactiveVol(Long.valueOf(id_user))) {
                    redirect = "/admin/main?result= " + true + "&message=" + URLEncoder.encode("Voluntario desactivado correctamente", StandardCharsets.UTF_8);
                } else {
                    redirect = "/admin/main?result= " + false + "&message=" + URLEncoder.encode("error", StandardCharsets.UTF_8);
                }
                break;
                /*
                case "/admin/active-status-event":
                id_user = req.getParameter("id");
                System.out.println(id_user);
                if (new DaoAdmin().activeEvent(Long.valueOf(id_user))) {
                    redirect = "/admin/main?result= " + true + "&message=" + URLEncoder.encode("Evento activado correctamente", StandardCharsets.UTF_8);
                } else {
                    redirect = "/admin/main?result= " + false + "&message=" + URLEncoder.encode("error", StandardCharsets.UTF_8);
                }
                break;

                case "/admin/inactive-status-event":
                id_user = req.getParameter("id");
                System.out.println(id_user);
                if (new DaoAdmin().inactiveEvent(Long.valueOf(id_user))) {
                    redirect = "/admin/main?result= " + true + "&message=" + URLEncoder.encode("Evento desactivado correctamente", StandardCharsets.UTF_8);
                } else {
                    redirect = "/admin/main?result= " + false + "&message=" + URLEncoder.encode("error", StandardCharsets.UTF_8);
                }
                break;

                 */
            case "/admin/create-admin":
                id_user = req.getParameter("id_user");
                email = req.getParameter("email");
                password = req.getParameter("password");
                name = req.getParameter("name");
                User userC = new User();
                userC.setEmail(email);
                userC.setPassword(password);
                userC.setStatus(false);

                Admin adminC = new Admin();
                adminC.setId_admin(Long.valueOf(id_admin));
                adminC.setName(name);
                adminC.setUser(userC);

                adminC.setRole(new Role(1, ""));
                if (new DaoAdmin().save(adminC)) {
                    redirect = "/admin/main?result=true&message=" + URLEncoder.encode("Administrador guardado correctamente", StandardCharsets.UTF_8);
                } else {
                    redirect = "/admin/main?result=false&message=" + URLEncoder.encode("No se pudo guardar el administrador", StandardCharsets.UTF_8);
                }
                break;

            case "/admin/update-admin":
                id_user = req.getParameter("id_user");
                email = req.getParameter("email");
                password = req.getParameter("password");
                name = req.getParameter("name");
                System.out.println(id_user+ " "+email+" "+password+" "+name);

                User userU = new User();
                userU.setId_user(Long.valueOf(id_user));
                userU.setEmail(email);
                userU.setPassword(password);
                userU.setStatus(false);

                Admin adminU = new Admin();
                adminU.setName(name);
                adminU.setUser(userU);

                if (new DaoAdmin().update_admin(adminU)) {
                    redirect = "/admin/main?result=true&message=" + URLEncoder.encode("Administrador actualizado correctamente", StandardCharsets.UTF_8);
                } else {
                    redirect = "/admin/main?result=false&message=" + URLEncoder.encode("No se pudo actualizar el administrador", StandardCharsets.UTF_8);
                }
                break;

            case "/admin/delete":
                try {
                    id_admin = req.getParameter("id");
                    System.out.println(id_admin);
                    if (!new DaoAdmin().delete(null, id_admin)) {
                        redirect = "/admin/administrators?result=" + true + "&message=" + URLEncoder.encode("Administrador eliminado correctamente", StandardCharsets.UTF_8);
                    } else {
                        throw new Exception("Error");
                    }
                } catch (Exception e) {
                    redirect = "/admin/administrators?result=" + false + "&message=" + URLEncoder.encode("No se pudo eliminar el administrador", StandardCharsets.UTF_8);
                    e.printStackTrace();
                }
                break;
            case "/admin/organ/delete":
                try {
                    String id = req.getParameter("id");
                    System.out.println(id);
                    if (!new DaoOrgan().delete(null, id)) {
                        redirect = "/admin/main-organ?result=" + true + "&message=" + URLEncoder.encode("Organizacion eliminada correctamente", StandardCharsets.UTF_8);
                    } else {
                        throw new Exception("Error");
                    }
                } catch (Exception e) {
                    redirect = "/admin/main-organ?result=" + false + "&message=" + URLEncoder.encode("No se pudo eliminar la organizacion", StandardCharsets.UTF_8);
                    e.printStackTrace();
                }
                break;
            case "/admin/volunteer/delete":
                try {
                    String id = req.getParameter("id");
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
                case "/admin/deleteprofile":
                try {
                    id_admin = req.getParameter("id");
                    System.out.println(id_admin);
                    if (!new DaoAdmin().delete(null, id_admin)) {
                        redirect = "/user/login?result=" + true + "&message=" + URLEncoder.encode("Voluntario eliminado correctamente", StandardCharsets.UTF_8);
                    } else {
                        throw new Exception("Error");
                    }
                } catch (Exception e) {
                    redirect = "/admin/porfile?result=" + false + "&message=" + URLEncoder.encode("No se pudo eliminar el Voluntario", StandardCharsets.UTF_8);
                    e.printStackTrace();
                }
                break;
            default:
                redirect = "/admin/main";
        }
        resp.sendRedirect(req.getContextPath() + redirect);

    }
}
