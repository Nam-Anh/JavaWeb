package model;

import java.util.Date;

/**
 *
 * @author anhlhnse05444
 */
public class Service {
    private int id;
    private String name;
    private String description;
    private String schedule;

    public Service() {
    }

    public Service(int id, String name, String description, String schedule) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.schedule = schedule;
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

    public String getSchedule() {
        return schedule;
    }

    public void setSchedule(String schedule) {
        this.schedule = schedule;
    }
    
    
}
