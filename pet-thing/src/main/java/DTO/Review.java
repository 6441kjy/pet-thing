package DTO;

public class Review {
 private Integer no;
 private Integer busino;
 private String id;
 private String star;
 private String contents;
 private String rdate;

 public Integer getNo() {
     return no;
 }

 public void setNo(Integer no) {
     this.no = no;
 }

 public Integer getBusino() {
     return busino;
 }

 public void setBusino(Integer busino) {
     this.busino = busino;
 }

 public String getId() {
     return id;
 }

 public void setId(String id) {
     this.id = id;
 }

 public String getStar() {
     return star;
 }

 public void setStar(String star) {
     this.star = star;
 }

 public String getContents() {
     return contents;
 }

 public void setContents(String contents) {
     this.contents = contents;
 }

 public String getRdate() {
     return rdate;
 }

 public void setRdate (String rdate) {
     this.rdate = rdate;
 }

}
