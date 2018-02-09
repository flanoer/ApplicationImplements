<%@page import="model.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%

	
	//파라미터 받기]
	//1]파라미터(키값) 받기
	String articleId = request.getParameter("articleId");
	//현재 페이지번호 받기
	int nowPage = Integer.parseInt(request.getParameter("nowPage"));
	//2]CRUD작업용 BbsDAO생성
	BbsDAO dao = new BbsDAO(application);
	int affected=dao.delete(articleId);
	int totalRecordCount=dao.getTotalRecordCount(null);
	int pageSize =Integer.parseInt(application.getInitParameter("PAGE_SIZE"));	
	int totalPage =(int)Math.ceil((double)totalRecordCount/pageSize);
	//3]자원반납
	dao.close();	
	
	if(totalPage < nowPage){
		nowPage=totalPage;
	}
	if(affected == 1){
		response.sendRedirect("List.jsp?nowPage="+nowPage);
	}
	else{%>
		<script>
			alert("삭제 실패했어요");
			history.back();
		</script>
		<%
	}

%>