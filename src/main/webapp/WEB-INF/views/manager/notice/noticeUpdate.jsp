<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>

<html>
<head>
	<title>공지사항 수정 페이지</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="../../resources/js/manager/notice.js" type="text/javascript" ></script>
	
	<link href="../../resources/css/manager/notice.css" rel="stylesheet">
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
	
</head>
<body>
	<div class="container">
	    <div class="row">
	        <div class="col-lg-12">
	            <h3 class="text-dark">Notice Content 페이지&nbsp;<img src="../../resources/image/Exercise.svg" class="notis_img" ></h3>
	        </div>
	    </div>
	    <div class="row">
	        <div class="col-lg-12">
	            <div class="job-detail mt-2 p-4">
	                <div class="row">
	                    <div class="col-lg-12">
	                    </div>
	                </div>
	                <div class="custom-form">
	                	<form class="needs-validation" method="post" action="/manager/noticeUpdatePro" enctype="multipart/form-data">
	                		<input type="hidden" name="num" value="${noticeDTO.num}" />
	                        <div class="row">
	                            <div class="col-md-4">
	                                <div class="form-group app-label">
	                                    <label for="writer_id" class="text-muted">작 성 자</label><br/>
	                                   ${noticeDTO.writer_id} 님
	                                </div>
	                            </div>
	                            <div class="col-md-4">
	                                <div class="form-group app-label">
	                                    <label for="taget_id" class="text-muted">공지 확인 대상</label>
	                                    <div class="form-button">
	                                        <select class="nice-select" name="target_id" id="target_id" required>
	                                            <option data-display="${noticeDTO.target_id}">${noticeDTO.target_id}</option>
	                                            <option value="All">All</option>
	                                            <option value="Coach">Coach</option>
	                                            <option value="Member">Member</option>
	                                        </select>
	                                    </div>
	                                    <div class="invalid-feedback">
					     					option을 선택해주세요.
					     				</div>
	                                </div>
	                            </div>
	                            <div class="col-md-4">
	                                <div class="form-group app-label">
	                                    <label for="marital-status" class="text-muted">상단고정 여부</label>
	                                    <div class="form-button">
	                                        <select class="nice-select" name="pin" id="pin" required>
	                                            <option data-display="${noticeDTO.pin}">${noticeDTO.pin}</option>
	                                            <option value="yes">yes</option>
	                                            <option value="no">no</option>
	                                        </select>
	                                    </div>
	                                    <div class="invalid-feedback">
					     					option을 선택해주세요.
					     				</div>
	                                </div>
	                            </div>
	                            <div class="col-md-12">
	                                <div class="form-group app-label">
	                                    <label for="university/college" class="text-muted">제 목</label>
	                                    <input id="university/college" type="text" id="title" name="title" class="form-control resume" value="${noticeDTO.title}" required>
	                                </div>
	                                <div class="invalid-feedback">
					     				제목을 입력해주세요.
					     			</div>
	                            </div>
	                             <div class="col-lg-12">
	                                <div class="form-group app-label">
	                                    <label for="content" class="text-muted">내 용</label>
	                                    <textarea id="content" rows="4" id="content" name="content" class="form-control resume" required>${noticeDTO.content}</textarea>
	                                </div>
	                                <div class="invalid-feedback">
					     				내용을 입력해주세요.
					     			</div>
	                            </div>
	                            <div class="col-md-12">
	                             	<label for="img" class="text-muted">첨부 파일</label>
	                             	<img src="../../resources/image/upload/${noticeDTO.img}" alt="img">
	  								<input class="form-control" type="file" id="save" name="save" multiple="multiple"  required>
	                            </div>
	                        </div>
	                         <div class="col-lg-12">
	                          	<div class="text-center">
	                          		<input type="submit" class="btn btn-outline-black" value="수정 하기" />
	                          			&nbsp;
	                          		<input type="reset" class="btn btn-outline-black" value="다시 작성하기" />
										&nbsp;
									<input type="button" class="btn btn-outline-black" value="공지사항 페이지로 돌아가기" onClick="javascript:window.location='/manager/notice'" />
	                        	</div>
	                        </div>
	                    </form>
	                </div>
	            </div>
	        </div>
	    </div>
    </div>
</body>
</html>

<%@ include file="../../layout/footer.jsp"%>