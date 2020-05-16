package dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import bean.AddQuestions;
import bean.QuestionOptions;
import helpingClasses.SessionFact;

public class QuestionOptionOperation implements QuestionOptionsDeclaration {
 
	SessionFactory sf;
	Session ss;
	Transaction tr;
	
	
	@Override
	public long insertQuestionOptions(QuestionOptions op) {
		ss=(SessionFact.getssionFact()).openSession();
		tr= ss.beginTransaction();
		long l=(long)ss.save(op);
		tr.commit();
		ss.close();
		if(l>0) {return l;}else
		{return 0;}
		 
	}

	@Override
	public long upDate(long id, QuestionOptions op) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public boolean delete(long id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public QuestionOptions selectQuestionOption(long id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List selectOptions() {
		// TODO Auto-generated method stub
		return null;
	}

	 
	 
}
