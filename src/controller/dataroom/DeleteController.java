package controller.dataroom;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dataroom.DataRoomDAO;
import model.dataroom.DataRoomDTO;
import model.dataroom.FileUtils;

public class DeleteController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, 
			HttpServletResponse resp) throws ServletException, IOException {
		//키값 받기
		String key= req.getParameter("key");
		//레코드 삭제 성공후 파일 삭제하자]
		DataRoomDAO dao = new DataRoomDAO(req.getServletContext());
		//레코드 삭제전 파일명 얻기]
		DataRoomDTO dto= dao.selectOne(key);
		int sucOrFail=0;
		if(dto !=null) {
			String original = dto.getAttachedfile();		
			sucOrFail=dao.delete(key);
			if(sucOrFail == 1) {
				//DB레코드 삭제 성공시 업로드된 파일 삭제
				FileUtils.deleteFile(req,"/Upload",original);
			}	
		}
		dao.close();		
		//리퀘스트 영역에 데이타 저장]
		req.setAttribute("SUC_FAIL", sucOrFail);
		//포워드]
		req.getRequestDispatcher("/DataRoom13/Message.jsp").forward(req, resp);
	}////////////////////////////////////////////
}
