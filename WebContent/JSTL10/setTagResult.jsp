<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>setTagResult.jsp</title>
</head>
<body>
	<fieldset>
		<legend>set태그로 설정한 객체를 EL로 출력</legend>
		<h2>xxxxvar 계열</h2>
		<ul style="list-style-type:decimal;">
			<li>requestvar:${requestScope.requestvar }</li>
			<li>sessionvar:${sessionScope['sessionvar'] }</li>
			<li>applicationvar:${applicationScope["applicationvar"] }</li>
		</ul>
		<h2>MemberDTO 계열</h2>
		<ul style="list-style-type:decimal;">
			<li>아뒤:${requestScope.defaultMember.id}</li>
			<li>비번:${defaultMember.pwd}</li>
			<li>이름:${defaultMember.name}</li>
		</ul>
		<h2>컬렉션 계열</h2>
		<h4>리스트계열</h4>
		<ul style="list-style-type:decimal;">
			<li>아뒤:${list[0].id}</li>
			<li>비번:${list[0].pwd}</li>
			<li>이름:${list[0].name}</li>
		</ul>
		<h4>맵계열</h4>
		 <!--  default는 예약어 고로  map["default"].id방식으로 접근-->
		<ul style="list-style-type:decimal;">
			<li>아뒤:${map['default'].id}</li>
			<li>비번:${map['default'].pwd}</li>
			<li>이름:${map['default'].name}</li>
		</ul>
		<h2>파라미터</h2>
		${param.subject }
	</fieldset>
</body>
</html>