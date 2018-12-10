<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Footer -->

</body>
<br>
<br>
<footer>
	<div class="footer card bg-light text-dark" style="margin-bottom:0">
		<div class="card-body text-center" >
			<b>(주) Mirinae Cinema</b><br> 
			(04377) 부산광역시 부산진구 중앙대로 708, 5층<br> 
			대표이사 : 김미리 &nbsp; 개인정보보호 책임자 : 김리내<br> 
			사업자등록번호 : 604-12-34567 &nbsp; 통신판매업신고번호 : 2018-부산서면-1213<br> 
			대표이메일 : mirinae@cinema.co.kr &nbsp; 미리내 고객센터 : 1544-1234<br>
		</div>
	</div> 
</footer>
</html>
<script>
jQuery(document).ready(function() {
 var contentHeight = jQuery(window).height();
 var footerHeight = jQuery('.footer').height();
 var footerTop = jQuery('.footer').position().top + footerHeight;
 if (footerTop < contentHeight) {
     jQuery('.footer').css('margin-top', 10+ (contentHeight - footerTop) + 'px');
   }
 });
</script>

