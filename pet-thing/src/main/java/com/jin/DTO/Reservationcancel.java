package com.jin.DTO;

public class Reservationcancel {

    // 예약번호 
    private Integer no;

    // 예약날짜 
    private String revdate;

    // 예약이름 
    private String revname;

    // 진행상황 
    private String progress;

    // 예약자 
    private String id;

    // 예약시간 
    private String revtime;

    // 장소번호 
    private Integer busino;

    // 예약자 이름 
    private String name;
    
    // 취소 번호
    private Integer cancelno;

    public Integer getNo() {
        return no;
    }

    public void setNo(Integer no) {
        this.no = no;
    }

    public String getRevdate() {
        return revdate;
    }

    public void setRevdate(String revdate) {
        this.revdate = revdate;
    }

    public String getRevname() {
        return revname;
    }

    public void setRevname(String revname) {
        this.revname = revname;
    }

    public String getProgress() {
        return progress;
    }

    public void setProgress(String progress) {
        this.progress = progress;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getRevtime() {
        return revtime;
    }

    public void setRevtime(String revtime) {
        this.revtime = revtime;
    }

    public Integer getBusino() {
        return busino;
    }

    public void setBusino(Integer busino) {
        this.busino = busino;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

	public Integer getCancelno() {
		return cancelno;
	}

	public void setCancelno(Integer cancelno) {
		this.cancelno = cancelno;
	}
    
    

  
}
