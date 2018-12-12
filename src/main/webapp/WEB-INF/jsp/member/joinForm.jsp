<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../header.jsp"%>
<%@include file="joinFormAction.jsp" %>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<section id="about">
<h1 class="text-center">회원가입</h1>
<hr>
<form action="add" method="post" name="frm" id="frm" >
<div class="container">
	<div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
			<div class="post-preview">				
				<input required="required" type="text" name="mb_ID" id="id" class="form-control" placeholder="아 이 디">
			<span id="dupIdMsg"></span><span id="idCheckMsg"></span><br>
				<input required="required" type="password" name="mb_passwd" id="passwd" class="form-control"placeholder="패스워드">
				<span id="PwdMsg"></span><br>
				<input required="required" type="password" id="passwdDp" class="form-control"placeholder="패스워드 확인">
			<span id="dupPwdMsg"></span><br>
				<input required="required" type="text" name="mb_name" id="name" class="form-control" placeholder="이름 입력">
			<span id="dupNameMsg"></span><br>
				<input required="required" type="email" name="mb_email" id="email" class="form-control"placeholder="E-MAIL">
			<span id="EmailMsg"></span>
			<span id="dupEmailMsg"></span>
				<input required="required" type="button" name="emailBtn" id="emailBtn"class="btn btn-primary" value="코드발송"><br>
				<input type="hidden" name="" id="checkCode" value="0">
				<input required="required" type="text" name="mb_emailN" id="code" class="form-control"placeholder="인증코드 입력">
				<input required="required" type="button" id="check_btn" class="btn btn-primary" value="인증"><br><br> 
				<input type="hidden" name="" id="email_code" class="form-control"value="0"> 
				<input required="required" type="text" name="mb_phone" id="phone" class="form-control"placeholder="휴대폰번호 입력">
			<span id="dupPhoneMsg"></span><br> 
				<input type="hidden" name="mb_grade" class="form-control"value="bronze"> 
				<input type="hidden" name="mb_point" class="form-control"value="1000">
				<input type="hidden" id="submitChk">
				<input type="reset" class="btn btn-danger float-left" value="Reset"> 
				<input type="submit" id="submitBtn" class="btn btn-primary float-right" value="Sign Up"><br><br><br>
			</div>				
		</div>
	</div>
</div>
</form>
</section>
<%@include file="../footer.jsp"%>