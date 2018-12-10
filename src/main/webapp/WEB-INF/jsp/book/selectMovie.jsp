<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../header.jsp"%>
<!-- Page Header -->

    <div class="overlay"></div>
   <div class="container">
      <div class="row">
         <div class="col-lg-8 col-md-10 mx-auto"> 
            <div class="site-heading">
               <h1 class="text-center">영화 예매</h1>
               <hr>
               <span class="subheading"></span>
            </div>
          </div>
      </div>
   </div>
<script>
   function test1(){
      var a = document.getElementById('selectTitle').value;
      if(a == ""){
         $('#times').html("");
         $('#dates').html("");
         $('#theathers').html("");
         $('#sub').html("");
         return false;
      } else {
         $('#times').html("");
         $('#dates').html("");
         $('#theathers').html("");
         $('#sub').html("");
      }
      var daa = {"title":a};
      $.ajax({
         type:'get',
         url:'getAbleDate',
         dataType:'text',
         contentType:'application/text; chareset=utf-8',
         data:daa,
         success:function(data){
            var arr = $.parseJSON(data); 
            var test = '<label>   관람일 선택 :</label> <select class="form-control" name="bk_wDate" id="selectDate" onchange="test2()">';
            var test2 = '<option value="">날짜를 선택하세요</option>';
            var startDate = new Date();
            var endDate = new Date(arr[0].mv_endDate);
            var kkk = ((endDate - startDate)/86400000)+1;
            if(kkk>7){
               kkk=7;
            }
            for(var i=0; i<kkk;i++){
               var year = startDate.getFullYear();
               var month = startDate.getMonth()+1;
               var day = startDate.getDate();
               if(day < 10){
                  day = '0'+day;
               }
               var s = year+'-'+month+'-'+day;
               test2 = test2 + '<option value="'+s+'">'+s+'</option>';
               startDate.setDate(startDate.getDate()+1);
            }
            test2 = test2 + '</select>';
            $('#dates').html(test+test2);
         },
         error:function(){
            alert('통신 실패');
         }
      });
   }
   </script>
   
   <script>
   function test2(){
      var a = document.getElementById('selectTitle').value;
      var b = document.getElementById('selectDate').value;
      if(b == ""){
         $('#times').html("");
         $('#theathers').html("");
         $('#sub').html("");
         return false;
      }else {
         $('#times').html("");
         $('#theathers').html("");
         $('#sub').html("");
      }
      var time = new Date().getHours();
      var daa = {"date":b, "title":a, "nowTime":time};
      $.ajax({
         type:'get',
         url:'getAbleTime',
         dataType:'text',
         contentType:'application/text; chareset=utf-8',
         data:daa,
         success:function(data){
            var arr = $.parseJSON(data); 
            var test = '<label>   관람 시간 선택 :</label> <select class="form-control" name="mv_time" id="selectTime" onchange="aaa()">';
            var test2 = '<option value="">시간을 선택하세요</option>';
            console.log(arr);
            if(arr.length == 0){
               alert('해당 날짜에 예매 가능한 영화가 없습니다. 다른 날짜를 선택해 주세요.');
               $('#selectDate').val("");
               return false;
            }
            for(var i=0; i<arr.length;i++){
               var ddd = new Date().getDate();
               if(ddd < 10){
                  ddd = '0'+ddd;
               }
               if(b == new Date().getFullYear()+"-"+(new Date().getMonth()+1)+"-"+ddd){
                  //오늘 날짜일 경우
               var k = new Date().getHours(); // 현재시간
               var e = arr[i].mv_time.substring(0,arr[i].mv_time.indexOf(':')); // 관람시간
                  if(k<e){ // 현재시간이 관람시간보다 빠르면
                  test2 = test2 + '<option value="'+arr[i].mv_time+'">'+arr[i].mv_time+'</option>';
                     } else { // 관람시간이 현재시간보다 빠르면
                        test2 = test2 + '<option value="">'+arr[i].mv_time+'은 상영시간이 지났습니다.'+'</option>';
                        if(i+1 == arr.length){
                           alert('오늘 예매 가능한 영화가 없습니다');
                           $('#times').html("");
                           return false;
                        }
                     }
               }
               else{
                  test2 = test2 + '<option value="'+arr[i].mv_time+'">'+arr[i].mv_time+'</option>';
               }
            }
            test2 = test2 + '</select>';
            $('#times').html(test+test2);
            var l = $('#times').length;
            console.log(l);
         },
         error:function(){
            alert('통신 실패');
         }
      });
   }
   </script>
   <script>
   function go(){
      var a = document.getElementById('selectTheather').value;
      if(a == ""){
         $('#sub').html("");
         return false;
      }else {
         $('#sub').html("");
      }
      $('#sub').html("<input type=\"submit\" value=\"다음으로\">");
   }
   </script>
   <script>
   function aaa(){
      var a = document.getElementById('selectTitle').value;
      var b = document.getElementById('selectDate').value;
      var c = document.getElementById('selectTime').value;
      
      if(c == ""){
         $('#theathers').html("");
         $('#sub').html("");
         return false;
      }else {
         $('#theathers').html("");
         $('#sub').html("");
      }
      var das = {"title":a, "date":b, "time":c};
      $.ajax({
         type:'get',
         url:'getAbleTheather',
         dataType:'text',
         contentType:'application/text; chareset=utf-8',
         data:das,
         success:function(data){
            var arr = $.parseJSON(data);
            var test = '<label>   상영관 선택 :</label> <select class="form-control" name="tt_num" id="selectTheather" onchange="go()">';
            var test2 = '<option value="">상영관을 선택하세요</option>';
            for(var i=0; i<arr.length;i++){
               test2 = test2 + '<option value="'+arr[i].tt_num+'">'+arr[i].tt_num+'</option>';
            }
            test2 = test2 + '</select>';
            $('#theathers').html(test+test2);
         },
         error:function(){
            alert('통신 실패');
         }
      });
   };
   </script>
   <script>
	$(document).ready(function(){
			var title = '${mv_title}';
			if(title != null){
				test1();
			}
	});
	</script>

   <div class="container">
      <div class="row">
         <div class="col-lg-8 col-md-10 mx-auto">
            <form action="selectSeat" method="post">
               <div class="form-group">
         <label>   영화 선택 :</label> <select class="form-control" name="mv_title" id="selectTitle" onchange="test1()">
            <c:choose>
               <c:when test="${list.size() > 0 }">
               <option value="">영화를 선택하세요</option>
                  <c:forEach var="m" items="${list }">
                  <c:choose>
                  <c:when test="${m.mv_title eq mv_title }">
                  <option value="${m.mv_title }" selected="selected">${m.mv_title }</option>
                  </c:when>
                  <c:otherwise>
                     <option value="${m.mv_title }" >${m.mv_title }</option>
                     </c:otherwise>
                     </c:choose>
                  </c:forEach>
               </c:when>
               <c:otherwise>
                  <option>상영중인 영화가 없습니다.</option>
               </c:otherwise>
            </c:choose>
         </select>
         </div>
            <div class="form-group" id="dates">
         </div>
            <div class="form-group" id="times">
         </div>
            <div class="form-group" id="theathers">
         </div>
            <div id="sub">
            
            </div>
         </div>
      </div>
   </div>
   </form>
  

<%@include file="../footer.jsp"%>




