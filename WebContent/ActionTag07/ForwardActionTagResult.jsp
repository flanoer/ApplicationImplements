<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>ForwardActionTagResult.jsp</title>
</head>
<body>
	<fieldset>
		<legend>포워드 및 리다이렉트로 이동한 페이지</legend>
		<ul style="list-style-type:upper-roman;">
			<li>페이지 영역:<%=pageContext.getAttribute("pagevar") %></li>
			<li>리퀘스트 영역:<%=request.getAttribute("requestvar") %></li>
		</ul>
	</fieldset>
</body>
</html>