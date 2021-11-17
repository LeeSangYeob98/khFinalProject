<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="file:///C:/CODE/F_SPRING/spring06_toyProject/src/main/webapp/resources/css/reset.css">
<link rel="stylesheet" href="file:///C:/CODE/F_SPRING/spring06_toyProject/src/main/webapp/resources/css/all.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<header class="d-flex justify-content-center py-3"style="min-width: 500px;">
			<ul class="nav nav-pills">
				<li class="nav-item"><a href="/mypage/my-info" class="nav-link">회원정보</a></li>
				<li class="nav-item"><a href="/mypage/pet-info" class="nav-link">마이펫</a></li>
				<li class="nav-item"><a href="/mypage/vaccination" class="nav-link">예방접종</a></li>
				<li class="nav-item"><a href="/mypage/managing-board" class="nav-link">작성글</a></li>
			</ul>
		</header>
		<h4 class="mb-3">마이페이지</h4>
	</div>
	
	<div class="container" style="display: flex;">
		<div class="d-flex flex-column flex-shrink-0 p-3 bg-light" style="width: 280px;">
		    <span class="fs-4">회원정보</span>
		    <hr>
		    <ul class="nav nav-pills flex-column mb-auto">
		      <li class="nav-item">
		        <a href="/mypage/my-info" class="nav-link link-dark">
		          <svg class="bi me-2" width="16" height="16"><use xlink:href="#"></use></svg>
		          회원정보 보기
		        </a>
		      </li>
		      <li>
		        <a href="/mypage/modify-info" class="nav-link active">
		          <svg class="bi me-2" width="16" height="16"><use xlink:href="#"></use></svg>
		          회원정보 수정
		        </a>
		      </li>
		    </ul>
		</div>
		
		<form class="needs-validation" novalidate="" style="margin: 0 auto; width: 400px;">
			<div class="form-floating mb-3">
				<input type="password" class="form-control" id="password" placeholder="1" value="">
				<label for="password" class="form-label">비밀번호</label>
				<div class="invalid-feedback">비밀번호 양식에 맞게 입력해주세요</div>
			</div>

			<div class="form-floating mb-3">
				<input type="password" class="form-control" id="password2" placeholder="1" value="">
				<label for="password2" class="form-label">비밀번호 확인</label>
				<div class="invalid-feedback">비밀번호가 맞지 않습니다</div>
			</div>

			<div class="form-floating mb-3">
				<input type="text" class="form-control" id="nickname" placeholder="1" value="">
				<label for="nickname" class="form-label">닉네임</label>
			</div>

			<div class="form-floating mb-3">
				<input type="text" class="form-control" id="address" placeholder="1" value="">
				<label for="address" class="form-label">주소</label>
			</div>
			
			<div class="form-floating mb-3">
				<textarea class="form-control" id="info" placeholder="1"></textarea>
				<label for="detail" class="form-label">자기소개</label>
			</div>
			
			<div class="mb-3">
			  <label for="formFile" class="form-label">프로필 사진</label>
			  <input class="form-control" type="file" id="formFile">
			</div>
			
			<hr class="my-3">
			
			<button class="w-100 btn btn-primary btn-lg" type="submit">회원정보 수정</button>
		</form>
	</div>
	
	<aside class="fixed-up-btn btn badge-rank" id="up_btn" type="button" onclick="window.scrollTo(0,0)" style="float: right;">
        <i class="fas fa-arrow-alt-circle-up"></i>
    </aside>

	<script type="text/javascript" src="file:///C:/CODE/F_SPRING/spring06_toyProject/src/main/webapp/resources/js/webUtil.js"></script>
	<script type="text/javascript" src="file:///C:/CODE/F_SPRING/spring06_toyProject/src/main/webapp/resources/js/urlEncoder.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>