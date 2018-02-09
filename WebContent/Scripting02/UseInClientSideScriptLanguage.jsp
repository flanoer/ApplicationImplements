<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//한글처리-post방식일때
 	request.setCharacterEncoding("UTF-8");
	//사용자 선택값 받기]
	String color = request.getParameter("color");
	String font  = request.getParameter("font");
    out.println(String.format("색상:%s,글꼴:%s",color,font));
    if(color==null || color.length()==0){
    	color="black";
    }
    if(font==null || font.length()==0){
    	font="굴림체";
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>UseInClientSideScriptLanguage.jsp</title>
<style>
	span{
		color:<%=color%>;
		font-family:<%=font%>;
	
	}

</style>
</head>
<body>
	<fieldset>
      <legend>HTML안에서 스크립팅요소 사용</legend>
      <% for(int i=1;i<=6;i++){ %>
      <h<%=i %>>제목<%=i %></h<%=i %>> 
      <% } %>      
      <form>
       <input type="text" name="counter"/>
       <input type="submit" value="이미지 카운터"/>  
      </form>
      <%
      	String counter = request.getParameter("counter");
      	//out.println("counter:"+counter);
      	if(counter !=null){
      		char[] ch=counter.toCharArray();
      		for(char number:ch){
      %>
      <img src="../Images/num_<%=number %>.gif" alt="<%=number %>번이미지"/>
      <% 	}//for      
      	}//if %>
     
   </fieldset>
   
   
   <fieldset>
     <legend>CSS안에서 스크립팅 요소 사용</legend>
     <span>CSS를 적용한 텍스트</span>
     <form method="post">
     [글자색] <select name="color">
        <option value="">색상 선태요망</option>
        <option value="Red">빨강</option>
        <option value="Green">그린</option>
        <option value="Blue">블루</option>
        </select>
     [글꼴] <select name="font">
        <option value="">글꼴 선태요망</option>
        <option value="굴림체">굴림체</option>
        <option value="바탕체">바탕체</option>
        <option value="휴먼옛체">휴먼옛체</option>
        </select>
        <input type="submit" value="글꼴 및 색상 변경"/>
     </form> 
    </fieldset> 
  <%
	//사용자 입력값 받기
  	String id=request.getParameter("id");
  	String pwd=request.getParameter("pwd");
  %>
   <script>
   	<% if(id !=null){    	
   		if(id.trim().toUpperCase().equals("KIM") &&
   				pwd.trim().equals("1234")){
   			
   		
   	%>
		alert("<%=id%>님 반갑습니다.");
		
		
	<%}else{%>
	alert("회원이 아닙니다.");
   	<%}//else
   		}//바깥 if%>

	</script>  
   <fieldset>
    <legend>자스안에서 스크립팅 요소 사용</legend>
    <form>
     아이디 <input type="text" name="id"/>
     비밀번호<input type="password" name="pwd"/> 
     <input type="submit" value="로그인"/>   
    </form>
  </fieldset> 
</body>
</html>