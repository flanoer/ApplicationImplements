<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>IncludeMember.jsp</title>
	<meta charset="utf-8" />
    <link rel="stylesheet" href="../Styles/divLayout.css" type="text/css" />
</head>
<body>
    <div class="allWrap">
        <div class="partWrap">
            <!-- 탑메뉴 및 로고 감싸는 div 시작 -->
            <div class="header">
                <div class="logo">
                    <img src="../Images/logo.png" alt="로고이미지" />
                </div>
                <%@ include file="/Template/Top.jsp" %>
            </div>
            <!-- 탑메뉴 및 로고 감싸는 div 끝 -->
            <!--Left메뉴 및 실제 내용 감싸는 div시작-->
            <div class="section">
                <%@ include file="/Template/Left.jsp" %>
                <div class="body">
                    <div class="content">
                        <h2>회원 가입</h2>
                        <%@include file="IncludedPage.jsp" %>                        
    					<form method="post" name="frmObj" action="IncludeMemberComplete.jsp">

				        <table style="width:75%;border-spacing:1px;background-color:green">
				
				            <tr style="background-color:white">
				                <td>아이디</td>
				                <td><input type="text" name="id" size="20" /></td>
				            </tr>
				            <tr style="background-color:white">
				                <td>비밀번호</td>
				                <td><input type="password" name="pwd" size="20" /></td>
				            </tr>
				            <tr style="background-color:white">
				                <td>비밀번호확인</td>
				                <td><input type="password" name="pwd2" id="pwd2" size="20" /></td>
				            </tr>
				            <tr style="background-color:white">
				                <td>성별</td>
				                <td>
				                    <input type="radio" name="gender" value="man" />남
				                    <input type="radio" name="gender" value="woman" />녀
				                    <input type="radio" name="gender" value="trans" />트랜스젠더
				                </td>
				            </tr>
				            <tr style="background-color:white">
				                <td>관심사항</td>
				                <td>
				                    <input type="checkbox" name="inter" value="pol" />정치
				                    <input type="checkbox" name="inter" value="eco" />경제
				                    <input type="checkbox" name="inter" value="spo" />스포츠
				                    <input type="checkbox" name="inter" value="ent" />연예
				                </td>
				            </tr>
				            <tr style="background-color:white">
				                <td>학력사항</td>
				                <td>
				                    <select name="grade">
				                        <option value="">==학력을 선택하세요==</option>
				                        <option value="ele">초등학교</option>
				                        <option value="mid">중학교</option>
				                        <option value="hig">고등학교</option>
				                        <option value="uni">대학교</option>
				                    </select>
				                </td>
				            </tr>
				            <tr style="background-color:white">
				                <td>첨부파일</td>
				                <td>
				                    <input type="file" name="file" size="40"  />
				                </td>
				            </tr>
				            <tr style="background-color:white">
				                <td>자기소개</td>
				                <td>
				                    <textarea cols="60" rows="5" name="self" ></textarea>
				                </td>
				            </tr>
				            <tr style="background-color:white">
				                <td colspan="2" align="center">
				                    <table>
				                        
				                        <tr>
				                            <td>
				                                <input type="submit" value="회원가입" title="type=submit" />
				                            </td>
				                            
				                        </tr>
				                    </table>
				                </td>
				            </tr>
				        </table>
				    </form>
                    </div>
                </div>
            </div>
            <!--Left메뉴 및 실제 내용 감싸는 div끝-->
            <!--footer를 감싸는 div 시작-->
            <%@ include file="/Template/Footer.jsp" %>
            <!--footer를 감싸는 div 끝-->
        </div>
    </div>
</body>
</html>
