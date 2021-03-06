<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>


<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="assets/images/favicon.png">
<title>Matrix Template - The Ultimate Multipurpose admin
	template</title>

<!-- Custom CSS -->
<link href="/resources/css/admin/dataTables.bootstrap4.css"
	rel="stylesheet">
<link href="/resources/css/admin/style.min.css" rel="stylesheet">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
</head>

<body>
	<!-- ============================================================== -->
	<!-- Preloader - style you can find in spinners.css -->
	<!-- ============================================================== -->

	<!-- ============================================================== -->
	<!-- Main wrapper - style you can find in pages.scss -->
	<!-- ============================================================== -->
	<div id="main-wrapper">
		<!-- ============================================================== -->
		<!-- Topbar header - style you can find in pages.scss -->
		<!-- ============================================================== -->
		<%@ include file="/WEB-INF/views/admin/include/nav.jsp"%>
		<!-- ============================================================== -->
		<!-- End Left Sidebar - style you can find in sidebar.scss  -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- Page wrapper  -->
		<!-- ============================================================== -->
		<div class="page-wrapper">
			<!-- ============================================================== -->
			<!-- Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->
			<div class="page-breadcrumb">
				<div class="row">
					<div class="col-12 d-flex no-block align-items-center">
						<h4 class="page-title">???????????????</h4>
						<div class="ml-auto text-right">
							<nav aria-label="breadcrumb">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="#">Home</a></li>
									<li class="breadcrumb-item active" aria-current="page">???????????????</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>
			</div>
			<!-- ============================================================== -->
			<!-- End Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- Container fluid  -->
			<!-- ============================================================== -->
			<div class="container-fluid">
				<!-- ============================================================== -->
				<!-- Start Page Content -->
				<!-- ============================================================== -->
				<form class="row">

					<div class="col-md-12">
						<div class="card">
							<div class="card-body no-padding">

								<div class="form-group row">

									<div class="col-sm-9">
										<div>
											<div style="display: table; width: 100%; margin-bottom: 5px;">
												<div style="display: table-row-group;">
													<div class='d-table-cell' style="width: 15%;">?????? ??????</div>
													<div class='d-table-cell '>
														<input type="radio" name="option" id="search_option"
															value="b.nickname" checked><label class="ml-2 mr-2">?????????</label>
														<input type="radio" value="content" name="option"
															id="search_option"><label class="ml-2 mr-2">?????????</label>
														<input type="radio" name="option" id="search_option"
															value="bd_title"><label class="ml-2 mr-2">??????</label>
													</div>
												</div>
											</div>
											<div style="display: table; width: 100%; margin-bottom: 5px;">
												<div style="display: table-row-group;">
													<div class='d-table-cell' style="width: 15%;">????????? ??????</div>
													<div class='d-table-cell '>
														<input type="search" class="form-control" style="width: 50%" 
															placeholder="????????? ?????? ??????" name="keyword" aria-label="Search" required
															id="inp" value="${dataMap.keyword }">
													</div>
												</div>
											</div>

										</div>
										<div class="border-top">
											<div class="card-body">
												<button class="btn-secondary float-right ml-2"
													onclick="searchKeyword()">??????</button>
												<button class="btn-primary float-right" type="button"
													onclick="javascript:location.href=location.pathname">?????????</button>
											</div>
										</div>
									</div>
								</div>

							</div>
						</div>

					</div>

				</form>
				<div class="row">

					<div class="col-12">

						<div class="card">
							<div class="card-body">
								<h5 class="card-title m-b-0">????????? ??????</h5>
								<span class="float-left"> <select class="form-control" onchange="changeCategory()"
									aria-hidden="true" name="category" id="categorySelect">
										<option value="all">??????</option>


										<option value="info" data-select2-id="17">???????????????</option>
										<option value="dog" data-select2-id="18">??????????????????</option>

										<option value="cat" data-select2-id="20">??????????????????</option>
										<option value="review" data-select2-id="21">???????????????</option>
										<option value="meet" data-select2-id="22">???????????????</option>
										<option value="consulting" data-select2-id="23">???????????????</option>


								</select>
								</span> <span class="float-right"><select name="sort"
									id="sortSelect" onchange="sortList()" class="form-control">
										<option value="reg_date">????????????</option>
										<option value="view_count">?????????</option>
										<option value="rec_count">?????????</option>

								</select></span>
							</div>

							<br>
							<div class="table-responsive">
								<form>
									<table class="table mb-0">
										<thead class="thead-dark">
											<tr>
												<th style="width: 10%"><input type="checkbox"
													id="chk_all" /></th>
												<th scope="col" style="width: 20%">??????</th>
												<th scope="col" style="width: 10%">?????????</th>
												<th scope="col" style="width: 10%">??????</th>
												<th scope="col" style="width: 20%">?????????</th>
												<th scope="col" style="width: 10%">????????? ???</th>
												<th scope="col" style="width: 10%">?????? ???</th>
												<th scope="col" style="width: 10%"></th>
											</tr>
										</thead>
										<tbody class="customtable">
											<c:forEach items="${bList}" var="bList" varStatus="status">
												<tr>
													<th><label class="customcheckbox"> <input
															type="checkbox" class="listCheckbox" value="${bList.BD_IDX}" /> <span
															class="checkmark"></span>
													</label></th>
													<td><a
														href="/board/${bList.CATEGORY}/detail?bdIdx=${bList.BD_IDX}">${bList.BD_TITLE}</a><small
														class="ml-2"><i class="fas fa-comment mr-1"></i>${bList.CM_CNT}</small></td>
													<td><a href="">${bList.NICKNAME}</a></td>
													<td>${bList.CATEGORY}</td>
													<td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss"
															value="${bList.REG_DATE}" /></td>
													<td>${bList.REC_COUNT}</td>
													<td>${bList.VIEW_COUNT}</td>
													<td class="nav-item" ><span>
													<c:choose>
													
													<c:when test="${bList.IS_DEL == 1}">
														???????????????<a class="btn btn-warning btn-sm" onclick="confirmDeleteBoard(${bList.BD_IDX})">??????</a>
													</c:when>
													<c:otherwise>
														?????????
													</c:otherwise>
													</c:choose>
													</span></td>
												</tr>
											</c:forEach>

										</tbody>
									</table>

									<div class="border-top">
										<div class="card-body">
											<button class="btn btn-secondary " onclick="deleteCheckList('contents/delete-board')">??????</button>
											<%@ include file="/WEB-INF/views/admin/include/paging.jsp"%>
										</div>
									</div>

								</form>
							</div>
						</div>
					</div>
				</div>
				<!-- ============================================================== -->
				<!-- End PAge Content -->
				<!-- ============================================================== -->
				<!-- ============================================================== -->
				<!-- Right sidebar -->
				<!-- ============================================================== -->
				<!-- .right-sidebar -->
				<!-- ============================================================== -->
				<!-- End Right sidebar -->
				<!-- ============================================================== -->
			</div>

			<footer class="footer text-center">
				All Rights Reserved by Matrix-admin. Designed and Developed by <a
					href="https://wrappixel.com">WrapPixel</a>.
			</footer>
			<!-- ============================================================== -->
			<!-- End footer -->
			<!-- ============================================================== -->
		</div>
		<!-- ============================================================== -->
		<!-- End Page wrapper  -->
		<!-- ============================================================== -->
	</div>
	<!-- ============================================================== -->
	<!-- End Wrapper -->
	<!-- ============================================================== -->
	<!-- ============================================================== -->
	<!-- All Jquery -->
	<!-- ============================================================== -->
	<script src="/resources/js/admin/jquery.min.js"></script>
	<!-- Bootstrap tether Core JavaScript -->
	<script src="/resources/js/admin/popper.min.js"></script>
	<script src="/resources/js/admin/bootstrap.min.js"></script>
	<script src="/resources/js/admin/perfect-scrollbar.jquery.min.js"></script>
	<script src="/resources/js/admin/sparkline.js"></script>
	<!--Wave Effects -->
	<script src="/resources/js/admin/waves.js"></script>
	<!--Menu sidebar -->
	<script src="/resources/js/admin/sidebarmenu.js"></script>
	<!--Custom JavaScript -->
	<script src="/resources/js/admin/custom.min.js"></script>
	<script src="/resources/js/admin/common/paging.js"></script>
	<script src="/resources/js/admin/common/select-tab.js"></script>
	<!--This page JavaScript -->
	<script type="text/javascript">
