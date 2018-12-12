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
public class Prayer {
    private int id;
    private String prayerTitle;
    private String prayerDes;
    private String prayerPhoto;

    public Prayer() {
    }

    public Prayer(int id, String prayerTitle, String prayerDes, String prayerPhoto) {
        this.id = id;
        this.prayerTitle = prayerTitle;
        this.prayerDes = prayerDes;
        this.prayerPhoto = prayerPhoto;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPrayerTitle() {
        return prayerTitle;
    }

    public void setPrayerTitle(String prayerTitle) {
        this.prayerTitle = prayerTitle;
    }

    public String getPrayerDes() {
        return prayerDes;
    }

    public void setPrayerDes(String prayerDes) {
        this.prayerDes = prayerDes;
    }

    public String getPrayerPhoto() {
        return prayerPhoto;
    }

    public void setPrayerPhoto(String prayerPhoto) {
        this.prayerPhoto = prayerPhoto;
    }
    
    
}
