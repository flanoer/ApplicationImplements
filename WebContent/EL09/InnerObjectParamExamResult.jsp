<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	//한글처리
 	request.setCharacterEncoding("UTF-8");
    
 %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>InnerObjectParamExamResult.jsp</title>
</head>
<body>
	<fieldset>
	  <legend>JSP코드로 받기</legend>	 
	  	<ul>
		   <li>이름:<%=request.getParameter("name") %></li>
		   <li>성별:<%=request.getParameter("gender") %></li>
		   <%
		   	String[] inters=request.getParameterValues("inter");		    
		   %>	   
		   <li>관심사항:
		   	<%
		   		for(String inter:inters){
		   			out.println(inter+" ");
		   		}
		   	%>		   
		   </li>	   
		   <li>학력:<%=request.getParameter("grade") %></li>	 
	 	</ul>	  
 	</fieldset>
 	<fieldset>
	  <legend>EL로 받기</legend>	
	  <!-- 
			하나받을때:param.파라미터명 혹은 param["파라미터명"]
			여러개 받을때:paramValues.파라미터명 혹은 paramValues["파라미터명"]
		 --> 
	  	<ul>
		   <li>이름:${param.name } </li>
		   <li>성별:${param.gender } </li>	   
		   <li>관심사항:
		   <c:forEach var="item" items="${paramValues.inter }">
		   	${item }&nbsp;
		   </c:forEach>
		   
		   </li>	   
		   <li>학력:${param.grade }</li>	 
	 	</ul>	  
 	</fieldset>  
</body>
</html>