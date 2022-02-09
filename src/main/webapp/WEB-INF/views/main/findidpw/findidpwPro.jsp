<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<c:if test="${result == 1 }">
	<script>
		alert('아이디가 있네요~~!!!')
		window.location="/ddarawazoom/findidpw"
	</script>
</c:if>


<c:if test="${result != 1 }">
	<script>
		alert('해당하는 아이디가 없다.')
		window.location="/ddarawazoom/login"
	</script>
</c:if>





