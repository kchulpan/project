<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>DDJY University</title>
<!-- 테이블관련 CSS/JS 시작 -->

<!-- Bootstrap core CSS-->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link href="vendor/datatables/dataTables.bootstrap4.css"
	rel="stylesheet">
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

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<!-- css -->
<link rel="stylesheet" href="/css/include/subpage.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- <link rel="stylesheet" type="text/css" href="/css/project/project.css"/> -->
<!-- js -->
<script src="js/include/subpage.js"></script>

<!-- datepicker를 위한 CSS/JS -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<!-- datepicker를 위한 CSS/JS 끝-->

<script>
	$(document).ready(function() {
		$('#project').addClass('top_menu_active');
		$('#project').find('i').addClass('menu_icon_active');
	});
</script>
<style>
.modal-backdrop {
	display: none;
}

#inputModal {
	top: 15%;
	margin-top: -50px;
}

#updateModal {
	top: 15%;
	margin-top: -50px;
}

.table-responsive {
	overflow-x: hidden;
}

a {
	color: black;
}

.idClick {
	font-size: 13px;
}
</style>
<!-- 테이블 내용에서 프로젝트명으로 검색 -->
<script>
	function myFunction() {
		var input, filter, table, tr, td, i;
		input = document.getElementById("myInput");
		filter = input.value.toUpperCase();
		table = document.getElementById("dataTable");
		tr = table.getElementsByTagName("tr");
		/*   proj_nm = $('.proj_nm');
		 project_str_date = $('.project_str_date');
		 project_end_date = $('.project_end_date');
		 client_nm = $('.client_nm'); 
		 need_tech = $('.need_tech');
		 field_1 = $('.field_1');
		 involve_num = $('.involve_num');
		 charge_id = $('.charge_id'); */

		for (i = 0; i < tr.length; i++) {
			td = tr[i].getElementsByTagName("td")[1];
			if (td) {
				if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
					tr[i].style.display = "";
				} else {
					tr[i].style.display = "none";
				}
			}
		}
	}

	/* 	  console.log(client_nm.eq(i).html());
	 console.log(project_str_date.eq(1).html());
	
	 if (proj_nm.eq(i).html().toUpperCase().indexOf(filter) > -1) {
	 tr.eq(i).attr('style','display:');
	 else if(project_str_date.eq(i).html().toUpperCase().indexOf(filter) > -1) {
	 tr.eq(i).attr('style','display:');
	 } else if(project_end_date.eq(i).html().toUpperCase().indexOf(filter) > -1) {
	 tr.eq(i).attr('style','display:'); 
	 } else if(client_nm.eq(i).html().toUpperCase().indexOf(filter) > -1) {
	 tr.eq(i).attr('style','display:');
	 } else if(need_tech.eq(i).html().toUpperCase().indexOf(filter) > -1) {
	 tr.eq(i).attr('style','display:');
	 } else if(field_1.eq(i).html().toUpperCase().indexOf(filter) > -1) {
	 tr.eq(i).attr('style','display:');
	 } else if(involve_num.eq(i).html().toUpperCase().indexOf(filter) > -1) {
	 tr.eq(i).attr('style','display:');
	 } else if(charge_id.eq(i).html().toUpperCase().indexOf(filter) > -1) {
	 tr.eq(i).attr('style','display:');
	 } else {
	 tr.eq(i).attr('style','display:none');
	 }
	 }
	 } */
