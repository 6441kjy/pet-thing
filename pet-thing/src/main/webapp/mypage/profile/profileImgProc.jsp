<%@page import="com.jin.Board.UploadFileDAO"%>
<%@page import="com.jin.Board.SaveFile"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	//request아니라서 안됨
	//String prevPage = request.getParameter("prevPage");
    
    //out.print(prevPage);
    
    //로그인 정보 연동없어 임의 값
	String userId = (String) session.getAttribute("userId");
    
    SaveFile saveFile = new SaveFile();
    UploadFileDAO uploadFileDAO = new UploadFileDAO();
    
    saveFile.saveFile(request, userId);
    
    
    //uploadFileDAO.insertProfileImg();
	
%>
<jsp:forward page="/index.jsp">
	<jsp:param value="mypage" name="currentPage"/>
</jsp:forward>
