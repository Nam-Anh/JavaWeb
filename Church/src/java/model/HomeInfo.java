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
public class HomeInfo {
    private int id;
    private String bannerPhoto;
    
    private String introImage;
    private String introTitle;
    private String introDes;
    
    private String aboutImage;
    private String aboutTitle;
    private String aboutDes;
    
    private String authorImage;
    private String authorName;

    public HomeInfo() {
    }

    public HomeInfo(int id, String bannerPhoto, String introImage, String introTitle, String introDes, String aboutImage, String aboutTitle, String aboutDes, String authorImage, String authorName) {
        this.id = id;
        this.bannerPhoto = bannerPhoto;
        this.introImage = introImage;
        this.introTitle = introTitle;
        this.introDes = introDes;
        this.aboutImage = aboutImage;
        this.aboutTitle = aboutTitle;
        this.aboutDes = aboutDes;
        this.authorImage = authorImage;
        this.authorName = authorName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getBannerPhoto() {
        return bannerPhoto;
    }

    public void setBannerPhoto(String bannerPhoto) {
        this.bannerPhoto = bannerPhoto;
    }

    public String getIntroImage() {
        return introImage;
    }

    public void setIntroImage(String introImage) {
        this.introImage = introImage;
    }

    public String getIntroTitle() {
        return introTitle;
    }

    public void setIntroTitle(String introTitle) {
        this.introTitle = introTitle;
    }

    public String getIntroDes() {
        return introDes;
    }

    public void setIntroDes(String introDes) {
        this.introDes = introDes;
    }

    public String getAboutImage() {
        return aboutImage;
    }

    public void setAboutImage(String aboutImage) {
        this.aboutImage = aboutImage;
    }

    public String getAboutTitle() {
        return aboutTitle;
    }

    public void setAboutTitle(String aboutTitle) {
        this.aboutTitle = aboutTitle;
    }

    public String getAboutDes() {
        return aboutDes;
    }

    public void setAboutDes(String aboutDes) {
        this.aboutDes = aboutDes;
    }

    public String getAuthorImage() {
        return authorImage;
    }

    public void setAuthorImage(String authorImage) {
        this.authorImage = authorImage;
    }

    public String getAuthorName() {
        return authorName;
    }

    public void setAuthorName(String authorName) {
        this.authorName = authorName;
    }

    
}
