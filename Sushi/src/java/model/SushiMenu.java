package model;

import java.util.Date;

public class SushiMenu {
    private int id;
    private String name;
    private String description;
    private String shortDescription;
    private String price;
    private Date createdDate;
    public SushiMenu() {
    }
 
    public SushiMenu(int id, String name, String description, String shortDes, String price, Date createdDate) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.shortDescription = shortDes;
        this.price = price;
        this.createdDate = createdDate;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getShortDescription() {
        return shortDescription;
    }

    public void setShortDescription(String shortDescription) {
        this.shortDescription = shortDescription;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }
    
    
}
