package com.bbs.model;

public class User {

	private String userId;
	private String userName;
	private String userPwd;
	private String userSex;
	private String userBirth;
	private String userShow;
	private int userHeat;

	private int userPermission1;

	private int userPermission2;
	private int userPermission3;
	private int userPermission4;

	public int getUserHeat() {
		return userHeat;
	}

	public void setUserHeat(int userHeat) {
		this.userHeat = userHeat;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserSex() {
		return userSex;
	}

	public void setUserSex(String userSex) {
		this.userSex = userSex;
	}

	public String getUserBirth() {
		return userBirth;
	}

	public void setUserBirth(String userBirth) {
		this.userBirth = userBirth;
	}

	public String getUserShow() {
		return userShow;
	}

	public void setUserShow(String userShow) {
		this.userShow = userShow;
	}

	public int getUserPermission1() {
		return userPermission1;
	}

	public void setUserPermission1(int userPermission1) {
		this.userPermission1 = userPermission1;
	}

	public int getUserPermission2() {
		return userPermission2;
	}

	public void setUserPermission2(int userPermission2) {
		this.userPermission2 = userPermission2;
	}

	public int getUserPermission3() {
		return userPermission3;
	}

	public void setUserPermission3(int userPermission3) {
		this.userPermission3 = userPermission3;
	}

	public int getUserPermission4() {
		return userPermission4;
	}

	public void setUserPermission4(int userPermission4) {
		this.userPermission4 = userPermission4;
	}


}
