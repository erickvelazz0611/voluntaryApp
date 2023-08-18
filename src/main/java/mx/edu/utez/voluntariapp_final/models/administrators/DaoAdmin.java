package mx.edu.utez.voluntariapp_final.models.administrators;

import mx.edu.utez.voluntariapp_final.models.Role.Role;
import mx.edu.utez.voluntariapp_final.models.organization.Organ;
import mx.edu.utez.voluntariapp_final.models.user.User;
import mx.edu.utez.voluntariapp_final.models.volunteer.Volunteer;
import mx.edu.utez.voluntariapp_final.utils.MYSQLConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DaoAdmin {
    private Connection conn;
    private PreparedStatement pstm;
    private CallableStatement cs;
    private ResultSet rs;

    public List<Admin> findAll() {
        List<Admin> admins = new ArrayList();
        Admin admin = null;
        System.out.println("Llegas?"+admins);
        try {
            conn = new MYSQLConnection().connect();
            String query = "{call GetAdminUsers()}";
            cs = conn.prepareCall(query);
            boolean result = cs.execute();
            if (result)
            rs = cs.getResultSet();
            while (rs.next()) {
                admin = new Admin();
                admin.setId_admin(rs.getLong("id"));
                admin.setName(rs.getString("name"));
                admin.setUser_id(rs.getString("user_id"));
                User user =new User();
                user.setId_user(rs.getLong("id"));
                user.setEmail(rs.getString("email"));
                user.setStatus(rs.getBoolean("enable"));
                admin.setUser(user);
                Role role =new Role();
                role.setId(rs.getInt("role_id"));
                admin.setRole(role);
                admins.add(admin);
            }
        } catch (SQLException e) {
            Logger.getLogger(DaoAdmin.class.getName())
                    .log(Level.SEVERE, "Error del Listado " + e.getMessage());
        } finally {
            close();
        }
        return admins;
    }

    public boolean active(Long id) {
        try{
            conn = new MYSQLConnection().connect();
            String query = "UPDATE users SET enable = true WHERE id = ?;";
            pstm = conn.prepareStatement(query);
            pstm.setLong(1, Long.parseLong(String.valueOf(id)));
            return pstm.executeUpdate() > 0; // ==1
        }catch(SQLException e){
            Logger.getLogger(DaoAdmin.class.getName())
                    .log(Level.SEVERE, "Error findAll"
                            + e.getMessage());
        }finally{
            close();
        }
        return false;
    }
    public boolean inactive(Long id) {
        try{
            conn = new MYSQLConnection().connect();
            String query = "UPDATE users SET enable = false WHERE id = ?;";
            pstm = conn.prepareStatement(query);
            pstm.setLong(1, Long.parseLong(String.valueOf(id)));
            return pstm.executeUpdate() > 0; // ==1
        }catch(SQLException e){
            Logger.getLogger(DaoAdmin.class.getName())
                    .log(Level.SEVERE, "Error findAll"
                            + e.getMessage());
        }finally{
            close();
        }
        return false;
    }

    public boolean activeOrg(Long id) {
        try{
            conn = new MYSQLConnection().connect();
            String query = "UPDATE users SET enable = true WHERE id = ?;";
            pstm = conn.prepareStatement(query);
            pstm.setLong(1, Long.parseLong(String.valueOf(id)));
            return pstm.executeUpdate() > 0; // ==1
        }catch(SQLException e){
            Logger.getLogger(DaoAdmin.class.getName())
                    .log(Level.SEVERE, "Error findAll"
                            + e.getMessage());
        }finally{
            close();
        }
        return false;
    }

    public boolean inactiveOrg(Long id) {
        try{
            conn = new MYSQLConnection().connect();
            String query = "UPDATE users SET enable = false WHERE id = ?;";
            pstm = conn.prepareStatement(query);
            pstm.setLong(1, Long.parseLong(String.valueOf(id)));
            return pstm.executeUpdate() > 0; // ==1
        }catch(SQLException e){
            Logger.getLogger(DaoAdmin.class.getName())
                    .log(Level.SEVERE, "Error findAll"
                            + e.getMessage());
        }finally{
            close();
        }
        return false;
    }

    public boolean activeVol(Long id) {
        try{
            conn = new MYSQLConnection().connect();
            String query = "UPDATE users SET enable = true WHERE id = ?;";
            pstm = conn.prepareStatement(query);
            pstm.setLong(1, Long.parseLong(String.valueOf(id)));
            return pstm.executeUpdate() > 0; // ==1
        }catch(SQLException e){
            Logger.getLogger(DaoAdmin.class.getName())
                    .log(Level.SEVERE, "Error findAll"
                            + e.getMessage());
        }finally{
            close();
        }
        return false;
    }

    public boolean inactiveVol(Long id) {
        try{
            conn = new MYSQLConnection().connect();
            String query = "UPDATE users SET enable = false WHERE id = ?;";
            pstm = conn.prepareStatement(query);
            pstm.setLong(1, Long.parseLong(String.valueOf(id)));
            return pstm.executeUpdate() > 0; // ==1
        }catch(SQLException e){
            Logger.getLogger(DaoAdmin.class.getName())
                    .log(Level.SEVERE, "Error findAll"
                            + e.getMessage());
        }finally{
            close();
        }
        return false;
    }

    //Listado de los administradores que deberan ser aceptados
    public List<Admin> findAllInactive() {
        List<Admin> admin3 = new ArrayList();
        Admin admin1 = null;
        try {
            conn = new MYSQLConnection().connect();
            String query = "{call GetAdminsInactive()}";
            cs = conn.prepareCall(query);
            boolean result = cs.execute();
            if(result)
                rs = cs.getResultSet();
            while (rs.next()) {
                admin1 =new Admin();
                admin1.setId_admin(rs.getLong("id"));
                admin1.setName(rs.getString("name"));
                admin1.setUser_id(rs.getString("user_id"));
                User user =new User();
                user.setId_user(rs.getLong("id"));
                user.setEmail(rs.getString("email"));
                user.setStatus(rs.getBoolean("enable"));
                admin1.setUser(user);
                Role role =new Role();
                role.setId(rs.getInt("role_id"));
                admin1.setRole(role);
                admin3.add(admin1);
            }
        } catch (SQLException e) {
            Logger.getLogger(DaoAdmin.class.getName())
                    .log(Level.SEVERE, "Error del Listado " + e.getMessage());
        } finally {
            close();
        }
        return admin3;
    }
  //Lista de Administradores activados
  public List<Admin> findAllActive() {
      List<Admin> admin2 = new ArrayList();
      Admin admin1 = null;
      try {
          conn = new MYSQLConnection().connect();
          String query = "{call GetAdminsActive()}";
          cs = conn.prepareCall(query);
          boolean result = cs.execute();
          if(result)
              rs = cs.getResultSet();
          while (rs.next()) {
              admin1 =new Admin();
              admin1.setId_admin(rs.getLong("id"));
              admin1.setName(rs.getString("name"));
              admin1.setUser_id(rs.getString("user_id"));
              User user =new User();
              user.setId_user(rs.getLong("id"));
              user.setEmail(rs.getString("email"));
              user.setStatus(rs.getBoolean("enable"));
              admin1.setUser(user);
              Role role =new Role();
              role.setId(rs.getInt("role_id"));
              admin1.setRole(role);
              admin2.add(admin1);
          }
      } catch (SQLException e) {
          Logger.getLogger(DaoAdmin.class.getName())
                  .log(Level.SEVERE, "Error del Listado " + e.getMessage());
      } finally {
          close();
      }
      return admin2;
  }




    public Admin findOneByUser(Long id) {
        System.out.println(id);
        System.out.println("Bienvenido a tu inicio de sesión");
        try {
            conn = new MYSQLConnection().connect();
            String query = "SELECT a.* ,u.* ,r.* FROM administrators a INNER JOIN users u ON u.id = a.user_id INNER JOIN roles r on r.id= u.role_id where u.id =?;";
            pstm = conn.prepareStatement(query);
            pstm.setLong(1, id);
            rs = pstm.executeQuery();
            if (rs.next()) {
                Admin admin = new Admin();
                admin.setId_admin(rs.getLong("id"));
                admin.setName(rs.getString("name"));
                admin.setUser_id(rs.getString("user_id"));
                byte[] imageBytes = rs.getBytes("photo");
                admin.setImageUser(imageBytes);
                User user = new User();
                admin.setUser(user);
                Role role = new Role();
                admin.setRole(role);
                return admin;
            }
        } catch (Exception e) {
            Logger.getLogger(DaoAdmin.class.getName()).log(Level.SEVERE, "ERROR findOne" + e.getMessage());
        } finally {
            close();
        }
        return null;
    }




    public boolean save(Admin admin) {
        System.out.println("Bienvenido al DAO");
        try {
            conn = new MYSQLConnection().connect();
            String query = "CALL dividir_admin(?,?,?,?,?);";
            cs = conn.prepareCall(query);
            cs.setString(1, admin.getUser().getEmail());
            cs.setString(2, admin.getUser().getPassword());
            cs.setBoolean(3, admin.getUser().isStatus());
            cs.setLong(   4, admin.getRole().getId());
            cs.setString(5, admin.getName());
            cs.executeQuery();
            return true;
        } catch (Exception e) {
            Logger.getLogger(DaoAdmin.class.getName())
                    .log(Level.SEVERE, "Error findAll "
                            + e.getMessage());
        } finally {
            close();
        }
        return false;
    }

    public boolean update(Admin admin) {
        System.out.println("Bienvenido a la actualizacion");
        try {
            conn = new MYSQLConnection().connect();
            String query = "{CALL actualizar_administrador(?, ?, ?, ?, ?)}";
            cs= conn.prepareCall(query);
            cs.setLong(1, admin.getId_admin());
            cs.setString(2, admin.getName());
            cs.setString(3,admin.getUser().getEmail());
            cs.setString(4, admin.getUser().getPassword());
            cs.setBytes(5, admin.getImageUser());
            return cs.executeUpdate() > 0;

        } catch (SQLException e) {
            Logger.getLogger(DaoAdmin.class.getName())
                    .log(Level.SEVERE, "Error  de la actualizacion"
                            + e.getMessage());
        } finally {
            close();
        }
        return false;
    }
    public boolean delete(Long id,String adminId) {
        try {
            conn = new MYSQLConnection().connect();
            String query = "CALL DeleteAdminAndUser(?);";
            cs= conn.prepareCall(query);
            cs.setString(1, adminId);
            return pstm.executeUpdate() == 1;
        } catch (SQLException e) {
            Logger.getLogger(DaoAdmin.class.getName())
                    .log(Level.SEVERE, "Error No se puede eliminar " + e.getMessage());
        } finally {
            close();
        }
        return false;
    }


    public void close(){
        try{
            if(conn != null) conn.close();
            if(pstm != null) pstm.close();
            if(rs != null) rs.close();

        }catch(SQLException e){

        }
    }
}
