<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.FileRenamePolicy"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//1]한글처리
	request.setCharacterEncoding("UTF-8");
	/*
	2]파일 업로드를 위한 MultipartRequest객체 생성
	 ※MultipartRequest객체 생성만으로 파일 업로드가 이루어짐
	
	MultipartRequest(
	 javax.servlet.http.HttpServletRequest request,
	 java.lang.String saveDirectory,
	 int maxPostSize,
	 java.lang.String encoding,
	 FileRenamePolicy policy) 
	 
	 ※MultipartRequest 객체 생성시, 
	  최대 업로드 용량 초과시에는 예외 발생
	*/
	//3]MultipartRequest객체 생성자의 인자 설정
	//3-1]업로드할 서버의 물리적 디렉토리 설정
	String saveDirectory = application.getRealPath("/Upload");
	//3-2]업로드 최대 용량 설정(바이트 단위)
	//파일을 여러개 업로드시에는
	//각각의 용량을 합친 크기가 최대 용량이다.
	int maxPostSize = 1024 * 500;//500KB
	//3-3]인코딩 타입 설정
	String encoding ="UTF-8";
	//3-4]파일명이 중복된 경우 파일명을 재정의하도록
	//    FileRenamePolicy객체 얻기(인덱스가 자동으로 부여됨)
	FileRenamePolicy policy = new DefaultFileRenamePolicy();
	//4]MultipartRequest객체 생성
	MultipartRequest mr=null;
	String name=null;
	String title=null;
	StringBuffer buffer = new StringBuffer();
	try{
		mr = new MultipartRequest(
				request,
				saveDirectory,
				maxPostSize,
				encoding,policy);
		
		//5]기타 폼의 하위 요소 받기 
		//MultipartRequest객체로 받는다.
		name= mr.getParameter("name");
		title= mr.getParameter("title");
		String[] inters=mr.getParameterValues("inter");
		for(String inter:inters) buffer.append(inter+"&nbsp;");
	}
	catch(Exception e){
		//에러내용을 리퀘스트  영역에 저장]
		request.setAttribute("error","파일 용량을 초과 했어요");
		//UploadForm.jsp로 포워드]
		request.getRequestDispatcher("UploadForm.jsp").forward(request, response);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>UploadComplete.jsp</title>
</head>
<body>
	<fieldset>
	  <legend>파일 업로드 결과</legend>
	  <h2>type="file" 요소를 제외한 폼 요소</h2>
	  <ul style="list-style-type:decimal; ">
	   <li>이름:<%=name %></li>
	   <li>제목:<%=title %></li>
	   <li>관심사항:<%=buffer %></li>
	  </ul>
	  <h2>업로드된 파일 관련 정보</h2>
	  <h3>첫번째 파일</h3>
	  <ul style="list-style-type:decimal; ">
	   <li>원본 파일명:<%=mr.getOriginalFileName("attachedFile1") %></li>
	   <li>실제 서버에 저장된 파일명:<%=mr.getFilesystemName("attachedFile1") %></li>
	   <li>컨텐츠 타입:<%=mr.getContentType("attachedFile1") %></li>
	   <li>파일 크기:<%=(int)Math.ceil(mr.getFile("attachedFile1").length()/1024.0) %>KB</li>
	  </ul>
	  <h3>두번째 파일</h3>
	  <ul style="list-style-type:decimal; ">
	  <li>원본 파일명:<%=mr.getOriginalFileName("attachedFile2") %></li>
	   <li>실제 서버에 저장된 파일명:<%=mr.getFilesystemName("attachedFile2") %></li>
	   <li>컨텐츠 타입:<%=mr.getContentType("attachedFile2") %></li>
	   <li>파일 크기:<%=(int)Math.ceil(mr.getFile("attachedFile2").length()/1024.0) %>KB</li>
	  </ul>
	 </fieldset>
</body>
</html>