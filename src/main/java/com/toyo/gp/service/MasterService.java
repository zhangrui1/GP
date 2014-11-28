package com.toyo.gp.service;

import com.toyo.gp.dao.MasterMapper;
import com.toyo.gp.entity.Master;

import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Lsr on 10/9/14.
 */

@Service
public class MasterService {

    @Resource
    MasterMapper masterMapper;

    public List<Master> getAllMaster() {

        List<Master> masters = masterMapper.findAllMaster();
        return  masters;
    }

    public List<Master> findAllMasterSort(String sortname) {

        List<Master> masters = masterMapper.findAllMasterSort(sortname);
        return  masters;
    }


    public List<Master> getAllMasterBySortPlacename() {

        List<Master> masters = masterMapper.findAllMasterSortByPlacename();
        return  masters;
    }

    public List<Master> getAllMasterBySortPlacenameUnit() {

        List<Master> masters = masterMapper.findAllMasterSortByPlacenameUint();
        return  masters;
    }

    public Master addMaster(Master master){
        masterMapper.insertMaster(master);
        master.setId(masterMapper.getLastInsertId());
        return  master;
    }

    public Master getMasterByid(String id){
        Master master=masterMapper.findMasterById(id);
        return  master;
    }

    public void UpdateMaster(Master master) {

        masterMapper.updateMasterByMaster(master);
    }

    public void deleteMasterById(String id){
        masterMapper.deleteMasterById(id);
    }
}
