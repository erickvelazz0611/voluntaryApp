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

    public Forms findOne(long id) {
        Forms form = null;
        try {
            conn = new MYSQLConnection().connect();
            String query = "SELECT * FROM forms WHERE id = ?;";
            pstm = conn.prepareStatement(query);
            pstm.setLong(1, id);
            rs = pstm.executeQuery();
            while (rs.next()) {
                form = new Forms();
                form.setId_forms(rs.getLong("id"));
                form.setName_form(rs.getString("name_forms"));
                form.setInstructions(rs.getString("instructions"));
                // Otros campos que puedas necesitar
            }
        } catch (SQLException e) {
            Logger.getLogger(DaoForms.class.getName()).log(Level.SEVERE, "Error al buscar el formulario " + e.getMessage());
        } finally {
            close();
        }
        return form;
    }



    public List<Forms> findAll(long id) {
        List<Forms> list = new ArrayList<>();
        Forms form;
        try {
            conn = new MYSQLConnection().connect();
            String query = "SELECT * FROM forms WHERE organ_id = ?";
            pstm = conn.prepareStatement(query);
            pstm.setLong(1, id);
            rs = pstm.executeQuery();
            while (rs.next()) {
                form = new Forms();
                form.setId_forms(rs.getLong("id"));
                form.setName_form(rs.getString("name_forms"));
                form.setInstructions(rs.getString("instructions"));
//                form.setEvent_id(rs.getString("event_id"));
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
            conn = new MYSQLConnection().connect();
            String query = "CALL SaveForm(?, ?, ?, ?);"; // Modificado para incluir id_organ
            cs = conn.prepareCall(query);
            cs.setString(1, forms.getName_form());
            cs.setString(2, forms.getInstructions());
            cs.setBoolean(3, forms.getEnable());
            if (forms.getId_organ() != -1) {
                cs.setInt(4, forms.getId_organ());
            } else {
                cs.setNull(4, Types.INTEGER);
            }
//            System.out.println("Formulario: "+forms.getName_form()+"\nInstrucciones: "+forms.getInstructions()+"\nActivo: "+forms.getEnable()+"\nId Organ: "+forms.getId_organ());
            cs.executeQuery();
            return true;
        } catch (SQLException e) {
//            System.out.println(e.getMessage());
            Logger.getLogger(DaoForms.class.getName()).log(Level.SEVERE, "Error al guardar el formulario " + e.getMessage());
//            System.out.println(e.getMessage());
        } finally {
            close();
        }
        return false;
    }

    public boolean update(Forms form) {
        try {
            conn = new MYSQLConnection().connect();
            String query = "CALL UpdateForm(?, ?, ?);";
            cs = conn.prepareCall(query);
            cs.setLong(1, form.getId_forms());
            cs.setString(2, form.getName_form());
            cs.setString(3, form.getInstructions());
//            cs.setBoolean(4, form.getEnable());
//
//            if (form.getId_organ() != -1) {
//                cs.setInt(5, form.getId_organ());
//            } else {
//                cs.setNull(5, Types.INTEGER);
//            }

            cs.executeQuery();
            return true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            Logger.getLogger(DaoForms.class.getName()).log(Level.SEVERE, "Error al actualizar el formulario " + e.getMessage());
        } finally {
            close();
        }
        return false;
    }

    public boolean delete(String id) {
        try {
            conn = new MYSQLConnection().connect();
            String query = "CALL DeleteForm(?);";
            cs = conn.prepareCall(query);
            cs.setString(1, id);
            int affectedRows = cs.executeUpdate(); // La cantidad de filas afectadas
            return affectedRows > 0;
        } catch (SQLException e) {
            Logger.getLogger(DaoForms.class.getName())
                    .log(Level.SEVERE, "Error No se puede eliminar el formulario " + e.getMessage());
        } finally {
            close();
        }
        return false;
    }




    public List<Forms> Forms_Id(int orgId) {
        List<Forms> forms = new ArrayList<>();
        System.out.println("/* =================================== */" +"\n/*          Id Organizacion            */"+"\n/*                 "+orgId+"                  */"+"\n/* =================================== */" );
        try  {
            conn = new MYSQLConnection().connect(); //Establecer la conexion
            String query = "CALL VerOrganizationForms(?)"; //Preparamos la sentencia
            cs = conn.prepareCall(query);
            cs.setLong(1,orgId);
            rs = cs.executeQuery();
            while (rs.next()) {
                Organ organ =new Organ();

                Forms form = new Forms();
                form.setOrgan(organ);
                form.setId_forms(rs.getLong("id"));
                form.setName_form(rs.getString("name_forms"));
                form.setInstructions(rs.getString("instructions"));
                form.setEnable(Boolean.valueOf(rs.getString("enable")));
                form.setId_organ(Integer.parseInt(rs.getString("id_organ")));
                System.out.println( "Id_Form: "+form.getId_forms()+"    Formulario: "+form.getName_form()+"                  Instrucciones: "+form.getInstructions()+"               Enable: "+form.getEnable());



                forms.add(form);
            }
        } catch (SQLException e) {
            Logger.getLogger(DaoForms.class.getName())
                    .log(Level.SEVERE, "Error  del Listado"
                            + e.getMessage());
        } finally {
            close();
        }
        return forms;
    }



    //Listado de el formulario complete(@)
    public  Forms findForm(int form_id) {
        Forms form = null;
        try {
            conn = new MYSQLConnection().connect(); //Establecer la conexion
            String query = "SELECT * from forms where id=?;"; //Preparamos la sentencia
            pstm = conn.prepareStatement(query);
            pstm.setLong(1, form_id);
            rs = pstm.executeQuery();
            while (rs.next()) {
                form = new Forms();
                form.setName_form(rs.getString("name_forms"));
                form.setInstructions(rs.getString("instructions"));
//                form.setEvent_id(rs.getString("event_id"));
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
