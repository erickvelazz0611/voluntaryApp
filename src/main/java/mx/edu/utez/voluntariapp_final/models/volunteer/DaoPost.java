package mx.edu.utez.voluntariapp_final.models.volunteer;

import mx.edu.utez.voluntariapp_final.utils.MYSQLConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DaoPost {



    private Connection conn;
    private PreparedStatement pstm;
    private CallableStatement cs;
    private ResultSet rs;


    public List<Posts> findAll(long id) {
        List<Posts> list = new ArrayList<>();
        Posts post;
        try {
            conn = new MYSQLConnection().connect();
            String query = "SELECT * FROM postulations as p inner join  volunteers as v ON v.user_id = p.user_id " +
                    "WHERE p.event_id = ?";
            pstm = conn.prepareStatement(query);
            pstm.setLong(1, id);
            rs = pstm.executeQuery();
            while (rs.next()) {
                post = new Posts();
                post.setId_post(rs.getLong("id"));
                post.setIs_accept(rs.getBoolean("Is_Accept"));
                post.setUser_id(rs.getString("user_id"));
                post.setEvent_id(rs.getString("event_id"));

                Volunteer volunteer2 = new Volunteer();
                volunteer2.setId(rs.getLong("id"));
                volunteer2.setName(rs.getString("name"));
                volunteer2.setSurname(rs.getString("surname"));
                volunteer2.setLastanme(rs.getString("lastanme"));
                volunteer2.setBirthday(rs.getString("birthday"));
                volunteer2.setAddress(rs.getString("address"));
                volunteer2.setPhone(rs.getString("phone"));
                volunteer2.setCurp(rs.getString("curp"));
                post.setVolunteer(volunteer2);



                list.add(post);

            }
        } catch (SQLException e) {
            Logger.getLogger(DaoPost.class.getName()).log(Level.SEVERE, "Error findAll " + e.getMessage());
        } finally {
            close();
        }
        return list;
    }

    public boolean save(Posts post) {
        boolean isSaved = false;

        try {
            conn = new MYSQLConnection().connect();
            String query = "INSERT INTO postulations (is_accept, volunteer_id, user_id, event_id) VALUES (?, ?, ?, ?)";
            pstm = conn.prepareStatement(query);

            pstm.setBoolean(1, post.getIs_accept());
            pstm.setString(2, post.getVolunteer_id());
            pstm.setString(3, post.getUser_id());
            pstm.setString(4, post.getEvent_id());

            isSaved = pstm.executeUpdate() > 0;  // Si se inserta al menos un registro, devuelve true.

        } catch (SQLException e) {
            Logger.getLogger(DaoPost.class.getName()).log(Level.SEVERE, "Error in save() " + e.getMessage());
        } finally {
            close();
        }

        return isSaved;
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
