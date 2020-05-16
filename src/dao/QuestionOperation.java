package dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import bean.AddQuestions;
import bean.Subject;
import helpingClasses.SessionFact;

public class QuestionOperation implements QuestionDeclaration {


	SessionFactory sf;
	Session ss;
	Transaction tr;
	
	@Override
	public long insertQuestion(AddQuestions qs) {
		ss=(SessionFact.getssionFact()).openSession();
		tr= ss.beginTransaction();
		long l=(long)ss.save(qs);
		tr.commit();
		ss.clear();
		ss.close();
		if(l>0) {return l;}else
		{return 0;}
	}

	@Override
	public long upDate(long id, AddQuestions qs) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public boolean delete(long id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public AddQuestions selectQuestion(long id) {
		ss=(SessionFact.getssionFact()).openSession();
		try {
			AddQuestions q=(AddQuestions)ss.get(AddQuestions.class, id);
		 
		if(q!=null)
		{
			return q;
			
			
		}
		else {
		return null;
		
		}}finally {
            ss.close();
        }
	}

	@Override
	public List selectQuestions() {
		String hql="from bean.AddQuestions";
		ss=(SessionFact.getssionFact()).openSession();
		org.hibernate.Query query=ss.createQuery(hql);
		List<AddQuestions> li=query.list();
		ss.close();
		if(li.size()>0)
		{
			return li;
		}
		return null;
	}

	
	
	
}
