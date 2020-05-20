package bean;

import javax.persistence.*;

@Entity
public class Answer {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long Ans_id;
 
	@OneToOne 
   	private AddQuestions question;

	@ManyToOne 
	private Subject sub1;

	@ManyToOne 
	private Student st1;

	/*
	 * @OneToOne(cascade = CascadeType.ALL ) private AddQuestions q;
	 */

	String submit_answer, writeORwrong, date;

	public Answer() {
		super();
	}

	public Answer(Subject sub1, Student st1, AddQuestions question, String submit_answer, String writeORwrong, String date) {
		super();

		this.sub1 = sub1;
		this.st1 = st1;
		this.question= question;
		this.submit_answer = submit_answer;
		this.writeORwrong = writeORwrong;
		this.date = date;
	}

	public long getAns_id() {
		return Ans_id;
	}

	public void setAns_id(long ans_id) {
		Ans_id = ans_id;
	}

	public AddQuestions getQuestion() {
		return question;
	}

	public void setQuestion(AddQuestions question) {
		this.question = question;
	}

	public Subject getSub1() {
		return sub1;
	}

	public void setSub1(Subject sub1) {
		this.sub1 = sub1;
	}

	public Student getSt1() {
		return st1;
	}

	public void setSt1(Student st1) {
		this.st1 = st1;
	}

	public String getSubmit_answer() {
		return submit_answer;
	}

	public void setSubmit_answer(String submit_answer) {
		this.submit_answer = submit_answer;
	}

	public String getWriteORwrong() {
		return writeORwrong;
	}

	public void setWriteORwrong(String writeORwrong) {
		this.writeORwrong = writeORwrong;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	 

	 

}
