<%@page import="org.mvc.bean.MyProfileDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../../layout/header.jsp"%>
   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
	<head>
		<title>MyProfile 작성 페이지</title>
		<link href="../../resources/css/style.css" rel="stylesheet" type="text/css">
		<link href="../resources/myroom/css/simple-sidebar.css" rel="stylesheet">
		
		<script src="../../resources/myroom/js/simple-sidebar.js"></script>
		
	</head>
<body>


<!-- 사이드바 -->
<div class="sidebar" >
    <span class="sidebar-brand">
        <a href="javascript:void(0)" data-toggle="sidebar">
        	<i class="glyphicon glyphicon-arrow-left"></i>
        		메뉴숨기기
        </a><br/>
        <small>Myroom Sidebar </small>
    </span>
    <ul class="sidebar-nav">
        <li>
            <a href="/myroom">
                마 이 룸
            </a>
        </li>
        <li>
            <a href="/myroom/userinfo" data-toggle="collapse" data-target="#menu-collapse-1">
                회 원 정 보
            </a>
        </li>
        <li>
            <a href="javascript:void(0)" data-toggle="collapse" data-target="#menu-collapse-2">
                바디프로필 ▼
            </a>
            <ul id="menu-collapse-2" class="collapse in">
            	<li>
                    <a href="/myroom/bodyprofile">
                      	마이 바디 프로필
                    </a>
                </li>
                <li>
                    <a href="/myroom/bodyprofile/myWrite">
                        마이프로필 작성
                    </a>
                </li>
                <li>
                    <a href="/myroom/bodyprofile/myUpdate">
                       	마이프로필 수정
                    </a>
                </li>
                <li>
                    <a href="/myroom/bodyprofile/bodyWrite">
                        바디프로필 작성
                    </a>
                </li>
                <li>
                    <a href="/myroom/bodyprofile/bodyUpdate">
                        바디프로필 수정
                    </a>
                </li>
            </ul>
          </li>
          <li>
            <a href="javascript:void(0)" data-toggle="collapse" data-target="#menu-collapse-3">
                락 커 룸 ▼
            </a>
            <ul id="menu-collapse-3" class="collapse in">
            	<li>
                    <a href="">
                      	관심 수업
                    </a>
                </li>
                <li>
                    <a href="">
                       관심 VOD
                    </a>
            </li>
         </ul>
                <li>
            		<a href="/myroom/review" data-toggle="collapse" data-target="#menu-collapse-4">
                		리뷰 관리
            		</a>
        		</li>
        		<li>
            		<a href="/myroom/QnA" data-toggle="collapse" data-target="#menu-collapse-5">
                		1:1 문의
            		</a>
        		</li> 
     	</ul>
</div>

<div class="container-fluid">
    <a href="javascript:void(0)" class="btn btn-default" data-toggle="sidebar" style="margin: auto;">
        Menu
    </a>
</div>



		<form method="post" action="/myroom/bodyprofile/myWritePro" enctype="multipart/form-data">
			<div class="container">
				<label for="b_img">* 프로필 이미지</label><br/>
				<input type="file" name="save" />
			</div>
			<div class="container">
				<label for="b_id">* 아이디</label>    <!-- session id  담을 곳 -->
					<input type="text" name="b_id" value="${b_id}"	/>							
			</div>
		
			<div class="container">
				<label for="b_nick">* 닉네임</label>
				<input type="text" name="b_nick" />
			</div>
		
			<div class="container">
				<label for="b_name">* 이 름</label>
				<input type="text" name="b_name" />
			</div>
			
			<div class="container">
				<label for="b_gender">* 성 별</label>
				<select name="b_gender">
					<option value="성별선택">성별선택</option>
					<option value="남">남</option>
					<option value="여">여</option>
				</select>
			</div>
			
			<div class="container">
				<label for="b_birth">* 생년월일</label>
				<input class="date" type="date" name="b_birth" />
			</div>
			
			<div class="container">
				<label for="b_tel">* 연락처</label>
				<input type="text" name="b_tel" placeholder="전화번호 입력" />
			</div>
			
			<div class="container">
				<label for="b_email">* 이메일</label>
				<input type="email" name="b_email" />	
			</div>
			<input type="submit" value="입력하기" />
				&nbsp;
			<input type="reset" value="다시작성하기" />
				&nbsp;
			<input type="button" value="마이룸이동" onClick="javascript:window.location='/myroom'" />
		</form>
	
</body>
</html>

<%@ include file="../../layout/footer.jsp"%>