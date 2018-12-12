/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author anhlhnse05444
 */
public class SushiInfo {
    private int id;
    private String address;
    private String tel;
    private String email;
    private String photoPath;
    private String schedule;

    public SushiInfo() {
    }

    
    public SushiInfo(int id, String address, String tel, String email, String photoPath, String schedule) {
        this.id = id;
        this.address = address;
        this.tel = tel;
        this.email = email;
        this.photoPath = photoPath;
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
