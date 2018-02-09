<%@page import="java.util.StringTokenizer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>ForTokensTag.jsp</title>
</head>
<body>
	<fieldset>
		<legend>forTokens태그</legend>
		<%
		String color="red,green,blue,#ff88dd";
		StringTokenizer tokens = new StringTokenizer(color,",");
		out.println("<h2>StringTokenizer클래스</h2>");
		out.println("<h3>토큰 수:"+tokens.countTokens()+"</h3>");
		//hasMoreTokens():꺼내올 토큰이 있으면 true,없으면 false반환
		while(tokens.hasMoreTokens()){
			//토큰을 꺼내올때는 nextToken()
			String token=tokens.nextToken();
			out.println("<h4 style='color:"+token+"'>TOKEN</h4>");
		}
		
		String[] colors=color.split(",");
		out.println("<h2>String클래스 사용</h2>");
		for(String token:colors){
			out.println("<h4 style='color:"+token+"'>TOKEN</h4>");
		}
		%>
		<h2>JSTL의 forTokens태그 사용</h2>
		<c:forTokens items="<%=color %>" delims="," var="color">
			<h4 style="color:${color}">TOKEN</h4>
		</c:forTokens>
	</fieldset>
</body>
</html>