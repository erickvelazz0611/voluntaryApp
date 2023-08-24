package mx.edu.utez.voluntariapp_final;

import java.io.*;
import java.util.List;

import com.google.gson.Gson;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import mx.edu.utez.voluntariapp_final.models.organization.DaoForms;
import mx.edu.utez.voluntariapp_final.models.organization.Forms;
import mx.edu.utez.voluntariapp_final.models.volunteer.DaoPost;
import mx.edu.utez.voluntariapp_final.models.volunteer.Posts;

@WebServlet(name = "helloServlet", urlPatterns = {
        "/forms",
        "/postulations"
})
public class HelloServlet extends HttpServlet {
    private String id;
    private String action;
    PrintWriter out;

    public void init() {

    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        action = request.getServletPath();
        switch (action) {
            case "/forms":
                id = request.getParameter("id");
                List<Forms> list = new DaoForms().findAll(Long.valueOf(id));
                out = response.getWriter();
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                out.println(new Gson().toJson(list));
                break;

            case "/postulations":
                id = request.getParameter("id");
                List<Posts> postulantes = new DaoPost().findAll(Long.valueOf(id));
                out = response.getWriter();
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                out.println(new Gson().toJson(postulantes));
                break;
        }
    }
    public void destroy() {
    }
}