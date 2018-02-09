<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//클라이언트(웹브라우저)에서 전송한 쿠키 읽기]
	Cookie[] cookies=request.getCookies();	
	//상품 저장용
	StringBuffer cart= new StringBuffer();
	//아이디 저장용
	String username="";
	if(cookies !=null){
		for(Cookie cookie:cookies){
			//쿠키명얻기]
			String name=cookie.getName();
			//쿠키값 얻기]
			String value=cookie.getValue();
			if(name.indexOf("product") !=-1){
				//전송된 쿠키값들을 버퍼에 저장]
				cart.append(value);
			}//if
			//아이디 저장용 쿠키 체크]
			if(name.indexOf("USER_ID") !=-1){
				username=value;
			}
					
		}//for
	}//if
%>		
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>CookieExamIndex.jsp</title>
</head>
<body>
	<fieldset>
        <legend>쿠키를 이용한 장바구니 예제</legend>
        <form action="CookieExamCartProcess.jsp">
            <input type="checkbox" name="cart" value="product1" <%if(cart.indexOf("product1")!=-1){ %>disabled checked<%}%> />상품1
            <input type="checkbox" name="cart" value="product2" <%if(cart.indexOf("product2")!=-1){ %>disabled checked<%}%>/>상품2
            <input type="checkbox" name="cart" value="product3" <%if(cart.indexOf("product3")!=-1){ %>disabled checked<%}%>/>상품3
            <input type="checkbox" name="cart" value="product4" <%if(cart.indexOf("product4")!=-1){ %>disabled checked<%}%>/>상품4
            <input type="submit" value="장바구니 담기"/>        
        </form>
        <form action="CookieExamCartEmpty.jsp">
            <input type="submit" value="장바구니 비우기"/>        
        </form>
        <a href="CookieExamCartResult.jsp">장바구니 보기</a>
    </fieldset>
    <fieldset>
        <legend>쿠키를 이용한 아이디 저장 예제</legend>
        <span style="color:red;font-weight:bold"><%=request.getAttribute("ERROR_MESSAGE")==null? "" : request.getAttribute("ERROR_MESSAGE") %></span>
        <form method="post" action="CookieExamLoginProcess.jsp" >
            <table style="width:400px;border-spacing:1px;background-color:green">
                <tr style="background-color:white">
                    <td style="width:25%">아이디</td>
                    <td>
                                
                        <input type="text" name="user" value='<%=request.getParameter("user")==null? username : request.getParameter("user") %>'/>
                   
                        <input type="checkbox" name="idsave" value="Y" <%if(username.length()!=0){ %>checked<%}%>/> 아이디저장
                    </td>
                </tr>
                <tr style="background-color:white">
                    <td>비밀번호</td>
                    <td><input type="password" name="pass" value='<%=request.getParameter("pass")==null? "" : request.getParameter("pass") %>'/></td>
                </tr>
                <tr style="background-color:white;text-align:center">                   
                    <td colspan="2"><input type="submit" value="로그인"/></td>
                </tr>
            </table>       
        </form>
      	<%if(session.getAttribute("USER_ID") != null){ %>
        <a href="CookieExamLoginLogout.jsp">로그아웃</a> 
        <% } %>   
    </fieldset> 
</body>
</html>