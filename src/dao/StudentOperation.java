package dao;

//import java.awt.List;
import java.util.*;

import javax.persistence.Query;

import org.hibernate.Criteria;

//import javax.transaction.Transaction;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
//import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Restrictions;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;


import bean.Student;
import helpingClasses.SessionFact;

public class StudentOperation implements StudentDeclaration {
 
	SessionFactory sf;
	Session ss;
	Transaction tr;
	
	@Override
	public long insertStudent(Student st) {
		ss=(SessionFact.getssionFact()).openSession();
		tr= ss.beginTransaction();
		long l=(long)ss.save(st);
		tr.commit();
		 
		ss.close();
		if(l>0) {return l;}else
		{return 0;}
	}

	@Override
	public long upDate(long id, Student st) {
		ss=(SessionFact.getssionFact()).openSession();
		tr= ss.beginTransaction();
		st.setS_id(id);
		try {
		ss.update(st);
		tr.commit();
		long v=id;
		return id;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}finally {
			ss.close();
		}
		return 0;
	}

	@Override
	public boolean delete(long id) {
		ss=(SessionFact.getssionFact()).openSession();
		Student st=new Student();
		tr= ss.beginTransaction();
		st.setS_id(id);
		try {
		ss.delete(st);
		tr.commit();
		return true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}finally {
			ss.close();
		}
		return false;
	}

	@Override
	public Student selectStudent(long id) {
		ss=(SessionFact.getssionFact()).openSession();
		Student st=(Student)ss.get(Student.class,id);
		ss.close();
		if(st!=null)
		{
			return st;
		}
			
		return null;
	}

	@Override
	public List selectStudents() {
	   String hql="from bean.Student";	// TODO Auto-generated method stub
	   ss=(SessionFact.getssionFact()).openSession();
	   org.hibernate.Query query=ss.createQuery(hql);
	   List<Student> li=query.list();
	  // ListIterator lit=li.listIterator();
	   ss.close();
	   if(li.size()>0)
	   {
		   return li;
	   }
	   return null;
	}

	@Override
	public List searchByName(String name) {
		ss=(SessionFact.getssionFact()).openSession();
		Criteria criteria =ss.createCriteria(Student.class);
		criteria.add(Restrictions.like("name","%"+name+"%"));
		List li=criteria.list();
		ss.close();
		if(li.size()>0)
		{
			return li;
		}
		return null;
	}
	
	
	@Override
	public Student searchByUsername(String username ) {
		
		ss=(SessionFact.getssionFact()).openSession();
		Criteria criteria =ss.createCriteria(Student.class);
		criteria.add(Restrictions.like("username",username));
		Student st = (Student) criteria.uniqueResult();
		ss.close();
		return st;
	}
	
	/*public static void main(String []args)   
	{
		StudentOperation ope=new StudentOperation();
		ope.selectStudents();
	}*/		
}