<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>userInfo 수정페이지</title>
	</head>
<body>

	<div class="container">
	  <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
	    <div class="row g-5">
	      <div class="col-md-7 col-lg-8">
	        <h4 class="mb-3">멤버 정보 수정</h4>
	        <form class="needs-validation" novalidate id="updateForm" action="/coachroom/info" method="post" onsubmit="update_submit();">
	          <div class="row g-3">
	            <div class="col-sm-6">
	              <label for="firstName" class="form-label">이름</label>
	              <input type="text" class="form-control" id="c_name" name="c_name" placeholder="" value="${coachInfo.c_name}" required>
	              <div class="invalid-feedback">
	                이름은 필수항목입니다.
	              </div>
	            </div>
	
	            <div class="col-6">
	              <label for="username" class="form-label">닉네임</label>
	              <div class="input-group has-validation">
	                <input type="text" class="form-control" id="c_nick" name="c_nick" value="${coachInfo.c_nick}" required>
	              <div class="invalid-feedback">
	                  닉네임은 필수항목입니다.
	                </div>
	              </div>
	            </div>
	
	            <div class="col-12">
	              <label for="email" class="form-label">이메일</label>
	              <input type="email" class="form-control" id="c_email" name="c_email" value="${coachInfo.c_email}" required>
	              <div class="invalid-feedback">
	                이메일은 필수항목입니다.
	              </div>
	            </div>
	            <div class="col-12">
	              <label for="address" class="form-label">생년월일</label>
	              <input type="date" class="form-control" id="c_birth" name="c_birth" value="${birth}" required>
	              <div class="invalid-feedback">
	                생년월일은 필수항목입니다.
	              </div>
	            </div>
	
	            <div class="col-12">
	              <label for="address2" class="form-label">소속 회사 <span class="text-muted">(선택사항)</span></label>
	              <input type="text" class="form-control" id="company" name="company" placeholder="소속 회사를 입력하세요." value="${coachInfo.company}">
	            </div>
	
	            <div class="col-md-5">
	              <label for="country" class="form-label">성별</label>
	              <select class="form-select" id="c_gender" name="c_gender" required>
	               	<option value="">선택하세요</option>
	                <option value="0">남성</option>
	                <option value="1">여성</option>
	              </select>
	              <div class="invalid-feedback">
	                성별은 필수항목입니다.
	              </div>
	            </div>
	          </div>
	
	          <hr class="my-4">
	          
	          <button class="w-40 btn btn-primary btn-lg" type="submit">
	          	정보 수정
	          </button>
	          
	          <button class="w-40 btn btn-danger btn-lg" onclick="window.location='/coachroom/info'">
	          	취소
	          </button>
	        </form>
	      </div>
	    </div>
	  </main>
	</div>
	
</body>
</html>