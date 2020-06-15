package dao;

import java.util.List;

import bean.QuestionOptions;

//import bean.AddQuestions;

public interface QuestionOptionsDeclaration {
	public long insertQuestionOptions(QuestionOptions op);
	public long upDate(long id,QuestionOptions op);
	public boolean delete(long id);
	public QuestionOptions selectQuestionOption(long id);
	public List selectOptions();
}
