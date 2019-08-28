<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link type="text/css" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,800italic,400,700,800">
    <link type="text/css" rel="stylesheet" href="http://fonts.googleapis.com/css?family=Oswald:400,700,300">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/styles/font-awesome.min.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/styles/bootstrap.min.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/styles/animate.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/styles/all.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/styles/main.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/styles/style-responsive.css">
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
    	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jsbn.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/rsa.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/prng4.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/rng.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script>
    <script type="text/javascript">
    	$(function(){
    		$('#btn-login').click(function(){
    			var mem_id = $('#mem_id').val();
    			var mem_pass = $('#mem_pass').val();
    			
    			// 암호화
    			var modulus = '${publicKeyMap["publicModulus"]}';
    			var exponent = '${publicKeyMap["publicExponent"]}';
    			var rsaObject = new RSAKey();
    			rsaObject.setPublic(modulus, exponent);
    			
    			// 암호화적용
    			mem_id = rsaObject.encrypt(mem_id);
        		mem_pass = rsaObject.encrypt(mem_pass);
    			
    			
    			
    			if(!mem_id.validationID){
    				alert("id를 바르게 입력해주세요.");
    				return;
    			}
    			if(!mem_pass.validationPWD){
    				alert("password를 바르게입력해주세요.")
    				return;
    			}
    			
    			$.ajax({
    				url:"${pageContext.request.contextPath}/join/loginCheck.do",
    				data:{mem_id:mem_id,
    					mem_pass:mem_pass},
    				type:"POST",
    				dataType:"json",
    				success:function(result){
    					if(result.flag == "true"){
    						alert("로그인 성공");
    						$(location).attr('href','${pageContext.request.contextPath}/member/board/boardList.do');
    					}else if(result.flag == "false"){
    						alert("로그인 실패");
    					}else{
    						console.log("LOGIN ERROR");
    					}
    				},
    				error:function(result){
    					alert(result.status);
    				}
    			});
    		});
    	})
    </script>
</head>
<body style="background: url('images/bg/bg.png') center center fixed;">
    <div class="page-form">
        <div class="panel panel-blue">
            <div class="panel-body pan">
                <form action="#" class="form-horizontal">
                <div class="form-body pal">
                    <div class="col-md-12 text-center">
                        <h1 style="margin-top: -90px; font-size: 48px;">
                            KAdmin</h1>
                        <br />
                    </div>
                    <div class="form-group">
                        <div class="col-md-3">
                            <img src="${pageContext.request.contextPath}/images/avatar/profile-pic.png" class="img-responsive" style="margin-top: -35px;" />
                        </div>
                        <div class="col-md-9 text-center">
                            <h1>
                                Hold on, please.</h1>
                            <br />
                            <p>
                                Just sign in and we’ll send you on your way</p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputName" class="col-md-3 control-label">
                            Username:</label>
                        <div class="col-md-9">
                            <div class="input-icon right">
                                <i class="fa fa-user"></i>
                                <input id="mem_id" type="text" placeholder="ID" class="form-control" /></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword" class="col-md-3 control-label">
                            Password:</label>
                        <div class="col-md-9">
                            <div class="input-icon right">
                                <i class="fa fa-lock"></i>
                                <input id="mem_pass" type="password" placeholder="Password" class="form-control" /></div>
                        </div>
                    </div>
                    <div class="form-group mbn">
                        <div class="col-lg-12" align="right">
                            <div class="form-group mbn">
                                <div class="col-lg-3">
                                    &nbsp;
                                </div>
                                <div class="col-lg-9">
                                    <a href="${pageContext.request.contextPath }/join/registForm.do" class="btn btn-default">Regist</a>&nbsp;&nbsp;
                                    <button id="btn-login" type="submit" class="btn btn-default">
                                       Login</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </form>
            </div>
        </div>
        <div class="col-lg-12 text-center">
            <p>
                Forgot Something ?
            </p>
        </div>
    </div>
</body>
</html>
