package mx.edu.utez.voluntariapp_final.models.organization;

import mx.edu.utez.voluntariapp_final.models.user.User;
import mx.edu.utez.voluntariapp_final.utils.MYSQLConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DaoEvent {

    private Connection conn;
    private PreparedStatement pstm;
    private CallableStatement cs;
    private ResultSet rs;

    //Listado de eventos ,relacion con organizacion
    public List<Event> relacionEvnt() {
        List<Event> events = new ArrayList<>();
        System.out.println(events);
        try {
            conn = new MYSQLConnection().connect(); //Establecer la conexion
            String query = "SELECT * FROM organization_event_info;"; //Preparamos la sentencia
            pstm = conn.prepareStatement(query);   //Ejecutamos la sentencia en la base de datos
            rs = pstm.executeQuery();

            while (rs.next()) {
                Organ organ =new Organ();
                organ.setId(rs.getLong("org_id"));
                organ.setBussines_name(rs.getString("bussines_name"));

                Event event = new Event();
                event.setId(rs.getLong("event_id"));
                event.setName(rs.getString("event_name"));
                event.setEvent_date(rs.getString("event_date"));
                event.setEvent_time(rs.getString("event_time"));
                event.setDescription(rs.getString("description"));
                event.setStreet(rs.getString("event_street"));
                event.setCologne(rs.getString("event_cologne"));
                event.setPostal_code(rs.getString("event_postal_code"));
                event.setMunicipality(rs.getString("event_municipality"));
                event.setState(rs.getString("event_state"));
                event.setUser_id(rs.getString("event_user_id"));
                event.setOrganization_id(rs.getString("organization_id"));
                event.setCategory(rs.getString("category"));
                event.setOrgan(organ);
                User user =new User();
                event.setUser(user);
                events.add(event);
            }
            System.out.println("Que pedo si llegas aqui?");
        } catch (SQLException e) {
            Logger.getLogger(DaoEvent.class.getName())
                    .log(Level.SEVERE, "Error  del Listado"
                            + e.getMessage());
        } finally {
            close();
        }
        return events;
    }



    public List<Event> findAll() {
        List<Event> events = new ArrayList<>();
        System.out.println(events);
        try {
            conn = new MYSQLConnection().connect(); //Establecer la conexion
            String query = "SELECT * FROM events;"; //Preparamos la sentencia
            pstm = conn.prepareStatement(query);   //Ejecutamos la sentencia en la base de datos
            rs = pstm.executeQuery();

            while (rs.next()) {
                Event event = new Event();
                event.setId(rs.getLong("id"));
                event.setName(rs.getString("name"));
                event.setEvent_date(rs.getString("event_date"));
                event.setEvent_time(rs.getString("event_time"));
                event.setDescription(rs.getString("description"));
                event.setStreet(rs.getString("street"));
                event.setCologne(rs.getString("cologne"));
                event.setPostal_code(rs.getString("postal_code"));
                event.setMunicipality(rs.getString("municypaly"));
                event.setState(rs.getString("state"));
                event.setCategory(rs.getString("category"));
                User user = new User();
                user.setId_user(rs.getLong("user_id"));
                Organ organ =new Organ();
                organ.setId(rs.getLong("organization_id"));
                events.add(event);
            }
            System.out.println("Que pedo si llegas aqui?");
        } catch (SQLException e) {
            Logger.getLogger(DaoEvent.class.getName())
                    .log(Level.SEVERE, "Error  del Listado"
                            + e.getMessage());
        } finally {
            close();
        }

        return events;
    }

    public Event findOne(Long id) {
        System.out.println(id);
        try {
            conn = new MYSQLConnection().connect(); //Establecer la conexion
            String query = "SELECT * FROM events WHERE id = ?;"; //Preparamos la sentencia
            pstm = conn.prepareStatement(query);   //Ejecutamos la sentencia en la base de datos
            pstm.setLong(1, id);
            rs = pstm.executeQuery();
            Event event = new Event();
            if (rs.next()) {
                event.setId(rs.getLong("id"));
                event.setName(rs.getString("name"));
                event.setEvent_date(rs.getString("event_date"));
                event.setDescription(rs.getString("description"));
                event.setStreet(rs.getString("street"));
                event.setCologne(rs.getString("cologne"));
                event.setPostal_code(rs.getString("postal_code"));
                event.setMunicipality(rs.getString("municipality"));
                event.setEvent_time(rs.getString("event_time"));
                event.setCategory(rs.getString("category"));

                // category.setId(rs.getLong("id"));
                //event.setCategory(category);
                User user =new User();
                event.setUser(user);
                Organ organ =new Organ();
                event.setOrgan(organ);
                //users.add(User);
            }
            return event;

        } catch (SQLException e) {
            Logger.getLogger(DaoOrgan.class.getName())
                    .log(Level.SEVERE, "Error findOne"
                            + e.getMessage());
        } finally {
            close();
        }
        return null;
    }

    public boolean save(Event event) {
        try {
            conn = new MYSQLConnection().connect();
            String query = "CALL  CreateEvent(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? ,?,?);";
            cs = conn.prepareCall(query);
            cs.setString(1, event.getName());
            cs.setString(2, event.getEvent_date());
            cs.setString(3, event.getEvent_time());
            cs.setString(4, event.getDescription());
            cs.setString(5, event.getStreet());
            cs.setString(6, event.getCologne());
            cs.setString(7, event.getPostal_code());
            cs.setString(8, event.getMunicipality());
            cs.setString(9, event.getState());
            cs.setString(10,event.getCategory());
            cs.setLong(11,event.getUser().getId_user());
            cs.setLong(12,event.getOrgan().getId());
            cs.setBoolean(13, event.getStatus());



            System.out.println(event.getOrgan().getId()+" Daooooo");
            System.out.println(event.getUser().getId_user()+ " id de Usuario");
            cs .executeQuery();

            return true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            Logger.getLogger(DaoEvent.class.getName()).log(Level.SEVERE, "Error del save " + e.getMessage());
        } finally {
            close();
        }
        return false;
    }
    //Listado de eventos ,(Voluntarios acptados /Voluntarios no acepto)
   /* public List<Event> Volunteer_accept() {
        List<Event> events1 = new ArrayList<>();
        System.out.println(events1);
        try  {
            conn = new MYSQLConnection().connect(); //Establecer la conexion
            String query = " SELECT * FROM volunteer_event_view;"; //Preparamos la sentencia
            pstm = conn.prepareStatement(query);   //Ejecutamos la sentencia en la base de datos
            rs = pstm.executeQuery();

            while (rs.next()) {
                Event event = new Event();
                event.setId(rs.getLong("event_id"));
                event.setName(rs.getString("event_name"));
                event.setEvent_date(rs.getString("event_date"));
                //IF QUE NO SIRVE PEROOOO SERVIRA OK?

                int isAccept = rs.getInt("is_accept");
                if (isAccept == 1) {
                    event.setEvent_time(rs.getString("event_time"));
                    event.setDescription(rs.getString("description"));
                    event.setMunicipality(rs.getString("municypaly"));
                    event.setState(rs.getString("state"));
                } else {
                    event.setEvent_time(rs.getString(null));
                    event.setDescription(rs.getString(null));
                    event.setMunicipality(rs.getString(null));
                    event.setState(rs.getString(null));
                }
                event.setUser_id(rs.getString("event_user_id"));
                event.setOrganization_id(rs.getString("organization_id"));
                event.setCategory(rs.getString("category"));
                Post post = new Post();
                event.setPost(post);
                Organ organ =new Organ();
                event.setOrgan(organ);
                User user = new User();
               event.setUser(user);
                events1.add(event);
            }
            System.out.println("Que pedo si llegas aqui?");
        } catch (SQLException e) {
            Logger.getLogger(DaoEvent.class.getName())
                    .log(Level.SEVERE, "Error  del Listado"
                            + e.getMessage());
        } finally {
            close();
        }

        return events1;
    }*/
    //Listado de Relacion de los eventos y organizacion
    public List<Event> relacion_Organ(int orgId) {
        List<Event> events2 = new ArrayList<>();
        System.out.println(orgId);
        System.out.println("ahah");
        try  {
            conn = new MYSQLConnection().connect(); //Establecer la conexion
            String query = "CALL VerOrganizationEvents(?)"; //Preparamos la sentencia
            cs = conn.prepareCall(query);
            /// cs.setLong(1,orgId);//Ejecutamos la sentencia en la base de datos
            cs.setLong(1,orgId);
            rs = cs.executeQuery();
            while (rs.next()) {
                Organ organ =new Organ();
                Event event =new Event();
                event.setId(rs.getLong("event_id"));
                event.setName(rs.getString("event_name"));
                event.setEvent_date(rs.getString("event_date"));
                event.setDescription(rs.getString("description"));
                event.setStreet(rs.getString("street"));
                event.setCologne(rs.getString("cologne"));
                event.setState(rs.getString("state"));
                event.setPostal_code(rs.getString("postal_code"));
                event.setMunicipality(rs.getString("municypaly"));
                event.setEvent_time(rs.getString("event_time"));
                event.setCategory(rs.getString("category"));
                event.setOrgan(organ);

                events2.add(event);

            }

        } catch (SQLException e) {
            Logger.getLogger(DaoEvent.class.getName())
                    .log(Level.SEVERE, "Error  del Listado"
                            + e.getMessage());
        } finally {
            close();
        }

        return events2;
    }

    //Update de evento

    public boolean update (Event event) {
        try {
            conn = new MYSQLConnection().connect();
            String query = "CALL  UpdateEvent(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, );";
            cs = conn.prepareCall(query);
            cs.setString(1, event.getName());
            cs.setString(2, event.getEvent_date());
            cs.setString(3, event.getEvent_time());
            cs.setString(4, event.getDescription());
            cs.setString(5, event.getStreet());
            cs.setString(6, event.getCologne());
            cs.setString(7, event.getPostal_code());
            cs.setString(8, event.getMunicipality());
            cs.setString(9, event.getState());
            cs.setString(10,event.getCategory());
            cs.setLong(11,event.getUser().getId_user());
            cs .executeQuery();

            return true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            Logger.getLogger(DaoEvent.class.getName()).log(Level.SEVERE, "Error del save " + e.getMessage());
        } finally {
            close();
        }
        return false;
    }
//Segun chat este metodo sera para hacer la
// busqueda del id del
// evento para poder hacer el update
   /*public  Event getById(String eventId){
        Event event = null;
        String query = "SELECT * FROM events WHERE id = ?";
        try {
            conn = new MYSQLConnection().connect(); // Asumo que así obtienes la conexión, basado en tu código previo.
            pstm = conn.prepareStatement(query);
            pstm.setInt(1, Integer.parseInt(eventId));
            rs = pstm.executeQuery();
            if (rs.next()) {
                event = new Event();
                event.setId(rs.getLong("id"));
                event.setName(rs.getString("name"));
                event.setEvent_date(rs.getString("event_date"));
                event.setEvent_time(rs.getString("event_time"));
                event.setDescription(rs.getString("description"));
                event.setStreet(rs.getString("street"));
                event.setCologne(rs.getString("cologne"));
                event.setPostal_code(rs.getString("postal_code"));
                event.setMunicipality(rs.getString("municipality"));
                event.setState(rs.getString("state"));
                event.setCategory(rs.getString("category"));
                // Aquí puedes continuar con los demás campos...
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Aquí puedes manejar la excepción como prefieras.
        } finally {
            close(); // Asumo que tienes un método close que cierra la conexión, el PreparedStatement y el ResultSet.
        }
        return event;
    }*/



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