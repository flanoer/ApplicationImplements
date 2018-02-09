<%@page import="java.util.Currency"%>
<%@page import="java.text.NumberFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 코어 태그를 위한 라이브러리 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 국제화 태그를 위한 라이브러리 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>FormatNumberTag.jsp</title>
</head>
<body>
	<fieldset>
		<legend>국제화 태그:formatNumber태그</legend>
		<!-- JSTL 코어 태그를 이용해서 변수 선언 -->
		<c:set var="money" value="10000"/>
		<h2>필수 속성만 사용</h2>
		<!-- 필수 속성: value  
			 type속성의 기본값:number
		     groupingUsed속성의 기본값:true(1000단위로 콤마를 찍는다)
		 -->
		
		<h4>EL로 출력</h4>
		\${money} : ${money}
		<h4>JSTL의 국제화 태그로 출력</h4>
		<fmt:formatNumber value="${money}"/>
		<h4>JSTL의 국제화 태그로 출력-천단위로 ,(콤마)찍기 생략</h4>
		<fmt:formatNumber value="${money}" groupingUsed="false"/>
		<h4>type="currency" 이고 currencySymbol-현지 통화단위로 출력</h4>
		<fmt:formatNumber value="${money }" type="currency" currencySymbol="$"/>
		<h4>type="percent"</h4>
		<fmt:formatNumber type="percent" value="0.05"/>
		<h4>원하는 위치에 출력하고자 할때</h4>
		<fmt:formatNumber value="${money }" type="currency" var="price"/>
		<h4>아래에 위 가격을 출력</h4>
		가격이 <span style="color:red;font-size:1.5em;font-weight:bold">${price }</span>내렸어요
		<h2>자바코드로 천단위로 콤마찍기</h2>
		<%
		int money =Integer.parseInt(pageContext.getAttribute("money").toString());
		NumberFormat nf=NumberFormat.getInstance();
		//천다위로 콤마찍기:format()메소드
		String commaMoney=nf.format(money);
		out.println("<h4>천단위로 콤마찍기</h4>");
		out.println("money:"+money+",commaMoney:"+commaMoney);
		//현지통화 기호 얻기]
		Currency currency=nf.getCurrency();
		String symbol=currency.getSymbol();
		out.println("<h4>통화 출력</h4>");
		out.println(symbol+commaMoney);
		%>
	</fieldset>
</body>
</html>