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

    <!-- Bootstrap Core CSS -->
    <link href="../startbootstrap-sb-admin-3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../startbootstrap-sb-admin-3.3.7/css/sb-admin.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../startbootstrap-sb-admin-3.3.7/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

       <%@include file="nav.jsp"%>

        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">상영마감</h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href="main">Dashboard</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-edit"></i> 상영마감
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->

                <div class="row">
                    <div class="col-lg-6">

                        <form action="screenCancel" method="post" role="form">

                			<div class="form-group">
                                <label>상영마감</label>
                            </div>
                            
                            <!-- DB에서 영화등록 정보 확인해서 option 추가해야 함 -->
                            <!-- 영화등급 + 개봉일 + 영화제목? -->
                            <div class="form-group">
                                <label>상영마감할 영화 선택</label>
                                <select class="form-control" name="title">
                                    <c:choose>
                                    	<c:when test="${mList.size() > 0 }">
                                    		<c:forEach var="m" items="${mList }">
                                    			<option value="${m.mv_title }">${m.mv_title } (${m.mv_startDate} ~ ${m.mv_endDate})</option>
                                    		</c:forEach>
                                    	</c:when>
                                    	<c:otherwise>
                                    		<option>상영중인 영화가 없습니다.</option>
                                    	</c:otherwise>
                                    </c:choose>
                                </select>
                            </div>
                            <input type="submit" class="btn btn-default" onclick="return confirm('상영을 마감하시겠습니까?')" value="마감하기"/>
                        </form>

                    </div>
                </div>
                <!-- /.row -->

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->


    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="../startbootstrap-sb-admin-3.3.7/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../startbootstrap-sb-admin-3.3.7/js/bootstrap.min.js"></script>

</body>

</html>
