<%@page import="java.util.HashMap"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 코어용 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 포맷용 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 문자열이나 컬렉션등을 처리하기위한 함수 라이브러리 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>FunctionOfJSTL.jsp</title>
</head>
<body>
	<fieldset>
		<legend>JSTL의 함수 라이브러리</legend>
		<!-- JSTL에서 제공하는 함수들은 EL식에서 호출 해야한다 
          호출방법: \${접두어:함수명([매개변수들])}
          JSTL의 모든 함수는 항상 값을 반환한다. 
        --> 
        <% String[] mountains={"한라산","덕유산","소백산","태백산"}; %> 
        <!-- EL에서 사용할 변수들 선언 -->
        <fmt:formatDate value="<%=new Date() %>" var="today" pattern="yyyy년 MM월 dd일"/>
        <c:set var="todaystring">ToDay는 ${today } 입니다</c:set>
        <c:set var="stringinters">Sports,Economics,Politics,Entertainments</c:set>
        <c:set var="array" value="<%=mountains %>"/>
        <c:set var="collection" value="<%=new HashMap() %>"/>
        <c:set target="${collection}" property="id" value="KIM"/>
        <c:set target="${collection}" property="pwd" value="1234"/>
        <!-- 
     	문자열인 경우는 문자열의 길이 반환
     	(한글 1자도 길이 1로 처리)
     	배열인 경우는 배열의 크기(즉 메모리 개수) 반환
    	컬렉션인 경우는 컬렉션에 저장된 객체의 수 반환 
     	-->
     	<h2>int length(Object)</h2>     	
     	<ul style="list-style-type:upper-roman;">
     		<li>문자열의 길이:${fn:length(todaystring) }</li>
     		<li>배열의 크기:${fn:length(array) }</li>   
     		<li>컬렉션에 저장된 객체 수(JSTL의 함수):${fn:length(collection) }</li> 
     		<li>컬렉션에 저장된 객체 수(EL의 함수):${collection.size()}</li>    	
     	</ul>
     	<h4>컬렉션에 객체저장 여부 판단</h4>
     	<h5>JSTL의 함수 이용</h5>
     	<c:choose>
     		<c:when test="${fn:length(collection) ==0 }">
     			저장된 객체가 없어요
     		</c:when>
     		<c:otherwise>
     			<c:forEach var="item" items="${collection}">
     				${item.value }&nbsp;
     			</c:forEach>     		
     		</c:otherwise>
     	</c:choose>
     	<h5>EL함수 이용-size()혹은 empty연산자</h5>
     	<c:choose>
     		<c:when test="${collection.size() ==0}">
     			저장된 객체가 없어요
     		</c:when>
     		<c:otherwise>
     			<c:forEach var="item" items="${collection}">
     				${item.value }&nbsp;
     			</c:forEach>     		
     		</c:otherwise>
     	</c:choose>
     	<h2>String toUpperCase(String) 및 String toLowerCase(String)</h2>
     	<ul>
     		<li>${fn:toUpperCase(stringinters) }</li>
     		<li>${fn:toLowerCase(stringinters) }
     	</ul>
     	<h2>String substring(문자열,시작인덱스,끝인덱스)</h2>
     	<!-- 
	       문자열에서 시작인덱스부터 끝인덱스-1까지 추출, 
	       끝인덱스가 -1 인경우 시작인덱스부터 
	       문자열 끝까지 추출
	       인덱스는 0부터 시작
	    -->
	    <ul>
	    	<li>특정부분 추출:${fn:substring(todaystring,7,20)}</li>
	    	<li>문자열 끝까지 추출:${fn:substring(todaystring,7,-1)}</li>
	    </ul>
	    <h2>String substringAfter(문자열,str2):str2이후의 문자열 추출</h2>
	    ${fn:substringAfter(todaystring,"ToDay는 ") }
	    <h2>String substringBefore(문자열,str2):str2이전의 문자열 추출</h2>
	    ${fn:substringBefore(todaystring,"는") }
	    <h2>String trim(문자열):좌우의 공백 제거</h2>
	    \${"    J   S     T    L    " }:${"    J   S     T    L    " }<br/>
	    X${fn:trim("    J   S     T    L    ") }Y
	    <h2>String replace(str,src,dest):str에서 src를 dest로 대체</h2>
	    \${fn:replace(todaystring,'ToDay','Tomorrow') } :
	    ${fn:replace(todaystring,'ToDay','Tomorrow') }
	    <h4>방법1</h4>
	    <c:set var="temp" value="${fn:replace(todaystring,'ToDay','Tomorrow') }"/>
	    ${fn:replace(temp,"23일","24일") }
	    <h4>방법2</h4>
	    ${fn:replace(fn:replace(todaystring,'ToDay','Tomorrow'),"23일","24일") }
		<h2>boolean startsWith(str,str1):str이 str1으로 시작하면 true,아니면 false</h2>
		${fn:startsWith(todaystring,"To") ? "To로 시작":"To로 시작 안함" }
		
		<h2>boolean endsWith(str,str1):str이 str1으로 끝나면 true,아니면 false</h2>
		${fn:endsWith(todaystring,"다") ? "다로 끝난다":"다로 끝나지 않은다" }
		<h2>String[] split(str,delim):str에서 delim(구분자)를 기준으로 문자열 분리</h2>
		<c:set var="inters" value='${fn:split(stringinters,",") }'/>
		<c:forEach var="inter" items="${inters}">
			${inter }&nbsp;&nbsp;
		</c:forEach>
		<h2>String join(array,str2):배열에 저장된 각 요소를 str2라는 문자열로 연결해서 하나의 문자열을 반환</h2> 
		\${fn:join(array,'▲') } : ${fn:join(array,'▲') }
		<h2>escapeXml(str):html태그를 그대로 출력하고자 할때</h2>
			<ul>
				<li>JSTL함수 이용:${fn:escapeXml("<h3>제목3입니다</h3>") }</li>
				<li>core의 out태그이용:<c:out value="<h3>제목3입니다</h3>"/></li>
			
			</ul>
		<h2>int indexOf(str1, str2):str1에서 str2가 시작하는 인덱스 위치 반환</h2>
		\${fn:indexOf(todaystring,"Day") } :${fn:indexOf(todaystring,"Day") }<br/>
		\${fn:indexOf(todaystring,"day") } :${fn:indexOf(todaystring,"day") }
		<h2>boolean contains(str,str1):str에 str1이 포함되었으면 true,아니면 false</h2>
		\${fn:contains(todaystring,"Day") } :${fn:contains(todaystring,"Day") }<br/>
		\${fn:contains(todaystring,"day") } :${fn:contains(todaystring,"day") }
		<h2>boolean containsIgnoreCase(str,str1):str에 str1이 포함되었으면 true,아니면 false(대소문자 구분 안함)</h2>
		\${fn:containsIgnoreCase(todaystring,"Day") } :${fn:containsIgnoreCase(todaystring,"Day") }<br/>
		\${fn:containsIgnoreCase(todaystring,"day") } :${fn:containsIgnoreCase(todaystring,"day") }
		
	</fields0et>
</body>
</html>