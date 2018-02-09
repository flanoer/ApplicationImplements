<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>UseBeanActionTagBasic.jsp</title>
</head>
<body>
	<fieldset>
		<legend>useBean액션 태그</legend>
		<!-- useBean액션태그는 무조건 기본 생성자를 사용해서
		      객체 생성]
		 -->
		<jsp:useBean id="member" class="model.MemberDTO" scope="request"/>
		<!--  
		위 액션태그를 자바코드 만으로 코딩시 
		아래와 같다 -->
		<%--
			//1]scope속성에 지정한 영역에서 객체 얻기
			MemberDTO member=(MemberDTO)request.getAttribute("member");
			//2]영역에 존재하지 않을때 생성
			if(member== null){
				//기본 생성자로 생성]
				member = new MemberDTO();
				//생성된 객체를 SCOPE에 지정한 영역에 저장]
				request.setAttribute("member", member);			
			}
		
		--%>
		<%=member %>
		<h2>setProperty액션태그로 자바빈 객체 속성 설정</h2>
			<!-- 
		  - setter를 호출한 것과 같다
		  - name속성에는 액션태그로 자바빈 객체 생성시 
		    id속성에 지정한 값
		  -->
		<!-- 자바코드로 속성 설정 -->
		<% member.setAge("20"); %>
		<% member.setName("김길동"); %>
		<!-- 액션 태그로 속성 설정 -->
		<jsp:setProperty property="id" name="member" value="KIM"/>
		<jsp:setProperty property="pwd" name="member" value="1234"/>
		<%=member %>
		<h2>getProperty액션태그로 자바빈 객체 속성 읽기</h2>
		<!-- getter를 호출한 것과 같다 -->
		<ul style="list-style-type:upper-roman;">
			<li>아이디:<jsp:getProperty name="member" property="id" /></li>
			<li>비번:<jsp:getProperty name="member" property="pwd" /></li>
			<li>이름:<jsp:getProperty name="member" property="name" /></li>
			<li>나이:<%=member.getAge() %></li>
		</ul>
	</fieldset>
	<!-- scope속성에 지정한 영역에 객체가 저장되었는지 테스트를
          위한 포워드
 	 -->
	<jsp:forward page="UseBeanActionTagForwared.jsp"/>
</body>
</html>