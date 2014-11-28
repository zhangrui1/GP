package com.toyo.gp.controller;


import com.toyo.gp.entity.Image;
import com.toyo.gp.service.ImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by zhangrui on 11/27/14.
 */
@Controller
@RequestMapping("/image")
public class ImageController {

    @Autowired
    ImageService imageService;

//    @Autowired
//    ImagepartService imagepartService;

    @RequestMapping(value = "/saveImageByImage", method = RequestMethod.POST, produces = "html/text;charset=UTF-8")
    @ResponseBody
    public String saveImageByImage(@RequestParam("object")String object,@RequestParam("koujiId") String koujiId,
                                       HttpSession session,
                                       ModelMap modelMap){
        Image image = new Image();

        image.setImagename(object);
        image.setKoujiId(koujiId);

        //append Date
        Date date = new Date();
        SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy/MM/dd");
        image.setTrkDate(sdf1.format(date));
        image.setUpdDate(sdf1.format(date));

        imageService.insertImage(image);
        return Integer.toString(image.getId());
    }

    @RequestMapping(value = "/deleteByImagename", method = RequestMethod.POST, produces = "html/text;charset=UTF-8")
    @ResponseBody
    public String deleteByImagename(@RequestParam("object")String object){
        imageService.deleteImageByImagename(object);
        return object;
    }
}
