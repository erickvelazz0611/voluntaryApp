package mx.edu.utez.voluntariapp_final.models.organization;

import mx.edu.utez.voluntariapp_final.utils.MYSQLConnection;

import java.sql.*;
import java.text.Normalizer;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DaoForms {
    private Connection conn;
    private PreparedStatement pstm;
    private CallableStatement cs;
    private ResultSet rs;



    public List<Forms> findAll(long id) {
        List<Forms> list = new ArrayList<>();
        Forms form;
        try {
            conn = new MYSQLConnection().connect();
            String query = "SELECT * FROM forms WHERE event_id = ?";
            pstm = conn.prepareStatement(query);
            pstm.setLong(1, id);
            rs = pstm.executeQuery();
            while (rs.next()) {
                form = new Forms();
                form.setId_forms(rs.getLong("id"));
                form.setName_form(rs.getString("name_forms"));
                form.setInstructions(rs.getString("instructions"));
                form.setEvent_id(rs.getString("event_id"));
                list.add(form);
            }
        } catch (SQLException e) {
            Logger.getLogger(DaoForms.class.getName()).log(Level.SEVERE, "Error findAll " + e.getMessage());
        } finally {
            close();
        }
        return list;
    }

    public boolean save(Forms forms) {
        try {
            System.out.println("Bienvenido al DAO de forms");
            conn = new MYSQLConnection().connect();
            String query = "CALL  InsertForm(?,?,?,?);";
            cs = conn.prepareCall(query);
            cs.setString(1, forms.getName_form());
            cs.setString(2, forms.getInstructions());
            cs.setString(3, forms.getEvent_id());
            cs.setString(4, forms.getEvent().getOrganization_id());
            cs.executeQuery();
            return true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            Logger.getLogger(DaoForms.class.getName()).log(Level.SEVERE, "Error de giardar el formulario " + e.getMessage());
        } finally {
            close();
        }
        return false;
    }



    //Listado de el formulario complete(@)
    public  Forms findForm(int form_id) {
        Forms form = null;
        try {
            conn = new MYSQLConnection().connect(); //Establecer la conexion
            String query = "SELECT *from forms where id=?;"; //Preparamos la sentencia
            pstm = conn.prepareStatement(query);
            pstm.setLong(1, form_id);
            rs = pstm.executeQuery();
            while (rs.next()) {
                form = new Forms();
                form.setName_form(rs.getString("name_form"));
                form.setInstructions(rs.getString("instructions"));
                form.setEvent_id(rs.getString("event_id"));
            }
            if (form == null) return null;
            query = "select*from questions where form_id=?;";
            pstm = conn.prepareStatement(query);
            pstm.setLong(1,form_id);
            rs = pstm.executeQuery();
            List<Question> list = new ArrayList<>();
            PreparedStatement ps = conn.prepareStatement("select *from answers where question_id=?;");
            while (rs.next()) {
                Question question = new Question();
                question.setQuestion(rs.getString("question"));
                question.setForm_id(rs.getString("form_id"));
                ResultSet rs2 = ps.executeQuery();
                List<Answer> answers = new ArrayList<>();
                while (rs2.next()) {
                    Answer answer = new Answer();
                    answer.setAnswer(rs.getString("answer"));
                    answer.setId_question(rs.getString("question_id"));
                    answer.setForm_id(rs.getString("form_id"));
                    answers.add(answer);
                }
                question.setAnswerList(answers);
                list.add(question);
                rs2.close();
            }
            ps.close();
            form.setQuestions(list);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close();
        }
        return form;
    }

    public void close() {
        try {
            if (conn != null) conn.close();
            if (pstm != null) pstm.close();
            if (cs != null) cs.close();
            if (rs != null) rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
