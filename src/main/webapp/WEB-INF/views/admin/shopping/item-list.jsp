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
		<%@ include file="/WEB-INF/views/admin/include/nav.jsp"%>
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
						<h4 class="page-title">Tables</h4>
						<div class="ml-auto text-right">
							<nav aria-label="breadcrumb">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="#">Home</a></li>
									<li class="breadcrumb-item active" aria-current="page">?????????
										?????????</li>
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
				<div class="row">
					<div class="col-md-12">
						<div class="card" style="background-color: transparent;">
							<div class="row">
								<div class="ml-3">
									<div class=" text-center m-10">
										<h6>
											<a class="tab_all tab" data-tab="all"
												onclick="selectTab('state','all')">??????<span><c:out
														value="${datas.totalCnt }"></c:out></span></a>
										</h6>
									</div>
								</div>
								<div class="ml-3">
									<div class=" text-center m-10">
										<h6>
											<a class="tab_n tab" data-tab="sale"
												onclick="selectTab('state','sale')">????????? <span><c:out
														value="${datas.saleCnt }"></c:out></span></a>
										</h6>
									</div>
								</div>
								<div class="ml-3">
									<div class=" text-center m-10">
										<h6>
											<a class="tab_n tab" data-tab="soldout"
												onclick="selectTab('state','soldout')">?????? <span><c:out
														value="${datas.soldoutCnt }"></c:out></span></a>
										</h6>
									</div>
								</div>
								<div class="ml-3">
									<div class=" text-center m-10">
										<h6>
											<a class="tab_n tab" data-tab="hidden"
												onclick="selectTab('state','hidden')">?????? <span><c:out
														value="${datas.hiddenCnt }"></c:out></span></a>
										</h6>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- ============================================================== -->
				<!-- Start Page Content -->
				<!-- ============================================================== -->
					<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-body no-padding">
								<form>
									<div class="form-group row">

										<div class="col-sm-9">
											<div>

												<div
													style="display: table; width: 100%; margin-bottom: 5px;">
													<div style="display: table-row-group;">
														<div class='d-table-cell' style="width: 15%;">????????? ??????</div>
														<div class='d-table-cell '>
															<input type="search" class="form-control"
																style="width: 50%" placeholder="????????? ?????? ??????"
																name="keyword" aria-label="Search" required id="inp"
																value="${dataMap.keyword }">
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
								</form>
							</div>
						</div>

					</div>

				</div>
				<div class="row">

					<div class="col-12">

						<div class="card">
							<div class="card-body">
								<h5 class="card-title m-b-0 d-inline-block">????????????</h5>

								<span class="btn-primary float-right btn-lg"
									onclick="location.href='/admin/shopping/add-item'">????????????</span>

							</div>

							<div class="table-responsive">
								<div>
									<table class="table mb-0">
										<thead class="thead-dark">
											<tr>
												<th><input type="checkbox" id="chk_all" /></th>
												<th scope="col">NO</th>
												<th scope="col">?????????</th>
												<th scope="col">?????????</th>
												<th scope="col">????????????</th>
												<th scope="col">??????</th>
												<th scope="col">??????</th>
												<th scope="col">?????????</th>
											</tr>
										</thead>
										<tbody class="customtable">

											<c:forEach items="${datas.prdList}" var="data"
												varStatus="status">
												<tr>
													<td><label class="mt-3"> <input
															type="checkbox" class="listCheckbox" value="${data.DT_IDX }" /> <span
															class="checkmark"></span>
													</label></td>
													<td>${data.RNUM}</td>
													<td><a><img style="height: 60px; widht: 60px;"
															src="${data.downloadURL}"></a>
														<div class="d-inline-block">
															<a href="#">(${data.BRAND})${data.NAME}/${data.PO_NAME}</a>
														</div></td>
													<td>${data.SALE_PRICE}???</td>
													<td><c:choose>
															<c:when test="${data.CATEGORY eq 'feed'}">??????</c:when>
															<c:when test="${data.CATEGORY eq 'snack'}">??????</c:when>
															<c:when test="${data.CATEGORY eq 'health'}">????????????</c:when>
															<c:when test="${data.CATEGORY eq 'potty'}">??????/??????</c:when>
															<c:when test="${data.CATEGORY eq 'beauty'}">??????/??????</c:when>
															<c:when test="${data.CATEGORY eq 'feeder'}">?????????/?????????</c:when>
															<c:when test="${data.CATEGORY eq 'kennel'}">?????????/?????????</c:when>
															<c:when test="${data.CATEGORY eq 'vari-kennel'}">?????????</c:when>
															<c:when test="${data.CATEGORY eq 'clothes'}">??????/????????????</c:when>
															<c:when test="${data.CATEGORY eq 'toy'}">?????????</c:when>

														</c:choose></td>
													<td><select name="state" id="state"
														onchange="changeState(${data.DT_IDX}, this.value)">
															<c:choose>
																<c:when test="${data.STATE == 'sale'}">
																	<option value="sale" selected>?????????</option>
																	<option value="soldout">??????</option>
																	<option value="hidden">??????</option>
																</c:when>
																<c:when test="${data.STATE == 'soldout'}">
																	<option value="sale">?????????</option>
																	<option value="soldout" selected>??????</option>
																	<option value="hidden">??????</option>
																</c:when>
																<c:when test="${data.STATE == 'hidden'}">
																	<option value="sale">?????????</option>
																	<option value="soldout">??????</option>
																	<option value="hidden" selected>??????</option>
																</c:when>
															</c:choose>

													</select></td>


													<td>${data.PO_STOCK }</td>
													<td><fmt:formatDate
															pattern="yyyy-MM-dd"
															value="${data.REG_DATE}" /></td>

												</tr>
											</c:forEach>
											
										</tbody>
									</table>

									<div class="border-top">
										<div class="card-body">
											<button class="btn btn-secondary " onclick="deleteCheckList('shopping/delete-prd')">??????</button>
											<%@ include file="/WEB-INF/views/admin/include/paging.jsp"%>
										</div>
									</div>
								</div>
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
	<!--This page JavaScript -->

	<script src="/resources/js/admin/common/paging.js"></script>
	<script src="/resources/js/admin/common/select-tab.js"></script>
	
	<script type="text/javascript">
	let changeState = (dtIdx, state) =>{
 		
    	return fetch('/admin/shopping/update-product-state',{
 			method:"post",
 			body: JSON.stringify({dtIdx : dtIdx, state : state}),
 			 headers:{
 			    'Content-Type': 'application/json'
 			  }
    	}).then(res => {
    		alert('????????? ?????????????????????.');
    		location.reload();
    	})
    		
 	
 	}
	
	let searchKeyword = () =>{
		
		var keyword = document.querySelector("#inp").value
		
		keyword = keyword.trim()

		URLSearch.set("keyword", String(keyword));
		if(keyword == ''){
			alert("???????????? ??????????????????.")
			return
		}
	 	 const newParam = URLSearch.toString();
	 	 location.href = location.pathname + '?' + newParam
		
	}
	
	
	
	
	


	   
	</script>
</body>

</html>