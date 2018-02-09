<%@page import="java.util.Map"%>
<%@page import="model.BbsDTO"%>
<%@page import="model.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/Common/IsMember.jsp" %>  
<%

	//1]파라미터(키값) 받기
	String articleId = request.getParameter("articleId");
	//현재 페이지번호 받기
	String nowPage = request.getParameter("nowPage");
	//2]CRUD작업용 BbsDAO생성
	BbsDAO dao = new BbsDAO(application);
	//조회수 업데이트
	dao.updateVisitCount(articleId);
	//상세보기용 메소드 호출	
	BbsDTO dto= dao.selectOne(articleId);
	//이전글/다음글 조회
	Map<String,BbsDTO> map = dao.prevNNext(articleId);
	//3]자원반납
	dao.close();

%>
<!DOCTYPE html>
<html>
<head>
    <title>View.jsp</title>
	<meta charset="utf-8" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/Styles/divLayout.css" type="text/css" />
	<script>
	var isDelete = function(){
		if(confirm("정말로 삭제 하시겠습니까?")){
			location.replace("Delete.jsp?articleId=<%=articleId%>&nowPage=<%=nowPage%>");
		}
		
	};
	
	</script>
</head>
<body>
    <div class="allWrap">
        <div class="partWrap">
            <!-- 탑메뉴 및 로고 감싸는 div 시작 -->
            <div class="header">
                <div class="logo">
                    <img src="<%=request.getContextPath() %>/Images/logo.png" alt="로고이미지" />
                </div>
                <jsp:include page="/Template/Top.jsp"/>
            </div>
            <!-- 탑메뉴 및 로고 감싸는 div 끝 -->
            <!--Left메뉴 및 실제 내용 감싸는 div시작-->
            <div class="section">
                <jsp:include page="/Template/Left.jsp"/>
                <div class="body">
                    <div class="content">
                    	<fieldset style="padding:20px 0 50px 20px">
	                    	<legend>상세 보기</legend>
	                        
			                  	<table width="75%" bgcolor="gray" cellspacing="1"> 
			                  		<tr bgcolor="white" >
			                  			<td width="30%" align="center">작성자</td>
			                  			<td >
			                  			<%=dto.getName() %>
			                  			</td>
			                  		</tr>    
			                  		<tr bgcolor="white" >
			                  			<td width="30%" align="center">작성일</td>
			                  			<td >
			                  			<%=dto.getPostdate() %>
			                  			</td>
			                  		</tr>
			                  		<tr bgcolor="white" >
			                  			<td width="30%" align="center">조회수</td>
			                  			<td >
			                  			<%=dto.getVisitcount() %>
			                  			</td>
			                  		</tr>             	
			                  		<tr bgcolor="white" >
			                  			<td width="30%" align="center">제목</td>
			                  			<td >
			                  			<%=dto.getTitle() %>
			                  			</td>
			                  		</tr>
			                  		<tr bgcolor="white" >
			                  			<td align="center">내용</td>
			                  			<td>
			                  			<%=dto.getContent().replace("\r\n", "<br/>") %>
			                  			</td>			                  			
			                  		</tr>
			                  		<tr bgcolor="white" align="center">
			                  			<td colspan="2">
			                  			<%if(session.getAttribute("USER_ID").toString().equals(dto.getId())){%>
			                  			 <a href="Edit.jsp?articleId=<%=dto.getNo()%>&nowPage=<%=nowPage%>">수정</a> | <a href="#" onclick="isDelete()">삭제</a> | 
			                  			 <% } %>
			                  			 <a href="List.jsp?nowPage=<%=nowPage%>">목록</a>
			                  			</td>
			                  		</tr>                  	
			                  	</table> 
		                  		<!-- 이전글/다음글 -->
			                     <table width="75%" >
			                           <tr>
			                            <td width="15%">이전글:</td>
			                            <td><%=map.get("PREV")==null?"이전글이 없습니다" : String.format("<a href='View.jsp?articleId=%s'>%s</a>",map.get("PREV").getNo(),map.get("PREV").getTitle()) %></td>
			                           </tr>
			                           <tr>
			                            <td>다음글:</td>
			                            <td><%=map.get("NEXT")==null?"다음글이 없습니다" : String.format("<a href='View.jsp?articleId=%s'>%s</a>",map.get("NEXT").getNo(),map.get("NEXT").getTitle()) %></td>
			                           </tr>
			                     </table> 
	                    </fieldset>                         
                    </div>
                </div>
            </div>
            <!--Left메뉴 및 실제 내용 감싸는 div끝-->
            <!--footer를 감싸는 div 시작-->
            <jsp:include page="/Template/Footer.jsp"/>
            <!--footer를 감싸는 div 끝-->
        </div>
    </div>
</body>
</html>
