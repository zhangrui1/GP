package com.toyo.gp.dao;

import com.toyo.gp.entity.Image;

import java.util.List;

/**
 * Created by zhangrui on 11/27/14.
 */
public interface ImageMapper {


    Image findImagesById(String id);

    List<Image> findAllImagesByKoujiId(String koujiid);

    void deleteImageById(String id);

    void deleteImageByImagename(String imagename);


    void insertImage(Image image);

    /**最新追加したデータのIDを取得*/
    public int getLastInsertId();

}
