package mx.edu.utez.voluntariapp_final.models.volunteer;

public class Posts {


    public Long id_post;
    public Boolean is_accept;
    public  String volunteer_id;
    public  String user_id;
    public String event_id;
    private Volunteer volunteer;

    public Posts() {
    }

    public Posts(Long id_post, Boolean is_accept, String volunteer_id, String user_id, String event_id, Volunteer volunteer) {
        this.id_post = id_post;
        this.is_accept = is_accept;
        this.volunteer_id = volunteer_id;
        this.user_id = user_id;
        this.event_id = event_id;
        this.volunteer = volunteer;
    }

    public Long getId_post() {
        return id_post;
    }

    public void setId_post(Long id_post) {
        this.id_post = id_post;
    }

    public Boolean getIs_accept() {
        return is_accept;
    }

    public void setIs_accept(Boolean is_accept) {
        this.is_accept = is_accept;
    }

    public String getVolunteer_id() {
        return volunteer_id;
    }

    public void setVolunteer_id(String volunteer_id) {
        this.volunteer_id = volunteer_id;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getEvent_id() {
        return event_id;
    }

    public void setEvent_id(String event_id) {
        this.event_id = event_id;
    }

    public Volunteer getVolunteer() {
        return volunteer;
    }

    public void setVolunteer(Volunteer volunteer) {
        this.volunteer = volunteer;
    }
}