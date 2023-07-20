package com.deewan.Multi_Shop.dto;

public class UserDto {

	private String userFirstname;
	private String userLastname;
	private String userEmail;
	private String userAddress;
	private long userMobile;
	private String userCountry;
	private String userState;
	private int userZipCode;
	private String userCity;

	public String getUserCity() {
		return userCity;
	}
	public void setUserCity(String userCity) {
		this.userCity = userCity;
	}
	public String getUserFirstname() {
		return userFirstname;
	}
	public void setUserFirstname(String userFirstname) {
		this.userFirstname = userFirstname;
	}
	public String getUserLastname() {
		return userLastname;
	}
	public void setUserLastname(String userLastname) {
		this.userLastname = userLastname;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
	public long getUserMobile() {
		return userMobile;
	}
	public void setUserMobile(long userMobile) {
		this.userMobile = userMobile;
	}
	public String getUserCountry() {
		return userCountry;
	}
	public void setUserCountry(String userCountry) {
		this.userCountry = userCountry;
	}
	public String getUserState() {
		return userState;
	}
	public void setUserState(String userState) {
		this.userState = userState;
	}
	public int getUserZipCode() {
		return userZipCode;
	}
	public void setUserZipCode(int userZipCode) {
		this.userZipCode = userZipCode;
	}
	@Override
	public String toString() {
		return "UserDto [userFirstname=" + userFirstname + ", userLastname=" + userLastname + ", userEmail=" + userEmail
				+ ", userAddress=" + userAddress + ", userMobile=" + userMobile + ", userCountry=" + userCountry + ", userState=" + userState + ", userZipCode=" + userZipCode + "]";
	}
}
