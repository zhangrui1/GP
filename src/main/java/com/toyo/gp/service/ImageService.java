package com.toyo.gp.service;

import com.google.gson.Gson;
import com.toyo.gp.dao.ImageMapper;
import com.toyo.gp.dao.KoujiImageMapper;
import com.toyo.gp.entity.Image;
import com.toyo.gp.entity.KoujiImage;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by zhangrui on 11/27/14.
 */

@Service
public class ImageService {

    @Resource
    ImageMapper imageMapper;

    public Image insertImage(Image image) {
        //append Date
        Date date=new Date();
        SimpleDateFormat sdf1=new SimpleDateFormat("yyyy/MM/dd");
        image.setTrkDate(sdf1.format(date));
        image.setUpdDate(sdf1.format(date));

        Gson gson = new Gson();
        System.out.println(gson.toJson(image));

        imageMapper.insertImage(image);
        image.setId(imageMapper.getLastInsertId());

        return image;
    }


    public void deleteImageById(String id) {

        imageMapper.deleteImageById(id);
    }

    public void deleteImageByImagename(String imagename) {

        imageMapper.deleteImageByImagename(imagename);
    }


    public Image getImageById(String id) {

        return imageMapper.findImagesById(id);
    }

    public List<Image> getAllImagesByKoujiId(String koujiId) {

        return imageMapper.findAllImagesByKoujiId(koujiId);
    }

}
