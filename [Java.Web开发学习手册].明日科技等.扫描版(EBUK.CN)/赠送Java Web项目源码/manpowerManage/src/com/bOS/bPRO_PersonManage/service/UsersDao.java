package com.bOS.bPRO_PersonManage.service;

import java.util.Iterator;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;


import com.bOS.bPRO_PersonManage.en.Users;
import com.bOS.bUtil.db.HibSessionFactory;

/**
 * @author BWeiMing
 *  
 */
public class UsersDao {

    public void addUsers(Users users) throws HibernateException {
        users.setCreatetime(new java.util.Date());
        Session session = HibSessionFactory.currentSession();
        Transaction tx = session.beginTransaction();
        session.save(users);
        tx.commit();
        HibSessionFactory.closeSession();

    }

    public void deleteUsers(Users users) throws HibernateException {
        Session session = HibSessionFactory.currentSession();
        Transaction tx = session.beginTransaction();
        session.delete(users);
        tx.commit();
        HibSessionFactory.closeSession();

    }

    public void updateUsers(Users users) throws HibernateException {
        Users u = loadUsers(users.getId().longValue());
        if (users.getBirthday() != null){
            u.setBirthday(users.getBirthday());
        }
        if(users.getSex()!=null){
            u.setSex(users.getSex());
        }
        if (users.getContent() != null) {
            u.setContent(users.getContent());
        }
        if (users.getIsadmin() != null) {
            u.setIsadmin(users.getIsadmin());
        }
        if (users.getPassword() != null) {
            u.setPassword(users.getPassword());
        }

        Session session = HibSessionFactory.currentSession();
        Transaction tx = session.beginTransaction();
        session.update(u);
        tx.commit();
        HibSessionFactory.closeSession();
    }

    public Users loadUsers(long id) throws HibernateException {
        Session session = HibSessionFactory.currentSession();
        Transaction tx = session.beginTransaction();
        Users u = (Users) session.load(Users.class, new Long(id));
        return u;

    }

    public boolean logonUsers(Users users) throws HibernateException {
        Session session = HibSessionFactory.currentSession();
        Transaction tx = session.beginTransaction();
        Query query = session
                .createQuery("select count(*) from Users as u where username = :name and password =:password and isadmin=1");
        query.setString("name", users.getUsername());
        query.setString("password", users.getPassword());
        List list = null;
        list = query.list();
        tx.commit();
        HibSessionFactory.closeSession();
        if (list != null) {
            Iterator it = list.iterator();
            if (it.hasNext()) {
                if (((Long) it.next()).longValue()== 1) {
                    return true;
                }
            }
        }
        return false;
    }

    public List listUser() throws HibernateException {
        Session session = HibSessionFactory.currentSession();
        Transaction tx = session.beginTransaction();
        Query query = session
                .createQuery("select u from Users as u order by isadmin desc,createtime");
        List list = query.list();
        tx.commit();
        HibSessionFactory.closeSession();
        return list;
    }

}