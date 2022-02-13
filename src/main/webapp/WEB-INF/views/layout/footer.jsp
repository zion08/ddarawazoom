<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  
<div class="container">
	<footer class="row row-cols-5 py-5 my-3 border-top">
    	<div class="col">
      		<a href="/ddarawazoom" class="d-flex align-items-center mb-3 link-dark text-decoration-none">
        		<img class="bi me-2" width="40" height="32" src="../../resources/image/Exercise.svg"/>
      		</a>
    		 <p class="text-muted">&copy; 2022</p>
    	</div>



    <div class="col fs-7">
      <h6 class="fw-bold">따라와줌</h6>
      <ul class="nav flex-column">
        <li class="nav-item mb-2"><a href="/ddarawazoom/intro" class="nav-link p-0 text-muted">사이트 소개</a></li>
        <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">이용 방법</a></li>
        <li class="nav-item mb-2"><a href="/ddarawazoom/notice" class="nav-link p-0 text-muted">공지 사항</a></li>
        <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">QnA</a></li>
      </ul>
    </div>

    <div class="col">
      <h6 class="fw-bold">온라인 강의</h6>
      <ul class="nav flex-column">
        <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">Zoom 강의</a></li>
        <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">Vod 강의</a></li>
      </ul>
    </div>

    <div class="col">
      <h6 class="fw-bold">맴버</h6>
      <ul class="nav flex-column">
        <li class="nav-item mb-2"><a href="/myroom" class="nav-link p-0 text-muted">마이룸</a></li>
     <c:if test="${sessionScope.id != null}">
        <li class="nav-item mb-2"><a href="/myroom/bodyprofile" class="nav-link p-0 text-muted">바디프로필</a></li>
      </c:if>
      </ul>
    </div>
    
    <div class="col">
      <h6 class="fw-bold">코치</h6>
      <ul class="nav flex-column">
        <li class="nav-item mb-2"><a href="/ddarawazoom/coachIntro" class="nav-link p-0 text-muted">코치소개</a></li>
      </ul>
    </div>
    
  </footer>
</div>