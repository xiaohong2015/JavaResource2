package com.bOS.bPRO_PersonManage.service;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;


import com.bOS.bPRO_PersonManage.en.Job;
import com.bOS.bUtil.db.HibSessionFactory;

/**
 * @author BWeiMing
 *
 */
public class JobDao {

    public void addJob(Job job) throws HibernateException{
        job.setIsstock(new Byte("0"));
        job.setCreatetime(new java.util.Date());
        Session session = HibSessionFactory.currentSession();
        Transaction tx = session.beginTransaction();
        session.save(job);
        tx.commit();
        HibSessionFactory.closeSession();
    }
    
    public List listJob(byte isstock) throws HibernateException{
        Session session = HibSessionFactory.currentSession();
        Transaction tx = session.beginTransaction();
        Query query = session.createQuery("select j from Job as j where j.isstock = :isstock order by createtime");
        query.setByte("isstock",isstock);
        List list = query.list();
        tx.commit();
        HibSessionFactory.closeSession();
        return list;
    }
    
    public Job loadJob(long id) throws HibernateException{
        Session session = HibSessionFactory.currentSession();
        Transaction tx = session.beginTransaction();
        Job j = (Job) session.load(Job.class, new Long(id));
        tx.commit();	//ÐÂÌí¼ÓµÄ
        HibSessionFactory.closeSession();
        return j;

    }
    
    public void deleteJob(Job job) throws HibernateException{
        Session session = HibSessionFactory.currentSession();
        Transaction tx = session.beginTransaction();
        session.delete(job);
        tx.commit();
        HibSessionFactory.closeSession();
    }
    
    public void updateJob(Job job) throws HibernateException{
        Job j = loadJob(job.getId().longValue());
        if (job.getAge()!=null){
            j.setAge(job.getAge());
        }
        if(job.getContent()!=null){
            j.setContent(job.getContent());
        }
        if (job.getExperience() != null) {
            j.setExperience(job.getExperience());
        }
        if (job.getIsstock()!= null) {
            j.setIsstock(job.getIsstock());
        }
        if(job.getJob()!=null){
            j.setJob(job.getJob());
        }
        if(job.getName()!=null){
            j.setName(job.getName());
        }
        if(job.getSchool()!=null){
            j.setSchool(job.getSchool());
        }
        if(job.getSex()!=null){
            j.setSex(job.getSex());
        }
        if(job.getSpecialty()!=null){
            j.setSpecialty(job.getSpecialty());
        }
        if(job.getStudyeffort()!=null){
            j.setStudyeffort(job.getStudyeffort());
        }
        if(job.getTel()!=null){
            j.setTel(job.getTel());
        }
        if(job.getEmail()!=null){
            j.setEmail(job.getEmail());
        }
        Session session = HibSessionFactory.currentSession();
        Transaction tx = session.beginTransaction();
        session.update(j);
        tx.commit();
        HibSessionFactory.closeSession();
    }
}
