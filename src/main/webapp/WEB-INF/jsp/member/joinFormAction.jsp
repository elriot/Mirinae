<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>

$(function(){
	// submitChk가 0이면 서브밋불가 1이면 서브밋 가능q
		
	// 대문자 x, 특수기호 x 정규식 아이디에만 키업으로 적용 
	$('#id').keyup(function(event) {

	    if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
	       var inputVal = $(this).val();
	       $(this).val($(this).val().replace(/[^_a-z0-9]/gi, '').toLowerCase()); // _(underscore), 영어,

	    }
	  }) //function 끝
})

$(function(){
	// 아이디 다음칸 넘어가면 함수호출
	$('#id').blur(function () {  
		
		//var id = document.getElementById('id').value;
		
		var id = $('#id').val();
		var check = chkId();
		
	    if (check != false) {
	    	
	    	$.ajax({
				url:'../api/member/chkDupId',
				data: {id:id},
				success: function (result) {
					 if (result.count == 0) {
						 $('#dupIdMsg').text("");
						$('#dupIdMsg').text('사용가능한 아이디입니다.').css('color', 'green');

					 	}else {
					 	$('#dupIdMsg').text("");
						$('#dupIdMsg').text('이미 사용중인 아이디입니다.').css('color', 'red');
					
						return;
					}
				}
			}) // ajax의 끝
	    
	 	}else{
	 		id.value = "";
	 		return false;
	 	}
	 });// passwd focus() function 끝.
})
	
	
$(function(){
	// 패스워드재확인 포커스 시 패스워드체크 함수호출
	 $('#passwd').blur(function(){
		
		 var result = chkPwd();
		    if (result != false) {
		    	$('#PwdMsg').text('적합한 패스워드 입니다.').css('color', 'green');
		    	return
		    }
	 });
})	
	
$(function(){
	 // 네임 포커스 시 패스워드밸류 값 패스워드재확인 밸류값 비교 
	 $('#passwdDp').blur(function(){
		
		var pw = document.getElementById("passwd");	// 패스워드
		var pwD = document.getElementById("passwdDp"); // 패스워드확인
		 if(pw.value != pwD.value||pwD.value ==""){
			 $('#dupPwdMsg').text('비밀번호가 일치하지 않습니다.').css('color', 'red');
			 pwD.value = "";
			 return;
		 }else{
			 $('#dupPwdMsg').text('비밀번호가 일치합니다.').css('color', 'green');
		 }
	 });
})	 

$(function(){
	 // 이메일 포커스 시 이름 밸류값이 공백이면 리턴 하기
	 $('#name').blur(function(){
		
		 var name = document.getElementById("name"); // name
		 var result = chkName();
		 
		 if(result == false){
			 return false;
		 }else{
			 $('#dupNameMsg').text('좋은 이름이네요.').css('color', 'green');
		 }
	 });
})
	
$(function(){
	$('#emailBtn').click(function(){
		
		var email = $('#email').val();
		var result = chkEmail();
		
			if(result == false){
				return false;
			}else{
				
				$.ajax({
					url: '../api/member/chkDupEmail',
					data: {email:email},
					success : function(result){
						
						if (result.count == 0) {// 아이디가 없을경우
							$('#dupEmailMsg').text(null);
							$('#EmailMsg').text('가입이 가능한 이메일입니다.').css('color', 'green');
							
							$.ajax({
								url:'../mail/mail',
								data: {
									email: email
								},
								success: function (result) {
									$('#checkCode').val(result);
									// email 여기서 undefined 로 확인되지만 이메일은 정상발송됨
									alert('발송된 코드를 입력해주세요.')
									return;
								}
							});// ajax 끝
							
							} else { // result.count == 1 이미 아이디가 있을경우
							$('#EmailMsg').text(null);
							$('#dupEmailMsg').text('이미 사용하고있는 이메일입니다.').css('color', 'red');
							
							return false;
							}
						}
					}) // ajax 끝
				} // else의 끝
	}) // emailbtn 클릭이벤트 함수의 끝
}) // function 함수의 끝
							
							
						

$(function(){
	//이메일 코드버튼 클릭시 함수호출
	$('#check_btn').click(function () {
		
		if($('#checkCode').val() == $('#code').val()){
			alert('인증되었습니다.');
			$('#email_code').val(1);
			$('#check_btn').val('인증완료');
		}else{
			alert('인증번호가 틀렸습니다.');
			$('#email_code').val(0);
			return;
		}
	});
})

$(function(){
	$('#phone').blur(function(){
		
		var result = chkHp();
		if(result == false){
		return false;
		}else{
		$('#dupPhoneMsg').text('알맞은 번호입니다.').css('color', 'green');	
		}
	});
})


