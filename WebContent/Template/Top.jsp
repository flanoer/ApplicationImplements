<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="topMenu">
    <ul>
        <li><a href="<%=request.getContextPath() %>/Directive01/IncludeIndex.jsp">HOME</a></li>
        <%if(session.getAttribute("USER_ID") ==null){ %>
        <li><a href="<%=request.getContextPath() %>/Session06/Login.jsp">로그인</a></li>
        <%}else{ %>        
        <li><a href="<%=request.getContextPath() %>/Session06/Logout.jsp">로그아웃</a></li>
        <% } %>
        <li><a href="<%=request.getContextPath() %>/Directive01/IncludeMember.jsp">회원가입</a></li>
        <li><a href="<%=request.getContextPath() %>/BBS08/List.jsp">게시판</a></li>
        <li>자료실</li>       
    </ul>
</div>
        