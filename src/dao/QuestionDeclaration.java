package dao;

import java.util.List;

import bean.AddQuestions;
import bean.Student;

public interface QuestionDeclaration {
	
	public long insertQuestion(AddQuestions qs);
	public long upDate(long id,AddQuestions qs);
	public boolean delete(long id);
	public AddQuestions selectQuestion(long id);
	public List selectQuestions();
	

}
