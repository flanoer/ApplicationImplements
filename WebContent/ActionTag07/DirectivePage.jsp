<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//-서블릿으로 변환 안됨 
	// 즉 페이지에 포함되서 서블릿으로 변홤됨으로
	// 같은 페이지다.		
	//변수 선언]
	String directiveString="지시어로 포함된 페이지 안에서 선언한 변수";

%>
<h2>DirectivePage.jsp 입니다</h2>
<ul style="list-style-type: decimal;">
	<li>페이지 영역:<%=pageContext.getAttribute("pagevar") %></li>
	<li>리퀘스트 영역:<%=request.getAttribute("requestvar") %></li>
</ul>