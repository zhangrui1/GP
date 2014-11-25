package com.toyo.gp.entity;

/**
 * Created by zhangrui on 25/11/14.
 */
public class KoujiImage {

    public int id;
    public String filename;
    public String filepath;
    public String fileid;
    public String filethumbnail;
    public String placename;
    public String placeshortname;
    public String valveimagenum;
    public String decideimagenum;
    public String sizeimagenum;
    public String commend;
    public String trkDate;
    public String updDate;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public String getFilepath() {
        return filepath;
    }

    public void setFilepath(String filepath) {
        this.filepath = filepath;
    }

    public String getFileid() {
        return fileid;
    }

    public void setFileid(String fileid) {
        this.fileid = fileid;
    }

    public String getFilethumbnail() {
        return filethumbnail;
    }

    public void setFilethumbnail(String filethumbnail) {
        this.filethumbnail = filethumbnail;
    }

    public String getPlacename() {
        return placename;
    }

    public void setPlacename(String placename) {
        this.placename = placename;
    }

    public String getPlaceshortname(){return  placeshortname;}

    public void setPlaceshortname(String placeshortname){this.placeshortname=placeshortname;}

    public String getValveimagenum(){return  valveimagenum;}

    public void  setValveimagenum(String valveimagenum){this.valveimagenum=valveimagenum;}

    public String getDecideimagenum(){return  decideimagenum;}

    public void setDecideimagenum(String decideimagenum){this.decideimagenum=decideimagenum;}

    public String getSizeimagenum(){return  sizeimagenum;}

    public void setSizeimagenum(String sizeimagenum){this.sizeimagenum=sizeimagenum;}

    public String getCommend(){return  commend;}

    public void setCommend(String commend){this.commend=commend;}

    public String getTrkDate(){return trkDate;}

    public void setTrkDate(String trkDate){this.trkDate=trkDate;}

    public String getUpdDate(){return  updDate;}

    public void setUpdDate(String updDate){this.updDate=updDate;}
}

