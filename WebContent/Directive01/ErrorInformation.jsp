<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isErrorPage="true"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>ErrorInformation.jsp</title>
</head>
<body>
	<fieldset>
		<legend>에러발생:관리자에게 문의하세요</legend>
		<h2>관리자 연락처:010-1234-5678</h2>
		<h2>관리자 연락처:010-1234-5678</h2>
		<h2>관리자 연락처:010-1234-5678</h2>
		<h2>관리자 연락처:010-1234-5678</h2>
		<h2>관리자 연락처:010-1234-5678</h2>
		<h2>관리자 연락처:010-1234-5678</h2>
		<h2>관리자 연락처:010-1234-5678</h2>
		<h2>관리자 연락처:010-1234-5678</h2>
		<h2>관리자 연락처:010-1234-5678</h2>
		<h2>관리자 연락처:010-1234-5678</h2>
		<h2>관리자 연락처:010-1234-5678</h2>
		<h2>관리자 연락처:010-1234-5678</h2>
		
		
		<!-- 
		exception내장객체는 page지시어의 isErrorPage속성이
		true인 jsp페이지에서만 사용가능	
	     -->
	     <h3>에러내용:<%=exception.getMessage() %></h3>
	</fieldset>
</body>
</html>