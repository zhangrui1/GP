package com.toyo.gp.controller;

import com.google.gson.Gson;
import com.toyo.gp.dto.KoujiImageForm;
import com.toyo.gp.entity.KoujiImage;
import com.toyo.gp.entity.User;
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
@RequestMapping("/")
public class IndexController {

    @Autowired
    KoujiImageService KoujiImageService;

    @RequestMapping(method = RequestMethod.GET)
    public String index(HttpSession session,
                                       ModelMap modelMap){
        User user=(User)session.getAttribute("user");
        //get real path
        session.setAttribute("imageRoot","http://storage.googleapis.com/grouppacking/");

        session.removeAttribute("image");

        List<KoujiImage> newKoujiImages = KoujiImageService.getAllImages();
        modelMap.addAttribute("newKoujiImages",newKoujiImages);
//
//        Gson gson=new Gson();
//        System.out.println(gson.toJson(newKoujiImages));

        String indexPath = (String)session.getAttribute("indexPath");
//        if(null == indexPath) {
////            index = luceneIndexService.generateRAMIndex();
//            indexPath = luceneIndexService.generateLocalIndex();
//        }
//        session.setAttribute("indexPath",indexPath);
        if(user == null) {
            return "login";
        } else {
            return "index";
        }
    }

    @RequestMapping(value="/logout", method=RequestMethod.GET)
    public String logout(HttpSession session){
        session.removeAttribute("user");
        return "login";
    }

}
