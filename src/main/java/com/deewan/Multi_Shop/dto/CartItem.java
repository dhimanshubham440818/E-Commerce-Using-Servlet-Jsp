package com.deewan.Multi_Shop.dto;

public class CartItem {

	private int cartItemId;
	private double cartItemPrice;
	private String cartItemName;
	private String cartItemImage;
	private double cartItemTotal;
	private int cartItemQuentity;

	public int getCartItemId() {
		return cartItemId;
	}
	public void setCartItemId(int cartItemId) {
		this.cartItemId = cartItemId;
	}
	public double getCartItemPrice() {
		return cartItemPrice;
	}
	public void setCartItemPrice(double cartItemPrice) {
		this.cartItemPrice = cartItemPrice;
	}
	public String getCartItemName() {
		return cartItemName;
	}
	public void setCartItemName(String cartItemName) {
		this.cartItemName = cartItemName;
	}
	public String getCartItemImage() {
		return cartItemImage;
	}
	public void setCartItemImage(String cartItemImage) {
		this.cartItemImage = cartItemImage;
	}
	public double getCartItemTotal() {
		return cartItemTotal;
	}
	public void setCartItemTotal(double cartItemTotal) {
		this.cartItemTotal = cartItemTotal;
	}
	public int getCartItemQuentity() {
		return cartItemQuentity;
	}
	public void setCartItemQuentity(int cartItemQuentity) {
		this.cartItemQuentity = cartItemQuentity;
	}
	@Override
	public String toString() {
		return "CartItem [cartItemId=" + cartItemId + ", cartItemPrice=" + cartItemPrice + ", cartItemName="
				+ cartItemName + ", cartItemImage=" + cartItemImage + ", cartItemTotal=" + cartItemTotal
				+ ", cartItemQuentity=" + cartItemQuentity + "]";
	}

}
