Kakao.init('56c76e35398250abedfccf8bf8f759ec');
function kakaoLogin() {
    Kakao.Auth.loginForm({
             success : function(authObj) {
                Kakao.Auth.login({
                         scope : 'account_email',
                         success : function(e) {
                            //console.dir(e)
                            Kakao.API.request({
                                     url : '/v2/user/me',
                                     success : function(res) {
										fetch('/member/kakaoLogin?userId='  + res.id)
										.then(response => {
											if(response.ok){
												/*console.dir(response.status);
												console.dir('통신성공' + res.id);
												console.dir(response.text()); 
												전체 코드를 읽는중에 여기 주석 풀면 오류남!*/
												return response.text();

											}else{
												throw new Error(response.status);
											}
											
										}).then(text => {
											// 회원
											if(text == 'kakaoLogin'){
												console.dir('로그인성공');
												location.href = '/';
											// 비회원
											}else if(text == 'kakaoJoin'){	
												console.dir('가입하러가기');					
												location.href = '/member/kakaoJoin?userId='+res.id;		
											}
										}).catch(error => {
											alert(error + '응답에 실패하였습니다.');
										})
	                                        
                                     },fail : function(error) {
                                        alert('login success, but failed to request user information: '
                                              + JSON.stringify(error))
                                     }
                                  })
                         },fail : function(error) {
                            console.dir(error)
                         }
                      })
             },fail : function(err) {
                showResult(JSON.stringify(err))
             }
          })
 }








/*Kakao.init('56c76e35398250abedfccf8bf8f759ec');
function kakaoLogin() {
    Kakao.Auth.login({
             scope : 'account_email',
             success : function(authobj) {
              console.dir(authobj);
              Kakao.API.request({
                url : '/v2/user/me',
                success: res =>{
					const kakao_account = res.kakao_account;
					console.log(kakao_account);
										
             },
          })
 		}
 	})
 }*/