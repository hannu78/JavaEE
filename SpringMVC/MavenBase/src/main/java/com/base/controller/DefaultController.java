
package com.base.controller;

import com.base.DAO.CourseDAO;
import com.base.DAO.TeacherDAO;
import com.base.models.Course;
import com.base.models.Teachers;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class DefaultController {
    
    private boolean isLogged = false;
    @RequestMapping(value="/", method=RequestMethod.GET)
    public String index(ModelMap map){
        //Define attributes to be used in the template (index.jsp here)
        map.addAttribute("isLogged", "false");
        return "index";
    }
    @RequestMapping(value="/admin/second", method=RequestMethod.GET)
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
        isLogged = true;
        map.addAttribute("teacher", new Teachers());
        map.addAttribute("isLogged", "true");
        return "second";
    }
    @RequestMapping(value="/admin/teacher", method=RequestMethod.POST)
    public String addNewTeacher(@ModelAttribute ("teacher") Teachers teacher, ModelMap map) {
        System.out.println(teacher.getTName());
        try {
            TeacherDAO.addTeacher(teacher);
            map.addAttribute("save_info", "Teacher added succesfully!");
            map.addAttribute("teachers", TeacherDAO.getTeachers());
            teacher.clearAttributes();
        } catch (Exception e) {
            map.addAttribute("save_info", "Database error occured.");
            e.printStackTrace();
        }
        return "/second";
    }
    @RequestMapping(value="/admin/course", method=RequestMethod.GET)
    public String listCourses(ModelMap map){
        try {
            map.addAttribute("courses", CourseDAO.getCourses());
        } catch (Exception e) {
            map.addAttribute("save_info", "List generation failed.");
            e.printStackTrace();
        }
        isLogged = true;
        map.addAttribute("course", new Course());
        map.addAttribute("isLogged", "true");
        return "course";
    }
    @RequestMapping(value="/admin/course", method=RequestMethod.POST)
    public String addNewCourse(@ModelAttribute ("course") Course course, ModelMap map) {
        System.out.println(course.getCName());
        try {
            CourseDAO.addCourse(course);
            map.addAttribute("save_info", "Course added succesfully!");
            map.addAttribute("courses", CourseDAO.getCourses());
            course.clearAttributes();
        } catch (Exception e) {
            map.addAttribute("save_info", "Database error occured.");
            e.printStackTrace();
        }
        return "/course";
    }
    
    
    @RequestMapping(value="/logout", method=RequestMethod.GET)
    public String logout(HttpServletRequest request, HttpServletResponse resp) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if(auth != null) {
            new SecurityContextLogoutHandler().logout(request, resp, auth);
        }
        isLogged = false;
        return "redirect:/";
    }

    @RequestMapping(value="/login/error", method=RequestMethod.GET)
    public String loginError(ModelMap map) {
        map.addAttribute("login_error", "Wrong username or password given.");
        return "index";
    }
    @RequestMapping(value="/403", method=RequestMethod.GET)
    public String accessDenied(ModelMap map) {
        return "<h1><i>You don't have permission to access this page.</i></h1>";
    }
    @ModelAttribute("isLogged")
    public boolean isLogged() {
        return isLogged;
    } 
}
