<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>계약관리</title>
	<!-- 테이블관련 CSS/JS 시작 -->
	
	<!-- Bootstrap core CSS-->
	<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
	<link href="css/mainpage/sb-admin.css" rel="stylesheet">
	
	 <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
 
    <script src="vendor/datatables/jquery.dataTables.js"></script>
    <script src="vendor/datatables/dataTables.bootstrap4.js"></script>
    <script src="js/mainpage/sb-admin.min.js"></script>
 
 
  	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
  	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>
	
	<!-- 테이블관련 CSS/JS 끝 -->

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	
	
	<!-- css -->
	<link rel="stylesheet" href="/css/include/subpage.css" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

	<!-- js -->
	<script src="js/include/subpage.js"></script>
	<!-- 메뉴버튼눌렀을때 HOVER 유지 -->
	<script>
	$(document).ready(function(){
		$('#commoncode').addClass('top_menu_active');
		$('#commoncode').find('i').addClass('menu_icon_active');
	});
	</script>
	<!-- 메뉴버튼눌렀을때 HOVER 유지 끝-->
	
<!-- 테이블 내용에서 고객사로 검색 -->
	<script>
	function myFunction() {
	  var input, filter, table, tr, i;
	  var freeln_nm,career_year, freeln_phone,in_enable_date,freen_mail,hope_place,major_tech;
	  input = document.getElementById("myInput");
	  filter = input.value.toUpperCase();
	  tbody = $('tbody');
	  tr = $('tr',tbody);
	  project_nm = $('.project_nm');
	  /* career_year = $('.career_year');
	  freeln_phone = $('.freeln_phone');
	  in_enable_date = $('.in_enable_date');
	  freen_mail = $('.freen_mail');
	  hope_place = $('.hope_place');
	  major_tech = $('.major_tech'); */

	  for (i = 0; i < tr.length; i++) {
		
	      if (project_nm.eq(i).html().toUpperCase().indexOf(filter) > -1) {
	    	  tr.eq(i).attr('style','display:');
	      } else {
	    	  tr.eq(i).attr('style','display:none');
	      }
	  }
	}
	</script>
<!-- 테이블 내용에서 고객사로 검색 끝-->

<!-- 테이블 내용에서 컬럼클릭시 정렬 -->
	<script>
	function sortTable(n) {
	  var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
	  table = document.getElementById("dataTable");
	  switching = true;
	  dir = "asc"; 
	  while (switching) {
	    switching = false;
	    rows = table.rows;
	    for (i = 1; i < (rows.length - 1); i++) {
	
	      shouldSwitch = false;
	      x = rows[i].getElementsByTagName("TD")[n];
	      y = rows[i + 1].getElementsByTagName("TD")[n];
	      if (dir == "asc") {
	        if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
	          shouldSwitch= true;
	          break;
	        }
	      } else if (dir == "desc") {
	        if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
	          shouldSwitch = true;
	          break;
	        }
	      }
	    }
	    if (shouldSwitch) {
	      rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
	      switching = true;
	      switchcount ++;      
	    } else {
	      if (switchcount == 0 && dir == "asc") {
	        dir = "desc";
	        switching = true;
	      }
	    }
	  }
	}
	</script>
<!-- 테이블 내용에서 컬럼클릭시 정렬 끝-->
<script>
$(document).ready(function(){
	
	$('#appupdate').on('click',function(){
		/* var phone = $('#freeln_phone', this).html(); */
		var tr = $(this).parents('tr');
		var project_id = $('.project_id',tr).html();
		var freeln_id = $('.freeln_id',tr).html();
		/* alert(project_id+freeln_id); */
		location.href="/ApplyUpdate?project_id="+project_id+"&freeln_id="+freeln_id ; 
	});
});
</script>
</head>
<!-------------------------------- body ---------------------------------------->
<body>
<div id="wrapper">
<!-- header -->
  <header>
  	<%@ include file="../include/header.jspf" %>
  </header>
  
  <div id="main_templet">
  <div id="slide_btn"></div>
   
<!-- side_menu -->
  <nav class="nav">
  	<%@ include file="../include/nav.jspf" %>
  </nav>

<!-- main -->
  <article>
   	<div class="tabs"></div>
    	
    <div class="content-wrapper"> 
    <!-- 테이블내용 시작 -->
    	<div class="card mb-3">
    		<div class="card-header">
    			<i class="fas fa-fw fa-users"></i>신청관리
    		</div>
    		<div class="card-body">
    			<div class="table-responsive">
    				<div id="dataTable_wrapper" 
    					class="dataTables_wrapper dt-bootstrap4">
    					<div class="row">		
    						<div class="col-sm-12 col-md-11">
	    						<div id="dataTable_filter" class="dataTables_filter">
    								<label>Search: <input type="text"
    									 class="form-control form-control-sm" 
    									 placeholder="프로젝트명을 입력하세요" aria-controls="dataTable" 
    									 id="myInput" onkeyup="myFunction()">
	    							</label>
	    						</div>
    						</div>
    						<div class="col-sm-12 col-md-1">	
    							<!-- <button type="button" class="btn btn-primary btn-sm" 
    								id="myBtn" data-toggle="modal" data-target="#inputModal">등록</button> -->




<!-------------------------- 조회 리스트 테이블---------------------------->
    					
              			</div>
           			</div>
           			<div class="row">
    						<div class="col-sm-12">
    						<table class="table table-bordered dataTable" id="dataTable" width="100%" cellspacing="0" role="grid" aria-describedby="dataTable_info" style="width: 100%;">
                  				<thead>
                    				<tr role="row" style="text-align: center">
                    					<th onclick="sortTable(0)">순번</th>
                    					<th onclick="sortTable(1)">프로젝트ID</th>
                    					<th onclick="sortTable(2)">프로젝트명</th>
                    					<th onclick="sortTable(3)">프리랜서ID</th>
                    					<th onclick="sortTable(4)">프리랜서명</th>
                    					<th onclick="sortTable(5)">신청일</th>
                    					<th onclick="sortTable(6)">승인여부</th>
                    					<th>승인</th>
                   				 	</tr>
                  				</thead>
                  				<tfoot>
                    				<tr role="row" style="text-align: center">
                    					<th onclick="sortTable(0)">순번</th>
                    					<th onclick="sortTable(1)">프로젝트ID</th>
                    					<th onclick="sortTable(2)">프로젝트명</th>
                    					<th onclick="sortTable(3)">프리랜서ID</th>
                    					<th onclick="sortTable(4)">프리랜서명</th>
                    					<th onclick="sortTable(5)">신청일</th>
                    					<th onclick="sortTable(6)">승인여부</th>
                    					<th>승인</th>
                    				</tr>
                  				</tfoot>
				                <tbody>
					                  <c:forEach var="app" items="${ApplyList}" varStatus="status">

					                  		<tr class="rowClick" role="row" style="text-align:center">
					                  			  
							                      
							                      <td>${app.rownum}</td>
							                      <td class="project_id">${app.project_id}</td>
							                      <td class="project_nm">${app.project_nm}</td>
							                      <td class="freeln_id">${app.freeln_id}</td>
							                      <td>${app.freeln_nm}</td>
							                      <td>${app.apply_date}</td>
							                      <td>${app.apply_yn}</td>
							                      <td><input type="button" id="appupdate" name="appupdate" value="승인"></td>

							           
						                    </tr>
									  </c:forEach>
				                </tbody>
                			</table>
           			
         	  </div>
    		</div>			
   		 </div> 			
 	 </div> 	
   </div>
 </div>
</div>
   <!-- 테이블내용 끝 -->   	
  </article>
</div> 
</div>

</body>
</html>