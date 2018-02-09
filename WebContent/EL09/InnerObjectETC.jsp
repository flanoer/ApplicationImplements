<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.List"%>
<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>InnerObjectETC.jsp</title>
</head>
<body>
	<fieldset>
		<legend>EL의 기타 내장 객체들</legend>
		<h2>1.EL의 pageContext내장객체</h2>
		<!-- JSP의 pageContext내장객체와 같다.단,
		     자바빈 규칙으로 접근 가능한 메소드만 
		     제공한다.
		 -->
		 <h4>JSP코드로 컨텍스트 루트 얻기</h4>
		 <ul>
		 	<li>방법1:request내장객체:<%=request.getContextPath() %></li>
		 	<%
		 		ServletRequest req= pageContext.getRequest();
		 		String contextPath=((HttpServletRequest)req).getContextPath();
		 	%>
		 	<li>방법2:pageContext내장객체:<%=contextPath %></li>		 
		 </ul>
		 <h4>EL로 컨텍스트 루트 얻기</h4>
		 \${pageContext.request.contextPath }:${pageContext.request.contextPath }
		 <h4>JSP로 URL얻기</h4>
		 <%=request.getRequestURL() %>
		 <h4>EL로 URL얻기</h4>
		 \${pageContext.request.requestURL } :
		 ${pageContext.request.requestURL }
		 <h4>JSP로 세션 유효시간 얻기</h4>
		 <%=session.getMaxInactiveInterval() %>초
		 <h4>EL로 세션 유효시간 얻기</h4>
		 \${pageContext.session.maxInactiveInterval } :
		 ${pageContext.session.maxInactiveInterval }초
		 <h2>2.EL의 header내장 객체</h2>
		  <!-- JSP로 요청 헤더 정보를 얻어 오려면
		      request.getHeader("user-agent")식으로 
		      얻는다.
		  -->
		  <h4>JSP로 요청 헤더값 얻기</h4>
		  request.getHeader("user-agent") : <%=request.getHeader("user-agent") %>
		  <h4>EL로 요청 헤더값 얻기</h4>
		  <!-- 
	    	EL식으로 요청헤더명에 따른 
	   		헤더 값을 출력할때는
	    	header내장객체.요청헤더명이나
	    	혹은 header내장객체["요청헤더명"]
	        단,키값에 해당하는 요청헤더명에
	        특수 문자가 들어가 있는 경우에는 
	        무조건 []사용
	     -->
		  \${header.user-agent}:${header.user-agent}<br/>
		  \${header['user-agent']}:${header['user-agent']}<br/>
		  \${header["user-agent"]}:${header["user-agent"]}
		  <h2>3. EL의 cookie내장객체</h2>
		   <!-- 
			※EL에서는 값을 설정하거나 영역에 속성을 
			  저장하지는 못한다.
			  단지 저장된 값을 출력만 할 수 있다.
		 -->
		 <%
		 	Cookie cookie = new Cookie("KOSMO","JAVA");
		 	cookie.setPath(request.getContextPath());
		 	response.addCookie(cookie);		 
		 %>
		 <h4>JSP로 쿠키 읽기</h4>
		 <%
		 	Cookie[] cookies=request.getCookies();
		 	if(cookies !=null){
		 		
		 		for(Cookie cook:cookies){
		 			//쿠키명 얻기
		 			String name=cook.getName();
		 			//쿠키값 얻기
		 			String value=cook.getValue();
		 			out.println(String.format("%s:%s<br/>",name,value));
		 		}		 		
		 	}/////////////////////////
		 %>
		 <h4>EL로 쿠키 읽기</h4>
		 <!-- 
		 	cookie.쿠키명.value로 쿠키명에 해당하는 쿠키값을 
		 	얻을 수 있다.		 
		  -->
		 <ul>
		 	<li>\${cookie.KOSMO.value } : ${cookie.KOSMO.value }</li>
		 	<li>\${pageContext.request.cookies }:${pageContext.request.cookies }</li>
		 </ul>
		 <h4>JSTL을 이용해서 쿠키 배열 출력</h4>
		 <ul>
		 	<c:forEach items="${pageContext.request.cookies }" var="item">
		 	<li>${item.name } : ${item.value }</li>
		 	</c:forEach>
		 </ul>
		 <h2>4. EL의 initParam내장객체</h2>
		  <!-- 
		   컨텍스트 초기화 파라미터를 얻어 올수 있는 내장 객체  
		   -->
		  <!-- 
		   [Context초기화 파라미터]
		   -Context초기화 파라미터는 ServletContext의
		    getInitParameter("파라미터명")메소드를 통해서 
		    얻는다.
		   -Context를 구성하는 모든 서블릿에서 
		    공유할 수 있는 변수
		   [Servlet초기화 파라미터]
		   -Servlet초기화 파라미터는 ServletConfig의
		    getInitParameter("파라미터명")메소드를 통해서 얻는다
		   -해당 서블릿에서만 사용할 수 있는 변수		   
		      ※초기화 파라미터는 web.xml에 등록
		   -->
		   <h4>JSP로 컨텍스트 초기화파라미터 얻기</h4>
		   <ul style="list-style-type:upper-roman;">
		   		<li>ORACLE_URL:<%=application.getInitParameter("ORACLE_URL") %></li>		   
		   		<li>ORACLE_DRIVER:<%=application.getInitParameter("ORACLE_DRIVER") %></li>
		   		<li>PAGE_SIZE:<%=application.getInitParameter("PAGE_SIZE") %></li>
		   </ul>
		   <h4>EL로 컨텍스트 초기화파라미터 얻기</h4>
		   <ul style="list-style-type:upper-roman;">
		   		<li>ORACLE_URL:${initParam.ORACLE_URL }</li>
		   		<li>ORACLE_DRIVER:${initParam['ORACLE_DRIVER'] }</li>
		   		<li>PAGE_SIZE:${initParam["PAGE_SIZE"]}</li>		   
		   </ul>
		   <h2>컬렉션에 저장된 객체를 EL로 출력</h2>
		   <%
		 	//JSP코드로 컬렉션에 객체 저장]
			MemberDTO first = new MemberDTO("KIM","1234","김길동",null,"20");	
			MemberDTO second = new MemberDTO("PARK","5678","박길동",null,"40");	 
			 //리스트 계열 컬렉션에 객체 저장]
			List<MemberDTO> list= new Vector<MemberDTO>();
			list.add(first);
			list.add(second);
			//맵 계열 컬렉션에 객체 저장]
			Map<String,MemberDTO> map= new HashMap<String,MemberDTO>();
		    map.put("first",first);
		    map.put("second",second);
		   %>
		  
		   <h4>JSP로 출력</h4>
		   <h5>리스트계열 켈렉션</h5>
		   <h6>일반 for문</h6>
		   <ul>
		   	<% for(int i=0;i < list.size();i++){ %>
		   		<li><%=String.format("아뒤:%s,비번:%s,이름:%s,나이:%s",
		   								list.get(i).getId(),
		   								list.get(i).getPwd(),
		   								list.get(i).getName(),
		   								list.get(i).getAge())
		   				%></li>
		   	<%} %>
		   </ul>
		   <h6>확장 for문</h6>
		   <ul>
		   	<% for(MemberDTO dto:list){ %>
		   		<li><%=String.format("아뒤:%s,비번:%s,이름:%s,나이:%s",
		   								dto.getId(),
		   								dto.getPwd(),
		   								dto.getName(),
		   								dto.getAge())
				%></li>
		   <%} %>
		   </ul>
		   <h5>맵 계열 컬렉션</h5>
		   <ul>
		   	<%
		   		Set<String> keys=map.keySet();
		   		for(String key:keys){
		   			MemberDTO dto=map.get(key);
		   	%>
		   		<li><%=String.format("아뒤:%s,비번:%s,이름:%s,나이:%s",
		   								dto.getId(),
		   								dto.getPwd(),
		   								dto.getName(),
		   								dto.getAge())
				%></li>
		   	<% }%>
		   </ul>
		   <h4>EL로 출력</h4>
		   <!-- EL에서 사용할 수 있도록 JSTL을 이용해서
        		변수로 설정
    	   -->
    	    <!-- 스크립팅요소에서 선언한 변수를
		      EL식에서 사용해봤자 소용없다
		      JSTL을 이용해서 EL변수로 설정해야 한다.
		  -->
		   <c:set var="elMap" value="<%=map %>"/>
		   <c:set var="elList" value="<%=list %>"/>
		   <!-- 
			List계열:
			el변수[인덱스]
			단,el변수.인덱스는 사용불가
			Map계열:
			el변수.키값
			혹은 el변수["키값"]
			     el변수['키값']		
		   -->
		   <h5>리스트 계열 컬렉션(JSTL미사용)</h5>
		   <ul>
		   	<li>아뒤:${elList[0].id },비번:${elList[0].pwd },이름:${elList[0].name },나이:${elList[0].age }</li>
		   	<li>아뒤:${elList[1].id },비번:${elList[1].pwd },이름:${elList[1].name },나이:${elList[1].age }</li>
		   </ul>
		   <h5>맵계열 계열 컬렉션(JSTL미사용)</h5>
		   <ul>
		   	<li>아뒤:${elMap.first.id },비번:${elMap.first.pwd },이름:${elMap.first.name },나이:${elMap.first.age }</li>
		   	<li>아뒤:${elMap['second'].id },비번:${elMap['second'].pwd },이름:${elMap['second'].name },나이:${elMap['second'].age }</li>
		   </ul>
		   <h5>리스트 계열 컬렉션(JSTL사용)</h5>
		   <ul>
		   		<c:forEach var="item" items="${elList}">
		   			<li>아뒤:${item.id },비번:${item.pwd },이름:${item.name },나이:${item.age }</li>
		   		</c:forEach>
		   </ul>
		   <!-- 
		 		JSTL의 forEach사용시
		 		var에 지정한 변수명.value
		  -->
		  <h5>맵계열 계열 컬렉션(JSTL사용)</h5>
		  <ul>
		  	<c:forEach var="item" items="${elMap}">
		   			<li>아뒤:${item.value.id },비번:${item.value.pwd },이름:${item.value.name },나이:${item.value.age }</li>
		   	</c:forEach>	  
		  </ul>
		  <h5>컬렉션에 저장된 객체수 얻기:EL변수.size()</h5>
		  <ul>
		  	<li>\${elList.size() } : ${elList.size() }</li>
		  	<li>\${elMap.size() } : ${elMap.size() }</li>
		  </ul>
		  
	</fieldset>
</body>
</html>