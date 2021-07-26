package c.DTO;

//ȸ������ 
public class Member {

 // id 
 private String id;

 // pw 
 private String pw;

 // ���� 
 private String gender;

 // �ּ� 
 private String address;

 // �̸� 
 private String name;

 // ���� 
 private String age;

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

 public String getAddress() {
     return address;
 }

 public void setAddress(String address) {
     this.address = address;
 }

 public String getName() {
     return name;
 }

 public void setName(String name) {
     this.name = name;
 }

 public String getAge() {
     return age;
 }

 public void setAge(String age) {
     this.age = age;
 }

 // Member �� ����
 public void CopyData(Member param)
 {
     this.id = param.getId();
     this.pw = param.getPw();
     this.gender = param.getGender();
     this.address = param.getAddress();
     this.name = param.getName();
     this.age = param.getAge();
 }
}
