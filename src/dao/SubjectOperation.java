package dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import bean.Student;
import bean.Subject;
import helpingClasses.SessionFact;

public class SubjectOperation implements SubjectDeclaration {
    
	SessionFactory sf;
	Session ss;
	Transaction tr;
	
	
	@Override
	public long insertSubject(Subject sb) {
		ss=(SessionFact.getssionFact()).openSession();
		tr=ss.beginTransaction();
		try {
		int l=(int)ss.save(sb);
		 
		tr.commit();
		if(l>0)
		{return l;}else {
		return 0;}}finally{
			ss.clear();
			ss.close();
	    }
	}

	@Override
	public int upDate(int sub_id, Subject sb) {
		ss=(SessionFact.getssionFact()).openSession();
		tr= ss.beginTransaction();
		sb.setSub_id(sub_id);
		try {
		ss.update(sb);
		tr.commit();
		return sub_id;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally {
            ss.close();
        }
		 return 0;
	}

	@Override
	public boolean delete(int id) {
		ss=(SessionFact.getssionFact()).openSession();
		tr=ss.beginTransaction();
		Subject sb=new Subject();
		sb.setSub_id(id);
		try {
			ss.delete(sb);
			tr.commit();
			return true;
			
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}finally {
            ss.close();}
		return false;
	}

	@Override
	public Subject selectSubject(int id) {
		ss=(SessionFact.getssionFact()).openSession();
		try {
		Subject st=(Subject)ss.get(Subject.class, id);
		 
		if(st!=null)
		{
			return st;
			
			
		}
		else {
		return null;
		
		}}finally {
           
            ss.close();
        }
		  
	}

	@Override
	public List selectSubjects() {
		String hql="from bean.Subject ";
		ss=(SessionFact.getssionFact()).openSession();
		org.hibernate.Query query=ss.createQuery(hql);
		List<Subject> lt=query.list();
		ss.close();
		if(lt.size()>0)
		{
			return lt;
		}
		else {
		return null;}
	
	}

	@Override
	public List searchByName(String sub_name) {
		ss=(SessionFact.getssionFact()).openSession();
		Criteria criteria =ss.createCriteria(Subject.class);
		criteria.add(Restrictions.like("sub_name","%"+sub_name+"%"));
		List li=criteria.list();
		ss.close();
		if(li.size()>0)
		{
			return li;
		}
		return null;
	}	

	
	
	
}
