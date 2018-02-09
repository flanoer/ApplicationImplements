<%@page import="java.util.Vector"%>
<%@page import="java.util.Collection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--  JSTL(Java Standard Tag Library)사용시
      taglib지시어를 이용해서 선언해야 한다.
       단,필요한 jar파일을 WEB-INF디렉토리 밑에
      lib에 넣어줘야 한다.
 -->  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>ELOperator.jsp</title>
</head>
<body>
	<fieldset>
		<legend>EL의 연산자들</legend>
		<h2>EL에서의 null연산</h2>
		<!-- EL에서 null이 연산에 참여시 0으로 간주된다 -->
		<div>
		\${null +10 } : ${null +10 }<br/>
		\${null*10 } : ${null*10 }<br/>
		\${param.myparam +10 } : ${param.myparam+10 }<br/>
		\${param.myparam > 10 } : ${param.myparam >10 }<br/>
		</div>
		<% String varInScriptlet ="스크립틀릿 안에서 선언한 변수"; %>
		<!-- EL 표현식 \${}에서는 JSP의 스크립팅 요소에서 선언한
	          변수를 직접 사용 못한다.값이 출력 안됨.	-->
	    <!-- null로 인식됨 -->
	    \${varInScriptlet } : ${varInScriptlet}
	    <!-- 고로 EL식에서 사용할 변수는 JSTL을 이용해서 선언해야 한다. -->
	    <h2>JSTL로 EL에서 사용할 변수 선언</h2>
	    <c:set var="elVar" value="<%=varInScriptlet%>"/>
	    \${elVar } : ${elVar }
	   
	    <h2>EL변수에 값 할당 불가(출력용이니까)</h2>
	    <!-- 톰캣 8.0부터는 할당 가능(비 권장):el-api.jar변경됨. -->
	    <c:set var="fnum" value="9"/>
	    <c:set var="snum" value="5"/>
	    \${fnum =100 } : ${fnum =100 }
	    <h2>EL의 산술 연산자</h2>
	    <ul style="list-style-type:upper-roman;">
	    	<li>\${fnum + snum } :${fnum + snum }</li>
	    	<li>\${fnum - snum } :${fnum - snum }</li>
	    	<li>\${fnum * snum } :${fnum * snum }</li>
	    	<li>\${fnum / snum } :${fnum / snum }</li>
	    	<li>\${fnum div snum } :${fnum div snum }</li>
	    	<li>\${fnum % snum } :${fnum % snum }</li>
	    	<li>\${fnum mod snum } :${fnum mod snum }</li>
	    	<!-- EL에서는 숫자형식의 문자열을 자동으로 숫자로 형변환 -->
	    	<li>\${"100"+100 } : ${"100"+100 }</li>
	    	<!-- EL에서 +는 숫자 연산에만 사용가능.문자열 연결시 에러 -->
	    	<li>\${'HELLO' + ' EL!!!' } : \${'HELLO' + ' EL!!!' }</li>
	    </ul>
	    <h2>EL의 비교연산자</h2>
	    <!-- 
		EL에서 비교 연산자를 이용한  비교 연산시에는 
		EL변수에 저장된 값을
		모두 문자열로 인식하여 String클래스의 
		compareTo()메소드 방식으로
		비교한다. 즉 첫번째 문자부터 하나씩 비교해 나간다.
		단,실제 숫자 비교시에는 정상적인 숫자 비교가 
		이루어짐.
		 -->
		<c:set var="fnum" value="100" "/>
	    <c:set var="snum" value="9"/>
	    <ul style="list-style-type:upper-roman;">
	    	<li>\${fnum > snum } : ${fnum > snum }</li>
	    	<li>\${100 gt 9 } : ${100 gt 9 }</li>
	    	<!--
	 			자바에서는 문자열 비교시 equals()메소드로 
	 			비교하나 EL에서는 ==로 비교 
	 		 -->
	 		 <li>\${"JSP" eq 'JSP' } : ${"JSP" eq'JSP' }</li>
	 		 <li>\${"JSP"=='Jsp' } : ${"JSP"=='Jsp' }</li>
	    </ul>
	    <h2>EL의 논리연산자</h2>
	    <ul style="list-style-type: decimal;">
			<li>\${5 >=5 && 10 !=10 } :${5 ge 5 and 10 ne 10 }</li>
			<li>\${5 < 6 || 10 > 100 } : ${5 lt 6 or 10 gt 100 }</li>
		</ul>
		<h2>EL의 삼항연산자</h2>
			\${10 gt 9 ? '10은 9보다 크다'  :'10은 9보다 크지 않다' }
			: ${10 gt 9 ? '10은 9보다 크다'  :'10은 9보다 크지 않다' }
		<h2>EL의 empty연산자</h2>
		<!-- 
			null이거나 
			""(빈문자열)이거나 
			배열인 경우는 길이가 0이거나
			컬렉션인 경우는 size가 0인 경우 true반환
		 
		   empty연산자 사용법 : \${empty el변수}
		   true나 false반환 
	   	-->
	   	<%
	   	String nullString   = null;
	   	String emptyString  = "";
	   	Integer[] lengthZero= new Integer[0];
	   	Collection sizeZero = new Vector();	   	
	   	%>
	   	<!-- JSTL로 EL에서 사용할 변수 선언 -->
	   	<c:set var="elnullString" value="<%=nullString %>" scope="page"/>
	   
	   	<c:set var="elemptyString" value="<%=emptyString %>"/>
	   	<c:set var="ellengthZero" value="<%=lengthZero %>"/>
	   	<c:set var="elsizeZero" value="<%=sizeZero %>"/>
	   	<ul style="list-style-type: decimal;">
	   		<li>\${empty elnullString} : ${empty elnullString}</li>
	   		<li>\${not empty elemptyString} : ${not empty elemptyString}</li>
	   		<li>${empty ellengthZero ? "배열크기가 0이다":'배열 크기가 0이 아니다' }</li>
	   		<li>${!empty elsizeZero ? "저장된 객체수가 0이 아니다":'저장된 객체수는 0이다' }</li>
	   	</ul>
	</fieldset>
</body>
</html>