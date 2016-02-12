/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.base.DAO;

import com.base.models.Teachers;
import com.base.util.HibernateUtil;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 * This class is for making CRUD operations to teacher table
 * @author Ohjelmistokehitys
 */
public class TeacherDAO {
    /** 
     * This method adds a new teacher to database
     * @param teacher
     * @throws java.lang.Exception
    **/
    public static void addTeacher(Teachers teacher) throws Exception {
        //Create session to database
        Session session = HibernateUtil.getSessionFactory().openSession();
        // Transaction is only needed when writing to database
        Transaction transaction = session.beginTransaction();
        System.out.println("Save teacher to database " + teacher.getTName());
        session.save(teacher);
        transaction.commit();
        // Release session
        session.close();
    }
    public static List<Teachers> getTeachers() throws Exception {
        Session session = HibernateUtil.getSessionFactory().openSession();
        // Use hql query language here, not SQL!
        Query query = session.createQuery("from Teachers");
        List<Teachers> lst = query.list();
        session.close();
        return lst;
    }
}   
