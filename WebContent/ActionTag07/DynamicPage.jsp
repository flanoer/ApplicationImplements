<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>DynamicPage.jsp</title>
</head>
<body>
	<fieldset>
		<legend>페이지 선택해서 동적으로 페이지 포함하기</legend>
		<form>
			<select name="pageName">
				<option value="DirectivePage.jsp">DirectivePage.jsp</option>
				<option value="ActionTagPage.jsp">ActionTagPage.jsp</option>
			</select>
			<input type="submit" value="페이지 선택"/>
		</form>
		<%
		String pageName=request.getParameter("pageName");
		
		if(pageName !=null){
		%>
		<jsp:include page="<%=pageName %>"/>
		<%} %>
	</fieldset>
	
	<fieldset>
		<legend>계절에 따른 페이지 변화</legend>
		<%
		String seasonPage="";
		Calendar cal= Calendar.getInstance();
		int month=cal.get(Calendar.MONTH);
		switch(month+1){
			case 3:
			case 4:
			case 5:seasonPage="Spring.jsp";break;
			case 6:
			case 7:
			case 8:seasonPage="Summer.jsp";break;
			case 9:
			case 10:
			case 11:seasonPage="Autumn.jsp";break;
			default:seasonPage="Winter.jsp";
		}		
		%>
		<jsp:include page="<%=seasonPage %>"/>
	</fieldset>
</body>
</html>