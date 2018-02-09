<%@page import="java.util.Collection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//[응답헤더 설정]
	/*
	웹브라우저의 캐쉬를 이용하지 않겠다
	즉 현재 페이지를 매번 서버에 요청하도록 만드는 것
	*/
	//HTTP/1.0에 적용시킬때
	response.setHeader("pragma", "no-cache");
	//HTTP/1.1에 적용시킬때
	response.setHeader("cache-control", "no-cache");
	/*
	웹브라우저가 인식하지 못하는 
	Content-Type(MIME타입)인 경우
	웹브라우저는 파일 다운로드창을 보여준다
	※다운로드 구현시 적용
	
	IE에서는 아무값이나 FX에서는 
	application/unknown이나
	binary/octect-stream등
	*/
	//response.setContentType("binary/octect-stream");
	/*
		add계열:기존 헤더명이 존재시 계속 추가,없을시 생성됨
		set계열:기존 헤더명이 존재시 기존 헤더명의 값이 변경됨,
		        없을시 생성.	
	*/
	//오늘 날짜를 SET계열로 CurrentDate란 응답헤더명으로 생성]		
	long time = new Date().getTime();
	response.setDateHeader("currentDate",time);
	//특정 날짜를 ADD계열로 currentDate란 응답헤더명으로 생성]
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	time=dateFormat.parse("2017-10-18").getTime();
	response.addDateHeader("currentDate", time);
	//response.setDateHeader("currentDate", time);
	//ADD계열로 NumberOfStudent라는 헤더명 생성]
	response.addIntHeader("NumberOfStudent", 22);		
	//SET계열로 NumberOfStudent라는 헤더명의 헤더값 변경]
	response.setIntHeader("NumberOfStudent", 0);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>ResponseForHeader.jsp</title>
</head>
<body>
	<fieldset>
		<legend>응답헤더</legend>
		<ul style="list-style-type:upper-latin;">
			<%
			//1]응답 헤더 명 얻기:getHeaderNames()	
				Collection<String> names=response.getHeaderNames();
				for(String name:names){
					//2]응답헤더명에 따른 응답헤더값:getHeader(헤더명)
					String value=response.getHeader(name);
					out.println("<li>"+name+" : " + value+"</li>");
				}
			%>
			
		</ul>
		<h2>응답헤더명 존재여부 판단:boolean containsHeader("응답헤더명")</h2>
		<h4>Content-Type존재 여부</h4>
		<%=response.containsHeader("Content-Type") ? "Content-Type헤더 존재" : "Content-Type헤더 미존재" %>
		<h4>currentDate존재 여부</h4>
		<%=response.containsHeader("CURRENTDate") ? "CURRENTDate헤더 존재" : "CURRENTDate헤더 미존재" %>
	</fieldset>
</body>
</html>