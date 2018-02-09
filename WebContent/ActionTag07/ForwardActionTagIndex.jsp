<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- ForwardActionTagIndex.jsp -->
<%
	//페이지 이동전 각 영역에 속성 저장]
	pageContext.setAttribute("pagevar", "페이지 영역 입니다.");
	request.setAttribute("requestvar", "리퀘스트 영역 입니다.");
	/*1]sendRedirect로 페이지 이동-redirect방식
    - request 영역 공유 안함 
    - 새로운 요청
    - URL창에는 마지막 요청 URL이 보임
    - 절대경로로 페이지 이동시에는 Context 루트를 
       포함한 경로로 지정
  	*/
	//response.sendRedirect(request.getContextPath()+"/ActionTag07/ForwardActionTagResult.jsp");
	/*
	2]액션태그가 아닌 자바코드로 포워딩(서블릿에서 사용)-forward방식
	- request영역 공유
	- 같은 요청(하나의 요청)
	- URL창에는 최초 요청한 URL이 보임
	- 절대경로로 지정시 Context루트 제외
	*/
	//request.getRequestDispatcher("/ActionTag07/ForwardActionTagResult.jsp").forward(request, response);
%>
<!-- 액션 태그로 포워딩 -->
<jsp:forward page="/ActionTag07/ForwardActionTagResult.jsp"/>
