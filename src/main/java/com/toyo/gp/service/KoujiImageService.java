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

        koujiImageMapper.insertKoujiImage(koujiImage);
        koujiImage.setId(koujiImageMapper.getLastInsertId());

        return koujiImage;
    }


    public void deleteKoujiImageById(String id) {

        koujiImageMapper.deleteKoujiImageById(id);
    }

    public KoujiImage getKoujiImagesById(String id) {

        return koujiImageMapper.findImagesById(id);
    }

    public List<KoujiImage> getAllImages() {

        return koujiImageMapper.findAllImages();
    }

    public List<KoujiImage> searchKoujiImage(KoujiImage koujiImage) {

        return koujiImageMapper.findKoujiImagesByKouji(koujiImage);
    }

    public void updateKoujiImageById(KoujiImage koujiImage) {

        //append Date
        Date date=new Date();
        SimpleDateFormat sdf1=new SimpleDateFormat("yyyy/MM/dd");
        koujiImage.setUpdDate(sdf1.format(date));



        koujiImageMapper.updateKoujiImageById(koujiImage);
    }
//
//    public String getBikouByObject(String object) {
//        return koujiImageMapper.findBikouByObject(object);
//    }
}
