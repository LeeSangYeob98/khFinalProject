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
<style>
.table tbody tr td, th {
	border-right: 1px solid #dee2e6;
}
</style>
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
						<h4 class="page-title">????????????</h4>
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
												onclick="selectTab('state','all')">??????<span>
													${orderMap.totalCnt}</span></a>
										</h6>
									</div>
								</div>
								<div class="ml-3">
									<div class=" text-center m-10">
										<h6>
											<a class="tab" data-tab="newOrder" onclick="selectTab('state','newOrder')">???????????? <span>${orderMap.newOrderCnt}</span></a>
										</h6>
									</div>
								</div>
								<div class="ml-3">
									<div class=" text-center m-10">
										<h6>
											<a class="tab" data-tab="delivering" onclick="selectTab('state','delivering')">????????? <span>${orderMap.deliveringCnt}</span></a>
										</h6>
									</div>
								</div>
								<div class="ml-3">
									<div class=" text-center m-10">
										<h6>
											<a class="tab" data-tab="deliverComplete" onclick="selectTab('state','deliverComplete')">???????????? <span>${orderMap.deliverCompleteCnt}</span></a>
										</h6>
									</div>
								</div>
								<div class="ml-3">
									<div class=" text-center m-10">
										<h6>
											<a class="tab" data-tab="newRefund" onclick="selectTab('state','newRefund')">??????????????? <span>${orderMap.newRefundCnt}</span></a>
										</h6>
									</div>
								</div>
								<div class="ml-3">
									<div class=" text-center m-10">
										<h6>
											<a class="tab" data-tab="refundComplete" onclick="selectTab('state','refundComplete')">???????????? <span>${orderMap.refundCompleteCnt}</span></a>
										</h6>
									</div>
								</div>
								<div class="ml-3">
									<div class=" text-center m-10">
										<h6>
											<a class="tab" data-tab="newCancel" onclick="selectTab('state','newCancel')">??????????????? <span>${orderMap.newCancelCnt}</span></a>
										</h6>
									</div>
								</div>
								<div class="ml-3">
									<div class=" text-center m-10">
										<h6>
											<a class="tab" data-tab="cancelComplete" onclick="selectTab('state','cancelComplete')">???????????? <span>${orderMap.cancelCompleteCnt}</span></a>
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

					<div class="col-12">

						<div class="card">
							<div class="card-body">
								<h5 class="card-title m-b-0 d-inline-block">????????????</h5>

							</div>

							<div class="table-responsive">

								<table class="table mb-0">
									<thead class="thead-dark">
										<tr>

											<th scope="col" style="width: 12%;">????????????/??????</th>
											<th scope="col" class="text-center" style="width: 20%;">????????????</th>
											<th scope="col" class="text-right" style="width: 8%;">????????????</th>
											<th scope="col" class="text-center" style="width: 5%;">??????</th>
											<th scope="col" class="text-center" style="width: 15%;">???????????????</th>
											<th scope="col" class="text-center" style="width: 15%;">????????????</th>
											<th scope="col" class="text-center" style="width: 15%;">????????????</th>
											<th scope="col" class="text-center" style="width: 10%;">??????</th>
										</tr>
									</thead>
									<tbody class="customtable">
										<c:forEach items="${orderMap.orderList}" var="orderList">

											<c:choose>
												<c:when test="${orderList.CNT == 1}">

													<c:forEach items="${orderList.specList}" var="specList">

														<tr>

															<td>
																<div>
																	<span style="color: black;">${specList.ORDER_NUM}</span>
																</div>
																<div style="font-size: 10pt; color: gray;">
																	<fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss"
																		value="${specList.ORDER_DATE}" />
																</div>
																<p style="margin-top: 10px;">?????????${specList.USER_NAME}</p>
															</td>
															<td><a><img
																	src="${specList.downloadURL}" style="width: 100px; height: 100px;"></a>
																<div class="d-inline-block">
																	<div style="font-size: 10pt; color: gray;">${specList.ORDER_NUM}</div>
																	<div>
																		<a href="#">${specList.NAME}(${specList.PO_NAME})</a>
																	</div>
																</div></td>
															<td class="text-right  ">${specList.PRICE * specList.ORDER_CNT}</td>
															<td class="text-center">${specList.ORDER_CNT}</td>
															<td>
																<form action="/admin/shopping/update-shipping"
																	method="post">
																	<input type="hidden" name="orderNum" id="orderNum"
																		value="${specList.ORDER_NUM}">
																	<div>
																		<select required name="shippingCompany" class="form-control"
																			id="shippingCompany${specList.ORDER_NUM}">
																			<option value="" selected disabled>????????? ??????</option>
																			<option value="CJ">CJ????????????</option>
																			<option value="EPOST">???????????????</option>
																			<option value="REGISTPOST">????????????</option>
																			<option value="HANJIN">????????????</option>
																			<option value="LOGEN">????????????</option>
																			<option value="GTX">GTX?????????</option>
																			<option value="LOTTE">????????????</option>
																			<option value="DS">????????????</option>
																			<option value="IY">???????????????</option>
																			<option value="KD">????????????</option>
																			<option value="NHLOGIS">????????????</option>
																			<option value="SEBANG">????????????</option>
																			<option value="CI">????????????</option>
																			<option value="CVS">CVSnet ???????????????</option>
																			<option value="HD">????????????</option>
																			<option value="EMS">EMS</option>
																			<option value="kpacket">K-Packet</option>
																			<option value="DHL">DHL</option>
																			<option value="FEDEX">Fedex</option>
																			<option value="GSMN">GSMNtoN</option>
																			<option value="UPS">UPS</option>
																			<option value="TNT">TNT Express</option>
																			<option value="USPS">USPS</option>
																			<option value="AIRBOY">???????????????????????????</option>
																			<option value="DHLMAIL">DHL Global Mail</option>
																			<option value="IPARCEL">i-Parcel</option>
																			<option value="HANWISA">??????????????????</option>
																			<option value="GUNYOUNG">????????????</option>
																			<option value="BUMHAN">???????????????</option>
																			<option value="APEX">APEX</option>
																			<option value="ECMSExpress">ECMSExpress</option>
																			<option value="GOODTOLUCK">?????????</option>
																			<option value="DHLGER">DHL ??????</option>
																			<option value="ACI">ACI</option>
																			<option value="LOTTEGLOBAL">????????????(????????????)</option>
																			<option value="CJGLOBAL">CJ????????????(????????????)</option>
																			<option value="SUNGWON">???????????????</option>
																			<option value="DAEWOON">???????????????</option>
																			<option value="SLX">SLX??????</option>
																			<option value="HONAM">????????????</option>
																			<option value="GSIEXPRESS">GSI???????????????</option>
																			<option value="KGBPS">KGB ??????</option>
																			<option value="CUPARCEL">CU???????????????</option>
																			<option value="VROONG">??????</option>
																			<option value="todaypickup">????????? ??????</option>
																			<option value="CHAINLOGIS">???????????????</option>
																			<option value="HOMEPICK">????????????</option>
																			<option value="QXPRESS">??????????????????</option>
																			<option value="LINEEXP">?????????????????????</option>
																			<option value="GPSLOGIX">GPS LOGIX</option>
																			<option value="CRLX">???????????????</option>
																			<option value="BRIDGE">??????????????????</option>
																			<option value="EFS">EFS</option>
																			<option value="FRESH">??????????????????</option>
																			<option value="FRESHMATES">??????????????????</option>
																			<option value="GTSLOGIS">GTS?????????</option>
																			<option value="GENIEGO">?????????</option>
																			<option value="PINGPONG">??????</option>
																			<option value="ETC">????????????</option>
																		</select>
																	</div>
																	<div>
																		<c:choose>
																			<c:when test="${specList.SHIPPING_NUM ne null}">
																				<input type="text" placeholder="????????????" required  class="form-control"
																					id="shippingNum" name="shippingNum"
																					value="${specList.SHIPPING_NUM}">
																			</c:when>
																			<c:otherwise>
																				<input type="text" placeholder="????????????" required class="form-control"
																					id="shippingNum" name="shippingNum" value="">
																			</c:otherwise>
																		</c:choose>
																	</div>
																	<div>
																		<center><button type="submit">??????/??????</button></center>
																	</div>

																</form> <script type="text/javascript">
																(() =>{
																	Array.prototype.forEach.call(document.querySelector("#shippingCompany${specList.ORDER_NUM}").options, e =>{
																		if(e.value == "${specList.SHIPPING_COMPANY}") e.selected = true;
																	})
																})();
																</script>
															</td>

															<td>
																<div class="mb-2">
																	<strong>${specList.USER_NAME }</strong>/<span>????????????</span>
																	<div class="mb-1" style="font-size: 10pt; color: gray">
																		????????????????????????<br>
																		<div>????????????</div>
																	</div>
																</div>
															</td>
															<td>
																<div>
																	<div
																		style="display: table; width: 100%; margin-bottom: 7px;">
																		<div style="display: table-row-group;">
																			<div class='d-table-cell'>??? ????????????</div>
																			<div class='d-table-cell text-right'>${specList.PAYMENT_AMOUNT}???</div>
																		</div>
																	</div>
																	<div style="display: table; width: 100%; color: gray;">
																		<div style="display: table-row-group;">
																			<div class='d-table-cell'>??????</div>
																			<div class='d-table-cell text-right'>${specList.PAYMENT_AMOUNT+specList.CP_SAVE_MONEY + specList.SAVE_MONEY}???</div>
																		</div>
																		<div style="display: table-row-group;">
																			<div class='d-table-cell'>?????? ????????????</div>
																			<div class='d-table-cell text-right'>${specList.CP_SAVE_MONEY + specList.SAVE_MONEY}???</div>
																		</div>
																	</div>
																	<div style="display: table; width: 100%; color: gray;">
																		<div style="display: table-row-group;">
																			<div class='d-table-cell'>${specList.PAYMENY_METHOD}</div>
																			<div class='d-table-cell text-right'>${specList.PAYMENT_METHOD}<br>????????????
																			</div>
																		</div>
																	</div>
																</div>
															</td>
															<td class="nav-item text-center "><span> <c:if
																		test="${specList.STATE == 'newOrder'}">????????????</c:if>
															</span> <c:if test="${specList.STATE != 'newOrder'}">
																	<select name="state" id="state"
																		onchange="changeState(${specList.ORDER_NUM}, this.value)">

																		<c:if test="${specList.STATE == 'delivering'}">
																			<option value="delivering" selected>?????????</option>
																			<option value="deliverComplete">????????????</option>
																		</c:if>
																		<c:if test="${specList.STATE == 'deliverComplete'}">
																			<option value="delivering">?????????</option>
																			<option value="deliverComplete" selected>????????????</option>
																		</c:if>
																		<c:if test="${specList.STATE == 'newRefund'}">
																			<option value="newRefund" selected>???????????????</option>
																			<option value="refundComplete">????????????</option>
																		</c:if>
																		<c:if test="${specList.STATE == 'refundComplete'}">
																			<option value="newRefund">???????????????</option>
																			<option value="refundComplete" selected>????????????</option>
																		</c:if>
																		<c:if test="${specList.STATE == 'newCancel'}">
																			<option value="newCancel" selected>???????????????</option>
																			<option value="cancelComplete">????????????</option>
																		</c:if>
																		<c:if test="${specList.STATE == 'cancelComplete'}">
																			<option value="newCancel">???????????????</option>
																			<option value="cancelComplete" selected>????????????</option>
																		</c:if>

																	</select>
																</c:if></td>
														</tr>
													</c:forEach>
												</c:when>
												<c:otherwise>
													<c:forEach items="${orderList.specList}" var="specList"
														varStatus="status">
														<c:choose>
															<c:when test="${status.count == 1}">
																<tr>

																	<td rowspan="${orderList.CNT}">
																		<div>
																			<span style="color: black;">${specList.ORDER_NUM}</span>
																		</div>
																		<div style="font-size: 10pt; color: gray;">
																			<fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss"
																				value="${specList.ORDER_DATE}" />
																		</div>
																		<p style="margin-top: 10px;">${specList.USER_NAME}</p>
																	</td>
																	<td><a><img
																			src="${specList.downloadURL}" style="width: 100px; height: 100px;"></a>
																		<div class="d-inline-block">
																			<div style="font-size: 10pt; color: gray;">${specList.ORDER_NUM}</div>
																			<div>
																				<a href="#">${specList.NAME}(${specList.PO_NAME})</a>
																			</div>
																		</div></td>
																	<td class="text-right  ">${specList.PRICE}</td>
																	<td class="text-center">${specList.ORDER_CNT}</td>
																	<td rowspan="${orderList.CNT}">
																		<form action="/admin/shopping/update-shipping"
																			method="post">
																			<input type="hidden" name="orderNum" id="orderNum"
																				value="${specList.ORDER_NUM}">
																			<div>
																				<select required name="shippingCompany" class="form-control"
																					id="shippingCompany${specList.ORDER_NUM}">
																					<option value="" selected disabled>????????? ??????</option>
																					<option value="CJ">CJ????????????</option>
																					<option value="EPOST">???????????????</option>
																					<option value="REGISTPOST">????????????</option>
																					<option value="HANJIN">????????????</option>
																					<option value="LOGEN">????????????</option>
																					<option value="GTX">GTX?????????</option>
																					<option value="LOTTE">????????????</option>
																					<option value="DS">????????????</option>
																					<option value="IY">???????????????</option>
																					<option value="KD">????????????</option>
																					<option value="NHLOGIS">????????????</option>
																					<option value="SEBANG">????????????</option>
																					<option value="CI">????????????</option>
																					<option value="CVS">CVSnet ???????????????</option>
																					<option value="HD">????????????</option>
																					<option value="EMS">EMS</option>
																					<option value="kpacket">K-Packet</option>
																					<option value="DHL">DHL</option>
																					<option value="FEDEX">Fedex</option>
																					<option value="GSMN">GSMNtoN</option>
																					<option value="UPS">UPS</option>
																					<option value="TNT">TNT Express</option>
																					<option value="USPS">USPS</option>
																					<option value="AIRBOY">???????????????????????????</option>
																					<option value="DHLMAIL">DHL Global Mail</option>
																					<option value="IPARCEL">i-Parcel</option>
																					<option value="HANWISA">??????????????????</option>
																					<option value="GUNYOUNG">????????????</option>
																					<option value="BUMHAN">???????????????</option>
																					<option value="APEX">APEX</option>
																					<option value="ECMSExpress">ECMSExpress</option>
																					<option value="GOODTOLUCK">?????????</option>
																					<option value="DHLGER">DHL ??????</option>
																					<option value="ACI">ACI</option>
																					<option value="LOTTEGLOBAL">????????????(????????????)</option>
																					<option value="CJGLOBAL">CJ????????????(????????????)</option>
																					<option value="SUNGWON">???????????????</option>
																					<option value="DAEWOON">???????????????</option>
																					<option value="SLX">SLX??????</option>
																					<option value="HONAM">????????????</option>
																					<option value="GSIEXPRESS">GSI???????????????</option>
																					<option value="KGBPS">KGB ??????</option>
																					<option value="CUPARCEL">CU???????????????</option>
																					<option value="VROONG">??????</option>
																					<option value="todaypickup">????????? ??????</option>
																					<option value="CHAINLOGIS">???????????????</option>
																					<option value="HOMEPICK">????????????</option>
																					<option value="QXPRESS">??????????????????</option>
																					<option value="LINEEXP">?????????????????????</option>
																					<option value="GPSLOGIX">GPS LOGIX</option>
																					<option value="CRLX">???????????????</option>
																					<option value="BRIDGE">??????????????????</option>
																					<option value="EFS">EFS</option>
																					<option value="FRESH">??????????????????</option>
																					<option value="FRESHMATES">??????????????????</option>
																					<option value="GTSLOGIS">GTS?????????</option>
																					<option value="GENIEGO">?????????</option>
																					<option value="PINGPONG">??????</option>
																					<option value="ETC">????????????</option>
																				</select>
																			</div>
																			<div>
																				<c:choose>
																					<c:when test="${specList.SHIPPING_NUM ne null}">
																						<input type="text" placeholder="????????????" required class="form-control"
																							id="shippingNum" name="shippingNum"
																							value="${specList.SHIPPING_NUM}">
																					</c:when>
																					<c:otherwise>
																						<input type="text" placeholder="????????????" required  class="form-control"
																							id="shippingNum" name="shippingNum" value="">
																					</c:otherwise>
																				</c:choose>
																			</div>
																			<div>
																				<center><button
																						type="submit">??????/??????</button></center>
																			</div>

																		</form> <script type="text/javascript">
																(() =>{
																	Array.prototype.forEach.call(document.querySelector("#shippingCompany${specList.ORDER_NUM}").options, e =>{
																		if(e.value == "${specList.SHIPPING_COMPANY}") e.selected = true;
																	})
																})();
																</script>
																	</td>



																	<td rowspan="${orderList.CNT}">
																		<div class="mb-2">
																			<strong>${specList.USER_NAME}</strong>/<span>????????????</span>
																			<div class="mb-1"
																				style="font-size: 10pt; color: gray">
																				????????????????????????<br>
																				<div>????????????</div>
																			</div>
																		</div>
																	</td>
																	<td rowspan="${orderList.CNT}">
																		<div>
																			<div
																				style="display: table; width: 100%; margin-bottom: 7px;">
																				<div style="display: table-row-group;">
																					<div class='d-table-cell'>??? ????????????</div>
																					<div class='d-table-cell text-right'>${specList.PAYMENT_AMOUNT}???</div>
																				</div>
																			</div>
																			<div
																				style="display: table; width: 100%; color: gray;">
																				<div style="display: table-row-group;">
																					<div class='d-table-cell'>??????</div>
																					<div class='d-table-cell text-right'>${specList.PAYMENT_AMOUNT+specList.CP_SAVE_MONEY + specList.SAVE_MONEY}???</div>
																				</div>
																				<div style="display: table-row-group;">
																					<div class='d-table-cell'>?????? ????????????</div>
																					<div class='d-table-cell text-right'>${specList.CP_SAVE_MONEY + specList.SAVE_MONEY}???</div>
																				</div>
																			</div>
																			<div
																				style="display: table; width: 100%; color: gray;">
																				<div style="display: table-row-group;">
																					<div class='d-table-cell'>????????????</div>
																					<div class='d-table-cell text-right'>${specList.PAYMENT_METHOD}<br>????????????
																					</div>
																				</div>
																			</div>
																		</div>
																	</td>
																	<td rowspan="${orderList.CNT}"
																		class="nav-item text-center "><span> <c:if
																				test="${specList.STATE == 'newOrder'}">????????????</c:if>
																	</span> <c:if test="${specList.STATE != 'newOrder'}">
																			<select name="state" id="state"
																				onchange="changeState(${specList.ORDER_NUM}, this.value)">

																				<c:if test="${specList.STATE == 'delivering'}">
																					<option value="delivering" selected>?????????</option>
																					<option value="deliverComplete">????????????</option>
																				</c:if>
																				<c:if test="${specList.STATE == 'deliverComplete'}">
																					<option value="delivering">?????????</option>
																					<option value="deliverComplete" selected>????????????</option>
																				</c:if>
																				<c:if test="${specList.STATE == 'newRefund'}">
																					<option value="newRefund" selected>???????????????</option>
																					<option value="refundComplete">????????????</option>
																				</c:if>
																				<c:if test="${specList.STATE == 'refundComplete'}">
																					<option value="newRefund">???????????????</option>
																					<option value="refundComplete" selected>????????????</option>
																				</c:if>
																				<c:if test="${specList.STATE == 'newCancel'}">
																					<option value="newCancel" selected>???????????????</option>
																					<option value="cancelComplete">????????????</option>
																				</c:if>
																				<c:if test="${specList.STATE == 'cancelComplete'}">
																					<option value="newCancel">???????????????</option>
																					<option value="cancelComplete" selected>????????????</option>
																				</c:if>

																			</select>
																		</c:if></td>

																</tr>
															</c:when>
															<c:otherwise>
																<tr>

																	<td><a><img
																			src="${specList.downloadURL}"  style="width: 100px; height: 100px;"></a>
																		<div class="d-inline-block">
																			<div style="font-size: 10pt; color: gray;">${specList.ORDER_NUM}</div>
																			<div>
																				<a href="#">${specList.NAME}(${specList.PO_NAME})</a>
																			</div>
																		</div></td>
																	<td class="text-right  ">${specList.PRICE * specList.ORDER_CNT}</td>
																	<td class="text-center">${specList.ORDER_CNT}</td>


																</tr>
															</c:otherwise>
														</c:choose>

													</c:forEach>

												</c:otherwise>
											</c:choose>


										</c:forEach>
										
									</tbody>
								</table>
								<div class="border-top">
										<div class="card-body">
											
											<%@ include file="/WEB-INF/views/admin/include/paging.jsp"%>
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
	<script src="/resources/js/admin/common/paging.js"></script>
	<script src="/resources/js/admin/common/select-tab.js"></script>
	

	
	<script type="text/javascript">
		let changeState = (orderNum, state) =>{
 		
    	return fetch('/admin/shopping/update-order-state',{
 			method:"post",
 			body: JSON.stringify({orderNum : orderNum, state : state}),
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