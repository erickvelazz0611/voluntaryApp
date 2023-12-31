package mx.edu.utez.voluntariapp_final.models.volunteer;

import mx.edu.utez.voluntariapp_final.models.Role.Role;
import mx.edu.utez.voluntariapp_final.models.user.User;

import java.io.InputStream;

public class Volunteer {

    private Long id;
    private String name;
    private String surname;
    private String lastanme;
    private String birthday;
    private String address;
    private String phone;
    private String curp;
    private String user_id;
    private User user;
    private Role role;

    private String Filename;
    private byte[] imageUser;
    InputStream img;

    public Volunteer(long l, String name, String surname, String lastanme, String birthday, String email, byte[] imageUser) {
    }

    public Volunteer(Long id, String name, String surname, String lastanme, String birthday, String address, String phone, String curp, String user_id, User user, Role role, byte[] imageUser) {
        this.id = id;
        this.name = name;
        this.surname = surname;
        this.lastanme = lastanme;
        this.birthday = birthday;
        this.address = address;
        this.phone = phone;
        this.curp = curp;
        this.user_id = user_id;
        this.user = user;
        this.role = role;
        this.imageUser = imageUser;
    }

    public Volunteer() {

    }

    public Volunteer(long l, String email, String password, String phone) {
    }

    public String getFilename() {
        return Filename;
    }

    public void setFilename(String filename) {
        Filename = filename;
    }

    public byte[] getImageUser() {
        return imageUser;
    }

    public void setImageUser(byte[] imageUser) {
        this.imageUser = imageUser;
    }

    public InputStream getImg() {
        return img;
    }

    public void setImg(InputStream img) {
        this.img = img;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getLastanme() {
        return lastanme;
    }

    public void setLastanme(String lastanme) {
        this.lastanme = lastanme;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getCurp() {
        return curp;
    }

    public void setCurp(String curp) {
        this.curp = curp;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }
}