<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>index.jsp</title>

    <!-- Bootstrap core CSS -->    
    <link href="<c:url value='/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet">
    <!-- Bootstrap theme -->
    <link href="<c:url value='/bootstrap/css/bootstrap-theme.min.css'/>" rel="stylesheet">

    <!-- Custom styles for this template -->    
	<style>
		body {
		   	min-height: 2000px;
  			padding-top: 70px;
		}
		table,table th{
			text-align:center;
		}	
		
	</style>
  </head>

<body>
	<jsp:include page="/BootStrapTemplate/Top.jsp"/>
    <div class="container">
		<div class="page-header">
  			<h2>자료실 목록</h2>
		</div>
		<div class="row">
			<div class="col-md-1 col-md-offset-9">
				<a href="<c:url value='/DATAROOM/Write.do'/>"><button type="button" class="btn btn-success">글등록</button></a>
			</div>
		</div>
		
     	<div class="row" style="padding-top:10px">
   			<div class="col-md-8 col-md-offset-2 ">
	   			<table class="table table-bordered table-hover">
	   				<tr >
	   					<th style="width:10%;">번호</th>
	   					<th style="width:35%">제목</th>
	   					<th style="width:10%">작성자</th>
	   					<th style="width:15%">등록일</th>
	   					<th style="width:20%">첨부파일</th>
	   					<th>조회수</th>
	   				</tr>
	   				<c:if test="${empty requestScope.list }" var="flag">
		   				<tr>
		   					<td colspan="6">등록된 자료가 없습니다</td>
		   				</tr>
	   				</c:if>
	   				<c:if test="${not flag }">
	   					<c:forEach var="item" items="${list}">
			   				<tr>
			   					<td>${item.no}</td>
			   					<td><a href="<c:url value='/DATAROOM/View.do?key=${item.no}'/>">${item.title}</a></td>
			   					<td>${item.name}</td>
			   					<td>${item.postdate}</td>
			   					<td><a href="">${item.attachedfile}</a></td>
			   					<td>${item.downcount}</td>
			   				</tr>
		   				</c:forEach>
	   				</c:if>
	   			</table>
   			</div>
   		</div>		
    </div> <!-- /container -->
    
   
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>
    </body>
</html>