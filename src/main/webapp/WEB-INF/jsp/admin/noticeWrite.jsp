<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin - Bootstrap Admin Template</title>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<script type="text/javascript" src="../editor/js/HuskyEZCreator.js"
    charset="utf-8"></script>
<script type="text/javascript"
    src="../editor/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js"
    charset="utf-8"></script>
</head>

<body>

       <%@include file="nav.jsp"%>

        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">공지 작성</h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href="main">Dashboard</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-edit"></i> 공지 작성
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->


<form action="insert" method="post" name="w_form">
  <div class="form-group">
    <input type="text" name="nt_subject" class="form-control" placeholder="Enter Subject">
  </div>
  <div class="form-group">
    <textarea name="nt_content" id="textAreaContent" style="width: 100%" rows="15" cols="80"
     placeholder="Enter Content"></textarea>
  </div>
  <button type="button" class="btn btn-primary" onClick="submitContents(this)">글쓰기</button>
</form>


<!-- Naver Smart Editor 2 -->
<script>
  var form = document.w_form;
  var oEditors = [];
   nhn.husky.EZCreator.createInIFrame({
      oAppRef: oEditors,
      elPlaceHolder: "textAreaContent",
      sSkinURI : "../editor/SmartEditor2Skin.html",
      fCreator: "createSEditor2"
  }); 
   
  // submit
  function submitContents(elClickedObj) {
      // 에디터의 내용이 textarea에 적용된다.
      oEditors.getById["textAreaContent"].exec("UPDATE_CONTENTS_FIELD", [ ]);
      var con = document.w_form.nt_content;
      con.value = document.getElementById("textAreaContent").value; 
      try {
          elClickedObj.form.submit();
      } catch(e) {
       
      }
  }
   
  // textArea에 이미지 첨부
  function pasteHTML(filepath){
      var sHTML = '<img src="../editor/upload/'+ filepath + '">';
      oEditors.getById["textAreaContent"].exec("PASTE_HTML", [ sHTML ]);
  }
</script>
<!-- Naver Smart Editor 2 END-->
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->

    </div>
    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="../startbootstrap-sb-admin-3.3.7/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../startbootstrap-sb-admin-3.3.7/js/bootstrap.min.js"></script>

</body>

</html>
