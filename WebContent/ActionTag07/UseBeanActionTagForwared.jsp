<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>UseBeanActionTagForwared.jsp</title>
</head>
<body>
	<fieldset>
		<legend>포워드된 페이지</legend>
		<!-- 
			※자바코드에서 사용한 인스턴스 변수는
			  액션태그에서 사용불가.
			  단, 액션태그에서 사용한 변수(id속성에 지정한 값)는 
			  자바코드에서도 사용가능		
		 --> 
		 <!-- 자바코드로 영역에 있는 객체 얻기 -->	
		 <%-- MemberDTO member =(MemberDTO)request.getAttribute("member"); --%>
		 <%--=member --%>	
		 <!--  jsp:getProperty property="id" name="member"/>-->
		 <jsp:useBean id="member" scope="request" class="model.MemberDTO"/>
		 <h2>액션태그로 읽어오기</h2>
		 <ul style="list-style-type:upper-roman;">
			<li>아이디:<jsp:getProperty name="member" property="id" /></li>
			<li>비번:<jsp:getProperty name="member" property="pwd" /></li>
			<li>이름:<jsp:getProperty name="member" property="name" /></li>
			<li>나이:<jsp:getProperty name="member" property="age" /></li>
		</ul>
		<h2>자바코드로 읽어오기</h2>
		 <ul style="list-style-type:upper-roman;">
			<li>아이디:<%=member.getId() %></li>
			<li>비번:<%=member.getPwd() %></li>
			<li>이름:<%=member.getName() %></li>
			<li>나이:<%=member.getAge() %></li>
		</ul>
		 
	</fieldset>
</body>
</html>