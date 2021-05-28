<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page import="java.util.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>403error</title>
</head>
<body>
<br>
<br>
<%-- <h2><c:out value="${SPRING_SECURITY_403_EXCEPTION.getMessage()}"/></h2> --%>
<%-- <h2><c:out value="${msg}"/></h2> --%>
<h2>403 ERROR</h2>
<br>
<h1>접근권한을 확인해 주세요.</h1>

<sec:authorize access="isAuthenticated()">

  <a href="/account/customLogout">로그아웃</a>

</sec:authorize>


</body>
</html>
