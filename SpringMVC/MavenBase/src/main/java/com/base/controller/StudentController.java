/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.base.controller;

import com.base.DAO.StudentDAO;
import com.base.models.Students;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author Ohjelmistokehitys
 */
@Controller
public class StudentController {
    @RequestMapping(value="/admin/student", method=RequestMethod.GET)
    public String renderStudent(ModelMap map) {
        try {
            map.addAttribute("students", StudentDAO.getStudents());
        } catch (Exception e) {
            map.addAttribute("save_info", "List generation failed.");
            e.printStackTrace();
        }
        map.addAttribute("student", new Students());
        return "student";
    }
    @RequestMapping(value="/admin/student", method=RequestMethod.POST)
    public String addNewStudent(@ModelAttribute ("student") Students student, ModelMap map) {
        System.out.println(student.getSName());
        map.addAttribute("isLogged", "true");
        try {
            StudentDAO.addStudent(student);
            map.addAttribute("save_info", "Student added succesfully!");
            map.addAttribute("students", StudentDAO.getStudents());
            student.clearAttributes();
        } catch (Exception e) {
            map.addAttribute("save_info", "Database error occured.");
            e.printStackTrace();
        }
        return "student";
    }
}
