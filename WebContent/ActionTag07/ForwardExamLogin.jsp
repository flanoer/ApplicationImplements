<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>ForwardExamLogin.jsp</title>
</head>
<body>
	<fieldset>
		<legend>forward액션태그-로그인 예제</legend>
		<form method="post" action="ForwardExamProcess.jsp">
			아이디 <input type="text" name="user" value='<%=request.getParameter("user")==null?"":request.getParameter("user")%>'/>
			비밀번호 <input type="password" name="pass" value='<%=request.getParameter("pass")==null?"":request.getParameter("pass")%>'/>
			<input type="submit" value="로그인"/>
		</form>
		<span style="color:red;font-size:1.5em;font-weight:bold"><%=request.getAttribute("ERROR")==null?"":request.getAttribute("ERROR")%></span>
	</fieldset>
</body>
</html>