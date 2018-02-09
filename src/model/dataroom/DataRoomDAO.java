package model.dataroom;
/*
데이타베이스와 관련된 CRUD작업을 하는 로직을 갖고 있는
클래스-DAO계열(Data Access Object)
*/

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletContext;
import javax.sql.DataSource;

import model.PBKDF2;

public class DataRoomDAO {
	//멤버변수]
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;
	//톰캣이 만들어 놓은 커넥션을 커넥션 풀에서 가져다 쓰기]
	public DataRoomDAO(ServletContext context) {
		try {
			Context ctx = new InitialContext();
			DataSource source=(DataSource)ctx.lookup(context.getInitParameter("TOMCAT_JNDI_ROOT")+"/jdbc/jsp");
			conn = source.getConnection();		
		} 
		catch (NamingException e) {e.printStackTrace();} 
		catch (SQLException e) {e.printStackTrace();}
		
	}////////////////////////
	//자원반납용]-사용한 커넥션 객체를 다시 풀에 반납
	public void close() {
		try {
			//메모리 해제]
			if(rs !=null) rs.close();
			if(psmt !=null) psmt.close();
			// 커넥션 풀에 커넥션 객체 반납-메모리 해제 아님]
			if(conn !=null) conn.close();
			
		} catch (Exception e) {e.printStackTrace();}
	}////////////////////////////
	//전체 목록용]
	/*
	 * 페이징 순서
	 * 1. 전체 목록용 쿼리를 구간쿼리로 변경
	 * 2. 전체 레코드수 얻기용 메소드 추가
	 * 3. 페이징 로직을 리스트 컨틀로러에 추가
	 * 4. 리스트.JSP페이지에 결과값 출력
	 */
	public List<DataRoomDTO> selectList() {
		List list = new Vector();
		
		String sql="SELECT * FROM DATAROOM ORDER BY POSTDATE DESC";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				DataRoomDTO dto = new DataRoomDTO();
				dto.setAttachedfile(rs.getString(7));
				dto.setContent(rs.getString(5));
				dto.setDowncount(rs.getString(6));
				dto.setName(rs.getString(2));
				dto.setNo(rs.getString(1));
				dto.setPass(rs.getString(4));
				dto.setPostdate(rs.getDate(8));
				dto.setTitle(rs.getString(3));
				
				list.add(dto);				
			}			
		} catch (Exception e) {e.printStackTrace();}
		return list;
	}////////////////////////////
	//입력용]
	public int insert(DataRoomDTO dto) {
		int affected=0;
		String sql="INSERT INTO DataRoom(no,name,title,pass,content,attachedfile) VALUES(SEQ_DATAROOM.NEXTVAL,?,?,?,?,?)";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1,dto.getName());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getPass());
			psmt.setString(4, dto.getContent());
			psmt.setString(5, dto.getAttachedfile());
			affected = psmt.executeUpdate();
		} 
		catch (Exception e) {	e.printStackTrace();}
		return affected;
	}////////////////////////
	//상세보기용]
	public DataRoomDTO selectOne(String key) {
		DataRoomDTO dto=null;
		String sql="SELECT * FROM DATAROOM WHERE NO=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, key);
			rs = psmt.executeQuery();
			if(rs.next()) {
				dto = new DataRoomDTO();
				dto.setAttachedfile(rs.getString(7));
				dto.setContent(rs.getString(5));
				dto.setDowncount(rs.getString(6));
				dto.setName(rs.getString(2));
				dto.setNo(rs.getString(1));
				dto.setPass(rs.getString(4));
				dto.setPostdate(rs.getDate(8));
				dto.setTitle(rs.getString(3));
			}
		} catch (Exception e) {e.printStackTrace();}
		return dto;
	}/////////////////////////////////////////
	//비밀번호 체크용]
	public boolean isCorrectpassword(String no, String pass) {
		
		String sql="SELECT pass FROM dataroom WHERE no=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, no);
			rs = psmt.executeQuery();
			if(!rs.next()) return false;//키값이 없는 경우
			String hashedPassword=rs.getString(1);
			if(!PBKDF2.validatePassword(pass, hashedPassword))
				return false;
			
		} catch (Exception e) {e.printStackTrace();return false;}
		
		return true;
	}///////////////////////////////////////////
	//삭제용
	public int delete(String key) {
		int affected=0;
		String sql="DELETE FROM dataroom WHERE NO=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1,key);			
			affected = psmt.executeUpdate();
		} 
		catch (Exception e) {	e.printStackTrace();}
		return affected;
	}///////////////////////////////////
	//수정용]
	public int update(DataRoomDTO dto) {
		int affected=0;
		String sql="UPDATE dataroom SET name=?,title=?,pass=?,content=?,attachedfile=? WHERE no=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1,dto.getName());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getPass());
			psmt.setString(4, dto.getContent());
			psmt.setString(5, dto.getAttachedfile());
			psmt.setString(6, dto.getNo());
			affected = psmt.executeUpdate();
		} 
		catch (Exception e) {	e.printStackTrace();}
		return affected;
	}///////////////////////////////////////
	
	
}////////////////////////////
