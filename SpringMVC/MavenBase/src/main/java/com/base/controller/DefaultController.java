
package com.base.controller;

import com.base.DAO.TeacherDAO;
import com.base.models.Teachers;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
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
        //Teachers s = new Teachers();
        //s.setTName("Teppo Testaaja");
        //s.setTSubject("Testing");
        //s.setEmail("teppo@testaa.com");
        //s.setPhone("0401234567");
        //try {
        //    TeacherDAO.addTeacher(s);
        //} catch (Exception e) {
        //    e.printStackTrace();
        //}
        //Define attributes to be used in the template (index.jsp here)
        try {
            map.addAttribute("teachers", TeacherDAO.getTeachers());
        } catch (Exception e) {
            map.addAttribute("save_info", "List generation failed.");
            e.printStackTrace();
        }
        map.addAttribute("teacher", new Teachers());
        return "second";
    }
    @RequestMapping(value="/teacher", method=RequestMethod.POST)
    public String addNewTeacher(@ModelAttribute("teacher") Teachers teacher, ModelMap map) {
        System.out.println(teacher.getTName());
        try {
            TeacherDAO.addTeacher(teacher);
            map.addAttribute("save_info", "Teacher added succesfully!");
            map.addAttribute("teachers", TeacherDAO.getTeachers());
        } catch (Exception e) {
            map.addAttribute("save_info", "Database error occured.");
            e.printStackTrace();
        }
        return "second";
    }
}
