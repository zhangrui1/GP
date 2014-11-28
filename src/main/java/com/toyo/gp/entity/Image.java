package com.toyo.gp.entity;

import com.toyo.gp.dto.KoujiImageForm;

/**
 * Created by zhangrui on 25/11/14.
 */
public class Image {

    public int id;
    public String koujiId;
    public String imagename;
    public String trkDate;
    public String updDate;



    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getKoujiId() {
        return koujiId;
    }

    public void setKoujiId(String koujiId) {
        this.koujiId = koujiId;
    }

    public String getImagename() {
        return imagename;
    }

    public void setImagename(String imagename) {
        this.imagename = imagename;
    }

    public String getTrkDate(){return trkDate;}

    public void setTrkDate(String trkDate){this.trkDate=trkDate;}

    public String getUpdDate(){return  updDate;}

    public void setUpdDate(String updDate){this.updDate=updDate;}


}

