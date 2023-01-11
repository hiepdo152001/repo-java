package com.devpro.Drake.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name="tbl_contact")
public class Contact extends BaseEntity {

@Column(name="name" ,length = 45 , nullable = false)
private String name;

@Column(name="email" ,length = 45 , nullable =  false)
private String email;
@Column(name="message" , length = 1000, nullable = false)
private String message;

@Column(name="request_type" ,length = 45 ,nullable = true)
private String request_type;

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

public String getMessage() {
	return message;
}

public void setMessage(String message) {
	this.message = message;
}

public String getRequest_type() {
	return request_type;
}

public void setRequest_type(String request_type) {
	this.request_type = request_type;
}

}
