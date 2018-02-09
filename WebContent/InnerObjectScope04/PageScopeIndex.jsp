<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.MemberDTO"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/* 
	모든 영역(페이지,리퀘스트,세션,어플리케이션)에는 
	모든 타입(Object)의 객체 저장 가능
	파라미터로 값을 전달할때는 문자열만 가능
	
	※page영역에 저장한 속성은 해당 페이지를 벗어나면
	  사라진다. 
	  page영역에는 pageContext객체(PageContext타입)존재
	*/ 
	//페이지 영역에 속성 저장]
	pageContext.setAttribute("pageNumber", 1000);
	pageContext.setAttribute("pageString","페이지 영역에 저장한 문자열");
	pageContext.setAttribute("pageDate", new Date());
	pageContext.setAttribute("pageMemberFirst",new MemberDTO("KIM","1234","김길동",null,"20"));
	
	MemberDTO member = new MemberDTO();
	member.setAge("30");
	member.setId("PARK");
	member.setName("박길동");
	member.setPwd("1234");
	pageContext.setAttribute("pageMemberSecond", member);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>PageScopeIndex.jsp</title>
</head>
<body>
	<fieldset>
		<legend>페이지 영역</legend>
		<h2>페이지 영역에 저장된 속성값 읽기</h2>
		<%
			Object object=pageContext.getAttribute("pageDate");
			String dateString="";
			if(object instanceof Date){
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
				dateString=dateFormat.format((Date)object);				
			}
			MemberDTO firstMember=(MemberDTO)pageContext.getAttribute("pageMemberFirst");
			String firstMemberString=String.format("아이디:%s,비번:%s,이름:%s,나이:%s",
						firstMember.getId(),
						firstMember.getPwd(),
						firstMember.getName(),
						firstMember.getAge()					
						);
			
			MemberDTO secondMember=(MemberDTO)pageContext.getAttribute("pageMemberSecond");
			
		%>
		<ul style="list-style-type:upper-roman;">
			<li>Integer타입:<%=pageContext.getAttribute("pageNumber") %></li>
			<li>String타입:<%=pageContext.getAttribute("pageString") %></li>
			<li>Date타입:<%=dateString %></li>
			<li>MemberDTO타입 1:<%=firstMemberString %></li>
			<li>MemberDTO타입 2:<%=String.format("아이디:%s,비번:%s,이름:%s,나이:%s",
					secondMember.getId(),
					secondMember.getPwd(),
					secondMember.getName(),
					secondMember.getAge()					
					) %></li>
		</ul>
		<h2>페이지 영역에 저장된 속성 삭제후 출력</h2>
		<%
			//속성명이 틀린 경우 삭제가 안됨.에러는 안남.
			pageContext.removeAttribute("NOKEY");
			//존재하는 키값(속성명)으로 삭제
			pageContext.removeAttribute("pageNumber");
			pageContext.removeAttribute("pageString");
		%>
		<ul style="list-style-type:upper-roman;">
			<li>Integer타입:<%=pageContext.getAttribute("pageNumber") %></li>
			<li>String타입:<%=pageContext.getAttribute("pageString") %></li>
			<li>Date타입:<%=dateString %></li>
			<li>MemberDTO타입 1:<%=firstMemberString %></li>
			<li>MemberDTO타입 2:<%=String.format("아이디:%s,비번:%s,이름:%s,나이:%s",
					secondMember.getId(),
					secondMember.getPwd(),
					secondMember.getName(),
					secondMember.getAge()					
					) %></li>
		</ul>
		<h2>페이지 이동</h2>
		<a href="PageScopeResult.jsp">사용자 클릭에 의한 페이지 이동</a>
	</fieldset>
	<%@ include file="PageScopeIncludedPage.jsp" %>
</body>
</html>