package com.jin.DTO;

public class Attachfile {

    // 순번 
    private Integer writeno;

    // 첨부파일 
    private String attachedfile;

    // 원본파일 
    private String filepath;

    // 글번호 
    private Integer fno;

    public Integer getWriteno() {
        return writeno;
    }

    public void setWriteno(Integer writeno) {
        this.writeno = writeno;
    }

    public String getAttachedfile() {
        return attachedfile;
    }

    public void setAttachedfile(String attachedfile) {
        this.attachedfile = attachedfile;
    }

    public String getFilepath() {
        return filepath;
    }

    public void setFilepath(String filepath) {
        this.filepath = filepath;
    }

    public Integer getFno() {
        return fno;
    }

    public void setFno(Integer fno) {
        this.fno = fno;
    }

}