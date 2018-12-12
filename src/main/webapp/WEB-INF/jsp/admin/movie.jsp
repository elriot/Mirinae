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
                        <h1 class="page-header">영화등록</h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href="main">Dashboard</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-edit"></i> 영화 등록
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->

                <div class="row">
                    <div class="col-lg-12">

                        <form action="insertMv" method="post" role="form" enctype="multipart/form-data">

                			<div class="form-group">
                                <label>영화 제목</label>
                                <input class="form-control" placeholder="제목을 입력하세요" name="mv_title" required>
                            </div>
                            
                            
                            <div class="form-group">
                                <label>영화등급</label>
                                <select class="form-control" name="mv_rating" required>
                                    <option>전체</option>
                                    <option>12세</option>
                                    <option>15세</option>
                                    <option>18세</option>
                                </select>
                            </div>
                            
                            <div class="form-group" >
                                <label>영화 소개</label>
                                <textarea class="form-control" rows="5" name="mv_detail"></textarea>
                            </div>
                            
                            <div class="form-group" >
                                <label>개봉일</label>
                                <input type="date" id="mv_releaseDate" name="mv_releaseDate" required>
                            </div>
                            
							<div class="form-group">
                                <label>상영관번호</label>
                                <c:forEach var="t" items="${list }">
                                	<input type="checkbox" name="tt_num" value="${t.tt_num }">${t.tt_num}관
                                </c:forEach>
                            </div>
                            
                            <div class="form-group" >
                                <label>상영시작일</label>
                                <input type="date" name="mv_startDate" required>
                            </div>
                            
                            <div class="form-group" >
                                <label>상영종료일</label>
                                <input type="date" name="mv_endDate" required>
                            </div>
                            
                            <div class="form-group">
                                <label>상영시간대</label>
                                <c:forEach var="i" begin="9" end="24">
                                	<c:choose>                                 		                               
                                	<c:when test="${i < 10 }">
                                	 	<input type="checkbox" name="mv_time" value="0${i}:00">0${i}시
                                		
                                	</c:when>
                                	<c:otherwise>
                                		<input type="checkbox" name="mv_time" value="${i }:00">${i}시
                                	</c:otherwise>                                	
                                	</c:choose> 
                                </c:forEach>
                            </div>
                            
                            <div class="form-group">
                                <label>포스터 등록</label>
                                <input type="file" name="image" required>
                            </div>
                            
                      		<div class="form-group">
                                <label>예고편 등록</label>
                                <input class="form-control" placeholder="유튜브 주소를 입력하세요" name="mv_trailer">
                            </div>

                            <button type="submit" class="btn btn-default">Submit Button</button>
                            <button type="reset" class="btn btn-default">Reset Button</button>

                        </form>

                    </div>
                </div>
                <!-- /.row -->

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->

	</div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="../startbootstrap-sb-admin-3.3.7/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../startbootstrap-sb-admin-3.3.7/js/bootstrap.min.js"></script>

</body>

</html>
