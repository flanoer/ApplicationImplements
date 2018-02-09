<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//- 이 페이지는 서블릿으로 변환
	//- 즉 다른 페이지다
	//- 실행결과가 페이지에 포함된.
	//- request영역 공유
	
	//변수 선언]
	String actionTagString="액션태그로 포함된 페이지 안에서 선언한 변수";

%>
<h2>ActionTagPage.jsp 입니다</h2>
<ul style="list-style-type: decimal;">
	<li>페이지 영역:<%=pageContext.getAttribute("pagevar") %></li>
	<li>리퀘스트 영역:<%=request.getAttribute("requestvar") %></li>
</ul>