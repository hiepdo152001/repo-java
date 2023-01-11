package com.devpro.Drake.dto;

import java.math.BigDecimal;
import java.util.Iterator;

/**
 * danh sách sản phẩm.
 * @author daing
 *
 */
public class CartItem {
	// mã sản phẩm 
	private int productId;
	
	private String avatar;
	
	private boolean status;
	
	// tên sản phẩm
	private String productName;
	
	// số lương sản phẩm
	private int quanlity;
	
	
	
	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	// đơn giá sản phẩm
	private BigDecimal priceUnit;

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getQuanlity() {
		return quanlity;
	}

	public void setQuanlity(int quanlity) {
		this.quanlity = quanlity;
	}

	public BigDecimal getPriceUnit() {
		return priceUnit;
	}

	public void setPriceUnit(BigDecimal priceUnit) {
		this.priceUnit = priceUnit;
	}

	

	

}
