<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--  코어 태그 라이브러리 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 나만의 태그 라이브러리-->
<%@ taglib prefix="my" uri="/WEB-INF/tlds/mytaglib.tld"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>ChooseWhenOtherwiseTag.jsp</title>
</head>
<body>
	<fieldset>
		<legend>choose~when~otherwise태그</legend>
		<!-- EL에서 사용할 변수 설정 -->
		<c:set var="numvar" value="101"/>
		<c:set var="strvar" value="자바"/>
		<h2>if태그로 짝/홀수 판단</h2>
		<c:if test="${numvar mod 2 eq 0 }" var ="result">
			<!-- 주석 -->
			${numvar }는 짝수
		</c:if>
		<c:if test="${not result}" >
			${numvar }는 홀수
		</c:if>
		<h2>choose~when~otherwise태그로 짝/홀수 판단</h2>
		<!--choose안에 주석시 에러 YES.반드시 when~otherwise절만..-->
		<c:choose>	
			
			<c:when test="${numvar mod 2 eq 0 }">
				<!-- 주석:에러 NO -->
				${numvar }는 짝수
			</c:when>
			<c:otherwise>
				${numvar }는 홀수
			</c:otherwise>
		</c:choose>
		<h2>choose~when~otherwise태그로 문자열 비교</h2>
		<c:choose>
			<c:when test="${strvar eq 'JAVA' }">
				${strvar }는 JAVA다
			</c:when>
			<c:when test="${strvar eq 'Java' }">
				${strvar }는 Java다
			</c:when>
			<c:when test="${strvar == '자바' }">
				${strvar }는 자바다
			</c:when>
		</c:choose>	
		
		<fieldset>
			<legend>점수 확인</legend>
			<form>
				국어 : <input type="text" name="kor"/>
				영어 : <input type="text" name="eng"/>
				수학 : <input type="text" name="math"/>
				<input type="submit" value="확인"/>
			</form>
			<!-- 국영수 점수를 파라미터(kor,math,eng)로 받아 
		    90점이상이면 "A학점"출력
		    80점이상이면 "B학점"출력
		    70점이상이면 "C학점"출력
		    60점이상이면 "D학점"출력
		    60점미만이면 "F학점"출력.
		    단,EL과 JSTL을 사용하여라
		   -->
		   <c:if test="${! empty param.kor and ! empty param.eng and ! empty param.math}">
		   		<c:if test="${my:isNumber(param.kor) and my:isNumber(param.eng) and my:isNumber(param.math) }" var="result">
		   			<c:set var="age" value="${(param.kor+param.eng+param.math)/3 }"/>
		   			<c:choose>
		   				<c:when test="${age >= 90 }">
		   					 A학점
		   				</c:when>
		   				<c:when test="${age ge 80 }">
		   					 B학점
		   				</c:when>
		   				<c:when test="${age ge 70 }">
		   					 C학점
		   				</c:when>
		   				<c:when test="${age ge 60 }">
		   					 D학점
		   				</c:when>
		   				<c:otherwise>
		   					F학점
		   				</c:otherwise>
		   			</c:choose>
		   		</c:if>
		   		<c:if test="${not result }">
		   			<span style="color:red;font-size:1.5em;font-weight:bold">점수는 숫자만....</span>		   		
		   		</c:if>		   
		   </c:if> 
		</fieldset>
		<fieldset>
			<legend>로그인</legend>
			<form>
				아이디 : <input type="text" name="user"/>
				비밀번호 : <input type="password" name="pass"/>
				<input type="submit" value="로그인"/>
			</form>
			<!--
      		회원인 경우 "?님 반갑습니다"
          	아닌 경우 "로그인후 이용하세요"출력.
          	단,자신만의 태그라이브러리를 만들어
          	EL식으로 호출하여라 그리고 
          	실제 멤버 테이블을 연동하여라.
      		--> 
		</fieldset>
		<c:if test="${not empty param.user }">
			<c:choose>
				<c:when test="${my:isMember(param.user,param.pass,pageContext.servletContext) }">
					${param.user }님 반갑습니다.
				</c:when>
				<c:otherwise>
					로그인후 이용하세요
				</c:otherwise>
			</c:choose>
		
		</c:if>	
	</fieldset>
	
	
</body>
</html>