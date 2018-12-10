<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<form action="update" method="post" name="form">
	<div class="form-group">
		아이디 : <input type="text" name="mb_ID" class="form-control" value="${memberVO.mb_ID}" readonly/>
	</div>
	<div class="form-group">
		패스워드 : <input type="password" name="mb_passwd" class="form-control" />
	</div>
	<div class="form-group">
		이름 : <input type="text" name="mb_name" class="form-control" value="${memberVO.mb_name}"/>
	</div>
	<div class="form-group">
		이메일 : <input type="email" name="mb_email" class="form-control" value="${memberVO.mb_email}"/>
	</div>
	<div class="form-group">
		연락처 : <input type="tel" name="mb_phone" class="form-control" value="${memberVO.mb_phone}" />
	</div>
	<div class="form-group">
		등급 : ${memberVO.mb_grade} <br>
	</div>
	<div class="form-group">포인트 : <fmt:formatNumber value="${memberVO.mb_point}" pattern="###,###,###"></fmt:formatNumber></div>
	<br> <input type="submit" class="btn btn-primary" value="정보변경" />
</form>

<%-- 
<form action="update" method="post">
아이디: <input type="text" name="mb_ID" value="${id}" readonly><br>
패스워드: <input type="password" name="mb_passwd"><br>
이름: <input type="text" name="mb_name" value="${memberVO.mb_name}"><br>
H.P : <input type="text" name="mb_phone" value ="${memberVO.mb_phone}"><br>
이메일: <input type="email" name="mb_email" value="${memberVO.mb_email}"><BR>
<a href="main">메인화면</a>
<input type="submit" value="회원수정">
</form> --%>
