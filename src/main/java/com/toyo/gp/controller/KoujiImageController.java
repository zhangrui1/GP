package com.toyo.gp.controller;

import com.google.gson.Gson;
import com.toyo.gp.dto.KoujiImageForm;
import com.toyo.gp.entity.Image;
import com.toyo.gp.entity.KoujiImage;
import com.toyo.gp.service.ImageService;
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
@RequestMapping("/kouji")
public class KoujiImageController {

    @Autowired
    KoujiImageService koujiImageService;

    @Autowired
    ImageService imageService;

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String goValve(){
        return "kouji/AddKoujiImage";
    }

    @RequestMapping(value="/add",method=RequestMethod.POST)
    public String addKoujiImage(@ModelAttribute("KoujiImageForm")KoujiImageForm koujiImageForm,ModelMap modelMap,HttpSession session){

        KoujiImage koujiImage=new KoujiImage();
        koujiImage.makeupKoujiImageByForm(koujiImageForm);
        koujiImage= koujiImageService.insertKoujiImage(koujiImage);


        List<KoujiImage> newKoujiImages = koujiImageService.getAllImages();
        modelMap.addAttribute("newKoujiImages",newKoujiImages);
        modelMap.addAttribute("message","追加しました");

        return  "index";

    }

    @RequestMapping(value="/search",method=RequestMethod.POST)
    public String searchKoujiImage(@ModelAttribute("KoujiImageForm")KoujiImageForm koujiImageForm,ModelMap modelMap,HttpSession session){

        KoujiImage koujiImage=new KoujiImage();
        koujiImage.makeupKoujiImageByForm(koujiImageForm);
        List<KoujiImage> newKoujiImages= koujiImageService.searchKoujiImage(koujiImage);

        modelMap.addAttribute("newKoujiImages",newKoujiImages);
        modelMap.addAttribute("message",newKoujiImages.size());

        return  "index";

    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET, produces = "html/text;charset=UTF-8")
//    @ResponseBody
    public String getKoujiImageById(@PathVariable String id, ModelMap modelMap){

        KoujiImage koujiImage=koujiImageService.getKoujiImagesById(id);
        modelMap.addAttribute("koujiImage",koujiImage);

        String koujiId=id;
        List<Image> images= imageService.getAllImagesByKoujiId(koujiId);
        modelMap.addAttribute("images",images);

        return "kouji/EditKoujiImage";
    }

    @RequestMapping(value = "/update/{id}", method = RequestMethod.POST, produces = "html/text;charset=UTF-8")
//    @ResponseBody
    public String updateKoujiImageById(@ModelAttribute("KoujiImageForm")KoujiImageForm koujiImageForm,@PathVariable String id, ModelMap modelMap){

        KoujiImage koujiImage=new KoujiImage();
        koujiImage.makeupKoujiImageByForm(koujiImageForm);
        koujiImage.setId(Integer.valueOf(id));

        koujiImageService.updateKoujiImageById(koujiImage);

        List<KoujiImage> newKoujiImages = koujiImageService.getAllImages();
        modelMap.addAttribute("newKoujiImages",newKoujiImages);
        modelMap.addAttribute("koujiImage",koujiImage);

        String koujiId=id;
        List<Image> images= imageService.getAllImagesByKoujiId(koujiId);
        modelMap.addAttribute("images",images);

        modelMap.addAttribute("message","更新しました");

        return  "kouji/EditKoujiImage";
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET, produces = "html/text;charset=UTF-8")
    public String deleteByImagename(@PathVariable String id,ModelMap modelMap){
        koujiImageService.deleteKoujiImageById(id);
        List<KoujiImage> newKoujiImages = koujiImageService.getAllImages();
        modelMap.addAttribute("newKoujiImages",newKoujiImages);
        modelMap.addAttribute("message","message");
        return "index";
    }

//
//    @RequestMapping(value = "/getBikouByObject", method = RequestMethod.GET, produces = "html/text;charset=UTF-8")
//    @ResponseBody
//    public String getBikouByObject(@RequestParam("object")String object){
//        return koujiImageService.getBikouByObject(object);
//    }


}
