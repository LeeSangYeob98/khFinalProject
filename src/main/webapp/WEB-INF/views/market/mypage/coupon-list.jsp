<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/market/mypage-head.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
</head>
<body onscroll="checkHeight()">
	<%@ include file="/WEB-INF/views/include/market/market-nav.jsp"%>

	<header class="py-2 px-lg-5" style="margin-top: 3.5rem; min-height: 28rem;">
		<div class="px-4 px-lg-5 my-5 mx-5">
			<div>
				<h1 class="display-7 fw-bolder">My Page</h1>
			</div>
		</div>
		<div class="px-lg-5 mx-5" style="display: flex; justify-content: space-between;">
			<div class="px-lg-5" style="display: flex; min-width: 50%;">
				<img src="https://dummyimage.com/200x200/dee2e6/6c757d.jpg" style="border-radius: 7rem;" />
				<div class="px-4 px-lg-5 my-3">
					<div>
						<div class="mt-4" style="display: flex; flex-direction: column;">
							<h1 class="display-4 fw-bolder">닉네임</h1>
							<div style="display: flex;">
								<h1 class="display-7 fw-bolder">회원등급</h1>
								<p class="px-lg-2 pt-1" style="color: lightgray;">가입일 : 2021.4.26</p>
							</div>
							<a class="fw-normal btn-" href="#!" style="text-decoration: none;">등급별 혜택 확인 <i class="fas fa-chevron-right"></i></a>
						</div>
					</div>
				</div>
			</div>
			<div class="px-lg-5 mt-5 mx-5 pt-2" style="display: flex; justify-content: space-between; min-width: 20%">
				<div class="mt-5" style="display: flex; flex-direction: column;">
					<i class="fas fa-coins py-2" style="font-size: 1.5rem;"></i>
					<p class="fw-normal mt-2">적립금</p>
					<p style="font-size: 1.3rem;">10,000</p>
				</div>
				<div class="mt-5" style="display: flex; flex-direction: column;">
					<i class="fas fa-ticket-alt py-2" style="font-size: 1.5rem"></i>
					<p class="fw-normal mt-2">쿠폰</p>
					<p style="font-size: 1.3rem;">3장</p>
				</div>
			</div>
		</div>
	</header>

	<section class="py-5 mb-5" style="display: flex; justify-content: space-between; min-height: 50rem;">
		<aside>
			<div class="px-lg-4 aside-nav">
				<ul class="aside-ul">
					<li class="ft-SBAggroM" style="font-size: 1.3rem;">나의 쇼핑 활동</li>
					<li><hr class="dropdown-divider" /></li>
					<li><a href="#!">주문 내역 조회</a></li>
					<li><a href="#!">구매후기</a></li>
					<li><a href="#!">장바구니</a></li>
					<li><a href="#!">상품문의</a></li>
					<li><a href="#!">주소록 관리</a></li>
				</ul>
			</div>
		</aside>
		<div class="container2" style="display: flex; flex-direction: column;">
			<p class="py-3 mb-0" style="font-size: 1.3rem;">쿠폰 <span style="color: steelblue;">3장</span></p>
			<table class="simple-table">
				<colgroup>
					<col style="width: 15%;">
					<col style="width: auto;">
					<col style="width: 10%;">
					<col style="width: 10%;">
					<col style="width: 10%;">
				</colgroup>
				<thead>
					<tr>
						<td>쿠폰번호</td>
						<td>쿠폰명</td>
						<td>할인율</td>
						<td>적용 범위</td>
						<td>유효 기간</td>
						<td>&nbsp;</td>
					</tr>
				</thead>
				
				<c:forEach var="couponList" items="${couponList}">
				<tbody>
				
					<tr>
						<td>${couponList.userCoupon.ucIdx} </td>
						<td class="cp-name">
						
						<c:set var="today" value="<%=new java.util.Date()%>" />
						<%-- <fmt:formatDate value="${today}" pattern="yyyy-MM-dd"/> --%>
						<fmt:parseDate var="expDate" value="${couponList.userCoupon.regDate}" pattern="yyyy-MM-dd"/>
						<fmt:parseNumber var="todayTime" value="${today.time / (1000*60*60*24)}" integerOnly="true"/>
						<fmt:parseNumber var="expDateTime" value="${expDate.time / (1000*60*60*24)}" integerOnly="true"/>
						
						<c:choose>
								<c:when test="${expDateTime - todayTime < 4}">
									<span>만료임박</span> 
								</c:when>
						</c:choose>	
						
							${couponList.name} 
						</td>
						<td class="cp-percent"><c:out value="${couponList.salePer}%"/></td>
						<td class="cp-range">일부 대상</td>
						<td>
							<ul>
								<li>${couponList.expDate}</li>
								<li style="color: gray;">${expDateTime - todayTime}일 남음</li>
							</ul>
						</td>
					</tr>
				
					<tr>
						<td>50676</td>
						<td class="cp-name"><span>만료임박</span> 쿠폰이름</td>
						<td class="cp-percent">10%</td>
						<td class="cp-range">일부 대상</td>
						<td>
							<ul>
								<li>21.11.15 ~ 21.11.20</li>
								<li style="color: gray;">15일 남음</li>
							</ul>
						</td>
					</tr>
					<tr>
						<td>50676</td>
						<td class="cp-name"><span>만료임박</span> 쿠폰이름</td>
						<td class="cp-percent">10%</td>
						<td class="cp-range">일부 대상</td>
						<td>
							<ul>
								<li>21.11.15 ~ 21.11.20</li>
								<li style="color: gray;">15일 남음</li>
							</ul>
						</td>
					</tr>
				</tbody>
				</c:forEach>
			</table>
		</div>
	</section>

	<%@ include file="/WEB-INF/views/include/market/footer.jsp"%>



</body>
</html>