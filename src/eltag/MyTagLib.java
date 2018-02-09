package eltag;

import javax.servlet.ServletContext;

import model.BbsDAO;

public class MyTagLib {
	//메소드는 public하고 static해야 한다.반드시 반환값이 있어야 한다.]
	//숫자형식인지 판별하는 메소드]
	public static boolean isNumber(String value) {		
		for(int i=0; i < value.length();i++) {
			if(!(value.codePointAt(i) >='0' && 
					value.codePointAt(i)<='9'))
				return false;
		}
		return true;
	}/////////////////////////////
	/*문]주민번호를 인자로 받아 남성인 경우 "남자"
	   여성인 경우 "여자"를 반환하는 메소드(getGender) 정의
	   그리고 이를 tld파일에 정의하여라
	   주민번호 예]123456-1234567 */
	public static String getGender(String value) {
		
		return value.substring(value.indexOf("-")+1,value.indexOf("-")+2).equals("1")?"남자":"여자";
	}
	//회원여부 판단용]
	public static boolean isMember(String id,String pwd,ServletContext context) {
		BbsDAO dao = new BbsDAO(context);
		boolean flag=dao.isMember(id, pwd);
		dao.close();
		return flag;
	}/////////////////////////
}
