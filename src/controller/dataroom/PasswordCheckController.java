package controller.dataroom;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dataroom.DataRoomDAO;

public class PasswordCheckController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//파라미터 받기]
		String key = req.getParameter("key");
		String mode = req.getParameter("mode");
		String pass = req.getParameter("pass");
		//모델호출 및 결과값 받기]
		DataRoomDAO dao = new DataRoomDAO(req.getServletContext());
		boolean flag=dao.isCorrectpassword(key,pass);
		dao.close();
		//결과값을 리퀘스트 영역에 저장]
		req.setAttribute("PASS_CORRECT", flag);
		//뷰 선택 후 포워딩]
		req.getRequestDispatcher("/DataRoom13/Password.jsp").forward(req, resp);
	}//////////////////////////////////
}
