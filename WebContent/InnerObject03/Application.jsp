<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!

	//[선언부에서 물리적 경로 얻는 방법들]
	//1]this키워드 사용
	private String getRealPath(){
		return this.getServletContext().getRealPath("/Images");
	}
	//2]매개변수로 내장객체 전달받기
	private String getRealPath(ServletContext app){
		return app.getRealPath("/Images");
	}
	//3]멤버변수 사용
	private ServletContext application;
	private String getRealPathString(){
		return application.getRealPath("/Images");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Application.jsp</title>

</head>
<body>
	<fieldset>
		<legend>application내장객체의 주요 메소드</legend>
		<!-- 
			목적]웹 어플리케이션(컨텍스트)을 구성하는 모든  jsp(서블릿)
			     에서 스트링형 상수를 공유하기 위함.
			STEP1] web.xml에 컨텍스트 초기화 파라미터 등록    
			STEP2] ServletContext의 getInitParameter("파라미터명") 
			         메소드로 얻기		
		 -->
		 <ul style="list-style-type: decimal;">
		 	<li>오라클 드라이버:<%=application.getInitParameter("ORACLE_DRIVER") %>
		 	<li>오라클 주소:<%=application.getInitParameter("ORACLE_URL") %>
		 	<li>this.getInitParameter(서블릿 초기화 파라미터):<%=this.getInitParameter("ORACLE_URL") %>
		 	<li>서블릿 초기화 파라미터(this):<%=this.getInitParameter("SERVLET_INIT") %></li>
		 	<li>서블릿 초기화 파라미터(config내장객체):<%=config.getInitParameter("SERVLET_INIT") %></li>
		 </ul>
		 <h2>컨텍스트 초기화 파라미터 목록</h2>
		 <ul style="list-style-type: upper-roman;">
		 	<%
		 		Enumeration<String> names=application.getInitParameterNames();
		 		while(names.hasMoreElements()){
		 			//컨텍스트 초기화 파라미터 명]
		 			String name=names.nextElement();
		 			//컨텍스트 초기화 파라미터 값]
		 			String value=application.getInitParameter(name);
		 			out.println("<li>"+name + ":"+value+"</li>");
		 		}
		 	%>
		 </ul>
		 <h2>서버의 물리적 경로 얻기</h2>
		 <!-- 
			ServletContext의 메소드인 
			getRealPath(/로 시작하는 웹상의 경로)로 얻는다.
			웹상의 경로는 Context 루트를 제외한 /로 시작
	 	-->
	 	 <ul style="list-style-type: upper-roman;">
	 	  	<li>application내장객체:<%=application.getRealPath("/Images") %></li>
	 	 	<li>request내장객체(서블릿에서 사용):<%=request.getServletContext().getRealPath("/Images") %></li>
	 	 	<li>request내장객체(서블릿에서 사용):<%=request.getRealPath("/Images") %></li>
	 	 	<li>session내장객체:<%=session.getServletContext().getRealPath("/Images") %></li>
	 	 	<li>config내장객체:<%=config.getServletContext().getRealPath("/Images") %></li>
	 	 	<li>this키워드(선언부에서 사용):<%=this.getServletContext().getRealPath("/Images") %></li>
	 	 	
	 	 </ul>
	 	 <h2>선언부에서 물리적 경로 사용하기</h2>
	 	 <ul style="list-style-type: upper-roman;">
	 	 <li>this키워드 사용:<%=getRealPath() %></li>
	 	 <li>매개변수로 전달:<%=getRealPath(application) %></li>
	 	 <% this.application=application; %>
	 	 <li>멤버변수 사용:<%=getRealPathString() %></li>
	 	 </ul>
	</fieldset>
</body>
</html>