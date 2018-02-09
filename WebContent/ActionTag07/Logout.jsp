<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//로그아웃 처리
	session.invalidate();
	//다시 로그인페이지로 이동
	response.sendRedirect("ForwardExamLogin.jsp");
%>