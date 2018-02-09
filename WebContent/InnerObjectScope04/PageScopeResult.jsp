<%@page import="model.MemberDTO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>PageScopeResult.jsp</title>
</head>
<body>
	<fieldset>
		<legend>이전 페이지(PageScopeIndex.jsp)에서 페이지영역에 저장한 속성 읽기</legend>
		<%
			Object object=pageContext.getAttribute("pageDate");
			String dateString=null;
			if(object instanceof Date){
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
				dateString=dateFormat.format((Date)object);				
			}
			MemberDTO firstMember=(MemberDTO)pageContext.getAttribute("pageMemberFirst");
			String firstMemberString=null;
			if(firstMember !=null){
				firstMemberString=String.format("아이디:%s,비번:%s,이름:%s,나이:%s",
							firstMember.getId(),
							firstMember.getPwd(),
							firstMember.getName(),
							firstMember.getAge()					
							);
			}
			MemberDTO secondMember=(MemberDTO)pageContext.getAttribute("pageMemberSecond");
			
		%>
		<ul style="list-style-type:upper-roman;">
			<li>Integer타입:<%=pageContext.getAttribute("pageNumber") %></li>
			<li>String타입:<%=pageContext.getAttribute("pageString") %></li>
			<li>Date타입:<%=dateString %></li>
			<li>MemberDTO타입 1:<%=firstMemberString %></li>
			
			<li>MemberDTO타입 2:<%=secondMember!=null ? String.format("아이디:%s,비번:%s,이름:%s,나이:%s",
					secondMember.getId(),
					secondMember.getPwd(),
					secondMember.getName(),
					secondMember.getAge()					
					) : null %></li>
		</ul>
	</fieldset>
</body>
</html>