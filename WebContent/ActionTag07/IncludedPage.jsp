<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<h2>인클루드된 페이지</h2>
	<h3>파라미터로 전달된 데이타</h3>
	<ul style="list-style-type:upper-roman;">
		<li>query:<%=request.getParameter("query") %></li>
		<li>name:<%=request.getParameter("name") %></li>
		<li>id:<%=request.getParameter("id") %></li>
	</ul>
	<h3>영역에 저장된 데이타</h3>
	<%=request.getAttribute("Member") %>
	