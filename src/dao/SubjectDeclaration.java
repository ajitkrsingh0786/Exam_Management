package dao;

import java.util.List;

import bean.Student;
import bean.Subject;

public interface SubjectDeclaration {
	public long insertSubject(Subject sb);
	public int upDate(int id,Subject sb);
	public boolean delete(int id);
	public Subject selectSubject(int id);
	public List selectSubjects();
	public List searchByName(String name);
}
