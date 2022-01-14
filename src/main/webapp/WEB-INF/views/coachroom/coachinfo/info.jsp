<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/resources/coach/custom/js/coach-info.js" type="text/javascript"></script>

<style>
	.coachInfo {
		margin-bottom: 20px;
	}
	
	.coachCareer {
		margin-top: 20px;
	}
	.center {
		text-align: center;
		margin: 0 auto;
		margin-bottom: 20px;
	}
</style>

<body>
<div class="row">
    <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
      <div class="position-sticky pt-3">
        <ul class="nav flex-column">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="#" onclick="window.location='/coachroom'">
              <span data-feather="home"></span>
              코치룸
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#" onclick="window.location='/coachroom/schedule'">
              <span data-feather="file"></span>
              스케줄 관리
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#" onclick="window.location='/coachroom/info'">
              <span data-feather="user"></span>
              내 정보 관리
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="users"></span>
              회원 관리
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="bar-chart-2"></span>
              리뷰 관리
            </a>
          </li>
        </ul>
        
        <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
          <span>Saved reports</span>
          <a class="link-secondary" href="#" aria-label="Add a new report">
            <span data-feather="plus-circle"></span>
          </a>
        </h6>
        <ul class="nav flex-column mb-2">
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="file-text"></span>
              Current month
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="file-text"></span>
              Last quarter
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="file-text"></span>
              Social engagement
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="file-text"></span>
              Year-end sale
            </a>
          </li>
        </ul>
        
      </div>
    </nav>
    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
    		<div class="btn-toolbar mb-2 mb-md-0" style="float: right;">
	          <div class="btn-group me-2">
	            <button type="button" class="btn btn-sm btn-outline-secondary" onclick="imgUpdateForm();">프로필 사진 변경</button>
	            <button type="button" class="btn btn-sm btn-outline-secondary" onclick="window.location='/coachroom/infoUpdate'">정보 수정</button>
	            <button type="button" class="btn btn-sm btn-outline-secondary" onclick="window.location='/coachroom/careerUpdate'">경력 수정</button>
	          </div>
	        </div>	
	    
		    <div class="center">
				프로필 사진 : ${coachInfo.c_img} <br/>
			</div>
		
			<div class="coachInfo">
				<h2>기본 정보</h2>
			    <div class="table-responsive">
			      <table class="table table-striped table-sm">
			        <thead>
			          <tr>
			            <th scope="col">이름</th>
			            <th scope="col">닉네임</th>
			            <th scope="col">성별</th>
			            <th scope="col">생년월일</th>
			            <th scope="col">연락처</th>
			            <th scope="col">이메일</th>
			            <th scope="col">소속</th>
			          </tr>
			       </thead>
			        <tbody>
			          <tr>
			            <td>${coachInfo.c_name}</td>
			            <td>${coachInfo.c_nick}</td>
			            <td>${coachInfo.c_gender}</td>
			            <td><fmt:formatDate pattern="yyyy년 MM월 dd일" value="${coachInfo.c_birth}" /></td>
			            <td>${coachInfo.c_tel}</td>
			            <td>${coachInfo.c_email}</td>
			            <td>${coachInfo.company}</td>
			          </tr>
			        </tbody>
			      </table>
			    </div>
			</div>
			
			<div class="coachCareer">
			  <h2>경력 정보</h2>
			    <div class="table-responsive">
			      <table class="table table-striped table-sm">
			        <thead>
			          <tr>
			            <th scope="col">전문 분야</th>
			            <th scope="col">경력</th>
			            <th scope="col">자격증</th>
			          </tr>
			       </thead>
			        <tbody>
			          <c:forEach var="coachCareer" items="${coachCareer}">
			        	<tr>
			              <td>${coachCareer.specialty}</td>
			              <td>${coachCareer.career}</td>
			              <td>${coachCareer.certificate}</td>
			            </tr>
			          </c:forEach>
			        </tbody>
			      </table>
				</div>
			</div>
    </main>
</div>

    <script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js" integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js" integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha" crossorigin="anonymous"></script>
    <script src="/resources/coach/custom/js/dashboard.js"></script>

</body>
</html>

<%@ include file="../../layout/footer.jsp"%>