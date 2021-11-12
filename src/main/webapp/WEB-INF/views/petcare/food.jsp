<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<link rel="stylesheet" href="/resources/css/petcare/food.css">
</head>
<body>

<section>
		<div class="petcare-back">
				<h2> 고양이 금지음식 </h2>
				<div class="search">
						<div class="search-inner">
							<div class="search-input"><input type="text" name ="searchFood" value="${searchContent }" ></div>
							<div class="search-button"><button><i class="fas fa-search"></i></button></div>
						</div>
				</div>
					
				<div class="petcare-wrap">
						<ul class="petcare-tab-wrap">
							<li><a class="selected" href="/petcare/food">과일/야채</a></li>
							<li><a href="/petcare/food">육류/해산물</a></li>
							<li><a href="/petcare/food">유제품</a></li>
							<li><a href="/petcare/food">기타</a></li>
						</ul>
					
					<div class="petcare-con">
					<%-- <%@ include file="/WEB-INF/views/petcare/petcare_tab.jsp" %> --%>
					
					

					</div>
				</div>
					
				
		</div>
	</section>

<script type="text/javascript">
	let tabBtns = document.querySelector('.petcare-tab-wrap').children;
	for (var i = 0; i < tabBtns.length; i++) {
		let tabBtn = tabBtns[i].children[0];
		tabBtn.classList.remove('selected');
		if(tabBtn.href==document.location.href.split('?')[0]){
			tabBtn.classList.add('selected');
		}
	}
</script>
</body>
</html>