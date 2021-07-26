package com.jin.DTO;

//ȸ������ 
public class Member {
	// ���̵�
	private String id;
	// �н�����
	private String pw;
	// ����
	private String gender;
	// �̸���
	private String email;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	// Member �� ����
	public void CopyData(Member param) {
		this.id = param.getId();
		this.pw = param.getPw();
		this.gender = param.getGender();
		this.email = param.getEmail();
	}
}
