package bean;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class AddQuestions {
	
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
@Column(unique = true, nullable = false)
private long q_id;

@Column(nullable=false)
private String question_type;

@Column(nullable=false)
private String question_text,answer_text;
private int q_marks;

 
@ManyToOne(cascade = CascadeType.ALL,fetch = FetchType.EAGER)
private Subject sub;

@OneToOne(cascade = CascadeType.ALL,fetch = FetchType.EAGER)
private QuestionOptions opt;

public AddQuestions() {
	super();
}


public AddQuestions(String question_type, String question_text, String answer_text,
		int q_marks) {
	super();
	 
	//this.written = written;
	this.question_type = question_type;
	this.question_text = question_text;
	this.answer_text = answer_text;
	this.q_marks = q_marks;
}


public QuestionOptions getOpt() {
	return opt;
}


public void setOpt(QuestionOptions opt) {
	this.opt = opt;
}


public Subject getSub() {
	return sub;
}


public void setSub(Subject sub) {
	this.sub = sub;
}


public long getQ_id() {
	return q_id;
}
public void setQ_id(long q_id) {
	this.q_id = q_id;
}
/*public String getWritten() {
	return written;
}
public void setWritten(String written) {
	this.written = written;
}*/
public String getQuestion_type() {
	return question_type;
}
public void setQuestion_type(String question_type) {
	this.question_type = question_type;
}
public String getQuestion_text() {
	return question_text;
}
public void setQuestion_text(String question_text) {
	this.question_text = question_text;
}
public String getAnswer_text() {
	return answer_text;
}
public void setAnswer_text(String answer_text) {
	this.answer_text = answer_text;
}
public int getQ_marks() {
	return q_marks;
}
public void setQ_marks(int q_marks) {
	this.q_marks = q_marks;
}




}
