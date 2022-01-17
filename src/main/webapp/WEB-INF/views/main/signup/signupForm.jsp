<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>
<div class="wrap">

	<div class="signupTitle">회원가입 페이지</div>

		<form action="/ddarawazoom/signupPro" method="post">
			아이디* : <input type="text" name="id"/>
				    <input type="button" name="id" value="아이디 중복확인"/><br/>
			비밀번호* : <input type="password" name="pw"/><br/>
			비밀번호 재확인* : <input type="password" name="re-pw"/><br/>
	
			이메일* : <input type="text" name="email"/><br/>
			
			닉네임 : <input type="text" name="nick"/>
		           <input type="button" name="re-nick" value="닉네임 중복확인"/><br/>
			*는 필수 항목 사항입니다.<br/>
			
			<input type="radio">약관 전체동의<br/>
			<input type="radio">개인정보 수집 이용동의(필수)<br/>
			<input type="radio">마케팅 활용 및 광고성 정보 수신 동의(선택)<br/>
	
			<input type="submit" value="회원가입" />
	
		</form>
		
</div>


<%@ include file="../../layout/footer.jsp"%>
