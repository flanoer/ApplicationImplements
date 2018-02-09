<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<fieldset>
	<legend>포함된 페이지(PageScopeIncludedPage.jsp)</legend>
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