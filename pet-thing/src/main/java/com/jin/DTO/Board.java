package com.jin.DTO;
import java.sql.Date;

public class Board {

    private Integer writeno;

    private String id;

    private String title;

	private String writecontents;

    private String writedate;
    
    private Integer readno;
    
    private Integer pno;
    
    private Integer depth;

    private Integer level;
    
    
    public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	public Integer getPno() {
		return pno;
	}

	public void setPno(Integer pno) {
		this.pno = pno;
	}

	public Integer getDepth() {
		return depth;
	}

	public void setDepth(Integer depth) {
		this.depth = depth;
	}

	public Integer getReadno() {
		return readno;
	}

	public void setReadno(Integer readno) {
		this.readno = readno;
	}
    public Integer getWriteno() {
        return writeno;
    }

    public void setWriteno(Integer writeno) {
        this.writeno = writeno;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getWritecontents() {
        return writecontents;
    }

    public void setWritecontents(String writecontents) {
        this.writecontents = writecontents;
    }

    public String getWritedate() {
        return writedate;
    }

    public void setWritedate(String writedate) {
        this.writedate = writedate;
    }
}