<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- ResponseForRedirectProcess.jsp -->
<%
	//POST방식으로만 받자]
	String method=request.getMethod();
	if(!method.equalsIgnoreCase("POST")){
	%>
		<script>
			alert('잘못된 접근입니다.');
			history.back();
		</script>
	<%
		return;
	}
	
	/*
	사용자가 입력한 아이디와 비번을 받아서 회원인지 판단한후
	회원인 경우 마이페이지로 이동시키고
	회원이 아닌 경우 다시 로그인 페이지로 이동시키자]
	가정]아이디가 kim이고 비번이 1234가 회원이라고 가정
	*/
	//1]사용자 입력값 받기
	String id= request.getParameter("id");
	String pwd= request.getParameter("pwd");
	if(id.trim().equals("")){
		out.println("<script>");
		out.println("alert('아이디를 입력하세요.');");
		out.println("history.back();");
		out.println("</script>");
	}
	else if(pwd.trim().length()==0){
	%>	
		<script>
			alert('비번을 입력하세요.');
			history.back();
		</script>
	<%
	}
	else{//정상적으로 입력한 경우
		//2]회원여부 판단(데이타 베이스의 테이블에서 조회)		
		//3]회원인 경우 로그인처리(session객체로)후
		//  마이페이지로 이동,
		//  회원이 아니면 다시 로그인 페이지로 이동.
		if(id.trim().equals("kim") && 
			 pwd.trim().equals("1234")){//회원인 경우]
			//방법1]sendRedirect("자동으로 이동할  페이지 주소");
			//response.sendRedirect(request.getContextPath()+"/InnerObject03/ResponseForSelfPage.jsp?user="+id+"&pass="+pwd);
			//방법2]자스로 메시지 띄운 후 이동
			//out.println("<script>");
			//out.println("alert('"+id+"님 반갑습니다.')");
			//out.println(String.format("location.href='%s/InnerObject03/ResponseForSelfPage.jsp?user=%s&pass=%s';",request.getContextPath(),id,pwd));
			//out.println("</script>");
			/* 
			sendRedirect()메소드를 사용하는 경우
			이전의 자바스크립트 코드는 실행이 안된다.
			※sendRedirect메소드는 자스의 location.href와 같다
			*/
			//방법3]URL에 노출이 안되도록 쿼리 스트링이 아닌 POST방식으로]
			%>
				<form method="post" action="ResponseForSelfPage.jsp">
					<input type="hidden" name="user" value="<%=id%>"/>
					<input type="hidden" name="pass" value="<%=pwd%>"/>
				</form>
				<script>
					alert("<%=id%>님 마이 페이지로 이동합니다");
					document.forms[0].submit();
				</script>
			<%
		}
		else{//회원이 아닌 경우]
			//response.sendRedirect("ResponseForRedirectIndex.jsp");
		%>
			<script>
				alert("아뒤와 비번 불일치....");
				//기존값이 유지됨.
				//history.back();
				//기존값이 사라짐			
				location.href="ResponseForRedirectIndex.jsp";
			</script>
		
		<%
		}
		
	}///////////////////////////////
%>