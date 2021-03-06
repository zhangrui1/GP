package com.toyo.gp.entity;

import com.toyo.gp.dto.KoujiImageForm;
import com.toyo.gp.dto.MasterForm;

/**
 * Created by zhangrui on 2014/11/25.
 */
public class Master {

    /**マスターID*/
    public int id;
    /**マスター種別*/
    public String placename;
    /**各種別の連番コード*/
    public String placenameUnit;
    /**略称*/
    public String ryakuplaceshortname;

    public void makeupMasterByForm(MasterForm masterForm){
        setPlacename(masterForm.getPlacename());
        setPlacenameUnit(masterForm.getPlacenameUnit());
        setRyakuplaceshortname(masterForm.getRyakuplaceshortname());
    }


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
