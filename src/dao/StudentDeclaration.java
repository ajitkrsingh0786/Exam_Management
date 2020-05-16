package dao;

import java.util.ArrayList;


import java.util.List;

import bean.Student;

public interface StudentDeclaration {
	public long insertStudent(Student st);
	public long upDate(long id,Student st);
	public boolean delete(long id);
	public Student selectStudent(long id);
	public List selectStudents();
	public List searchByName(String name);
	public Student searchByUsername(String username);
}
