<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@page import="model.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>ApplicationScopeResult.jsp</title>
</head>
<body>
	<fieldset>
		<legend>어플리케이션 영역에 저장된 속성 읽기</legend>
		<h2>리스트 계열 컬렉션</h2>
		<ul style="list-style-type:upper-roman;">
			<%
				List<MemberDTO> list=(List<MemberDTO>)application.getAttribute("list");
				for(MemberDTO item:list){
					out.println(String.format("<li>%s</li>",item));					
				}
			%>
		
		</ul>
		<h2>맵 계열 컬렉션</h2>
		<ul style="list-style-type:upper-roman;">
		<% 
			Map<String,MemberDTO> map=(Map<String,MemberDTO>)application.getAttribute("map");
			Set<String> keys=map.keySet();
			for(String key:keys){
				MemberDTO member=map.get(key);
			%>
				<li><%=member %></li>
			<%
			}
		%>
		</ul>
	</fieldset>
</body>
</html>