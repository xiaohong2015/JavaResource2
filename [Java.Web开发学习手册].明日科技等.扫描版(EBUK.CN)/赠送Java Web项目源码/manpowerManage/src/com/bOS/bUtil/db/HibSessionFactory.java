package com.bOS.bUtil.db;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

/**
 * @author BWeiMing
 *  
 */
public class HibSessionFactory{

    private static SessionFactory sf=null;
    public static final ThreadLocal session = new ThreadLocal();

    private HibSessionFactory() {
    }

    private static SessionFactory getSession() throws HibernateException {
        if (sf == null) {
            return new Configuration().configure().buildSessionFactory();
        }else{
            return sf;
        }
    }

    public static Session currentSession() throws HibernateException {
        Session s = (Session) session.get();
        if (s == null) {
            s = HibSessionFactory.getSession().openSession();
            session.set(s);
        }
        return s;
    }

    public static void closeSession() throws HibernateException {
        Session s = (Session) session.get();
        session.set(null);
        if (s != null)
            s.close();
    }
}