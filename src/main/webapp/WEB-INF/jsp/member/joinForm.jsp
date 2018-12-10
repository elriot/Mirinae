<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../header.jsp"%>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(document).ready(function () { 
	
	// submitChk가 0이면 서브밋불가 1이면 서브밋 가능
	var submitChk = document.getElementById("submitChk");
	submitChk = 0;
	
	var iDChkForSubmit = 0;
	var passwdChkForSubmit = 0;
	var emailChkForSubmit = 0;
	var emailCodeChkForSubmit = 0;
	
	
	
	alert(submitChk);
	// 대문자 x, 특수기호 x 정규식 아이디에만 키업으로 적용 
	$('#id').keyup(function(event) {
	    
	    if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
	       var inputVal = $(this).val();
	       $(this).val($(this).val().replace(/[^_a-z0-9]/gi, '').toLowerCase()); // _(underscore), 영어,
	       // 숫자만 가능
	    }
	 });


	// 아이디 다음칸 넘어가면 함수호출
	$('#passwd').focus(function () {  
		
		//var id = document.getElementById('id').value;
		var id = $('#id').val();
		
		var result = chkId();
	    if (result == false) {
	    	submitChk = 0;
	    	return;
	    }
	        
		$.ajax({
			url:'../api/member/chkDupId',
			data: {id:id},
			success: function (result) {
				 if (result.count == 0) {
					$('#dupIdMsg').text('사용가능한 아이디입니다.').css('color', 'green');
					$('#dupEmailMsg').val(1);
					submitChk = 1;
					iDChkForSubmit = 1; 
				 	}else { // result.count == 1

					$('#dupIdMsg').text('이미 사용중인 아이디입니다.').css('color', 'red');
					$('#dupEmailMsg').val(2);
					console.log($('#dupEmailMsg'));
					document.getElementById('id').focus();
					submitChk = 0;
					iDChkForSubmit = 0;
					return;
					
				}
			}
		});
	 });// passwd focus() function 끝.
	
	 // 패스워드재확인 포커스 시 패스워드체크 함수호출
	 $('#passwdDp').focus(function(){
		
		 var result = chkPwd();
		    if (result == false) {
		    	submitChk = 0;
		    	return;
		    }
	 });
	 
	 // 네임 포커스 시 패스워드밸류 값 패스워드재확인 밸류값 비교 
	 $('#name').focus(function(){
		
		var pw = document.getElementById("passwd");	// 패스워드
		var pwD = document.getElementById("passwdDp"); // 패스워드확인
		 if(pw.value != pwD.value||pwD.value ==""){
			 $('#dupPwdMsg').text('비밀번호가 일치하지 않습니다.').css('color', 'red');
			 pwD.value = "";
			 pwD.focus();
			 submitChk = 0;
			 passwdChkForSubmit = 0;
			 return;
		 }else{
			 $('#dupPwdMsg').text('비밀번호가 일치합니다.').css('color', 'green');
			 submitChk = 1;
			 passwdChkForSubmit = 1;
		 }
	 });
	 
	 // 이메일 포커스 시 이름 밸류값이 공백이면 리턴 하기
	 $('#email').focus(function(){
		
		 var name = document.getElementById("name"); // name
		 
		 if(name.value == ""){
			 $('#dupNameMsg').text('이름을 적어주세요.').css('color', 'red');
			 name.focus();
			 submitChk = 0;
			 return;
		 }else{
			 $('#dupNameMsg').text('');
			 submitChk = 1;
		 }
	 });
	  
	 //이메일 코드발송 버튼 클릭시 함수호출
	$('#emailBtn').click(function () {
		
	    var email = $('#email').val();
		console.log("이메일중복검사");
		
		if (submitChk==1){
			var result = chkEmail();					    
							
			$.ajax({
				url: '../api/member/chkDupEmail',
				data: {email:email},
				success: function (result) {
					if (result.count == 0) {// 아이디가 없을경우
						$('#dupEmailMsg').text('사용 가능한 이메일입니다.').css('color', 'green');
						submitChk = 1;
						emailChkForSubmit = 1;
						}else if(result.count != 0){ // result.count == 1 이미 아이디가 있을경우
						$('#dupEmailMsg').text('이미 사용중인 이메일입니다.').css('color', 'red');
						document.getElementById("email").focus();
						submitChk = 0;
						emailChkForSubmit  = 0;
						return;
					}
					
					if(submitChk==1){
						alert(email +"로 이메일을 발송합니다.");
						$.ajax({
							url:'../mail/mail',
							data: {
								email: email
							},
							success: function (result) {
								$('#checkCode').val(result);
								submitChk = 1;
								emailChkForSubmit = 1; 
							}
						});
					} else {
						submitChk = 0;
						emailChkForSubmit = 0;
					}
						
						
						
				    if (result == false) {
				    	document.getElementById("email").focus();
				    	submitChk = 0;
				    	return;
				    }				
				} // success
			});
		
		} // 첫번째 if문			
	});
	
	//이메일 인증코드버튼 클릭시 함수호출
	$('#check_btn').click(function () {
		
		if($('#checkCode').val() == $('#code').val()){
			alert('인증되었습니다.');
			$('#email_code').val(1);
			submitChk = 1;
			emailCodeChkForSubmit  = 1;
		}else{
			alert('인증번호가 틀렸습니다.');
			$('#email_code').val(0);
			document.getElementById("code").focus();
			submitChk = 0;
			emailCodeChkForSubmit = 0;
			return;
		}
	});
	
	$('#phone').focus(function(){
		
		var code = document.getElementById("code")
		if(code.value == ""){		if(submitChk==1){
			alert(email +"로 이메일을 발송합니다.");
			$.ajax({
				url:'../mail/mail',
				data: {
					email: email
				},
				success: function (result) {
					$('#checkCode').val(result);
					//submitChk = 1;
				}
			});
		} else {
			//submitChk = 0;
		}
			
			
			
	    if (result == false) {
	    	document.getElementById("email").focus();
	    	//submitChk = 0;
	    	return;
	    }
			code.focus();
			//submitChk = 0;
			return;
		}else if($('#phone').val() == ""){
			
		}
		
	});
 });

	$('#frm').submit(function() {
	    console.log('이거왜안돼?');
		alert("submitChk" + submitChk);
		var id = document.getElementById("id");
		var pwd = document.getElementById("passwd");
		var pwdD = document.getElementById("passwdDp");
		var name = document.getElementById("name");
		var email = document.getElementById("email");
		var code = document.getElementById("code");
		var phone = document.getElementById("phone");
		var result = chkHp();
		
		
		if(id.value == ""||pwd.value==""||pwdD.value==""||
				name.value==""||email.value==""||code.value==""){
			submitChk = 0;
			alert('회원가입 폼을 채워주세요.');
			return false;
			}else if(result == false){
				$('#dupPhoneMsg').text('- 를 포함한 숫자만 입력해 주세요.').css('color', 'red');
				submitChk = 0;
				return false;
			}else if(iDChkForSubmit == 1 && passwdChkForSubmit == 1 && 
					emailChkForSubmit == 1 && emailCodeChkForSubmit && submitChk ==1){
				alert('회원가입을 축하드립니다.');
			return true;
		}else{
			alert('회원가입을 축하드립니다.');
			return true;
			
		}
		
	
}); // ============여기까지가 document ready 함수끝




	// ======================아래부터 정규식 포함함수======================
	//아이디가 정규식에 합당한 조건인지 확인하는 함수
	function chkId() {

		var reIdPwd = /^(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]|.*[0-9]).{8,24}$/;

		// 변수선언부분
		var id = document.getElementById("id"); // 아이디의 밸류값을 변수 id에 넣음

		// if 문시작
		if (!check1(reIdPwd, id, "아이디는 8~24자 영문소문자+숫자 (특수문자 사용불가능)")) {

			return false;
		}
	}

	//패스워드가 정규식에 합당한 조건인지 확인하는 함수
	function chkPwd() {
		var reIdPwd = /^(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]|.*[0-9]).{8,24}$/;

		var passwd = document.getElementById("passwd"); // 패스워드의 밸류값을 변수 passwd 에 넣음

		// if 문

		if (!check1(reIdPwd, passwd, "패스워드는 8~24자 문자+숫자 특수문자 혼합 사용가능")) {

			return false;

		}
	}

	function chkEmail() {

		// 이메일이 적합한지 검사할 정규식
		var reEmail = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;

		var email = document.getElementById("email"); // 이메일

		// 이메일주소 밸류가 공백일때
		if (email.value == "") {
			email.focus();
			return false;
		}
		// 이메일 주소값이 알맞지 않을 시
		else if (!check2(reEmail, email, "@,. 을 포함한 알맞은 이메일주소를 입력해주세요.")) {
			return false;
		}
	}

	function chkHp() {

		// 폰번호 정규식
		var rePhone = /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/;
		
		// 폰번호
		var phone = document.getElementById("phone");

		// 폰번호를 - 포함하지않고 서브밋할때 혹은 숫자말고다른 텍스트값이 들어가있을때 혹은 공백일때
		if (phone.value == "") {
			phone.focus();
			return false;
		} else if (!check3(rePhone, phone, "- 를 포함한 숫자만 입력해 주세요.")) {
			return false;
		} else {
			return true;
		}
	}

	function check1(reIdPwd, what, message) {
		if (reIdPwd.test(what.value)) {
			return true;
		}
		alert(message);
		what.value = "";
		what.focus();
		//return false;
	}

	// 정규식 함수 호출 메일 
	function check2(reEmail, what, message) {
		if (reEmail.test(what.value)) {
			return true;
		}
		alert(message);
		what.value = "";
		what.focus();
		//return false;
	}

	// 정규식 함수호출 폰넘버
	function check3(rePhone, what, message) {
		if (rePhone.test(what.value)) {
			return true;
		}
		alert(message);
		what.value = "";
		what.focus();
		//return false;
	}

