<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"></script>
<link rel="stylesheet" href="/resources/css/board/board-list.css">
</head>
<body>
<%@ include file="/WEB-INF/views/include/navBar.jsp" %>


	<div class="board_list_wrap" style="padding-top:160px; width:60%; margin-left:20%">
		<div class="paging">
			<a href="/board/info" class="bt">정보게시판</a>
			<a href="/board/dog" class="bt">강아지</a> 
			<a href="/board/cat" class="bt">고양이</a>
			<a href="/board/review" class="bt">후기</a> 
			<a href="/board/meet" class="bt">모임게시판</a> 
			<a href="/board/consulting" class="bt">상담게시판</a>
		</div>
		<br><br>
		<span style="float:right">
			<select name="category" id="sortSelect" onchange="sortList()">
		        <option value="reg_date">등록일순</option>
		        <option value="view_count">조회순</option>
		        <option value="rec_count">추천순</option>
		    </select>
	    </span>
		<table class="board_list">
			<caption>게시판 목록</caption>
			
			<thead style="text-align:center;">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>글쓴이</th>
					<th>작성일</th>
					<th>추천수</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${bList}" var="bList" varStatus="status">
					<tr>
						<td>${totalCnt-bList.RNUM}</td>
						<td class="tit">
							<a href="/board/${dataMap.category}/detail?bdIdx=${bList.BD_IDX}">
								${bList.BD_TITLE}
							</a>
							<span style="margin-left: 5px">
								<i class="fas fa-comment" style="margin-right: 5px"></i>
							</span>
							${bList.CM_CNT}
						</td>
						<td>${bList.NICKNAME}</td>
						<td><fmt:formatDate value="${bList.REG_DATE}" pattern="yyyy-MM-dd" /></td>
						<td>${bList.REC_COUNT}</td>
						<td>${bList.VIEW_COUNT}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<br>
		
		<c:if test="${not empty authentication}">
			<div style="float: right;" class="btn">
				<button onclick="javascript:location.href='/board/${dataMap.category}/form'">글쓰기</button>
			</div>
		</c:if>
		
		<br>
		
		<div class="paging">
			<a class="bt" onclick="changePage(1)">첫 페이지</a>
			
			<a onclick="prevBtn(${pageUtil.curPage})" class="bt">이전 페이지</a>
			
			<c:if test="${pageUtil.blockEnd eq 1}">
				<a href="#" class="num on">1</a>
			</c:if>
			
			<c:if test="${pageUtil.blockEnd > 1}">
				<c:forEach var="i" begin="1" step="1" end="${pageUtil.blockEnd}">
					<a onclick="changePage(${i})" class="num">${i}</a>
				</c:forEach>
			</c:if>
			
			<a onclick="nextBtn( ${pageUtil.curPage}, ${pageUtil.blockEnd} )" class="bt">다음 페이지</a>
			 
			<a onclick="changePage(${pageUtil.blockEnd})" class="bt">마지막 페이지</a>
		</div>
		<br>
	
		<div class="seach">
			<select id="search_option">
				<option value="nickname">작성자</option>
				<option value="content">게시글</option>
				<option value="bd_title">제목</option>
			</select>
			<input type="text" class="inp" value="${dataMap.keyword}">
			<button type="button" onclick="searchKeyword()">조회하기</button>
		</div>

	</div>
	
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>	
	<%@ include file="/WEB-INF/views/include/mainJs.jsp" %>
	
	<script type="text/javascript">
		(() =>{
			Array.prototype.forEach.call(document.querySelector("#search_option").options, e =>{
				if(e.value == "${dataMap.option}") e.selected = true;
			})
			Array.prototype.forEach.call(document.querySelector("#sortSelect").options, e =>{
				if(e.value == "${dataMap.sort}") e.selected = true;
			})
		})();

        const params = new URLSearchParams(location.search);
        
        let sortList = () =>{
        	var sortSelect = document.getElementById("sortSelect");  
        	var selectValue = sortSelect.options[sortSelect.selectedIndex].value; 
     		 params.set('sort', String(selectValue));
     		 params.set('page', String("1"));
        	 const newParam = params.toString();
        	 //location.href = location.pathname + '?' + newParam
        	 location.href = '?' + newParam;
   		}
        
        let searchKeyword = () =>{
        	var option = document.querySelector("#search_option").selectedOptions[0].value
        	var keyword = document.querySelector(".inp").value
        	if(keyword == ''){
        		alert("검색어를 입력해주세요.")
        		return
        	}
        	 params.set("option", String(option));
      		 params.set("keyword", String(keyword));
         	 const newParam = params.toString();
         	 location.href = location.pathname + '?' + newParam
      	
        }
        
       	let prevBtn = (page) => {
    		if(page == 1){
    			alert("첫번째 페이지 입니다.")
    			return;
    		}
    		
    		page--;
    		changePage(page);
    	}
    	
    	let nextBtn = (page, blockEnd) => {
    		if(page == blockEnd){
    			alert("마지막 페이지 입니다.")
    			return;
    		}
    		
    		page++;
    		changePage(page);
    	}
    	
        let changePage = (page) =>{
       		 params.set('page', String(page));
           	 const newParam = params.toString();
           	 location.href = location.pathname + '?' + newParam
        }
        
	</script>
</body>

        
</html>