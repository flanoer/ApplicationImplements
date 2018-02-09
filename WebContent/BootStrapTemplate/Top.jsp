<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   

<!-- Fixed navbar -->
<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">자료실 프로젝트</a>
    </div>
    <div id="navbar" class="navbar-collapse collapse">
      
      <ul class="nav navbar-nav navbar-right">
        <li <c:if test="${empty active}"> class="active" </c:if>><a href="<c:url value='/DataRoom13/index.jsp'/>">HOME</a></li>
        <li><a href="#">로그인</a></li>
        <li <c:if test="${not empty active}"> class="active" </c:if> ><a href="<c:url value='/DATAROOM/List.do'/>">자료실</a></li>
      </ul>
    </div><!--/.nav-collapse -->
  </div>
</nav>
      