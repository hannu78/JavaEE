/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.base.DAO;

import com.base.models.User;
import com.base.util.HibernateUtil;
import java.util.List;
import org.hibernate.Hibernate;
import org.hibernate.Session;

/**
 *
 * @author Ohjelmistokehitys
 */
public class UserDAO {

    public static User findByUserName(String userName){
        
        List<User> lst = null;
        
        //MIKÄ HELEVETTI TÄSSÄ MENEE PIELEEN?
        //java.lang.NoClassDefFoundError: Could not initialize class com.base.util.HibernateUtil
	//com.base.DAO.UserDAO.findByUserName(UserDAO.java:23)
        Session session = HibernateUtil.getSessionFactory().openSession();
        lst = session.createQuery("FROM User where username=?").
                setParameter(0, userName).list();
        
        if(!lst.isEmpty()){
            Hibernate.initialize(lst.get(0).getUserRoleses());
        }
        session.close();
        
        if(!lst.isEmpty()){
            return lst.get(0);
        }
        else{
            return null;
        }
    }
    
}
