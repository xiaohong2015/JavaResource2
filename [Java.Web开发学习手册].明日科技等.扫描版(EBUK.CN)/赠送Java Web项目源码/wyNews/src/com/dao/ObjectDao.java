package com.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.actionForm.AfficheForm;

public class ObjectDao<T> {
	private static SessionFactory sessionFactory = null;
	private Session session = null;
	Transaction tx = null;
	static {
		try {
			Configuration config = new Configuration().configure();
			sessionFactory = config.buildSessionFactory();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	public boolean deleteT(T t) {
		Session session = sessionFactory.openSession();
		try {
			tx = session.beginTransaction();
			session.delete(t);
			tx.commit();
		} catch (Exception e) {
			return false;
		} finally {
			session.close();
		}
		return true;
	}

	public boolean saveT(T t) {
		Session session = sessionFactory.openSession();
		try {
			tx = session.beginTransaction();
			session.save(t);
			tx.commit();
		} catch (Exception e) {
			return false;
		} finally {
			session.close();
		}
		return true;
	}

	public boolean updateT(T t) {
		Session session = sessionFactory.openSession();
		try {
			tx = session.beginTransaction();
			session.update(t);
			tx.commit();
		} catch (Exception e) {
			return false;
		} finally {
			session.close();
		}
		return true;
	}

	
	
	public List<T> queryList(String hql) {
		session = sessionFactory.openSession();
		tx = session.beginTransaction();
		List<T> list = null;
		try {
			Query query = session.createQuery(hql);
			list = query.list();
		} catch (Exception e) {
		}
		tx.commit();
		session.close();
		return list;
	}

	public T queryFrom(String hql) {
		T t = null;
		session = sessionFactory.openSession();
		tx = session.beginTransaction();
		try {
			Query query = session.createQuery(hql);
			t = (T)query.uniqueResult();			
		} catch (Exception e) {
		}
		tx.commit();
		session.close();		
		return t;
	}
	
	
	public int queryListNumber(String hql){
		session = sessionFactory.openSession();
		tx = session.beginTransaction();
		int number=0;
		List<T> list = null;
		try {
			Query query = session.createQuery(hql);
			list = query.list();
			number=list.size();
		} catch (Exception e) {
		}
		tx.commit();
		session.close();
		return number;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