(() =>{
	
	Array.prototype.forEach.call(document.querySelector("#sortSelect").options, e =>{
		if(e.value == "${dataMap.sort}") e.selected = true;
	})
	
	Array.prototype.forEach.call(document.querySelector("#categorySelect").options, e =>{
		if(e.value == "${dataMap.category}") e.selected = true;
	})
	
	document.querySelectorAll("#search_option").forEach(e =>{
		if(e.value == "${dataMap.option}") e.checked = true;
		
	})
	
	
})();


  
    
    let sortList = () =>{
    	var sortSelect = document.getElementById("sortSelect");  
    	var selectValue = sortSelect.options[sortSelect.selectedIndex].value; 
 		 URLSearch.set('sort', String(selectValue));
 		 URLSearch.set('page', String("1"));
    	 const newParam = URLSearch.toString();
    	 location.href = location.pathname + '?' + newParam
 	 
		}
    let changeCategory = () =>{
    	var categorySelect = document.getElementById("categorySelect");  
    	var categoryValue = categorySelect.options[categorySelect.selectedIndex].value; 
 		 URLSearch.set('category', String(categoryValue));
 		 URLSearch.set('page', String("1"));
    	 const newParam = URLSearch.toString();
    	 location.href = location.pathname + '?' + newParam
 	 
		}
    
    let searchKeyword = () =>{
    	var option = document.querySelector("#search_option").value
    	var keyword = document.querySelector("#inp").value
    	var category = document.querySelector("#category").value
    	keyword = keyword.trim()
    	
    	 URLSearch.set("option", String(option));
  		 URLSearch.set("keyword", String(keyword));
  		 URLSearch.set("category", String(category));
  		if(keyword == ''){
    		alert("???????????? ??????????????????.")
    		return
    	}
     	 const newParam = URLSearch.toString();
     	 location.href = location.pathname + '?' + newParam
  	
        		
       		
    	
    }
    
let confirmDeleteBoard = (bdIdx) =>{
    	return fetch('/admin/contents/delete-one-board',{
 			method:"post",
 			body: JSON.stringify({bdIdx : bdIdx}),
 			 headers:{
 			    'Content-Type': 'application/json'
 			  }
    	}).then(res => {
    		alert('?????? ???????????????.');
    		location.reload();
    	})
    	
 	}
    
   
    
</script>



</body>

</html>