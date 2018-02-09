<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html>
<head>
    <title>Login.jsp</title>
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
			            	<legend>로그인 페이지</legend>        
			                      
			                <span style="color:red;font-weight:bold"><%=request.getAttribute("ERROR")==null?"":request.getAttribute("ERROR") %></span>
			                 <form method="post" action="LoginProcess.jsp" >
			                  <table style="width:300px;border-spacing:1px;background-color:green">
			                   <tr style="background-color:white">
			                    <td style="width:25%">아이디</td>
			                    <td><input type="text" name="user" value="<%=request.getParameter("user")==null?"":request.getParameter("user")  %>"/></td>
			                   </tr>
			                   <tr style="background-color:white">
			                    <td>비밀번호</td>
			                    <td><input type="password" name="pass" value="<%=request.getParameter("pass")==null?"":request.getParameter("pass")  %>"></td>
			                   </tr>
			                   <tr style="background-color:white;text-align:center">     
			                    <td colspan="2"><input type="submit" value="로그인"/></td>
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
