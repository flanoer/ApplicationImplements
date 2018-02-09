package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ContentTypeController extends HttpServlet {
	//[JSP로 페이지 이동 안하고 서블릿에서 웹브라우저로
	//직접 출력]
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//컨텐츠 타입 응답헤더에 설정]
		resp.setContentType("text/html; charset=UTF-8");
		//웹브라우저로 출력하기위한 출력 스트림 생성]
		PrintWriter out= resp.getWriter();
		//out으로 웹브라우저에 출력]
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<meta charset=\"UTF-8\" />");
		out.println("<title>Insert title here</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h2>서블릿에서 브라우저로 직접 출력</h2>");
		out.println("</body>");
		out.println("</html>");
		//스트림 닫기]
		out.close();
	}
}
