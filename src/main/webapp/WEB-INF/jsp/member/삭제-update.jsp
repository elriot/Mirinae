<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>회원수정</h1>
<hr>
<form action="update" method="post">
아이디: <input type="text" name="mb_ID" value="${id}" readonly><br>
패스워드: <input type="password" name="mb_passwd"><br>
이름: <input type="text" name="mb_name" value="${memberVO.mb_name}"><br>
H.P : <input type="text" name="mb_phone" value ="${memberVO.mb_phone}"><br>
이메일: <input type="email" name="mb_email" value="${memberVO.mb_email}"><BR>
<a href="main">메인화면</a>
<input type="submit" value="회원수정">
</form>

</body>
</html>





