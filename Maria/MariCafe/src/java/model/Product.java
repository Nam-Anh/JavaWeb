
package model;

import java.util.Date;

public class Product {
    private int id;
    private String product_name;
    private String description;
    private String shortDescription;
    private Date date;
    private String photo_name;
    private String price;

    public Product(int id, String title, String description, Date date, String photoName, String price, String shortDes) {
        this.id = id;
        this.product_name = title;
        this.date = date;
        this.description = description;
        this.photo_name = photoName;
        this.price = price;
        this.shortDescription = shortDes;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getProductName() {
        return product_name;
    }

    public void setProductName(String product_name) {
        this.product_name = product_name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getPhotoName() {
        return photo_name;
    }

    public void setPhotoName(String photo_name) {
        this.photo_name = photo_name;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getShortDescription() {
        return shortDescription;
    }

    public void setShortDescription(String shortDescription) {
        this.shortDescription = shortDescription;
    }
    
    
}
