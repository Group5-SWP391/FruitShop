/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package model;

public class CategoryMKT {
    private int cateID;
    private boolean isActive;
    private String cateName;

    public CategoryMKT() {
    }

    public CategoryMKT(int cateID, boolean isActive, String cateName) {
        this.cateID = cateID;
        this.isActive = isActive;
        this.cateName = cateName;
    }

    public int getCateID() {
        return cateID;
    }

    public void setCateID(int cateID) {
        this.cateID = cateID;
    }

    public boolean isIsActive() {
        return isActive;
    }

    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }

    public String getCateName() {
        return cateName;
    }

    public CategoryMKT(String cateName) {
        this.cateName = cateName;
    }

    public void setCateName(String cateName) {
        this.cateName = cateName;
    }

    @Override
    public String toString() {
        return "CategoryMKT{" + "cateID=" + cateID + ", isActive=" + isActive + ", cateName=" + cateName + '}';
    }
    
}
