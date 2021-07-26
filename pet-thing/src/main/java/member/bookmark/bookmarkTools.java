package member.bookmark;

public class bookmarkTools {
	String result="";
	
	public String getNavi(int total, int rowsPerPage, String url, int pageNumber) {
		int blockCnt = total/rowsPerPage;
		if(total%rowsPerPage>0)blockCnt++;
		
		if(pageNumber>1)result+=("<a href="+url+(pageNumber-1)+ " class='link-dark text-decoration-none'>◀</a>");
		for(int i=1;i<=blockCnt;i++){
			if(pageNumber==i)	result+=("<b>");
			result+=("<a href="+url+i+ " class='link-dark text-decoration-none'>["+i+"]</a>");
			if(pageNumber==i)	result+=("</b>");
		}
		if(pageNumber<blockCnt)result+=("<a href="+url+(pageNumber+1)+ " class='link-dark text-decoration-none'>▶</a>");
		
		
		return result;
	}

}
