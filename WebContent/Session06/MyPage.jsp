<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html>
<head>
    <title>MyPage.jsp</title>
	<meta charset="utf-8" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/Styles/divLayout.css" type="text/css" />
	
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
			            	<legend>마이 페이지</legend>
			                  <table style="width:300px;border-spacing:1px;background-color:green">
			                   <tr style="background-color:white">
			                    <td style="width:25%">아이디</td>
			                    <td><%=session.getAttribute("USER_ID") %></td>
			                   </tr>
			                   <tr style="background-color:white">
			                    <td>비밀번호</td>
			                    <td><%=session.getAttribute("USER_PWD") %></td>
			                   </tr>
			                   <tr style="background-color:white;text-align:center">     
			                    <td colspan="2">
			                    	<a href="Logout.jsp">로그아웃</a>
			                    </td>
			                   </tr>
			                  </table>  
			                 </form>                
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