$(function(){
	$('#email').keyup(function(){
		$('#check_btn').val('인증');
	})
})




$(function(){
	$('#frm').submit(function() {
	    
		
		if($('#check_btn').val() != '인증완료'){
			alert('이메일 인증을 해주세요.');
			return false;
		}else if($('#dupIdMsg').text() !='사용가능한 아이디입니다.'){
			alert('아이디를 확인해주세요.')
			return false;
		}else if($('#PwdMsg').text() != '적합한 패스워드 입니다.'){
			alert('패스워드를 확인해주세요.')
			return false;
		}else if($('#passwd').val() != $('#passwdDp').val()){
			alert('패스워드가 일치하지 않습니다.')
			return false;
		}else if($('#dupPwdMsg').text() != '비밀번호가 일치합니다.'){
			alert('패스워드 재입력을 확인해주세요.')
			return false;
		}else if($('#dupNameMsg').text() != '좋은 이름이네요.'){
			alert('이름을 확인해주세요.')
			return false;
		}else if($('#dupPhoneMsg').text() != '알맞은 번호입니다.'){
			alert('번호를 확인해주세요.')
			return false;
		}
		else{
			alert('회원가입을 축하드립니다.');
			return true;
		}
	}); 
})	



	// ======================아래부터 정규식 포함함수======================
	//아이디가 정규식에 합당한 조건인지 확인하는 함수
	function chkId() {

		var reId = /^(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]|.*[0-9]).{8,24}$/;

		// 변수선언부분
		var id = document.getElementById("id"); // 아이디의 밸류값을 변수 id에 넣음

		// if 문시작
		if (!check1(reId, id, "아이디는 8~24자 영문소문자+숫자 (특수문자 사용불가능)")) {
		
			return false;
		}
	}

	//패스워드가 정규식에 합당한 조건인지 확인하는 함수
	function chkPwd() {
		var rePwd = /^(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]|.*[0-9]).{8,24}$/;

		var passwd = document.getElementById("passwd"); // 패스워드의 밸류값을 변수 passwd 에 넣음

		// if 문

		if (!check2(rePwd, passwd, "패스워드는 8~24자 문자+숫자 특수문자 혼합 사용가능")) {

			return false;

		}
	}

	function chkEmail() {

		// 이메일이 적합한지 검사할 정규식
		var reEmail = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;

		var email = document.getElementById("email"); // 이메일

		// 이메일 주소값이 알맞지 않을 시
		if (!check3(reEmail, email, "알맞는 이메일주소를 입력해주세요.")) {
			return false;
		}
	}

	function chkHp() {

		// 폰번호 정규식
		var rePhone = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})([0-9]{3,4})([0-9]{4})$/;
		
		// 폰번호
		var phone = document.getElementById("phone");

		// 폰번호를 - 포함하지않고 서브밋할때 혹은 숫자말고다른 텍스트값이 들어가있을때 혹은 공백일때
		if (!check4(rePhone, phone, "- 제외한 알맞은 번호만 입력해 주세요.")) {
			return false;
		}
	}
	
	function chkName() {

		// 한글이름 정규식
		var reName = /^[가-힣]{2,4}$/;
		
		// 폰번호
		var name = document.getElementById("name");

		// 폰번호를 - 포함하지않고 서브밋할때 혹은 숫자말고다른 텍스트값이 들어가있을때 혹은 공백일때
		if (!check5(reName, name, "알맞는 한글로만 입력해주세요.")) {
			return false;
		}
	}
	
	function check1(reIdPwd, what, message) {
		if (reIdPwd.test(what.value)) {
			return true;
		}

		$('#dupIdMsg').text(message).css('color', 'red');
		
		
		//return false;
	}

	function check2(reIdPwd, what, message) {
		if (reIdPwd.test(what.value)) {
			return true;
		}

		$('#PwdMsg').text(message).css('color', 'red');
		
		
		//return false;
	}

	// 정규식 함수 호출 메일 
	function check3(reEmail, what, message) {
		if (reEmail.test(what.value)) {
			return true;
		}
		//alert(message);
		
		$('#EmailMsg').text(null);
		$('#dupEmailMsg').text(message).css('color', 'red');
		
		
		//return false;
	}

	// 정규식 함수호출 폰넘버
	function check4(rePhone, what, message) {
		if (rePhone.test(what.value)) {
			return true;
		}
		//alert(message);
		
		$('#dupPhoneMsg').text(message).css('color', 'red');
		
		//return false;
	}
	
	function check5(reName, what, message) {
		if (reName.test(what.value)) {
			return true;
		}
		//alert(message);
		
		$('#dupNameMsg').text(message).css('color', 'red');
		
		//return false;/^[가-힣]{2,4}$/;
	}

</script>