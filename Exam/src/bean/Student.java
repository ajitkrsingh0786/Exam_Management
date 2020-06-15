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
import javax.persistence.ManyToMany;

@Entity
public class Student {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(unique = true, nullable = false)
	private long s_id;
	private String name,address,contact,course,password;
	
	@Column(unique=true,nullable=false)
	String username;
	
	@Column(unique = false)
	//@OneToMany(mappedBy = "war",fetch = FetchType.EAGER)
	@ManyToMany(cascade = CascadeType.ALL,fetch = FetchType.EAGER)
	private Set<Subject>subject=new HashSet<Subject>();
	
	
	public Student() {
		super();
	}




	public Set<Subject> getSubject() {
		return subject;
	}




	public void setSubject(Set<Subject> subject) {
		this.subject = subject;
	}




	public Student(String name, String address, String contact, String course, String username, String password) {
		super();
		this.name = name;
		this.address = address;
		this.contact = contact;
		this.course = course;
		this.username = username;
		this.password = password;
		
	}
	
	
	
	
	public long getS_id() {
		return s_id;
	}
	public void setS_id(long s_id) {
		this.s_id = s_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getCourse() {
		return course;
	}
	public void setCourse(String course) {
		this.course = course;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}
