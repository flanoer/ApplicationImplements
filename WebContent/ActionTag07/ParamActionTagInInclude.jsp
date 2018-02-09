<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//한글처리]
	request.setCharacterEncoding("UTF-8");	
	//리퀘스트 영역에 객체 저장]
	request.setAttribute("Member", new MemberDTO("LEE","1234","이길동",null,null));
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>ParamActionTagInInclude.jsp</title>
</head>
<body>
	<fieldset>
		<legend>포함되는 페이지에 파라미터 전달</legend>
		<jsp:include page="IncludedPage.jsp">
			<jsp:param value="쿼리스트링" name="query"/>
			<jsp:param value="홍길동" name="name"/>
			<jsp:param value="Hong" name="id"/>
		</jsp:include>
	</fieldset>
	
</body>
</html>