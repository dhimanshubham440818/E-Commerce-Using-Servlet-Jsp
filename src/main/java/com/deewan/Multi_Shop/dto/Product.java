package com.deewan.Multi_Shop.dto;

public class Product {

	private int productId;
	private double productPrice;
	private String productName;
	private String productCategories;
	private String productImage;
	private double productActualPrice;
	private int productQuentity=1;

	public int getProductQuentity() {
		return productQuentity;
	}

	public void setProductQuentity(int productQuentity) {
		this.productQuentity = productQuentity;
	}

	public void setProductActualPrice(double productActualPrice) {
		this.productActualPrice = productActualPrice;
	}

	public double getProductActualPrice() {
		return productActualPrice;
	}

	public void setProductActualPrice(Double productActualPrice) {
		this.productActualPrice = productActualPrice;
	}

	public String getProductImage() {
		return productImage;
	}

	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}

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

	public double getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(double productPrice) {
		this.productPrice = productPrice;
	}

	public String getProductCategories() {
		return productCategories;
	}

	public void setProductCategories(String productCategories) {
		this.productCategories = productCategories;
	}

}