</script>
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
			console.log(rows);
			
			for (i = 1; i < (rows.length - 2); i++) {

				shouldSwitch = false;
				x = rows[i].getElementsByTagName("A")[n];
				y = rows[i + 1].getElementsByTagName("A")[n];

				console.log(table);
				console.log(x);
				console.log(y);
				console.log(n);
				if (dir == "asc") {
					if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
						shouldSwitch = true;
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
<!-- 기존 리스트를 모달창에 불러오기 -->
<script type="text/javascript">
	$(function() {
		$(".rowClick").click(function(e) {
			var project_id = $(this).find(".proj_id").val();
			var charge_id = $(this).find(".charge_id").val();
			var project_nm = $(this).find(".proj_nm").html();
			var project_str_date = $(this).find(".proj_str_date").html();
			var project_end_date = $(this).find(".proj_end_date").html();
			var client_id = $(this).find(".client_id").val();
			var involve_num = $(this).find(".involve_num").html();
			var field_1 = $(this).find(".field_1").html();
			var field_2 = $(this).find(".field_2").val();
			var remark = $(this).find(".remark").children("p").html();
			var project_amount = $(this).find(".project_amount").html();
			var need_tech = $(this).find(".need_tech").html();
	 	    var client_nm = $(this).find(".client_nm").html();   

			console.log(proj_id);
			console.log(proj_nm);
			console.log(proj_str_date);
			console.log(proj_end_date);
			console.log('고객사'+client_id);
			console.log(involve_num);
			console.log(field_1);
			console.log(field_2);
			console.log(remark);
			console.log(project_amount);
			console.log(need_tech);
	 		console.log(client_nm); 
			/* 
			var option = $("option[value="+charge_id+"]",".modal-body #char_id");
			console.log("option!!!"+option.html());
			var option = $("option[value="+client_id+"]",".modal-body #cli_id");
			console.log("option!!!"+option.html()); */
			
			/* console.log(use_yn); */
			/* var modalData = document.querySelectorAll('tbody a'); */
			//var my_id_value = $(".idClick").eq(0).data("title");
			//var my_id_value2 = $(".idClick").eq(1).data("title1");
			$(".modal-body #proj_id").val(project_id);
			$(".modal-body #proj_nm").val(project_nm);
			/* $(".modal-body #char_id").val(charge_id); */
			$("option[value="+charge_id+"]",".modal-body #char_id").prop("selected", true);
			$(".modal-body #proj_str_date").val(project_str_date);
			$(".modal-body #proj_end_date").val(project_end_date);
			/* $(".modal-body #cli_id").val(client_id); */
			
			$("option[value="+client_id+"]",".modal-body #cli_id").prop("selected", true);
			$(".modal-body #inv_num").val(involve_num);
			$(".modal-body #fid_1").val(field_1);
			$(".modal-body #fid_2").val(field_2);
			$(".modal-body #rmark").val(remark);
			$(".modal-body #proj_amount").val(project_amount);
			$(".modal-body #need_tec").val(need_tech);
	 	 	 $(".modal-body #cli_nm").val(client_nm);  

		})
	});
</script>
<script>
	$(document).ready(function() {
		$("#deletebtn").click(function() {
			if(confirm("정말 삭제하시겠습니까??")==true)
				{
					$("#modalform").attr("action", "/ProjectDelete");
					$("#modalform").submit();			
				}
			else
				{
					return;
				}		
		});

		$("#updatebtn").click(function() {
			if(confirm("정말 수정하시겠습니까?")==true)
				{
					$("#modalform").attr("action", "/ProjectUpdate");
					$("#modalform").submit();
				}
			else
				{
					return;
				}
		});
	});
</script>
<script>
	$(document).ready(function(){
		$('#inputModal').addClass('top_menu_active');
		$('#inputModal').find('i').addClass('menu_icon_active');
		
		 $( "#project_str_date" ).datepicker();
		 $( "#project_str_date" ).datepicker( "option", "dateFormat", "yy-mm-dd");
		 $( "#project_end_date" ).datepicker();
		 $( "#project_end_date" ).datepicker( "option", "dateFormat", "yy-mm-dd");
		 $( "#proj_str_date" ).datepicker();
		 $( "#proj_str_date" ).datepicker( "option", "dateFormat", "yy-mm-dd");
		 $( "#proj_end_date" ).datepicker();
		 $( "#proj_end_date" ).datepicker( "option", "dateFormat", "yy-mm-dd");
	});
</script> 
</head>
<!-------------------------------- body ---------------------------------------->
<body>
	<div id="wrapper">
		<!-- header -->
		<header>
			<%@ include file="../include/header.jspf"%>
		</header>

		<div id="main_templet">
			<div id="slide_btn"></div>

			<!-- side_menu -->
			<nav class="nav">
				<%@ include file="../include/nav.jspf"%>
			</nav>

			<!-- main -->
			<article>
				<div class="tabs"></div>
				<div id="content-wrapper">
					<!-- 테이블내용 시작 -->
					<div class="card mb-3">
						<div class="card-header">
							<i class="fas fa-fw fa-users"></i> 프로젝트 관리
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
													id="myInput" onkeyup="myFunction()" />
												</label>
											</div>
										</div>
										<div class="col-sm-12 col-md-1">
											<button type="button" class="btn btn-primary btn-sm"
												id="myBtn" data-toggle="modal" data-target="#inputModal">등록</button>
<!------------------------------------------------- The Modal 새프로젝트등록 -------------------------------------------------->

								  <!-- Modal -->
							  <div class="modal fade" id="inputModal" role="dialog">
							    <div class="modal-dialog" role="document">
							    
							      <div class="modal-content modal-lg">
							        <div class="modal-header">
							          <button type="button" class="close" data-dismiss="modal"></button>
							          <h5><i class="fa fa-user icon"></i>등록</h5>
							        </div>
							        <div class="modal-body">
							        	
							          <form role="form" action="/ProjectNewInsert" method="POST">
							            <div class="form-group">
							             <!--  <label for="proj_id">프로젝트 코드</label> -->
							              <input type="hidden" class="form-control" id="project_id" placeholder="자동생성" readonly>
							            </div>
							            <div class="form-group">
							              <label for="proj_nm">프로젝트명</label>
							              <input type="text" name="proj_nm"class="form-control" id="project_nm" placeholder="프로젝트 이름을 입력하세요" required>
							            </div>
							            <div class="form-group">
							              <label for="proj_date">프로젝트 기간</label>
							            
						              	  <div>
						              		<input type="text" name="proj_str_date" class="form-control" id="project_str_date" style="width:48%; float:left;" placeholder="시작일을 입력하세요" readonly="readonly">
						              		<input type="text" name="proj_end_date" class="form-control" id="project_end_date" style="width:48%; float:right;" placeholder="종료일을 입력하세요" readonly="readonly">
						              	  </div>
							           </div>
							            <div class="form-group">
							             <!-- <input type="hidden" id="client_id" name="client_id" value=""> -->
							              <label for="client_id">고객사</label>
				                	       <select name="client_id" class="form-control" id="client_id" >
										    <option value="선택하세요">선택하세요</option>
										    <c:forEach var="clientList" items="${clientList}">
									    	<option value="${clientList.client_id}">${clientList.client_nm} </option>
									        </c:forEach>												
				                	      </select>

				                	    </div>
							            <div class="form-group">
							              <label for="involve_num">인원</label>
							              <input type="text" name="involve_num" class="form-control" id="involve_num" placeholder="투여인원을 입력하세요" required>
							            </div>
							            <div class="form-group">
							              <label for="field"> 해당분야</label>
							              	   <div> <select name="field_1" class="form-control" id="field_1" style="width:46%; float:left; margin-left:10px;" required>
	    										<c:forEach var="projectList" items="${projectList}">
										    	<option value="${projectList.field_1}">${projectList.field_1} </option>
										    	</c:forEach>
	   											 </select>
							              	    <select name="field_2" class="form-control" id="field_2" style="width:46%; float:right; margin-right:10px;" required>
	    										<c:forEach var="projectList" items="${projectList}">
										    	<option value="${projectList.field_2}">${projectList.field_2} </option>
										    	</c:forEach>
	   											 </select></div>
							            </div>
							            <div class="form-group">
											 <label for="note">비고</label>
										    <input type="text" name="note" class="form-control" id="note">
										  </div> 
										  <div class="form-group">
										    <label for="remark">내용</label>
										    <textarea name="remark" class="form-control" id="remark" required></textarea>
										  </div> 
										    <div class="form-group">
											<label for="need_tech">필요기술</label>
										    <textarea name="need_tech" class="form-control" id="need_tech" required></textarea>
										   </div>  
					<!-- 									   	<div class="form-group">
															    <label for="charge_id" >담당자</label>
															    <input type="text" class="form-control" id="charge_id" name="charge_id"/>
															    </div> -->
					 										   <div class="form-group">
															    <!-- <input type="hidden" id="charge_id" name="charge_id" value=""> -->
																<label for="charge_nm">담당자</label>
															    <select name="charge_id" class="form-control" id="charge_id" required>
															    	<option value="선택하세요">선택하세요</option>
															    	<c:forEach var="chargeList" items="${chargeList}">
															    	<option value="${chargeList.charge_id}">${chargeList.charge_nm} </option>
															    	</c:forEach>												
															    </select>
															    </div> 
															    <div class="form-group">
																	 <label for="project_amount">금액</label>
																    <input type="text" class="form-control" id="project_amount" name="project_amount"/>
																  </div>  
																<div>
																	<label for="use_yn">사용유무</label> <input id="use_yn"
																		type="checkbox" name="use_yn" value="Y">
																</div>
																<div class="modal-footer">
																	<button class="btn btn-primary btn-default pull-left">확인</button>
																	<button type=""
																		class="btn btn-danger btn-default pull-left"
																		data-dismiss="modal">취소</button>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
<!------------------------------------------------- The Modal 새프로젝트등록!!!끝 -------------------------------------------------->

<!----------------------------------------- The Modal 수정/삭제 ------------------>
								  <!-- Modal -->
  							  <div class="modal fade" id="inputModal2" role="dialog">
							    <div class="modal-dialog" role="document">
							    
							      <!-- Modal content2-->
		 					      <div class="modal-content modal-lg">
							        <div class="modal-header">
							          <button type="button" class="close" data-dismiss="modal"></button>
							          <h5><i class="fa fa-user icon"></i>수정/삭제</h5>
							        </div>
							        <div class="modal-body">
							        
							          <form id="modalform" role="form" action="ProjectNewInsert" method="POST">
							            <div class="form-group">
							              <label for="proj_id">프로젝트 코드</label>
							              <input type="text" class="form-control" id="proj_id" name="proj_id" placeholder="자동생성" readonly>
							            </div>
							            <div class="form-group">
							              <label for="proj_nm">프로젝트명</label>
							              <input type="text" class="form-control" id="proj_nm" name="proj_nm" placeholder="프로젝트 이름을 입력하세요">
							              
							            </div>
							            <div class="form-group">
							               <label for="proj_date">프로젝트 기간</label>
							             <div>
							             	<input type="text" class="form-control" id="proj_str_date"  name="proj_str_date" style="width:48%; float:left;" placeholder="시작일을 입력하세요" readonly>
							             	<input type="text" class="form-control" id="proj_end_date" name="proj_end_date"  style="width:48%; float:right;" placeholder="종료일을 입력하세요" readonly>
							             </div>
							            </div>
							            <div class="form-group">
							              <label for="cli_id">고객사</label>
							           	  <select name="client_id" class="form-control" id="cli_id" >
										    <c:forEach var="clientList" items="${clientList}">
									    	<option value="${clientList.client_id}">${clientList.client_nm} </option>
									        </c:forEach>												
				                	      </select>
							            </div>
							            <div class="form-group">
							              <label for="inv_num">인원</label>
							              <input type="text" class="form-control" id="inv_num" name="involve_num"  placeholder="투여인원을 입력하세요">
							            </div>
							            <div class="form-group">
							              <label for="field"> 해당분야</label>
							              	   <div> <select class="form-control" id="fid_1" name="field_1" style="width:46%; float:left; margin-left:10px;">
	    										<c:forEach var="projectList" items="${projectList}">
										    	<option value="${projectList.field_1}">${projectList.field_1} </option>
										    	</c:forEach>
	   											 </select>
							              	    <select class="form-control" id="fid_2" name="field_2"  style="width:46%; float:right; margin-right:10px;">
	    										<c:forEach var="projectList" items="${projectList}">
										    	<option value="${projectList.field_2}">${projectList.field_2} </option>
										    	</c:forEach>
	   											 </select></div>
							            </div>
							            <div class="form-group">
											 <label for="nte">비고</label>
										    <input type="text" class="form-control" id="nte" name="note"/>
										  </div> 
										   <div class="form-group">
										    <label for="rmark">내용</label>
										    <textarea class="form-control" id="rmark" name="remark"></textarea>
										  </div> 
										    <div class="form-group">
											<label for="need_tech">필요기술</label>
										    <textarea class="form-control" id="need_tec" name="need_tech" ></textarea>
										   </div>  
										   <div class="form-group">
<!-- 										    <label for="char_id" >담당자</label>
										    <input type="text" class="form-control" id="char_id" name="charge_id"/>
										    </div> -->

										   
										   <!--담당자 이름-->
											<label for="char_id">담당자</label>
										    <select class="form-control" id="char_id" name="charge_id">
										    	<c:forEach var="chargeList" items="${chargeList}">
										    	<option value="${chargeList.charge_id}">${chargeList.charge_nm} </option>
										    	</c:forEach> 
										    </select>
										    </div>
										    <div class="form-group">
											 <label for="proj_amount">금액</label>
										    <input type="text" class="form-control" id="proj_amount" name="project_amount"/>
										  </div>  
										    <div>
										   		<label for="use_yn">사용유무</label>
							   					<input id="us_yn" type="checkbox" name="use_yn" value="Y">
										    </div>

							            <div class="modal-footer">
							          		<input type="button" id="updatebtn" class="btn btn-success btn-default pull-left" value="수정">
							          		<input type="button" id="deletebtn" class="btn btn-danger btn-default pull-left" value="삭제">
							          		<button type="" class="btn btn-primary  btn-default pull-left" data-dismiss="modal">취소</button>
							        	</div>   
							          </form>
							          </div>
							        </div>
							        
							      </div>
							      
							    </div>
<!----------------------------------------- The Modal 수정/삭제 !!! 끝 ------------------>

<!----------------------------------------- The Modal 상세내용 ------------------>
								  <!-- Modal -->
  							  <div class="modal fade" id="inputModal3" role="dialog">
							    <div class="modal-dialog" role="document">
							    
							      <!-- Modal content3-->
		 					      <div class="modal-content modal-lg">
							        <div class="modal-header">
							          <button type="button" class="close" data-dismiss="modal"></button>
							          <h5><i class="fa fa-user icon"></i>상세보기</h5>
							        </div>
							        <div class="modal-body">
							        
							          <form id="modalform" role="form" action="" method="POST">
							           
										  <div class="form-group">
										    <label for="rmark">상세보기</label>
										    <textarea class="form-control" id="rmark" style="height:250px;" name="remark"></textarea>
										  </div> 
										    

							            <div class="modal-footer">
							          		<button type="" class="btn btn-primary  btn-default pull-left" data-dismiss="modal">확인</button>
							        	</div>   
							          </form>
							          </div>
							        </div>
							        
							      </div>
							      
							    </div>
<!----------------------------------------- The Modal 상세내용 !!! 끝 ------------------>

							</div>
						</div>

									<div class="row">
										<div class="col-sm-12">
											<table class="table table-bordered dataTable" id="dataTable"
												width="100%" cellspacing="0" role="grid"
												aria-describedby="dataTable_info" style="width: 100%;">
												<thead>
													<tr role="row" style="text-align: center; font-size: 13px;">
														<th onclick="sortTable(0)" style="width: 6%; height: 5%">순번</th>
														<th onclick="sortTable(1)" style="width: 17%; height: 5%">프로젝트명</th>
														<th onclick="sortTable(2)" style="width: 12%; height: 5%">프로젝트기간</th>
														<!-- <th onclick="sortTable(3)">프로젝트종료일</th> -->
														<th onclick="sortTable(3)" style="width: 10%; height: 5%">고객사</th>
														<th onclick="sortTable(4)" style="width: 17%; height: 5%">필요기술</th>
														<th onclick="sortTable(5)" style="width: 10%; height: 5%">해당분야</th>
														<th onclick="sortTable(6)" style="width: 6%; height: 5%">투여인원</th>
														<th onclick="sortTable(7)" style="width: 10%; height: 5%">담당자</th>
														 <th onclick="sortTable(8)" style="width: 6%; height: 5%">금액</th>
														<th onclick="sortTable(9)" style="width: 6%; height: 5%">상세내용</th>
													</tr>
												</thead>
												<tfoot>
													<tr role="row" style="text-align: center; font-size: 13px;">
														<th onclick="sortTable(0)" rowspan="1" colspan="1">순번</th>
														<th onclick="sortTable(1)" rowspan="1" colspan="1">프로젝트명</th>
														<th onclick="sortTable(2)" rowspan="1" colspan="1">프로젝트기간</th>
														<!--  <th onclick="sortTable(3)" rowspan="1" colspan="1">프로젝트종료일</th> -->
														<th onclick="sortTable(3)" rowspan="1" colspan="1">고객사</th>
														<th onclick="sortTable(4)" rowspan="1" colspan="1">필요기술</th>
														<th onclick="sortTable(5)" rowspan="1" colspan="1">해당분야</th>
														<th onclick="sortTable(6)" rowspan="1" colspan="1">투여인원</th>
														<th onclick="sortTable(7)" rowspan="1" colspan="1">담당자</th>
													    <th onclick="sortTable(8)" rowspan="1" colspan="1">금액</th>
														<th onclick="sortTable(9)" rowspan="1" colspan="1">상세내용</th>
													</tr>
												</tfoot>
												<tbody>
													<c:forEach var="proj" items="${projectList}"
														varStatus="status">
														<%-- <c:choose>
															<c:when test="${(status.index)%2 eq 1}">
																<tr role="row" class="odd" style="text-align: center">
															</c:when>
															<c:when test="${(status.index)%2 eq 0}">
																<tr role="row" class="even" style="text-align: center">
															</c:when>
														</c:choose>  --%>
														<tr class="rowClick" role="row" style="text-align: center">
																<input type="hidden" data-toggle="modal" class="idClick proj_id" data-target="#inputModal2" data-id="proj_id" value="${proj.proj_id}"> 
																<input type="hidden" data-toggle="modal" class="idClick charge_id" data-target="#inputModal2" data-id="charge_id" value="${proj.charge_id}"> 
																<input type="hidden" data-toggle="modal" class="idClick client_id" data-target="#inputModal2" data-id="client_id" value="${proj.client_id}"> 
																<input type="hidden" data-toggle="modal" class="idClick field_2" data-target="#inputModal2" data-id="field_2" value="${proj.field_2}"> 
															<td><a href="#" data-toggle="modal" class="idClick rownum" data-target="#inputModal2"data-id="rownum">${proj.rownum}</a></td>
															<td><a href="#" data-toggle="modal" class="idClick proj_nm" data-target="#inputModal2"data-id="proj_nm">${proj.proj_nm}</a></td>
															<td><a href="#" data-toggle="modal" class="idClick proj_str_date" data-target="#inputModal2" data-id="proj_str_date">${proj.proj_str_date}</a>
																~
																<a href="#" data-toggle="modal" class="idClick proj_end_date" data-target="#inputModal2" data-id="proj_end_date">${proj.proj_end_date}</a></td>
															<td><a href="#" data-toggle="modal" class="idClick client_id" data-target="#inputModal2" >${proj.client_nm}</a></td>
															<td><a href="#" data-toggle="modal" class="idClick need_tech" data-target="#inputModal2" data-id="need_tech">${proj.need_tech}</a></td>
															<td><a href="#" data-toggle="modal" class="idClick field_1" data-target="#inputModal2" data-id="field_1">${proj.field_1}</a></td>
															<td><a href="#" data-toggle="modal" class="idClick involve_num" data-target="#inputModal2" data-id="involve_num">${proj.involve_num}</a></td>
															<td><a href="#" data-toggle="modal" class="idClick charge_id" data-target="#inputModal2" >${proj.charge_nm}</a></td>
															 <td><a href="#" data-toggle="modal" class="idClick project_amount" data-target="#inputModal2" data-id="project_amount">${proj.project_amount}</a></td> 
															<td><a href="#" data-toggle="modal" class="idClick remark" data-target="#inputModal3" data-id="remark">상세내용<p hidden>${proj.remark}</p></a></td>
															<%--   <td><a href="#" data-toggle="modal" class="idClick field_2" data-target="#inputModal2" data-id="field_2" >${proj.field_2}</a></td> --%>
															<%-- 	<td> <a href="#" data-toggle="modal" class="idClick charge_nm" data-target="#inputModal2" data-id="charge_nm" >${proj.charge_nm}</a></td> --%>
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