<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>ResponseForSelfPage.jsp</title>
</head>
<body>
	<fieldset>
		<legend>마이페이지</legend>
		<ul style="list-style-type: upper-latin;">
			<li>아이디:<%=request.getParameter("user") %></li>
			<li>비번:<%=request.getParameter("pass") %></li>
		</ul>
	</fieldset>
</body>
</html>