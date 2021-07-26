package map.lost;

import java.util.Date;

public class LostPetDTO {
    // 등록번호 
    private Integer no;

    // 동물이름 
    private String petname;

    // 종류 
    private Integer chk;

    // 종 
    private String species;

    // 성별 
    private Integer petgender;

    // 실종날짜 
    private String mdate;

    // 기타정보 
    private String info;

    // 등록자아이디 
    private String id;

    // x좌표 
    private String x;

    // Y좌표 
    private String y;

    // 연락처 
    private String phone;

    public Integer getNo() {
        return no;
    }

    public void setNo(Integer no) {
        this.no = no;
    }

    public String getPetname() {
        return petname;
    }

    public void setPetname(String petname) {
        this.petname = petname;
    }

    public Integer getChk() {
        return chk;
    }

    public void setChk(Integer chk) {
        this.chk = chk;
    }

    public String getSpecies() {
        return species;
    }

    public void setSpecies(String species) {
        this.species = species;
    }

    public Integer getPetgender() {
        return petgender;
    }

    public void setPetgender(Integer petgender) {
        this.petgender = petgender;
    }

    public String getMdate() {
        return mdate;
    }

    public void setMdate(String mdate) {
        this.mdate = mdate;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getX() {
        return x;
    }

    public void setX(String x) {
        this.x = x;
    }

    public String getY() {
        return y;
    }

    public void setY(String y) {
        this.y = y;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}
