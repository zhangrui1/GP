package com.toyo.gp.controller;

import com.toyo.gp.entity.KoujiImage;
import com.toyo.gp.entity.User;
import com.toyo.gp.service.KoujiImageService;
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
import java.util.List;

/**
 * Created by zhangrui on 11/25/14.
 */
@Controller
@RequestMapping("/")
public class KoujiImageController {

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

    @RequestMapping(value = "/getKoujiImageById", method = RequestMethod.POST, produces = "html/text;charset=UTF-8")
    @ResponseBody
    public KoujiImage getKoujiImageById(@RequestParam("id")String id){

        KoujiImage koujiImage=new KoujiImage();
        koujiImage=KoujiImageService.getImagesById(id);
        return koujiImage;
    }

    @RequestMapping(value = "/deleteByImagename", method = RequestMethod.POST, produces = "html/text;charset=UTF-8")
    @ResponseBody
    public String deleteByImagename(@RequestParam("object")String object){
        KoujiImageService.deleteImageByImagename(object);
//        imagepartService.deleteRelationByImagename(object);
        return object;
    }

    @RequestMapping(value = "/addRelation", method = RequestMethod.POST, produces = "html/text;charset=UTF-8")
    @ResponseBody
    public String addRelation(@RequestParam("partid") String partid,
                              @RequestParam("object") String object){

//        imagepartService.addRelation(partid,object);

        return "";
    }

    @RequestMapping(value = "/submitBikouById", method = RequestMethod.POST, produces = "html/text;charset=UTF-8")
    @ResponseBody
    public String submitBikouById(@RequestParam("bikou")String bikou,
                                  @RequestParam("object")String object){
        KoujiImageService.updateBikouByObject(bikou, object);
        return "";
    }

    @RequestMapping(value = "/getBikouByObject", method = RequestMethod.GET, produces = "html/text;charset=UTF-8")
    @ResponseBody
    public String getBikouByObject(@RequestParam("object")String object){
        return KoujiImageService.getBikouByObject(object);
    }
}
