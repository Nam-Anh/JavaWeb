/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.Date;

/**
 *
 * @author anhlhnse05444
 */
public class Sushi {
    private int id;
    private String name;
    private String des;
    private String photoName;
    private Date dayCreated;
    private String shortDescription;
    public Sushi() {
    }

    
    public Sushi(int id, String name, String des,  Date dayCreated, String photoName, String shortDescription) {
        this.id = id;
        this.name = name;
        this.des = des;
        this.photoName = photoName;
        this.dayCreated = dayCreated;
        this.shortDescription = shortDescription;
    }

    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des;
    }

    public String getPhotoName() {
        return photoName;
    }

    public void setPhotoName(String photoName) {
        this.photoName = photoName;
    }

    public Date getDayCreated() {
        return dayCreated;
    }

    public void setDayCreated(Date dayCreated) {
        this.dayCreated = dayCreated;
    }

    public String getShortDescription() {
        return shortDescription;
    }

    public void setShortDescription(String shortDescription) {
        this.shortDescription = shortDescription;
    }
    
    
}
