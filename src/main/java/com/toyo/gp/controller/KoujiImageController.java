package com.toyo.gp.controller;

import com.toyo.gp.dto.KoujiImageForm;
import com.toyo.gp.entity.KoujiImage;
import com.toyo.gp.service.KoujiImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by zhangrui on 11/25/14.
 */
@Controller
@RequestMapping("/image")
public class KoujiImageController {

    @Autowired
    KoujiImageService KoujiImageService;

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String goValve(){
        return "kouji/AddKoujiImage";
    }

    @RequestMapping(value="/add",method=RequestMethod.POST)
    public String addKoujiImage(@ModelAttribute("KoujiImageForm")KoujiImageForm koujiImageForm,ModelMap modelMap,HttpSession session){

        KoujiImage koujiImage=new KoujiImage();
        koujiImage.makeupKoujiImageByForm(koujiImageForm);
        koujiImage=KoujiImageService.insertKoujiImage(koujiImage);


        List<KoujiImage> newKoujiImages = KoujiImageService.getAllImages();
        modelMap.addAttribute("newKoujiImages",newKoujiImages);
        modelMap.addAttribute("message","message");

        return  "index";

    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET, produces = "html/text;charset=UTF-8")
//    @ResponseBody
    public String getKoujiImageById(@PathVariable String id, ModelMap modelMap){

        KoujiImage koujiImage=new KoujiImage();
        koujiImage=KoujiImageService.getKoujiImagesById(id);
        modelMap.addAttribute("koujiImage",koujiImage);

        return "kouji/EditKoujiImage";
    }

    @RequestMapping(value = "/update/{id}", method = RequestMethod.POST, produces = "html/text;charset=UTF-8")
//    @ResponseBody
    public String updateKoujiImageById(@ModelAttribute("KoujiImageForm")KoujiImageForm koujiImageForm,@PathVariable String id, ModelMap modelMap){

        KoujiImage koujiImage=new KoujiImage();
        koujiImage.makeupKoujiImageByForm(koujiImageForm);
        koujiImage.setId(Integer.valueOf(id));
//        koujiImage.setFilename("");
//        koujiImage.setFilepath("");
//        koujiImage.setFileid("");
//        koujiImage.setFilethumbnail("");

        KoujiImageService.updateKoujiImageById(koujiImage);

        List<KoujiImage> newKoujiImages = KoujiImageService.getAllImages();
        modelMap.addAttribute("newKoujiImages",newKoujiImages);
        modelMap.addAttribute("message","message");

        return  "index";
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET, produces = "html/text;charset=UTF-8")
    public String deleteByImagename(@PathVariable String id,ModelMap modelMap){
        KoujiImageService.deleteKoujiImageById(id);
        List<KoujiImage> newKoujiImages = KoujiImageService.getAllImages();
        modelMap.addAttribute("newKoujiImages",newKoujiImages);
        modelMap.addAttribute("message","message");
        return "index";
    }


    @RequestMapping(value = "/getBikouByObject", method = RequestMethod.GET, produces = "html/text;charset=UTF-8")
    @ResponseBody
    public String getBikouByObject(@RequestParam("object")String object){
        return KoujiImageService.getBikouByObject(object);
    }


}
