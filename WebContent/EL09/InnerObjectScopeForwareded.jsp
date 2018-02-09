<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>InnerObjectScope.jsp</title>
</head>
<body>
	<fieldset>
		<legend>EL의 XXXXScope계열 내장객체</legend>
		<h2>자바코드로 각 저장된 속성 읽기</h2>
		<ul style="list-style-type:upper-roman;">
			<li><%=pageContext.getAttribute("scopevar") %></li>
			<li><%=request.getAttribute("scopevar") %></li>
			<li><%=session.getAttribute("scopevar") %></li>
			<li><%=application.getAttribute("scopevar") %></li>
		</ul>
		<h2>각 영역에 저장된 속성읽기(XXXXScope지정)</h2>
		<ul style="list-style-type:upper-roman;">
			<li>\${pageScope.scopevar}:${pageScope.scopevar}</li>
			<li>\${requestScope['scopevar']}:${requestScope['scopevar']}</li>
			<li>\${sessionScope["scopevar"]}:${sessionScope["scopevar"]}</li>
			<li>\${applicationScope.scopevar}:${applicationScope.scopevar}</li>
		</ul>
		<h2>각 영역에 저장된 속성읽기(XXXXScope 미지정)</h2>
		<ul style="list-style-type:upper-roman;">
			<li>\${scopevar}:${scopevar}</li>
			<li>\${scopevar}:${scopevar}</li>
			<li>\${scopevar}:${scopevar}</li>
			<li>\${scopevar}:${scopevar}</li>
		</ul>
	</fieldset>
	
</body>
</html>