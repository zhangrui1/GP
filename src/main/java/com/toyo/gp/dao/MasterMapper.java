package com.toyo.gp.dao;

import com.toyo.gp.entity.Master;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * Created by zhangrui on 11/26/14.
 */
public interface MasterMapper {

    public List<Master> findAllMaster();

    public List<Master> findAllMasterSort(String sortname);

    public List<Master> findAllMasterSortByPlacename();

    public List<Master> findAllMasterSortByPlacenameUint();


    public void updateMasterByMaster(Master master);

    public int getLastInsertId();

    public Master findMasterById(String id);

    public void insertMaster(Master master);

    public void deleteMasterById(String id);

}