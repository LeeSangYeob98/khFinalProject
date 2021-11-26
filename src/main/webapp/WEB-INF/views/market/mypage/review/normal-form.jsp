<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/market/mypage-head.jsp"%>

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
							<h1 class="display-4 fw-bolder">${memberInfo.nickName}</h1>
							<div style="display: flex;">
								<p class="px-lg-2 pt-1" style="color: lightgray;">가입일 : ${memberInfo.joinDate}</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="px-lg-5 mt-5 mx-5 pt-2" style="display: flex; justify-content: space-between; min-width: 20%">
				<div class="mt-5" style="display: flex; flex-direction: column;">
					<i class="fas fa-coins py-2" style="font-size: 1.5rem;"></i>
					<p class="fw-normal mt-2">적립금</p>
					<p style="font-size: 1.3rem;">${memberInfo.saveMoney}</p>
				</div>
				<div class="mt-5" style="display: flex; flex-direction: column;">
					<i class="fas fa-ticket-alt py-2" style="font-size: 1.5rem"></i>
					<p class="fw-normal mt-2">쿠폰</p>
					<p style="font-size: 1.3rem;">${couponCnt}장</p>
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
					<li><a href="#!" style="color: black">구매후기</a></li>
					<li><a href="#!">장바구니</a></li>
					<li><a href="#!">상품문의</a></li>
					<li><a href="#!">주소록 관리</a></li>
				</ul>
			</div>
		</aside>
		<div class="container2" style="display: flex; flex-direction: column;">
			<p class="py-3 mb-0" style="font-size: 1.3rem;">일반 후기 작성</p>
			<hr class="mt-0" style="height: 3px; opacity: 1;">
			<ul>
				<li>일반 후기 작성시 300원의 적립금을 평일 기준 2일 전후로 지급합니다.</li>
				<li>후기 내용은 20자 이상 작성합니다. 상품과 관련 없는 내용, 단순 문자 및 기호의 나열/반복 확인 시 적립금 회수 및 지급 혜택이 제한됩니다.</li>
				<li>이메일, 휴대전화 번호 등 개인정보/광고/비속어가 포함된 후기는 블라인드 처리 및 계정 제재의 사유가 됩니다.</li>
				<li>등록하신 후기는 공개되어 회원이 조회 가능하며, 댓글이 등록될 수 있습니다.</li>
				<li>작성된 후기는 사이트의 홍보 콘텐츠로 사용될 수 있습니다.</li>
			</ul>
			<c:forEach var="reviewDetail" items="${reviewDetail}">
			<div class="d-flex n-prd-row">
				<a href="#!"><img src="https://dummyimage.com/100x120/dee2e6/6c757d.jpg"></a>
				<ul class="info p-4">
					<li class="brand">${reviewDetail.BRAND}</li>
					<li class="name ft-SBAggroM"><a href="#!" style="text-decoration: none; color: black;">${reviewDetail.NAME}</a></li>
					<li class="option">${reviewDetail.PO_NAME}</li>
				</ul>
			</div>
			<form action="/market/mypage/review/upload/${reviewDetail.ORDER_IDX}" method="post"
				 onsubmit="return minLengthCheck(this);" >
				<div class="d-flex pt-2">
					<p class="label"> 
						제품에 대해 나의 별점은 ?<br>
						<span style="font-size: 12px;">(선택하지 않을 시 별 5개로 선택됩니다.)</span>
					</p>
					<div class="star-rating">
					  <input type="radio" id="5-stars" name="rating" value="5" />
					  <label for="5-stars" class="star">&#9733;</label>
					  <input type="radio" id="4-stars" name="rating" value="4" />
					  <label for="4-stars" class="star">&#9733;</label>
					  <input type="radio" id="3-stars" name="rating" value="3" />
					  <label for="3-stars" class="star">&#9733;</label>
					  <input type="radio" id="2-stars" name="rating" value="2" />
					  <label for="2-stars" class="star">&#9733;</label>
					  <input type="radio" id="1-star" name="rating" value="1" />
					  <label for="1-star" class="star">&#9733;</label>
					</div>					
				</div>
				
				<hr>
				<p>상품에 대한 평가를 20자 이상 남겨주세요.</p>
				<div>
					<textarea class="review_text" placeholder="내용을 입력해주세요." 
						id="inputContent" name="rvContent" required="required" ></textarea>
					<p class="limit_text_alert" id="cntLength">(20자 / 0자) </p>
					<span id="contentCheck" class="valid-msg"></span>
				</div>
				
				<div>
					<input type="checkbox" name="ad-check" id="ad_agree">
					<label class="ad_check_label px-1" for="ad_agree">작성된 후기는 사이트의 홍보 콘텐츠로 사용될 수 있습니다. (필수)</label>
				</div>
				<div class="d-flex py-3" style="justify-content: center;">
					<button type="submit" class="py-2 px-lg-5 btn btn-outline-dark" style="font-size: 14px;">등록</button>
				</div>
			</form>
			</c:forEach>
		</div>
	</section>
	
	<%@ include file="/WEB-INF/views/include/market/footer.jsp"%>
	
<script>

	//글자 수 200자 제한
	$("#inputContent").keyup(function (e){
	  
		var content = $(this).val();
		
		//실시간 글자수 세기
		$("#cntLength").html("(20자 / " + content.length +"자)"); 
		
		if(content.length > 200){
			alert("최대 200자까지 입력 가능합니다.");
			$(this).val(content.substring(0, 200));
			$('#cntLength').html("(200 / 최대 200자)");
		}
	});
		
	function minLengthCheck(i) {
		
	    var content = document.getElementById("inputContent");
	    if(content.value.length < 20) {
	    	content.value =  content.value.substr(0, 20);
	        document.querySelector('#contentCheck').innerHTML = '최소 20자 이상을 입력해야 합니다.';
	        return false;
	    }
	    
	    //체크박스 유효성 검사
	    var check = $("input:checkbox[name='ad-check']:checked");
	    if(check.length == 0){
			alert("필수 체크 요소를 확인해주세요.");
		     return false;
		  }
	}

</script>





</body>
</html>