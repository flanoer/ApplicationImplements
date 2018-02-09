<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>ImportTag.jsp</title>
</head>
<body>
	<fieldset>
		<legend>import태그</legend>
		
		
		
		<!-- jsp:include액션태그와 같다. request영역 공유
		-->
		<!--url속성에 절대 경로 설정시
	         프로젝트명은 제외
	         단,server.xml의 Context태그의
	        path속성값을 지운 경우는 상관없다.
	 	-->
		<!-- 리퀘스트 영역에 속성 저장 -->
		<c:set var="requestvar" value="리퀘스트 영역입니다" scope="request"/>
		<h2>var속성 미지정-현재 위치에 바로 삽입됨(include액션태그와 같다)</h2>
		<c:import url="ImportedPage.jsp">
			<c:param name="user" value="KIM"/>
			<c:param name="pass">1234</c:param>
		</c:import>
		<h2>var속성 지정-원하는 위치에 삽입하고자 할때</h2>
		<c:import url="ImportedPage.jsp" var="content" >
			<c:param name="user" value="KIM"/>
			<c:param name="pass">1234</c:param>
		</c:import>
		<h3>바로 아래에 페이지 내용 출력</h3>
		${content }
		<h2>외부에 있는 컨텐츠 삽입</h2>
		<hr/>
		<iframe src="ImportedNate.jsp" style="width:100%;height:500px;border:none"></iframe>
	</fieldset>
</body>
</html>