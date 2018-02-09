<%@page import="model.PagingUtil"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="model.MemberDTO"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>ELError.jsp</title>
</head>
<body>
	<fieldset>
		<legend>EL에서 에러가 나거나 값이 출력 안되는 경우</legend>
		<h2>+를 숫자가 아닌 문자열 연결에 사용시(에러)</h2>
		<ul style="list-style-type:upper-roman;">
			<li>\${"100"+100 } :${"100"+100 }[정상]</li>
			<li>\${"백"+100 } :\${"백"+100 }[에러]</li>
			<li>\${"HELLO"+" EL" } :\${"HELLO"+" EL" }[에러]</li>
		</ul>
		<h2>특수문자가 포함된 속성에 .으로 접근시</h2>
		<ul style="list-style-type:upper-roman;">
			<li>\${header.user-agent }:${header.user-agent }[에러NO,0 출력]</li>
			<li>\${header['user-agent']}:${header['user-agent'] }[정상]</li>
		</ul>
		<h2>.인덱스로 접근시(배열 혹은 리스트계열 컬렉션)(에러)</h2>
		<%
			String[] mountains ={"설악산","속리산","덕유산"};
			out.println(mountains[0]);
			List collection = new Vector();
			for(String mountain:mountains){
				collection.add(mountain);
			}
			out.println(collection.get(0));
		%>
		<c:set var="mountains" value="<%=mountains %>"/>
		<c:set var="collection" value="<%=collection %>"/>
		
		<ul style="list-style-type:upper-roman;">
			<li>\${mountains[0]} : ${mountains[0]}[정상]</li>
			<li>\${collection[0]} : ${collection[0]}[정상]</li>
			<li>\${mountains.0} : \${mountains.0}[에러]</li>
			<li>\${collection.0} : \${collection.0}[에러]</li>
		</ul>
		<h2>배열과 리스트 계열 컬렉션 출력</h2>
		<h4>배열</h4>
		<c:forEach var="item" items="${collection}">		
			${item }&nbsp;
		</c:forEach>
		<h4>컬렉션</h4>
		<c:forEach var="item" items="${mountains }">		
			${item }&nbsp;
		</c:forEach>
		<h2>배열이나 컬렉션의 인덱스를 벗어난 경우(에러 NO,출력 NO)</h2>
		<ul style="list-style-type:upper-roman;">
			<li>\${mountains[3]} : ${mountains[3]}</li>
			<li>\${collection[3]} : ${collection[3]}</li>			
		</ul>
		<h2>없는 속성이거나,속성은 존재하지만 getter가 없는 경우(자바빈)(에러)</h2>
		<% MemberDTO mem = new MemberDTO("KIM","1234","김길동",null,null); %>
		<c:set var="mem" value="<%=mem %>"/>
		<ul style="list-style-type:upper-roman;">
			<li>존재하지 않은 속성:\${mem.addr } [PropertyNotFoundException에러]</li>
			<li>속성은 존재,getter미 존재:\${mem.id }[에러]</li>
			<li>el변수명이 틀린경우:${mems.pwd }[에러 NO,출력 NO]</li>
		</ul>
		<h2>EL 내장객체의 없는 속성으로 접근시</h2>
		<ul style="list-style-type:upper-roman;">
			<li>\${requestScope.noProperty } : ${requestScope.noProperty }[Scope계열 내장객체는 에러 NO,출력 NO-속성명은 개발자 마음대로이기 때문에]</li>
			<li>\${pageContext.noProperty }:\${pageContext.noProperty }[컴파일 오류 발생-속성명이 정해져 있기때문에,즉 게터호출과 같다]</li>
		</ul>
		<h2>EL의 내장객체중 사용자가 정의한 속성에 접근하는 
		    내장객체(Scope계열/param계열등) 및 맵 컬렉션인 경우, 
		    존재하지 않은 속성이나 
             키값으로 접근시 null임으로 에러는 안나고 출력만 안됨 </h2>
        <%
        	request.setAttribute("myrequest","리퀘스트 영역");
        	Map map = new HashMap();
        	map.put("mymap","맵 컬렉션");
        	       
        %>
        <c:set var="map" value="<%=map %>"/>
        <ul style="list-style-type:upper-roman;">
        	<li>\${requestScope.myrequest }:${requestScope.myrequest }[정상]</li>
        	<li>\${map.mymap }:${map.mymap}[정상]</li>
        	<li>\${requestScope.yourrequest }:${requestScope.yourrequest }[에러 NO,출력 NO]</li>
        	<li>\${map.yourmap }:${map.yourmap}[에러 NO,출력 NO]</li>
        </ul>
        <h2>숫자를 0으로 나누면 INFINITY</h2>
        \${100 / 0 } : ${100 / 0 }
        <h2>EL변수에 값 할당시[톰캣 8.0이상부터는 정상.그 이전버전은 에러]</h2>
        <c:set var="num" value="100"/>
        데이타 변경 전:${num }<br/>
        데이타 변경 후:${num = 3.14 }
       <h2>임의의 변수로 .을 통해서 접근시-NO 출력 NO 에러</h2>
       <ul style="list-style-type:upper-roman;">
       	<li>\${kosmo } : ${kosmo }</li>
       	<li>\${kosmo.name } : ${kosmo.name }</li>
       	<li>\${kosmo['name'] } : ${kosmo['name'] }</li>
       
       </ul>
      
	</fieldset>
</body>
</html>