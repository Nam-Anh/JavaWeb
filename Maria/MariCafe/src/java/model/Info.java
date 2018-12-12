package model;

public class Info {
    private int id;
    private String address;
    private String tel;
    private String email;
    private String photoPath;
    private String schedule;

    public Info(int id, String address, String tel, String email, String pPath, String schedule) {
        this.id = id;
        this.address = address;
        this.tel = tel;
        this.email = email;
        this.photoPath = pPath;
        this.schedule = schedule;
    }

    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    public String getPhotoPath() {
        return photoPath;
    }

    public void setPhotoPath(String photoPath) {
        this.photoPath = photoPath;
    }

    public String getSchedule() {
        return schedule;
    }

    public void setSchedule(String schedule) {
        this.schedule = schedule;
    }
    
}
