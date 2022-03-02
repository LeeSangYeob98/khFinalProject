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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/board/board-detail.css">
</head>
<body>
<%@ include file="/WEB-INF/views/include/navBar.jsp" %>
	<div class="board_wrap">

		<br> <br>
		<div class="board_title">
			<strong>${title}게시판</strong>

		</div>
		<div class="row">
			<div class="col-md-12">
				<c:if test="${not empty authentication}">
					<c:if test="${authentication.userIdx == board.userIdx}">
						<a class="btn btn-danger float-end"
						onclick="deleteBoard(${board.bdIdx} ,${board.userIdx })">삭제</a> <a
						href="/board/${category}/modify?bdIdx=${board.bdIdx}"
						class="btn btn-warning float-end" style="margin-right: 4px;">수정</a>

					</c:if>
				</c:if>
				

			</div>
		</div>
		<div class="board_write_wrap">
			<div class="board_write">
				<div class="title">
					<dl>

						<dd style="font-size: 17pt">
							<strong>${board.bdTitle}</strong>
						</dd>
						<c:if test="${not empty authentication}">
							<c:if test="${authentication.userIdx == board.userIdx }">
								<a class="btn btn-default btn-hover-success active"
									style="float: right" onclick="recommendBoard(${board.bdIdx})">
									<i class="fa fa-thumbs-up mr-1"></i>${board.recCount}
								</a>
							</c:if>
						</c:if>
						<c:if test="${empty authentication}">
							<span class="btn btn-default btn-hover-success active"
								style="float: right"> <i class="fa fa-thumbs-up mr-1"></i>${board.recCount}
							</span>
						</c:if>
					</dl>
				</div>
				<div class="title"
					style="border-top: 2px solid #F0EAD5; height: 48px;">
					<dl>
						<dt>${board.nickname}</dt>
						<dd>
							<span>|</span>
							<span style="margin-left: 10px"><i
								class="fas fa-comment" style="margin-right: 5px"></i>${commentCnt}</span><span
								style="margin-left: 10px"><i class="fas fa-eye"
								style="margin-right: 5px"></i>${board.viewCount } </span> <span
								style="float: right;"> <i class="fas fa-clock"
								style="margin-right: 5px"></i> <fmt:formatDate
									pattern="yyyy-MM-dd hh:mm:ss" value="${board.regDate}" />
							</span>
						</dd>

					</dl>
				</div>
				<div class="info">
					<dl>
						<dt>파일</dt>
						<dd>
							<div style="display: flex">
								<c:forEach items="${files}" var="file">
									<img src="${file.downloadURL }"
										style="max-width: 360px; max-height: 273px">
								</c:forEach>

							</div>
					</dl>
				</div>
				<div class="cont">
					<textarea disabled>${board.content}
                         </textarea>
				</div>
			</div>

			<br>
			<div class="row">
				<div class="col-md-12 justify-content-center" style="display: flex;">
					<button class="btn btn-success"
						onclick="javascript:location.href='/board/${category}'">목록으로</button>
				</div>
			</div>

			<div class="bt_wrap">
				<input type="text" placeholder="댓글을 남겨주세요" name="cmContent" required
					id="cmContent mainComment" style="width: 85%; height: 50px; font-size: 16px;">
				<a class="on" onclick="insertComment(this,${board.bdIdx})">등록</a>
			</div>

			<div class="container bootdey" style="font-size: 1rem">
				<div class="col-md-12 bootstrap snippets">

					<div class="panel">
						<div class="panel-body">
							<!-- Newsfeed Content -->
							<!--===================================================-->
							<div class="media-block">
								<div class="media-body">
									<hr>
									<!-- Comments -->
									<div>
									<c:forEach items="${pcomment}" var="comment">
										<div class="media-block">
											<!-- 댓글 DIV -->
											<div class="media-body originInput${comment.cmIdx }">
												<div class="mar-btm">
													<span class="text-semibold text-success media-heading box-inline">
														${comment.nickname}
													</span>
													<!-- 로그인 여부 -->
													<c:if test="${not empty authentication}">
														<!-- 댓글 작성자 여부 -->
														<c:if test="${authentication.userIdx == comment.userIdx }">
															<div class="dropdown" style="display: inline-block; float: right;">
																<i class="fas fa-ellipsis-h dropdown-toggle" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false"> </i>
																<ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="dropdownMenuButton1">
																	<li><a class="dropdown-item" href="#" onclick="updateComment(${comment.cmIdx})">수정</a></li>
																	<li><a class="dropdown-item" onclick="deleteComment(${comment.cmIdx})">삭제</a></li>
																</ul>
															</div>
														</c:if>
													</c:if>

													<p>${comment.cmContent}</p>
													<div class="pad-ver">
														<span class="text-muted text-sm">
															<fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${comment.regDate}" />
														</span>
														<!-- 대댓글 달기 버튼 -->
														<c:if test="${not empty authentication}">
															<button type="button" class="newBtn" onclick="addCommentBtn(${comment.cmIdx})">댓글달기</button>
															<a class="btn btn-default btn-hover-success active" style="float: right" onclick="recommendComment(${comment.cmIdx})">
																<i class="fa fa-thumbs-up mr-1"></i>
																${comment.cmRecCount}
															</a>
														</c:if>
														
														<c:if test="${empty authentication}">
															<span class="btn btn-default btn-hover-success active" style="float: right">
																<i class="fa fa-thumbs-up mr-1"></i>
																${comment.cmRecCount}
															</span>
														</c:if>
													</div>
												</div>
											</div>
											<!-- 댓글 수정 DIV -->
											<div class="media-body hiddenInput${comment.cmIdx }" style="display: none">
												<div class="mar-btm">
													<span class="text-semibold">${authentication.nickName}</span>
													<a type="button" class="btn-close" aria-label="Close" 
														onclick="cancelUpdate(${comment.cmIdx})"></a>
												</div>
												<div class="bt_wrap mt-1">
													<input type="text" placeholder="댓글을 남겨주세요"
														name="cmContent" id="cmContent" required
														value="${comment.cmContent}"
														style="width: 85%; height: 50px; font-size: 16px;">
													<a class="on" 
														onclick="updateCommentBtn(this,${comment.cmIdx})">등록</a>
												</div>
											</div>
											
											<hr>
											<!-- 대댓글달기 DIV -->
											<c:if test="${not empty authentication}">
												<div id="input${comment.cmIdx}" style="display: none">
													<div class="media-block" style="position: relative;">
														<span style="position: absolute; top: 32px">ㄴ</span>
														<div class="media-body" style="padding: 30px;">
															<div class="mar-btm">
																<span class="text-semibold">${authentication.nickName}</span>
															</div>

															<div class="bt_wrap mt-1">
																<input type="text" placeholder="댓글을 남겨주세요"
																	name="cmContent" id="cmContent" required
																	style="width: 85%; height: 50px; font-size: 16px;">
																<a class="on"
																	onclick="insertReComment(this,${board.bdIdx},${comment.cmIdx})">등록</a>
															</div>
														</div>
													</div>
													<hr>
												</div>
											</c:if>
											
											<!-- 대댓글표시 DIV -->
											<c:forEach items="${chcomment}" var="chcomment">
												<c:if test="${chcomment.prIdx == comment.cmIdx}">
													<div class="media-block" style="position: relative;">
														<span style="position: absolute;">ㄴ</span>
														<div class="media-body originInput${chcomment.cmIdx }" style="padding: 0 30px;">
															<div class="mar-btm">
																<span class="text-semibold text-success media-heading box-inline">
																	${chcomment.nickname}</span>
																<c:if test="${not empty authentication}">
																	<c:if test="${authentication.userIdx == chcomment.userIdx }">
																		<div class="dropdown"
																			style="display: inline-block; float: right;">
																			<i class="fas fa-ellipsis-h dropdown-toggle"
																				id="dropdownMenuButton1" data-bs-toggle="dropdown"
																				aria-expanded="false"> </i>
																			<ul class="dropdown-menu dropdown-menu-dark"
																				aria-labelledby="dropdownMenuButton1">
																				<li><a class="dropdown-item" href="#"
																					onclick="updateCommentBtn(${chcomment.cmIdx})">
																					수정</a></li>
																				<li><a class="dropdown-item" 
																					onclick="deleteComment(${chcomment.cmIdx})">
																					삭제</a></li>
																			</ul>
																		</div>
																	</c:if>
																</c:if>
															</div>
															<p>${chcomment.cmContent}</p>
															<div class="pad-ver">
																<span class="text-muted text-sm"><fmt:formatDate
																		pattern="yyyy-MM-dd hh:mm:ss"
																		value="${chcomment.regDate}" /></span>
																<!-- 대댓글 추천 -->
																<c:if test="${not empty authentication}">
																	<a class="btn btn-default btn-hover-success active"
																		style="float: right"
																		onclick="recommendComment(${chcomment.cmIdx})"> <i
																		class="fa fa-thumbs-up mr-1"></i>${chcomment.cmRecCount}
																	</a>
																</c:if>
																<c:if test="${empty authentication}">
																	<span
																		class="btn btn-default btn-hover-success active"
																		style="float: right"> <i
																		class="fa fa-thumbs-up mr-1"></i>${chcomment.cmRecCount}
																	</span>
																</c:if>
															</div>
														</div>
														<!-- 대댓글 수정/취소 -->
														<div class="media-body hiddenInput${chcomment.cmIdx }"
															style="display: none;padding: 30px;">

															<div class="mar-btm">
																<span class="text-semibold">${authentication.nickName}</span>
																<a type="button" class="btn-close" aria-label="Close"
																	onclick="cancelUpdate(${chcomment.cmIdx})"></a>
															</div>

															<div class="bt_wrap mt-1">
																<input type="text" placeholder="댓글을 남겨주세요"
																	name="cmContent" id="cmContent" required
																	value="${chcomment.cmContent}"
																	style="width: 85%; height: 50px; font-size: 16px;">
																<a class="on"
																	onclick="updateComment(this,${chcomment.cmIdx})">등록</a>
															</div>
														</div>
													</div>
													<hr>

												</c:if>
											</c:forEach>
										</div>
									</c:forEach>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous">
	</script>
		
	<script type="text/javascript">
		let insertComment = (obj, bdIdx) =>{
	 		<c:if test="${empty authentication}">
		 		alert("로그인이 필요합니다.")
		 		obj.preventDefault();
	 			return;
	 		</c:if>
			
			var comment = obj.previousElementSibling.value;
			comment.trim();
			
			if(comment == ''){
				alert("게시글을 작성해주세요.")
				return;
			}
			
			return fetch('/board/comment-form',{
				method:"post",
				body: JSON.stringify({cmContent : comment, bdIdx : bdIdx}),
				 headers:{
				    'Content-Type': 'application/json'
				  }
		  	}).then(res => {
		  		alert('댓글 등록이 완료되었습니다.');
		  		location.reload();
		  	})
		}
		 
		 let recommendBoard = (bdIdx) =>{
		 		
		    	return fetch('/board/recommend-board',{
		 			method:"post",
		 			body: JSON.stringify({bdIdx : bdIdx}),
		 			 headers:{
		 			    'Content-Type': 'application/json'
		 			  }
		    	}).then(response => {
		    		return response.text();
		    		
		    	}).then(res =>{
		    		console.dir(res)
		    		if(res == 'good'){
		    			alert('추천이 완료되었습니다.');
		    		}else if(res == 'bad'){
		    			alert('이미 추천한 댓글 입니다.')	
		    		}else{
		    			alert('로그인을 하셔야 추천기능이 작동합니다.')	
		    		}
		    		
		    		location.reload();
		    	})
		 	}
		 
		 let recommendComment = (cmIdx) =>{
		 		
		    	return fetch('/board/recommend-comment',{
		 			method:"post",
		 			body: JSON.stringify({cmIdx : cmIdx}),
		 			 headers:{
		 			    'Content-Type': 'application/json'
		 			  }
		    	}).then(response => {
		    		return response.text();
		    		
		    	}).then(res =>{
		    		console.dir(res)
		    		if(res == 'good'){
		    			alert('추천이 완료되었습니다.');
		    		}else if(res == 'bad'){
		    			alert('이미 추천한 댓글 입니다.')	
		    		}else{
		    			alert('로그인을 하셔야 추천기능이 작동합니다.')	
		    		}
		    		
		    		location.reload();
		    	})
		 	}
		 
		 let addCommentBtn = (idx) =>{
			 var temp = document.querySelector('#input'+idx);
			 
			 if(temp.style.display == "none"){
				 temp.style.display = ""
			 }else{
				 temp.style.display = "none"
			 }
		 }
		 
		 let updateCommentBtn = (idx) =>{
			document.querySelector('.originInput'+idx).style.display = "none"
			document.querySelector('.hiddenInput'+idx).style.display = ""
		 }
		 
		 let cancelUpdate = (idx) =>{
			document.querySelector('.originInput'+idx).style.display = ""
			document.querySelector('.hiddenInput'+idx).style.display = "none"
		 }
		 
		 let insertReComment = (obj, bdIdx, cmIdx) =>{
		    	return fetch('/board/comment-form',{
		 			method:"post",
		 			body: JSON.stringify({cmContent : obj.previousElementSibling.value, bdIdx : bdIdx, cmIdx : cmIdx, cmType: 1}),
		 			 headers:{
		 			    'Content-Type': 'application/json'
		 			  }
		    	}).then(res => {
		    		alert('댓글 등록이 완료되었습니다.');
		    		location.reload();
		    	})
		 	}
		 
		 let updateComment = (obj,cmIdx) =>{
		    	return fetch('/board/update-comment',{
		 			method:"post",
		 			body: JSON.stringify({cmContent : obj.previousElementSibling.value, cmIdx : cmIdx}),
		 			 headers:{
		 			    'Content-Type': 'application/json'
		 			  }
		    	}).then(res => {
		    		alert('댓글 수정이 완료되었습니다.');
		    		location.reload();
		    	})
		    		
		 	
		 	}
		 
		 let deleteBoard = (bdIdx, userIdx) =>{
			 let flg = confirm("정말 삭제하시겠습니까?")
			 if(flg){
			 return fetch('/board/delete-board',{
		 			method:"post",
		 			body: JSON.stringify({bdIdx : bdIdx, userIdx : userIdx}),
		 			 headers:{
		 			    'Content-Type': 'application/json'
		 			  }
			 }).then(res => {
		    		alert('삭제되었습니다');
		    		location.replace('/board/${board.category}');
		    	})
		    }
		    		
		 	
		 }
		 
		 let deleteComment = (cmIdx) =>{
			 let flg = confirm("정말 삭제하시겠습니까?")
			 if(flg){
			 return fetch('/board/delete-comment',{
		 			method:"post",
		 			body: JSON.stringify({cmIdx : cmIdx}),
		 			 headers:{
		 			    'Content-Type': 'application/json'
		 			  }
			 }).then(res => {
		    		alert('삭제되었습니다.');
		    		location.replace('/board/${board.category}/detail?bdIdx=${board.bdIdx}');
		    	})
		    }
		    		
		 	
		 }
	</script>
</body>
</html>