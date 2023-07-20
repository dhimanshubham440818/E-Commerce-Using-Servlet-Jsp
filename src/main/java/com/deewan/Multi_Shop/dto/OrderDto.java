package com.deewan.Multi_Shop.dto;

public class OrderDto {

	private int orderItemProductId;
	private String orderItemName;
	private double orderItemPrice;
	private int orderItemQuentity;
	private double orderItemTotal;
	private String orderItemUserEmail;
	private String orderItemImage;
	private String productCategories;

	public String getProductCategories() {
		return productCategories;
	}
	public void setProductCategories(String productCategories) {
		this.productCategories = productCategories;
	}
	public int getOrderItemProductId() {
		return orderItemProductId;
	}
	public void setOrderItemProductId(int orderItemProductId) {
		this.orderItemProductId = orderItemProductId;
	}
	public String getOrderItemImage() {
		return orderItemImage;
	}
	public void setOrderItemImage(String orderItemImage) {
		this.orderItemImage = orderItemImage;
	}
	public int getOrderItemQuentity() {
		return orderItemQuentity;
	}
	public void setOrderItemQuentity(int orderItemQuentity) {
		this.orderItemQuentity = orderItemQuentity;
	}
	public String getOrderItemUserEmail() {
		return orderItemUserEmail;
	}
	public void setOrderItemUserEmail(String orderItemUserEmail) {
		this.orderItemUserEmail = orderItemUserEmail;
	}
	public double getOrderItemPrice() {
		return orderItemPrice;
	}
	public void setOrderItemPrice(double orderItemPrice) {
		this.orderItemPrice = orderItemPrice;
	}
	public String getOrderItemName() {
		return orderItemName;
	}
	public void setOrderItemName(String orderItemName) {
		this.orderItemName = orderItemName;
	}
	public double getOrderItemTotal() {
		return orderItemTotal;
	}
	public void setOrderItemTotal(double orderItemTotal) {
		this.orderItemTotal = orderItemTotal;
	}

	@Override
	public String toString() {
		return "OrderDto [orderItemProductId=" + orderItemProductId + ", orderItemName=" + orderItemName
				+ ", orderItemPrice=" + orderItemPrice + ", orderItemQuentity=" + orderItemQuentity
				+ ", orderItemTotal=" + orderItemTotal + ", orderItemUserEmail=" + orderItemUserEmail
				+ ", orderItemImage=" + orderItemImage + ", productCategories=" + productCategories + "]";
	}
}
