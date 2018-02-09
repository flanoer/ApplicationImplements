<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>ForwardExamMyPage.jsp</title>
</head>
<body>
	<fieldset>
		<legend>forward액션태그-로그인 결과 페이지</legend>
		<h2>세션 영역에서 읽기</h2>
		<ul style="list-style-type:decimal;">
			<li>아이디:<%=session.getAttribute("USER") %></li>
			<li>비번:<%=session.getAttribute("PASS") %></li>
		</ul>
		<h2>파라미터로 받기</h2>
		<ul style="list-style-type:decimal;">
			<li>아이디:<%=request.getParameter("user") %></li>
			<li>비번:<%=request.getParameter("pass") %></li>
		</ul>
		<h2><a href="Logout.jsp">로그 아웃</a></h2>
	</fieldset>
</body>
</html>