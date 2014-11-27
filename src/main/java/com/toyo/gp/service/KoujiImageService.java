package com.toyo.gp.service;

import com.google.gson.Gson;
import com.toyo.gp.dao.KoujiImageMapper;
import com.toyo.gp.entity.KoujiImage;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by Lsr on 11/5/14.
 */

@Service
public class KoujiImageService {

    @Resource
    KoujiImageMapper koujiImageMapper;

    public KoujiImage insertKoujiImage(KoujiImage koujiImage) {
        //append Date
        Date date=new Date();
        SimpleDateFormat sdf1=new SimpleDateFormat("yyyy/MM/dd");
        koujiImage.setTrkDate(sdf1.format(date));
        koujiImage.setUpdDate(sdf1.format(date));

//        koujiImage.setFilename("");
//        koujiImage.setFilepath("");
//        koujiImage.setFileid("");
//        koujiImage.setFilethumbnail("");

//        Gson gson = new Gson();
//        System.out.println(gson.toJson(koujiImage));

        koujiImageMapper.insertKoujiImage(koujiImage);
        koujiImage.setId(koujiImageMapper.getLastInsertId());

        return koujiImage;
    }

//    public String addImageByImage(KoujiImage image){
//
//
//        koujiImageMapper.addImageByImage(image);
//        int id = koujiImageMapper.findIdByObject(image.getImagename());
//
//        return ""+id;
//    }

//    public void updateSyuByImagename(String imagesyu, String object) {
//
//        KoujiImage image = new KoujiImage();
//        image.setImagesyu(imagesyu);
//        image.setImagename(object);
//        koujiImageMapper.updateSyuByImagename(image);
//
//    }

    public void deleteKoujiImageById(String id) {

        koujiImageMapper.deleteKoujiImageById(id);
    }

    public KoujiImage getKoujiImagesById(String id) {

        return koujiImageMapper.findImagesById(id);
    }

    public List<KoujiImage> getAllImages() {

        return koujiImageMapper.findAllImages();
    }


    public void updateKoujiImageById(KoujiImage koujiImage) {

        //append Date
        Date date=new Date();
        SimpleDateFormat sdf1=new SimpleDateFormat("yyyy/MM/dd");
        koujiImage.setUpdDate(sdf1.format(date));



        koujiImageMapper.updateKoujiImageById(koujiImage);
    }

    public String getBikouByObject(String object) {
        return koujiImageMapper.findBikouByObject(object);
    }
}
