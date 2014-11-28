package com.toyo.gp.controller;

import com.google.gson.Gson;
import com.toyo.gp.dto.KoujiImageForm;
import com.toyo.gp.dto.MasterForm;
import com.toyo.gp.entity.Master;
import com.toyo.gp.service.MasterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("master")
public class MasterController {

    @Autowired
    private MasterService masterService;

/**
 * マスターリストを取得
 * */
    @RequestMapping(method=RequestMethod.GET)
    public String index(HttpSession session,ModelMap modelMap){
        List<Master> masterLists = masterService.getAllMaster();
        modelMap.addAttribute("masterLists",masterLists);

       return "master/master";
    }

    /**
     * マスターリストをSortする
     * */
    @RequestMapping(value="/sort/placename",method = RequestMethod.GET,produces = "text/html;charset=UTF-8")
    public String sortplacename(HttpSession session,ModelMap modelMap){
        List<Master> masterLists = masterService.getAllMasterBySortPlacename();
        modelMap.addAttribute("masterLists",masterLists);

        return "master/master";
    }

    /**
     * マスターリストをSortする
     * */
    @RequestMapping(value="/sort/placenameUnit",method = RequestMethod.GET,produces = "text/html;charset=UTF-8")
    public String sortplacenameUnit(HttpSession session,ModelMap modelMap){
        List<Master> masterLists = masterService.getAllMasterBySortPlacenameUnit();
        modelMap.addAttribute("masterLists",masterLists);

        return "master/master";
    }

    /**
     * マスターリストをSortする
     * */
    @RequestMapping(value="/sort/ryakuplaceshortname",method = RequestMethod.GET,produces = "text/html;charset=UTF-8")
    public String sortryakuplaceshortname(HttpSession session,ModelMap modelMap){
        List<Master> masterLists = masterService.getAllMaster();
        modelMap.addAttribute("masterLists",masterLists);

        return "master/master";
    }
    /**
     * 新規マスター
     * */

    @RequestMapping(value="/add",method = RequestMethod.POST,produces = "text/html;charset=UTF-8")
    public String edit(@ModelAttribute("MasterForm")MasterForm masterForm,HttpSession session,ModelMap modelMap){

        Master master=new Master();
        master.makeupMasterByForm(masterForm);
        masterService.addMaster(master);

        Gson gson=new Gson();
        System.out.println(gson.toJson(master));


        List<Master> masterLists = masterService.getAllMaster();
        modelMap.addAttribute("masterLists",masterLists);

        return "master/master";
    }

    /**
     * 編集画面へ遷移
     * */

    @RequestMapping(value="/edit/{id}",method = RequestMethod.GET,produces = "text/html;charset=UTF-8")
    public String edit(@PathVariable String id,HttpSession session,ModelMap modelMap){

        Master master=masterService.getMasterByid(id);

//        Gson gson=new Gson();
//        System.out.println(gson.toJson(master));
//        masterService.UpdateMaster(master);

        modelMap.addAttribute("master",master);

        return "master/EditMaster";
    }

    /**
     * マスターデータを更新して、リストを戻る
     * */

    @RequestMapping(value="/update/{id}",method = RequestMethod.POST,produces = "text/html;charset=UTF-8")
    public String update(@PathVariable String id,@ModelAttribute("MasterForm")MasterForm masterForm,HttpSession session,ModelMap modelMap){

        Master master=new Master();
        master.makeupMasterByForm(masterForm);
        master.setId(Integer.valueOf(id));

        Gson gson=new Gson();
        System.out.println(gson.toJson(master));
        masterService.UpdateMaster(master);

        List<Master> masterLists = masterService.getAllMaster();
        modelMap.addAttribute("masterLists",masterLists);
        modelMap.addAttribute("master",master);

        modelMap.addAttribute("message","更新しました");

        return "master/EditMaster";
    }

    /**
     * マスターデータを削除して、リストを戻る
     * */

    @RequestMapping(value="/delete/{id}",method = RequestMethod.GET,produces = "text/html;charset=UTF-8")
    public String delete(@ModelAttribute("id")String id,HttpSession session,ModelMap modelMap){

        masterService.deleteMasterById(id);
        List<Master> masterLists = masterService.getAllMaster();
        modelMap.addAttribute("masterLists",masterLists);

        return "master/master";
    }

/**
 * GP工事新規、編集画面の工事先リストを取得用
 * */
    @RequestMapping(value="/getAllMaster",method = RequestMethod.POST,produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String getMasterJson() {

        List<Master> masterList = masterService.getAllMaster();
        Gson gson = new Gson();
//        System.out.println(gson.toJson(masterList));
        return gson.toJson(masterList);
    }



}
