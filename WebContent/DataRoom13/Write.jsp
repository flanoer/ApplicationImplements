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
    <title>Write.jsp</title>

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
	<script>
		function isValidate(form){
			if(form.name.value==""){
				alert("작성자를 입력하세요");
				form.name.focus();
				return false;
			}
			else if(form.title.value.length==0){
				alert("제목을 입력하세요");
				form.title.focus();
				return false;
			}
			if(form.attachedfile.value.length==0){
				alert("파일을 첨부하세요");
				form.attachedfile.focus();
				return false;
			}/*
			else{
				//파일 사이즈(바이트):파일객체.files[0].size
				//파일 명:파일객체.files[0].name
				//파일 컨텐츠 타입:파일객체.files[0].type
				if(Math.ceil(form.attachedfile.files[0].size/1024) > 500){
					alert("최대 파일 업로드 용량을 초과 했어요:500KB");
					form.attachedfile.focus();
					console.log(form.attachedfile.files[0].size/1024,form.attachedfile.files[0].name,form.attachedfile.files[0].type);
					return false;
				}
			}*/
			if(form.pass.value.length==0){
				alert("비밀번호를 입력하세요");
				form.pass.focus();
				return false;
			}
			if(form.content.value.length==0){
				alert("내용을 입력하세요");
				form.content.focus();
				return false;
			}
			
		}////////////////////////////////////////	
	</script>
  </head>

<body>
	<jsp:include page="/BootStrapTemplate/Top.jsp"/>
    <div class="container">
		<div class="page-header">
  			<h2>자료실 등록${error}</h2>
		</div>	
		<div class="row">
			
			<div class="col-md-6 col-md-offset-3">
				<form action="<c:url value='/DATAROOM/Write.do'/>" 
				      method="post"
				      enctype="multipart/form-data"
				      onsubmit="return isValidate(this)"
				>
					<table class="table table-bordered">
	  					<tr>
	  						<td>작성자</td>
	  						<td>
	  							<input value="${name}" name="name" type="text"  style="width:50%" class="form-control"/>
	  						</td>
	  					</tr>
	  					<tr>
	  						<td>제 목</td>
	  						<td>
	  							<input value="${title}" name="title" type="text" class="form-control"/>
	  						</td>
	  					</tr>
	  					<tr>
	  						<td>첨부파일</td>
	  						<td>
	  							<input name="attachedfile" type="file"/>${attachedfile}
	  						</td>
	  					</tr>
	  					<tr>
	  						<td>비밀번호</td>
	  						<td>
	  							<input value="${pass}" name="pass" type="password" style="width:50%" class="form-control"/>
	  						</td>
	  					</tr>
	  					<tr>
	  						<td colspan="2">내 용</td>  						
	  					</tr>
	  					<tr>
	  						<td colspan="2"><textarea name="content" class="form-control" rows="10">${content}</textarea></td>  						
	  					</tr>
	  					<tr>
	  						<td colspan="2"><button type="submit" class="btn btn-primary">확인</button></td>  						
	  					</tr>
					</table>
				</form>
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