<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<%@ include file="../../layout/header.jsp"%>    

<div class="container-fluid"> 
	<div class="album py-2 bg-light">
    	<h2 style="text-align: center;"> 따라와 줌 </h2>
    	<h3 style="text-align: center;"> 온라인PT 상세페이지</h3> 
    <div class="container">
    
	<div class="row row-cols-1 row-cols-sm-1 row-cols-md-1 g-3">
		<div class="col">
		<div class="card shadow-sm">  
			<img src="/resources/coach/img/${ZoomDTO.img}" class="card-img-top" width="100" height="625">
			<c:if test="${id == null && c_id != null}">	
				<input type="button" value="사진변경" class="btn btn-outline-danger" onclick="window.location='/ddarawazoom/imgUpdate?img=${ZoomDTO.img}&num=${ZoomDTO.num}'" />
			</c:if>	
		<div class="btn-group">	
           	<c:if test="${id == null && c_id != null}">
				<input type="button" class="btn btn-outline-danger" value="글수정" onclick="document.location.href='/ddarawazoom/zupdateForm?num=${ZoomDTO.num}'">
				<input type="button" class="btn btn-outline-danger" value="글삭제" onclick="document.location.href='/ddarawazoom/zdeleteForm?num=${ZoomDTO.num}'"> 
			</c:if>	
				<input type="button" class="btn btn-outline-secondary" value="글목록" onclick="document.location.href='/ddarawazoom/zoom'">
				<input type="button" class="btn btn-outline-primary" value="관심목록 담기">
				<input type="button" class="btn btn-outline-primary" value="장바구니 담기">
				<input type="button" class="btn btn-outline-primary" value="바로 결제하기">
			</div>
			<div>
				<br />
				&nbsp;&nbsp;<button type="button" class="btn btn-m btn-danger" disabled>${ZoomDTO.type}</button>	 	 
             	&nbsp;&nbsp;<button type="button" class="btn btn-m btn-success" disabled>${ZoomDTO.goal}</button>
             	&nbsp;&nbsp;<button type="button" class="btn btn-m btn-warning" disabled>${ZoomDTO.tool}</button>
             	&nbsp;&nbsp;<button type="button" class="btn btn-m btn-primary" disabled>${ZoomDTO.frequency}</button> 
			</div>
			<div class="card-body">
				<h4 align="left">No.${ZoomDTO.num}</h4><h5 align="left">${ZoomDTO.count}회 조회</h5>
				<h2>${ZoomDTO.title}</h2>
				<h5>&nbsp;&nbsp;&nbsp;&nbsp;<font color="blue">${ZoomDTO.c_id}</font> 강사님</h5><br />
				<h5>&nbsp;&nbsp;${ZoomDTO.intro}</h5>
			</div>
		</div>	
		</div>
	</div>
	
	<br >
	
	<div class="row row-cols-1 row-cols-sm-1 row-cols-md-1 g-3">
		<div class="col">
			<h2>후기</h2> 
			
			<script type="text/javascript">
			    function validate(){
			        x=document.numbercheck
			        txt=x.grade.value
			        if (txt>=1 && txt<=10) {
						alert("맞게 입력하셨습니다.")
			            return false
			        }else{
			            alert("1부터 10까지 숫자만 입력가능합니다.")
			            return false
			        }
				}
			</script> 
			
			<hr class="featurette-divider">
	  			<div class="row featurette">
  			 	<div class="col-md-12">
  			 		<form action="re_writePro" method="post" name="numbercheck">
	  			 		<input type="hidden" name="class_num" value="${ZoomDTO.num}">
	  			 		<input type="hidden" name="title" value="${ZoomDTO.title}">
	     	 	  	<table class="table table-bordered">
	  		    		<thead>
					 		<tr>
								<th scope="col" style="width: 100px;"></th>
								<th scope="col" style="width: 30%;">아이디</th>
								<th scope="col" style="width: 30%;">닉네임</th>
								<th scope="col">평점(총점 10점)</th>
						 	</tr>
						</thead>			
						<tbody>
		      		 		<tr>
				        	    <th scope="row"></th>
				        	    <td><input type="text" name="id"></td>
				                <td><input type="text" name="nick"></td>
				                <td><input type="text" name="grade" size="3">&nbsp;<input type="button" value="확인" onclick='return validate(this.form);'></td>  
				            </tr>
				            <tr>
				                <th scope="row"> 강의명 </th>
				                <td colspan="3">${ZoomDTO.title}</td>
				            </tr>
				      		<tr>
				                <th scope="row"> 후기 </th>
				                <td colspan="3"><textarea name="content" rows="3" cols="100"></textarea></td>
				            </tr>
				            <tr>
				            	<td colspan="4" align="right">
					            	<input type="submit" value="작성하기">&nbsp;&nbsp;
					            	<input type="reset" value="초기화하기">&nbsp;&nbsp;		           
				            	</td>
				            </tr>
	  		           </tbody>
	        	   </table>
		           </form>			
		       </div>
			   </div>
					   
		   <c:if test="${contentCount > 0}">
		   <c:forEach var="reContent" items="${reContent}"> 
		   <hr class="featurette-divider">
  				<div class="row featurette">
  			 	<div class="col-md-12">
     	 	  		<table class="table table-bordered">
  		    			<thead>
							 <tr>
								<th scope="col" style="width: 100px;"></th>
								<th scope="col" style="width: 30%;">닉네임</th> 
								<th scope="col">평점</th>
							 </tr>
						</thead>								
						<tbody>
				      		 <tr>
				        	    <th scope="row"></th>
				                <td>${reContent.nick}</td>
				                <td>${reContent.grade}/10</td>
				            </tr>
				            <tr>
				                <th scope="row"> 강의명 </th>
				                <td colspan="2">${reContent.title}</td>
				            </tr>
				      		<tr>
				                <th scope="row"> 후기 </th>
				                <td colspan="2">${reContent.content}</td> 
				            </tr>
	  		           </tbody>
			         </table>				      			
			     </div>
				 </div>
			</c:forEach>
			</c:if>
		
			<div id="page">페이지&nbsp;  
				<c:if test="${startPage > pageBlock}">
					<a href="/ddarawazoom/zclasscontent?num=${num}&pageNum=${startPage}-${pageBlock}"> [이전] </a>
				</c:if>
				
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<a href="/ddarawazoom/zclasscontent?num=${num}&pageNum=${i}">${i}</a>
				</c:forEach>
				
				<c:if test="${endPage < totalPage}">
					<a href="/ddarawazoom/zclasscontent?num=${num}&pageNum=${startPage}+${pageBlock}"> [다음] </a>
				</c:if>
			</div>	
				
		</div>
	</div>		
	</div>
  	</div>
</div> 

<%@ include file="../../layout/footer.jsp"%>  

