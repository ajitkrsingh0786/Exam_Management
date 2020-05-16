package bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class QuestionOptions {
	@Id
	@GeneratedValue
	private long id;
	
	@Column(nullable=false)
	String option_1,Option_2,Option_3,Option_4;
	
	
	public QuestionOptions() {
		super();
	}

	public QuestionOptions(String option_1, String option_2, String option_3, String option_4) {
		super();
		this.option_1 = option_1;
		Option_2 = option_2;
		Option_3 = option_3;
		Option_4 = option_4;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getOption_1() {
		return option_1;
	}

	public void setOption_1(String option_1) {
		this.option_1 = option_1;
	}

	public String getOption_2() {
		return Option_2;
	}

	public void setOption_2(String option_2) {
		Option_2 = option_2;
	}

	public String getOption_3() {
		return Option_3;
	}

	public void setOption_3(String option_3) {
		Option_3 = option_3;
	}

	public String getOption_4() {
		return Option_4;
	}

	public void setOption_4(String option_4) {
		Option_4 = option_4;
	}
	
	
	

}
