package com.deewan.Multi_Shop.dto;

public class ContactDto {

	private String name;
	private String email;
	private String subject;
	private String messaage;

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getMessaage() {
		return messaage;
	}
	public void setMessaage(String messaage) {
		this.messaage = messaage;
	}
	@Override
	public String toString() {
		return "ContactDto [name=" + name + ", email=" + email + ", subject=" + subject + ", messaage=" + messaage
				+ "]";
	}

}
