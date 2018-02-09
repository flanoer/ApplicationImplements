<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!

	private String getProductName(String code){
		
		switch(code){
			case "product1":return "상품1";
			case "product2":return "상품2";
			case "product3":return "상품3";
			default:return "상품4";		
		}
	
	}


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>CookieExamCartResult.jsp</title>
</head>
<body>
	<fieldset>
		<legend>장바구니 예제(장바구니에 담은 상품들)</legend>
		<ul style="list-style-type:upper-roman;">
			<%
			//쿠키값 읽어오기]
			Cookie[] cookies=request.getCookies();		
			if(cookies !=null){
				for(Cookie cookie:cookies){
					//쿠키명얻기]
					String name=cookie.getName();
					//쿠키값 얻기]
					String value=cookie.getValue();
					if(name.indexOf("product") !=-1){
						%>
					<li><%=getProductName(value) %></li>
						<%
					}//if					
				}//for
			}//if
			%>		
			
		</ul>
		<a href="CookieExamIndex.jsp">쇼핑 계속하기</a>
	</fieldset>
</body>
</html>