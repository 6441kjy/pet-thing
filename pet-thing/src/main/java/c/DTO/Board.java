package c.DTO;

//Ŀ�´�Ƽ 
public class Board {

 private Integer no;
 private String title;
 private String id;
 private String contents;
 private String wdate;
 private String header;
 private int readno;
 private int level;

 	
 
	 public int getReadno() {
		return readno;
	}
	
	public void setReadno(int readno) {
		this.readno = readno;
	}
	
	public int getLevel() {
		return level;
	}
	
	public void setLevel(int level) {
		this.level = level;
	}

	public Integer getNo() {
	     return no;
	 }
	
	 public void setNo(Integer no) {
	     this.no = no;
	 }
	
	 public String getTitle() {
	     return title;
	 }
	
	 public void setTitle(String title) {
	     this.title = title;
	 }
	
	 public String getId() {
	     return id;
	 }
	
	 public void setId(String id) {
	     this.id = id;
	 }
	
	 public String getContents() {
	     return contents;
	 }
	
	 public void setContents(String contents) {
	     this.contents = contents;
	 }
	
	 public String getWdate() {
	     return wdate;
	 }
	
	 public void setWdate(String wdate) {
	     this.wdate = wdate;
	 }
	
	 public String getHeader() {
	     return header;
	 }
	
	 public void setHeader(String header) {
	     this.header = header;
	 }
}