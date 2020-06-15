package dao;

import java.util.List;

import bean.Answer;
import bean.Student;
import bean.Subject;

 

public interface AnswerDeclaration {
	
	public long insertAnswer(Answer as);
	public long upDate(long id,Answer as);
	public boolean delete(long id);
	public Answer selectAnswer(long id);
	public List selectAnswer();
	public List searchByQid(long qid);
	public List searchByStudent$Subject(Student st,Subject sub);
	public Answer selectAnswerById(long id);
}
