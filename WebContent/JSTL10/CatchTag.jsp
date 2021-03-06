<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>CatchTag.jsp</title>
</head>
<body>
	<fieldset>
		<legend>catch태그</legend>
		<!-- 
		catch태그:
		-EL에서 오류날때 에러 처리시 주로 사용
		-에러내용을 원하는 위치에서 출력하고자 
		 할때 사용	
		-JSTL문법오류는 catch가 안된다.
	    -->
	    <c:set var="fnum" value="100"/>
	    <c:set var="snum" value="0"/>
	    <h2>에러가 안나는 경우:에러내용이 저장안됨</h2>
	    <c:catch var="error">
	    	\${fnum / snum } :${fnum / snum }<br/>	    
	    </c:catch>
	    \${error } : ${error }
	    <h2>에러가 나는 경우:원하는 위치에 에러내용 표시</h2>
	    <c:catch var="error">
	    \${"백"+100 } :${"백"+100 }<br/>
	    </c:catch>
	    <br/>에러 내용:${error}
	    <h2>JSTL문법오류는 CATCH가 안됨</h2>
	    <c:catch>
		    <c:choose>
		    	<!-- 주석 -->
		    	<c:when test="true">
		    		참이다
		    	</c:when>
		    	<c:otherwise>
		    		거짓이다
		    	</c:otherwise>	    
		    </c:choose>
	    </c:catch>
	</fieldset>
</body>
</html>