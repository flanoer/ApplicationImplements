<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>CookieExamLoginResult.jsp</title>
</head>
<body>
	<fieldset>
		<legend>로그인 성공 예제</legend>
		<ul style="list-style-type:upper-roman;">
			<li>아이디:<%=session.getAttribute("USER_ID") %></li>
			<li>비번:<%=session.getAttribute("USER_PWD") %></li>
		</ul>
		<a href="CookieExamLoginLogout.jsp">로그아웃</a>
	</fieldset>
</body>
</html>