<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<%@ include file="/WEB-INF/views/include/navBar.jsp" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" 
	rel="stylesheet" 
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" 
	crossorigin="anonymous">
<link href="/resources/css/styles.css" rel="stylesheet">
<link href="/resources/css/mypage/font.css" rel="stylesheet">
<link href="/resources/css/mypage/mypage.css" rel="stylesheet">
</head>
<body>

<section>

	<div class="container" style="display: flex;">
		<nav class="d-flex flex-column flex-shrink-0 p-3" style="width: 280px;">
			<span class="fs-4"><a href="/mypage/my-info" class="nav-link">회원정보</a></li></span>
			<span class="fs-4"><a href="/mypage/pet-info" class="nav-link">마이펫</a></li></span>
			<span class="fs-4"><a href="/mypage/vaccination" class="nav-link">예방접종</a></li></span>
			<span class="fs-4"><a href="/mypage/managing-board" class="nav-link">작성글</a></li></span>
			<hr>
			<ul class="nav nav-pills flex-column mb-auto">
				<li><a href="/mypage/managing-board" class="nav-link">게시글</a></li>
				<li><a href="/mypage/managing-board-comment" class="nav-link">댓글</a></li>
			</ul>
		</nav>
		
		<div style="margin: 0 auto; width: 800px">
			<div>
				<table class="table table-hover" style="text-align: center;">
				  <thead>
				    <tr>
				      <th style="width: 5%"><input type="checkbox" id="chk_all"></th>
				      <th scope="col" style="width: 10%">글번호</th>
				      <th scope="col" style="width: 50%">제목</th>
				      <th scope="col" style="width: 10%">조회수</th>
				      <th scope="col" style="width: 10%">추천수</th>
				      <th scope="col" style="width: 20%">작성일</th>
				    </tr>
				  </thead>
				  <tbody>
					  <!-- 게시글 출력영역 -->
					  <c:forEach var="board" items="${boardList}">
						  <tr>
						  	<td><input type="checkbox" name="bdIdx" id="bdIdx" class="listCheckbox" value="${board.bdIdx}"></td>
					  		<td>${board.bdIdx}</td>
					  		<td><a href="/board/${board.category}/detail?bdIdx=${board.bdIdx}">${board.bdTitle}</a></td>
					  		<td>${board.viewCount}</td>
					  		<td>${board.recCount}</td>
					  		<td>${board.regDate}</td>
						  </tr>
					  </c:forEach>
					  
					  <!-- 데이터 없을 때 -->
					  <c:if test="${pageUtil.total == 0}">
						<tr>
							<td colspan="6">작성된 글이 없습니다.</td>
						</tr>
					  </c:if>
				  </tbody>
				</table>
				
				<c:if test="${pageUtil.total != 0}">
				<button type="button" class="btn btn-primary" onclick="deleteBoard()">삭제</button>
				</c:if>
			</div>
			
			<!-- 페이징기능 -->
			<c:if test="${pageUtil.total != 0}">
			<div style="display:flex; justify-content:center;">
				<nav aria-label="Page navigation example">
				  <ul class="pagination">
				    <li class="page-item">
				      <a class="page-link" aria-label="Previous" onclick="prevBtn(${pageUtil.curPage})">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				    </li>
				    <!-- 총 페이지 블록이 1일 때 -->
				    <c:if test="${pageUtil.blockEnd eq 1}">
				    	<li class="page-item">
				    		<a class="page-link" href="#">1</a>
				    	</li>
				    </c:if>
				    
				    <c:if test="${pageUtil.blockEnd > 1}">
				    	<c:forEach var="i" begin="1" step="1" end="${pageUtil.blockEnd}">
				    		<li class="page-item">
				    			<a class="page-link" onclick="pageBtn(this.text)">
				    				<c:out value="${i}"/>
				    			</a>
				    		</li>
				    	</c:forEach>
				    </c:if>
				    
				    <li class="page-item">
				      <a class="page-link" aria-label="Next" onclick="nextBtn(${pageUtil.curPage}, ${pageUtil.blockEnd})">
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				    </li>
				  </ul>
				</nav>
			</div>
			
			<!-- 검색 기능 -->
			<form>
				<div style="display:flex; justify-content:center;">
					<input name="keyword" id="keyword" value="${searchSet.keyword}" 
						style="width: 300px;" type="search" class="form-control" 
						placeholder="Search..." aria-label="Search" required="required">
					<button type="button" class="btn btn-primary" onclick="searchKeyword()">검색</button>
				</div>
			</form>
			</c:if>
		</div>
	</div>
</section>

<aside class="fixed-up-btn btn badge-rank" id="up_btn" type="button" onclick="window.scrollTo(0,0)" style="float: right;">
	<i class="fas fa-arrow-alt-circle-up"></i>
</aside>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>
<%@ include file="/WEB-INF/views/include/mainJs.jsp"%>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<script type="text/javascript">
	/* 검색기능 */
	const URLSearch = new URLSearchParams(location.search);
	/* 페이징 기능 */
	let prevBtn = (curPage) => {
		if(curPage == 1){
			alert("첫번째 페이지 입니다.")
			return;
		}
		
		let prevPage = curPage - 1;
		pageBtn(prevPage);
	}
	
	let nextBtn = (curPage, blockEnd) => {
		if(curPage == blockEnd){
			alert("마지막 페이지 입니다.")
			return;
		}
		
		let nextPage = curPage + 1;
		pageBtn(nextPage);
	}
	
	let pageBtn = (page) => {
		 URLSearch.set("page", String(page));
     	 const newParam = URLSearch.toString();
     	 location.href = location.pathname + '?' + newParam
	}
	
	
	let searchKeyword = () =>{
    	var keyword = document.querySelector("#keyword").value
    	if(keyword == ''){
    		alert("검색어를 입력해주세요.")
    		return
    	}
  		 URLSearch.set("keyword", String(keyword));
     	 const newParam = URLSearch.toString();
     	 location.href = location.pathname + '?' + newParam
    }
	
	let deleteBoard = () =>{
		 let flg = confirm("정말 삭제하시겠습니까?")
		 if(flg){
			let bdIdxArr = [];
			
			document.querySelectorAll("#bdIdx").forEach(e =>{
				if(e.checked) bdIdxArr.push(e.value);
			});
			
		 return fetch('/mypage/delete-board',{
	 			method:"post",
	 			body: JSON.stringify(bdIdxArr),
				headers:{
					'Content-Type': 'application/json'
					}
		 }).then(res => {
			 alert('삭제되었습니다.');
			 location.replace('/mypage/managing-board');
			 })
		}
	}
	
	/* checkbox 일괄선택 함수 */
	(() =>{
		var total = document.querySelectorAll(".listCheckbox").length;
		var checked = 0;
		
		document.querySelector("#chk_all").addEventListener("click" , e =>{
			if(e.target.checked){
				checked = total;
				document.querySelectorAll(".listCheckbox").forEach(t =>{
					t.checked = true;
				})
			}else{
				checked = 0;
				document.querySelectorAll(".listCheckbox").forEach(t =>{
					t.checked = false;
				})
			}
		})
		
		document.querySelectorAll(".listCheckbox").forEach(e =>{
			e.addEventListener("click", t=>{
				if(e.checked) checked++; else checked--;
				
				if(checked != total) document.querySelector("#chk_all").checked= false;
				else document.querySelector("#chk_all").checked= true;
			})
		})
	})();
</script>



</body>
</html>