package dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;

import bean.Answer;
import bean.Student;
import bean.Subject;
import helpingClasses.SessionFact;

public class AnswerOperation implements AnswerDeclaration {
	SessionFactory sf;
	Session ss;
	Transaction tr;
	
	@Override
	public long insertAnswer(Answer as) {
		  
		ss=(SessionFact.getssionFact()).openSession();
		 ss.close();
		 ss=(SessionFact.getssionFact()).openSession();
		tr= ss.beginTransaction();
		ss.save(as);
		tr.commit();
		ss.close();
		//if(l>0) {return l;}else
		//{return 0;}
		return 1;
	}

	@Override
	public long upDate(long id, Answer as) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public boolean delete(long id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Answer selectAnswer(long id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List selectAnswer() {
		 String hql=("from bean.Answer");
		 ss=(SessionFact.getssionFact()).openSession();
		 org.hibernate.Query query=ss.createQuery(hql);
		 List<Answer> li=query.list();
		 ss.close();
		 if(li.size()>0)
		 {
			 return li;
		 }
		return null;
	}

	@Override
	public List searchByQid(long qid) {
		ss=(SessionFact.getssionFact()).openSession();
		Criteria criteria =ss.createCriteria(Answer.class);
		criteria.add(Restrictions.like("question_id",qid));
		List li=criteria.list();
		ss.close();
		if(li.size()>0)
		{
			return li;
		}else {
		return null;}
	}
	
	@Override
	public List searchByStudent$Subject(Student st,Subject sub) {
		ss=(SessionFact.getssionFact()).openSession();
		Criteria criteria =ss.createCriteria(Answer.class);
		 Criterion criterion=Restrictions.eq("st1",st);
		 Criterion criterion1=Restrictions.eq("sub1",sub);
		//criteria.add(Restrictions.and(Restrictions.eq("sub1",sub)));
		 Criterion criterion3 = Restrictions.and(criterion,criterion1);
		criteria.add(criterion3);
		List li=(List)criteria.list();
		ss.close();
		if(li.size()>0)
		{
			return li;
		}
		else {
		return null;}
	}
	
	

}