</script>
<section id="about">
<h1 class="text-center">회원가입</h1>
<hr>
<form action="add" method="post" name="frm" id="frm" >
<div class="container">
	<div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
			<div class="post-preview">				
				<input type="text" name="mb_ID" id="id" class="form-control" placeholder="아이디 8~24자 영어+숫자조합(특수문자,대문자 사용불가능)">
				<span id="dupIdMsg"></span><br>
				<input type="password" name="mb_passwd" id="passwd" class="form-control"placeholder="패스워드 8~24자 영어+숫자조합(특수문자 사용가능)">
				<input type="password" id="passwdDp" class="form-control"placeholder="비밀번호 재입력">
				<span id="dupPwdMsg"></span><br>
				<input type="text" name="mb_name" id="name" class="form-control"placeholder="이름 입력">
				<span id="dupNameMsg"></span><br>
				<input type="email" name="mb_email" id="email" class="form-control"placeholder="ex)email@.com">
				<input type="button" name="emailBtn" id="emailBtn"class="btn btn-primary" value="코드발송"><span id="dupEmailMsg"></span><br><br>
				<input type="hidden" name="" id="checkCode" value="0">
				<input type="text" name="mb_emailN" id="code" class="form-control"placeholder="인증코드입력">
				<input type="button" id="check_btn" class="btn btn-primary" value="인증"><br><br> 
				<input type="hidden" name="" id="email_code" class="form-control"value="0"> 
				<input type="text" name="mb_phone" id="phone" class="form-control"placeholder="- 포함 번호입력">
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