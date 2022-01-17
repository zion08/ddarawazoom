<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>

<div class="wrap">
	<div class="signupTitle">코치 회원가입 페이지를 구현~~~!!</div>

		<form action="/coachsignupPro" method="post">

		<div class="coachinfo">
			아이디 : <input type="text" name="c_id"/>
			    	<input type="button" name="re-c_id" value="아이디 중복확인"/><br/>
		
			비밀번호 : <input type="password" name="c_pw"/><br/>
			비밀번호재확인 : <input type="password" name="re-pw"/><br/>
		
			이름 : <input type="text" name="c_name"/><br/>
		
			닉네임 : <input type="text" name="c_nick"/>
		           <input type="button" name="c_re-nick" value="닉네임 중복확인"/><br/>
		
			성별 : <input type="radio" name="c_sex"/>남
			  	  <input type="radio" name="c_sex"/>여
			      <br/>
			생년월일 : <input type="date" name="c_birth"/><br/>
			연락처 : <input type="text" name="c_tel"/><br/>
			이메일 : <input type="text" name="c_email"/><br/>
			프로필 사진 : <input type="image" name="c_image" src=""><br/>
			관련 소속 : <input type="text" name="company"/><br/>
		</div>
	
		수업 가능 시간대 : <input type="text" name="c_time"/><br/>
		상태 : <input type="text" name="c_status"/><br/>
		가입일 : <input type="date" name="c_regdate"/><br/>
	
		<input type="button" name="submit" value="저장"/>
</form>

</div>

<%@ include file="../../layout/footer.jsp"%>