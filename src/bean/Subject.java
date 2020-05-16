package bean;
import java.util.HashSet;
 
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Subject {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	//@Column(unique = true, nullable = false)
	private int sub_id;
	
	//@Column(unique=true,nullable=false)
	private String sub_name;
	
	@OneToMany(mappedBy = "sub",cascade =CascadeType.MERGE ,fetch = FetchType.EAGER)
	private Set<AddQuestions>question=new HashSet<AddQuestions>();
	

	private int sub_max_marks,sub_passing_marks, sub_total_questions, sub_duration, sub_fees, sub_offer;


	public Subject() {
		super();
	}


	public Subject( String sub_name, int sub_max_marks, int sub_passing_marks, int sub_total_questions,
			int sub_duration, int sub_fees, int sub_offer) {
		super();
		//this.sub_id = sub_id;
		this.sub_name = sub_name;
		this.sub_max_marks = sub_max_marks;
		this.sub_passing_marks = sub_passing_marks;
		this.sub_total_questions = sub_total_questions;
		this.sub_duration = sub_duration;
		this.sub_fees = sub_fees;
		this.sub_offer = sub_offer;
	}


	public int getSub_id() {
		return sub_id;
	}


	public void setSub_id(int sub_id) {
		this.sub_id = sub_id;
	}


	public String getSub_name() {
		return sub_name;
	}


	public void setSub_name(String sub_name) {
		this.sub_name = sub_name;
	}


	public int getSub_max_marks() {
		return sub_max_marks;
	}


	public void setSub_max_marks(int sub_max_marks) {
		this.sub_max_marks = sub_max_marks;
	}


	public int getSub_passing_marks() {
		return sub_passing_marks;
	}


	public void setSub_passing_marks(int sub_passing_marks) {
		this.sub_passing_marks = sub_passing_marks;
	}


	public int getSub_total_questions() {
		return sub_total_questions;
	}


	public void setSub_total_questions(int sub_total_questions) {
		this.sub_total_questions = sub_total_questions;
	}


	public int getSub_duration() {
		return sub_duration;
	}


	public void setSub_duration(int sub_duration) {
		this.sub_duration = sub_duration;
	}


	public int getSub_fees() {
		return sub_fees;
	}


	public void setSub_fees(int sub_fees) {
		this.sub_fees = sub_fees;
	}


	public int getSub_offer() {
		return sub_offer;
	}


	public void setSub_offer(int sub_offer) {
		this.sub_offer = sub_offer;
	}


	public Set<AddQuestions> getQuestion() {
		return question;
	}


	public void setQuestion(Set<AddQuestions> question) {
		this.question = question;
	}


	 
 
	
	
}
