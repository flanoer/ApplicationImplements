<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.List"%>
<%@page import="model.MemberDTO"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
JSTL사용]
1]WEB-INF/lib폴더에 필요한 jar파일 추가
2]taglib지시어를 JSP페이지에 추가.
-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>SetTagIndex.jsp</title>
</head>
<body>
	<fieldset>
		<legend>set태그</legend>
		<!-- 
			var속성:문자열만
			value속성:값,표현식,EL식 모두 가능
			scope속성:문자열만(
				"page","request","session","application"중 
				하나)"page"가 기본 값			         
		 -->
		<h2>set태그로 EL에서 사용할 변수 설정</h2>
		<ul style="list-style-type:upper-roman;">
			<li>value속성에 직접 값 설정:<c:set var="directvar" value="100" /></li>
			<!-- 위 JSRL은 pageContext.setAttribute("directvar","100");와 같다 -->
			<li>value속성에 EL로 값 설정:<c:set var="elvar" value="${directvar}" /></li>
			<li>value속성에 표현식으로 값 설정:<c:set var="expvar" value="<%=new Date() %>" /></li>
			<li>시작태그와 종료태그 사이에 값 설정:<c:set var="betweenvar">시작태그와 종료태그 사이에 설정한 값입니다</c:set></li>
		</ul>
	</fieldset>
	<fieldset>
		<legend>set태그로 설정한 값 출력</legend>
		<h2>JSP코드로 출력</h2>
		<ul style="list-style-type:upper-roman;">
			<li>directvar:<%=pageContext.getAttribute("directvar") %></li>
			<li>elvar:<%=pageContext.getAttribute("elvar") %></li>
			<li>expvar:<%=pageContext.getAttribute("expvar") %></li>
			<li>betweenvar:<%=pageContext.getAttribute("betweenvar") %></li>
		</ul>
		<h2>EL로 출력</h2>
		<ul style="list-style-type:upper-roman;">
			<li>directvar:${directvar}</li>
			<li>elvar:${pageScope.elvar }</li>
			<li>expvar:${pageScope['expvar'] }</li>
			<li>betweenvar:${pageScope["betweenvar"] }</li>
		</ul>
	</fieldset>
	<fieldset>
		<legend>set태그로 각 영역에 객체 저장</legend>
		<c:set var="pagevar" value="페이지 영역입니다"/>
		<c:set var="requestvar" value="리퀘스트 영역입니다" scope="request"/>
		<c:set var="sessionvar" value="세션 영역입니다" scope="session"/>
		<c:set var="applicationvar" value="어플리케이션 영역입니다" scope="application"/>
		<h2>JSP코드로 출력</h2>
		<ul style="list-style-type:upper-roman;">
			<li>pagevar:<%=pageContext.getAttribute("pagevar") %></li>
			<li>requestvar:<%=request.getAttribute("requestvar") %></li>
			<li>sessionvar:<%=session.getAttribute("sessionvar") %></li>
			<li>applicationvar:<%=application.getAttribute("applicationvar") %></li>
		</ul>
		<h2>EL로 출력</h2>
		<ul style="list-style-type:upper-roman;">
			<li>pagevar:${pagevar}</li>
			<li>requestvar:${requestScope.requestvar }</li>
			<li>sessionvar:${sessionScope['sessionvar'] }</li>
			<li>applicationvar:${applicationScope["applicationvar"] }</li>
		</ul>
	</fieldset>
	<fieldset>
		<legend>set태그로 자바빈 객체 설정</legend>
		<h2>기본 생성자로 설정</h2>
		<c:set var="defaultMember" value="<%=new MemberDTO() %>" scope="request"/>
		<h2>JSP코드로 출력</h2>
		<ul style="list-style-type:upper-roman;">
			<li>아뒤:<%=((MemberDTO)request.getAttribute("defaultMember")).getId() %></li>
			<li>비번:<%=((MemberDTO)request.getAttribute("defaultMember")).getPwd() %></li>
			<li>이름:<%=((MemberDTO)request.getAttribute("defaultMember")).getName() %></li>
		</ul>
		<h2>EL로 출력</h2>
		<ul style='list-style-type:upper-roman;'>
			<li>아뒤:${requestScope.defaultMember.id}</li>
			<li>비번:${defaultMember.pwd}</li>
			<li>이름:${defaultMember.name}</li>
		</ul>
		<h2>인자 생성자로 설정</h2>
		<c:set  var="argsMember" value='<%=new MemberDTO("KIM","1234","김길동",null,null) %>' scope="request"/>
		<h2>JSP코드로 출력</h2>
		<ul style="list-style-type:upper-roman;">
			<li>아뒤:<%=((MemberDTO)request.getAttribute("argsMember")).getId() %></li>
			<li>비번:<%=((MemberDTO)request.getAttribute("argsMember")).getPwd() %></li>
			<li>이름:<%=((MemberDTO)request.getAttribute("argsMember")).getName() %></li>
		</ul>
		<h2>EL로 출력</h2>
		<ul style='list-style-type:upper-roman;'>
			<li>아뒤:${requestScope.argsMember.id}</li>
			<li>비번:${argsMember.pwd}</li>
			<li>이름:${argsMember.name}</li>
		</ul>	
		<!-- 
		set태그의 target속성과 property속성은
		자바빈 객체의 속성이나
		컬렉션계열 객체의 값을 설정할때
		사용할 수 있는 속성.
		
		target속성:반드시 EL식이나 표현식만 가능
		property속성:값,표현식,EL식 모두 가능.
		                자바빈 인 경우-속성명(멤버변수명)
		               Map컬렉션 - 키값  
		
		
		※scope속성은 var속성을 지정한 태그에서만 
		  설정 가능
	 -->
	 <!-- target과 property를 사용해서
	       자바빈이나 컬렉션에 값을 설정할때는
	      var속성을 지정하면 안된다.
	 -->
	 <!-- target속성과 property속성을 이용해서
	      자바빈 객체의 속성값 설정
	  -->
	<c:set target="${defaultMember}" property="id" value="KOSMO"/>		
	<c:set target="${defaultMember}" property="pwd" value="9999"/>	
	<c:set target="${defaultMember}" property="name" value="한소인"/>
		<h4>target및 property속성으로 값 설정후 출력</h4>
		<ul style='list-style-type:upper-roman;'>
				<li>아뒤:${requestScope.defaultMember.id}</li>
				<li>비번:${defaultMember.pwd}</li>
				<li>이름:${defaultMember.name}</li>
		</ul>
	<%
		//리스트 계열 컬렉션]
		List list = new Vector();
		list.add(request.getAttribute("defaultMember"));
		list.add(request.getAttribute("argsMember"));	
	%>		
	<h2>1단계:set태그로 리스트 계열 컬렉션 설정</h2>	
	<c:set var="list" value="<%=list%>" scope="request"/>
		<h4>속성값 변경전 출력</h4>
		<ul style='list-style-type:upper-roman;'>
				<li>아뒤:${list[0].id}</li>
				<li>비번:${list[0].pwd}</li>
				<li>이름:${list[0].name}</li>
		</ul>
		<h4>target 및 property속성으로 속성값 변경</h4>
		<c:set target="${list[0]}" value="코스모" property="id"/>
		<c:set target="${list[0]}" value="4321" property="pwd"/>
		<c:set target="${list[0]}" value="한국소프트웨어 인재개발원" property="name"/>
		<h4>속성값 변경후 출력</h4>
		<ul style='list-style-type:upper-roman;'>
				<li>아뒤:${list[0].id}</li>
				<li>비번:${list[0].pwd}</li>
				<li>이름:${list[0].name}</li>
		</ul>
		<%
			//맵 계열 컬렉션]
			Map map = new HashMap();
			map.put("default",request.getAttribute("defaultMember"));
			map.put("args",request.getAttribute("argsMember"));		
		%>
		<h2>1단계:set태그로 맵 컬렉션 설정</h2>
		<c:set var="map" value="<%=map %>" scope="request"/>
		<h4>속성값 변경전 출력</h4>
		<ul style='list-style-type:upper-roman;'>
				<li>아뒤:${map.args.id}</li>
				<li>비번:${map.args.pwd}</li>
				<li>이름:${map.args.name}</li>
		</ul>
		<h4>속성값 변경후 출력</h4>
		<c:set target="${map.args}" property="id" value="LEE"/>
		<c:set target="${map.args}" property="pwd" value="7777"/>
		<c:set target="${map.args}" property="name" value="이길동"/>
		<ul style='list-style-type:upper-roman;'>
				<li>아뒤:${map.args.id}</li>
				<li>비번:${map.args.pwd}</li>
				<li>이름:${map.args.name}</li>
		</ul>
		
	</fieldset>
	<jsp:forward page="setTagResult.jsp">
		<jsp:param value="android" name="subject"/>	
	</jsp:forward>
</body>
</html>