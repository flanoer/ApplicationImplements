<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>RequestForHeader.jsp</title>
</head>
<body>
	<fieldset>
		<legend>요청헤더명 : 요청 헤더값 </legend>
		<ul style="list-style-type: upper-roman;">
			<%
			/*
			request객체의 메소드]
			1]요청 헤더명 얻기:getHeaderNames()
			2]헤더명에 따른 헤더값:getHeader(헤더명)		
			*/	
			Enumeration<String> headerNames= request.getHeaderNames();
			while(headerNames.hasMoreElements()){
				//헤더명 얻기]
				String headerName=headerNames.nextElement();
				//헤더값 얻기]
				String headerValue=request.getHeader(headerName);
			
			%>
			<li><%=headerName %> : <%=headerValue %></li>
			<% }//while %>
		
		</ul>
	</fieldset>
	<fieldset>
		<legend>요청헤더명에 따른 브라우저 종료 알아내기</legend>
		<%
		String browser = request.getHeader("user-agent");
		if(browser.toUpperCase().indexOf("MSIE")==-1)
			out.println("<h2>기타 웹부라우저 및 IE 11.0입니다</h2>");
		else if(browser.toUpperCase().indexOf("MSIE 6.0")!=-1 ||
				browser.toUpperCase().indexOf("MSIE 7.0")!=-1 ||
				browser.toUpperCase().indexOf("MSIE 8.0")!=-1 
				)
			out.println("<h2>IE 6.0/7.0/8.0입니다</h2>");
		else
			out.println("<h2>IE 9.0/10.0입니다</h2>");
		
		
		%>
	</fieldset>
	
	
</body>
</html>