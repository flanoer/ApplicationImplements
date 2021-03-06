package model.dataroom;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class FileUtils {
	//파일업로드 로직]
	public static MultipartRequest upload(HttpServletRequest req,String saveDirectory) {
		MultipartRequest mr = null;
		try {
			mr = new MultipartRequest(
					req, 
					saveDirectory,
					1024*500,
					"UTF-8",
					new DefaultFileRenamePolicy());
		}
		catch(Exception e) {e.printStackTrace();}
		return mr;
	}///////////////////////////////
	//파일 삭제 로직]
	public static void deleteFile(HttpServletRequest req, 
			String directory, 
			String original) {
		//서버의 물리적 경로 얻기]
		String saveDirectory = req.getServletContext().getRealPath(directory);
		//파일 객체 생성]
		File file = new File(saveDirectory+File.separator+original);
		//파일 존재 여부 판단후 삭제]
		if(file.exists()) file.delete();
		
	}///////////////////////////////
}
