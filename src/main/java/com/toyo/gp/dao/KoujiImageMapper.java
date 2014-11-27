package com.toyo.gp.dao;

import com.toyo.gp.entity.KoujiImage;

import java.util.List;

/**
 * Created by Lsr on 11/5/14.
 */
public interface KoujiImageMapper {


    KoujiImage findImagesById(String id);

    List<KoujiImage> findAllImages();

    void deleteKoujiImageById(String id);

    void insertKoujiImage(KoujiImage koujiImage);

    /**最新追加したデータのIDを取得*/
    public int getLastInsertId();

    void updateKoujiImageById(KoujiImage koujiImage);




    int findIdByObject(String object);

    void updateSyuByImagename(KoujiImage image);

    void addImageByImage(KoujiImage image);

    String findBikouByObject(String object);
}
