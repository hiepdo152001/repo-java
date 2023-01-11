package com.devpro.Drake.entities;

import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

@Entity
@Table(name ="tbl_users")
public class User  extends BaseEntity implements UserDetails{
	@Column(name="username" , length = 45, nullable = false)
	private String username ;
	
	@Column(name="password" , length = 100, nullable = false)
	private String password ;
	
	@Column(name="email" , length = 45, nullable = false)
	private String email ;
	@Column(name="adress", length = 45, nullable = true)
	private String adress;
	@Column(name="phone", length = 45, nullable = true)
	private String phone;
	@Column(name="avatar",length = 200,nullable = true)
	private String avatar;
	@Column(name="name",length = 45,nullable = true)
	private String name;
	
	@ManyToMany(cascade = CascadeType.ALL, 
		    fetch = FetchType.EAGER, 
		    mappedBy = "users")
private Set<Role> roles = new HashSet<Role>();
public void addRole(Role role) {
	roles.add(role);
	role.getUsers().add(this);
}
public void deleteRole(Role role) {
	roles.remove(role);
	role.getUsers().remove(this);
}
	
	
	public Set<Role> getRoles() {
		return roles;
	}
	public void setRoles(Set<Role> roles) {
		this.roles = roles;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
	
	public String getAdress() {
		return adress;
	}
	public void setAdress(String adress) {
		this.adress = adress;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		// TODO Auto-generated method stub
		return this.roles;
	}
	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}
	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}
	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}
	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return true;
	}
	

	
}
