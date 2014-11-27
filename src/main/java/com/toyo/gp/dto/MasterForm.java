package com.toyo.gp.dto;


/**
 * Created by Lsr on 10/14/14.
 */
public class MasterForm {

    public int id;
    /**マスター種別*/
    public String placename;
    /**各種別の連番コード*/
    public String placenameUnit;
    /**略称*/
    public String ryakuplaceshortname;


    /*** マスターIDの取得と設定*/
    public int getId(){return id;}
    public void setId(int id){
        this.id =id;
    }

    /*** マスター種別の取得と設定*/
    public String getPlacename(){return placename;}
    public void setPlacename(String placename){
        this.placename=placename;
    }

    /*** 各種別の連番コードの取得と設定*/
    public String getPlacenameUnit(){return placenameUnit;}
    public void setPlacenameUnit(String placenameUnit){
        this.placenameUnit=placenameUnit;
    }

    /*** 略称の取得と設定*/
    public String getRyakuplaceshortname(){return ryakuplaceshortname;}
    public void setRyakuplaceshortname(String ryakuplaceshortname){
        this.ryakuplaceshortname=ryakuplaceshortname;
    }
}
