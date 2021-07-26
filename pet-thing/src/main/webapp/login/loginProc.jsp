<%@page import="member.Login.GetLoginDTO"%>
<%@page import="java.util.List"%>
<%@page import="member.util.SHA512"%>
<%@page import="member.Login.LoginDTO"%>
<%@page import="java.sql.Connection"%>
<%@page import="member.Login.LoginDAO"%>
<%@page import="member.util.SHA256"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//SHA256 encrypt = new SHA256();
	SHA512 encrypt = new SHA512();
	LoginDTO loginDTO = new LoginDTO();
	LoginDAO loginDao = new LoginDAO();
	Connection conn = loginDao.getConn();
	
	//String loginPath = "main";
	
	//String path = "<jsp:forward page='/index.jsp'><jsp:param value='main' name='currentPage'/></jsp:forward>";
	//String script = "<script>alert('아이디 또는 비밀번호를 확인해주세요.')</script>";
	
	//String id = request.getParameter("id");
	//String encryptPw = encrypt.encryptSHA256(request.getParameter("pw"));
	String encryptPw = encrypt.encryptSHA512(request.getParameter("pw"));
	System.out.println(encryptPw);
	loginDTO.setId(request.getParameter("id"));
	loginDTO.setPw(encryptPw);
	
	//loginDTO.setPw(request.getParameter("pw"));
	
	String prevPage = request.getParameter("prevPage");
	//String url = request.getParameter("url");
	//String currentPage = request.getParameter("currentPage");
	
	
	//int result = loginDao.LoginProc(conn, loginDTO);
	
	List<GetLoginDTO> getLoginDTO = loginDao.getLoginInfo(conn, loginDTO);
	
	System.out.println(getLoginDTO);
	
	if(getLoginDTO.size()!=0) {
	
		String id = getLoginDTO.get(0).getId();
		int level = getLoginDTO.get(0).getLevel();
		
		session.setAttribute("userId", id);
		session.setAttribute("userLvl", level);
		
	} else{
		prevPage = request.getContextPath()+"/login/loginError.jsp";
	}
	
	//out.print(request.getParameter("id")+"<br>"+encryptPw+"<br>"+result+"<br>"+request.getHeader("referer"));
	
	/* if(result==1) {
		//pagePath = "request.getHeader('referer')"; 
		session.setAttribute("userId", loginDTO.getId());
	} else {
		prevPage = request.getContextPath()+"/login/loginError.jsp";
		//session.setAttribute("isModalOpen", true);
	} */
		response.sendRedirect(prevPage);
	
	
%>



