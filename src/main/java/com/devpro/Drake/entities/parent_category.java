//package com.devpro.Drake.entities;
//
//import java.util.HashSet;
//import java.util.Set;
//
//import javax.persistence.CascadeType;
//import javax.persistence.Column;
//import javax.persistence.Entity;
//import javax.persistence.FetchType;
//import javax.persistence.OneToMany;
//import javax.persistence.Table;
//
//@Entity
//@Table(name = "tbl_parent_category")
//public class parent_category extends BaseEntity{
//	@Column(name = "name", nullable = false)
//	private String name;
//    
//	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "parent")
//	private Set<Categories> categories = new HashSet<Categories>();
//	public void addProductImages(Categories categoriess) {
//		categoriess.setParent(categoriess);
//		categories.add(categoriess);
//	}
//	public void deleteProductImages(Categories categoriess) {
//		categoriess.setParent(categoriess);
//		categories.remove(null);
//	}
//	public String getName() {
//		return name;
//	}
//	public void setName(String name) {
//		this.name = name;
//	}
//	
//}
