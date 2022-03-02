var code = "";

$("#mail_auth_bnt").click(function(){
	var email = $("#email").val();
	var checkBox = $("#email_ck");  
	var boxWrap = $(".mail_auth_ck");
	
	$.ajax({
	         
	        type:"GET",
	        url:"mailCheck?email=" + email,
	        success:function(data){
	           
	        	//console.log("data : " + data);	//이거 확인 후에 안지우면 오류남..!
	        	checkBox.attr("disabled",false);
	        	boxWrap.attr("id", "mail_auth_input true");
	        	code = data;
	        	
	        	
	        }
	                
	    });
    alert('메일을 발송하였습니다.');
});


$("#email_ck").keyup(function(){
	var inputCode = $("#email_ck").val();        // 입력코드    
    var checkResult = $("#mail_auth_check_warn");    // 비교 결과 
    
    if(inputCode == code){                            // 일치할 경우
        checkResult.html("인증번호가 일치합니다.");
        checkResult.attr("class", "correct");   
        $('#joinBtn').removeAttr("disabled");         
    } else {                                            // 일치하지 않을 경우
        checkResult.html("인증번호를 다시 확인해주세요.");
        checkResult.attr("class", "incorrect");
        $('#joinBtn').attr("disabled","disabled"); 
    }    
    
});
