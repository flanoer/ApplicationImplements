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
    <title>View.jsp</title>

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
  			<h2>자료실 상세보기</h2>
		</div>	
		<div class="row">
			
			<div class="col-md-6 col-md-offset-3">
				<table class="table table-bordered table-striped">
	  					<tr>
	  						<td style="width:25%">작성자</td>
	  						<td>
	  							${dto.name}
	  						</td>
	  					</tr>
	  					<tr>
	  						<td>제 목</td>
	  						<td>
	  							${dto.title}
	  						</td>
	  					</tr>
	  					<tr>
	  						<td>첨부파일</td>
	  						<td>
	  							${dto.attachedfile}
	  						</td>
	  					</tr>
	  					<tr>
	  						<td>작성일</td>
	  						<td>
	  							${dto.postdate}
	  						</td>
	  					</tr>
	  					<tr>
	  						<td>다운로드수</td>
	  						<td>
	  							${dto.downcount}회
	  						</td>
	  					</tr>
	  					<tr>
	  						<td colspan="2">내 용</td>  						
	  					</tr>
	  					<tr>
	  						<td colspan="2" style="text-align:left">
	  						${dto.content}
	  						</td>  						
	  					</tr>
	  					<tr>
	  						<td colspan="2" >
	  						   <ul style="width:35%;" class="nav nav-pills center-block" role="tablist">
								  <li role="presentation" ><a href="#" id="update" data-toggle="modal" data-target="#dialog">수정</a></li>
								  <li role="presentation" ><a href="#" id="delete" data-toggle="modal" data-target="#dialog">삭제</a></li>
								  <li role="presentation" ><a href="<c:url value='/DATAROOM/List.do'/>">목록</a></li>
							   </ul>
	  							
	  						</td>  						
	  					</tr>
					</table>
				
			</div>	
				
		</div>	
		
    </div> <!-- /container -->
    <!-- 수정 및 삭제시 비밀번호를 입력받기 위한 다이얼로그 -->
    <div id="dialog" title="비밀번호 입력창" class="modal fade"  tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true" >    	
  		 <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
					<h4 class="modal-title" id="modalLabel">비밀번호 입력창</h4>
		      </div>
		      <div class="modal-body">
  		
			  		<form class="form-inline text-center" method="post" action="<c:url value='/DATAROOM/Password.do'/>">
			  		<!-- 키값 -->
			  		<input type="hidden" name="key" value="${dto.no }"/>
			  		<!-- 수정/삭제 판단용 -->
			  		<input type="hidden" name="mode"/>
			  		비 밀 번 호 <input type="password" name="pass" class="form-control"/>
			  		<button type="submit" class="btn btn-info">확인</button>	
			  		</form>
			  </div>
		      <div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				
		      </div>
		    </div>
		  </div>
		</div>
    
   
 

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>
    <script>
		$(function(){
			
			//수정클릭]
			$('#update').on('click',function(){
				//모드 설정
				$("form").get(0).mode.value="UPDATE";
				//다이얼로그창 띄우기
				$('#dialog').dialog("open");
				
			});
			//삭제클릭]
			$('#delete').on('click',function(){
				if(confirm('정말로 삭제하시겠습니까?')){
					//모드 설정
					$("form").get(0).mode.value="DELETE";
					//다이얼로그창 띄우기
					$('#dialog').dialog("open");
				}				
			});
			
			
		});
	</script>
    </body>
</html>