package mx.edu.utez.voluntariapp_final.models.Role;

public class Role {
     private Long id_role;

    private String name;
    private int id;
    private String description;

    public Role() {
    }

    public Role(int id, String description) {
        this.id = id;
        this.description = description;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public Long getId_role() {
        return id_role;
    }

    public void setId_role(Long id_role) {
        this.id_role = id_role;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }



    public void setDescription(String description) {
        this.description = description;
    }
}
