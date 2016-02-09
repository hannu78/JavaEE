
package com.base.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class DefaultController {
    
    @RequestMapping(value="/", method=RequestMethod.GET)
    public String index(ModelMap map){
        //Define attributes to be used in the template (index.jsp here)
        map.addAttribute("name", "Teppo Testaaja");
        return "index";
    }
    @RequestMapping(value="/second", method=RequestMethod.GET)
    public String second(ModelMap map){
        //Define attributes to be used in the template (index.jsp here)
        map.addAttribute("name", "Teppo Testaaja");
        return "second";
    }
}
