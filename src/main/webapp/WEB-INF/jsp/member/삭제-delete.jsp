<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>회원삭제</h1>
<form action="delete" method="post">
	아이디: <input type="text" name="id" value="${id}" readonly><br>
	패스워드: <input type="password" name="passwd"><br>
	<input type="button" value="메인으로" onclick="location.href='main'">
	<input type="submit" value="회원삭제">
</form>
</body>
</html>





