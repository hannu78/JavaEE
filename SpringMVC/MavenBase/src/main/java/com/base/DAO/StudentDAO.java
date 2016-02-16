/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.base.DAO;

import com.base.models.Students;
import com.base.util.HibernateUtil;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Ohjelmistokehitys
 */
public class StudentDAO {
    public static void addStudent(Students student) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        // Transaction is only needed when writing to database
        Transaction transaction = session.beginTransaction();
        System.out.println("Save student to database " + student.getSName());
        session.save(student);
        transaction.commit();
        // Release session
        session.close();
    }
    public static List<Students> getStudents() throws Exception {
        Session session = HibernateUtil.getSessionFactory().openSession();
        // Use hql query language here, not SQL!
        Query query = session.createQuery("from Students");
        List<Students> lst = query.list();
        session.close();
        return lst;
    }
}
