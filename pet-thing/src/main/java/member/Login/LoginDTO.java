package member.Login;

import member.util.SHA256;
import member.util.SHA512;

public class LoginDTO {
	String id;
	String pw;
	//SHA256 encrypt = new SHA256();
	//SHA512 encrypt = new SHA512();
	
	public LoginDTO() {
		// TODO Auto-generated constructor stub
	}
	
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
		//this.pw = encrypt.encryptSHA256(pw);
		//System.out.println(this.pw + "pw");
	}
}
