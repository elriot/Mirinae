<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<form action="delete" method="post" name="form">
	<div class="form-group">
		아이디 : <input type="text" name="mb_ID" class="form-control" value="${memberVO.mb_ID}" readonly/>
	</div>
	<div class="form-group">
		패스워드 : <input type="password" name="mb_passwd" class="form-control" />
	</div>
	<br> <input type="submit" class="btn btn-primary" value="탈퇴하기" onclick="return confirm('정말 탈퇴하시겠습니까?')" />
</form>
