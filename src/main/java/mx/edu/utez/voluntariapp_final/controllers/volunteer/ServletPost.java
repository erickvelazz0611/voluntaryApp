package mx.edu.utez.voluntariapp_final.controllers.volunteer;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.voluntariapp_final.models.volunteer.DaoPost;
import mx.edu.utez.voluntariapp_final.models.volunteer.Posts;
import mx.edu.utez.voluntariapp_final.models.volunteer.Volunteer;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

@WebServlet(name = "postulations ", urlPatterns = {

        "/posts/save",

})

public class ServletPost extends HttpServlet {

    private String action;
    private String redirect = "/posts/save" ;
    public Long id_post;
    public Boolean is_accept;
    public  String volunteer_id;
    public  String user_id;
    public String event_id;
    private Volunteer volunteer;
    private String email, password, id, name, surname, lastanme, birthday, address, phone, curp;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html");
        action = req.getServletPath();
        switch (action) {

            case "/posts/save":
                is_accept= Boolean.valueOf(req.getParameter("is_accept"));
                volunteer_id= req.getParameter("volunteer_id");
                user_id=req.getParameter("user_id");
                event_id=req.getParameter("event_id");

                Posts posts = new Posts();
                posts.setId_post(0L);
                posts.setIs_accept(is_accept);
                posts.setVolunteer_id(volunteer_id);
                posts.setUser_id(user_id);
                posts.setEvent_id(event_id);
                Volunteer volunteer2 = new Volunteer();
                volunteer2.setId(0L);
                volunteer2.setName(name);
                volunteer2.setSurname(surname);
                volunteer2.setLastanme(lastanme);
                volunteer2.setBirthday(birthday);
                volunteer2.setAddress(address);
                volunteer2.setPhone(phone);
                volunteer2.setCurp(curp);
                try {
                    // Guardar el objeto "Evento" en la base de datos
                    if (new DaoPost().save(posts)) {
                        // Redirigir con mensaje de éxito
                        redirect = "/volunteer/postulates?result=true&message=" + URLEncoder.encode("Postulacion rehistrado correctamente", StandardCharsets.UTF_8);
                    } else {
                        throw new Exception("Error");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    // Redirigir con mensaje de error
                    redirect = "/volunteer/postulates?result=false&message=" + URLEncoder.encode("Ocurrió un error", StandardCharsets.UTF_8);
                }
                break;




        }
        resp.sendRedirect(req.getContextPath() + redirect);
    }
}
