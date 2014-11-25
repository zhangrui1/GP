package com.toyo.gp.dao;

import com.toyo.gp.entity.KoujiImage;

import java.util.List;

/**
 * Created by Lsr on 11/5/14.
 */
public interface KoujiImageMapper {


    KoujiImage findImagesById(String id);

    List<KoujiImage> findAllImages();




    void insertImageByObject(String object);

    int findIdByObject(String object);

    void updateSyuByImagename(KoujiImage image);


    void deleteImageByImagename(String object);


    void addImageByImage(KoujiImage image);



    void updateBikouByObject(KoujiImage image);

    String findBikouByObject(String object);
}
