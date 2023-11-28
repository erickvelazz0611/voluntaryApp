package mx.edu.utez.voluntariapp_final.models.organization;

import mx.edu.utez.voluntariapp_final.utils.MYSQLConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DaoQuestion {
    private Connection conn;
    private PreparedStatement pstm;
    private CallableStatement cs;
    private ResultSet rs;

   public List<Question> findAll(long id) {
        List<Question> list = new ArrayList<>();
        Question question;
        try {
            conn = new MYSQLConnection().connect();
            String query = "SELECT * FROM questions WHERE form_id = ?";
            pstm = conn.prepareStatement(query);
            pstm.setLong(1, id);
            rs = pstm.executeQuery();
            while (rs.next()) {
                question = new Question();
                question.setId_question(rs.getLong("id"));
                question.setQuestion(rs.getString("question"));
                question.setForm_id(rs.getString("form_id"));

                list.add(question);
            }
        } catch (SQLException e) {
            Logger.getLogger(DaoQuestion.class.getName()).log(Level.SEVERE, "Error findAll " + e.getMessage());
        } finally {
            close();
        }
        return list;
    }


    public boolean save(Question question) {
        try {
            conn = new MYSQLConnection().connect();
            String query = "CALL CreateQuestion(?, ?)";
            cs = conn.prepareCall(query);
            cs.setString(1, question.getQuestion());
            cs.setString(2, question.getForm_id());

            System.out.println("Pregunta:  "+question.getQuestion()+"Form_id: "+question.getForm_id());

            int rowsAffected = cs.executeUpdate();

            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            Logger.getLogger(DaoQuestion.class.getName()).log(Level.SEVERE, "Error al guardar las preguntas: " + e.getMessage());
        } finally {
            close();
        }

        return false;
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


