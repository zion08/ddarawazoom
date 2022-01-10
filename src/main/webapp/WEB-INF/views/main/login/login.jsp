<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>


<div class="form-sigminbox text-center">
	<main class="form-signin">
		<form>
			<img class="mb-4" width="72" height="57" src="../../resources/image/Exercise.svg"/>
		    <h1 class="h3 mb-3 fw-normal">따라와Zoom과 운동해요</h1>
		
		    <div class="form-floating">
		    	<input type="email" class="form-control" id="floatingInput" placeholder="name@example.com">
		    	<label for="floatingInput">Email address</label>
		    </div>
		    <div class="form-floating">
		    	<input type="password" class="form-control" id="floatingPassword" placeholder="Password">
		    	<label for="floatingPassword">Password</label>
		    </div>
		
		    <div class="checkbox mb-3">
		    	<label>
		        	<input type="checkbox" value="remember-me"> Remember me
		    	</label>
		    </div>
		    
		    <button class="w-100 btn btn-lg btn-secondary mb-3" type="submit">Login</button>
		    <button class="w-100 btn btn-lg btn-warning" type="submit">Kakao</button>
		    
		</form>
	</main>
</div>

<%@ include file="../../layout/footer.jsp"%>