package com.toyo.gp.service;

import com.toyo.gp.dao.KoujiImageMapper;
import com.toyo.gp.entity.KoujiImage;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Lsr on 11/5/14.
 */

@Service
public class KoujiImageService {

    @Resource
    KoujiImageMapper koujiImageMapper;

    public String insertImageByObject(String object) {

        koujiImageMapper.insertImageByObject(object);

        int id = koujiImageMapper.findIdByObject(object);


        return ""+id;
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

    public void deleteImageByImagename(String object) {
        koujiImageMapper.deleteImageByImagename(object);
    }

    public KoujiImage getImagesById(String id) {

        return koujiImageMapper.findImagesById(id);
    }

    public List<KoujiImage> getAllImages() {

        return koujiImageMapper.findAllImages();
    }


    public void updateBikouByObject(String bikou, String object) {
        KoujiImage image = new KoujiImage();
//        image.setBikou(bikou);
//        image.setImagename(object);
        koujiImageMapper.updateBikouByObject(image);
    }

    public String getBikouByObject(String object) {
        return koujiImageMapper.findBikouByObject(object);
    }
}
