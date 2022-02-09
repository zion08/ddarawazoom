<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 

<%-- 회원가입을 눌렀을 경우 db에 값이 저장된다 --%>
<c:if test="${result == 1 }">
	<script>
		alert('회원 가입을 완료하였습니다.')
		window.location="/ddarawazoom/signupwelcome"
	</script>
</c:if>


<c:if test="${result != 1 }">
	<script>
		alert('회원 가입이 실패되었습니다.')
		window.location="/ddarawazoom/signupForm"
	</script>
</c:if>

