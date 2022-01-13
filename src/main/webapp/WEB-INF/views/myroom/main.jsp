<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../layout/header.jsp"%>

<!DOCTYPE html>
<html>
	<head>
		<title>Myroom Main 페이지</title>
	    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" rel="stylesheet">
	    
	    <link href="../resources/myroom/css/simple-sidebar.css" rel="stylesheet">
	    <link href="../resources/css/style.css" rel="stylesheet">
	    
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
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
                <div class="caret"></div>
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
                <div class="caret"></div>
            </a>
            <ul id="menu-collapse-3" class="collapse in" >
            	<li>
                    <a href="">
                      	락 커 룸
                    </a>
                </li>
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


<%@ include file="../layout/footer.jsp"%>