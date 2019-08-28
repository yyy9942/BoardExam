<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Forms | Forms</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="shortcut icon" href="${pageContext.request.contextPath }/images/icons/favicon.ico">
<link rel="apple-touch-icon" href="${pageContext.request.contextPath }/images/icons/favicon.png">
<link rel="apple-touch-icon" sizes="72x72"
	href="${pageContext.request.contextPath }/images/icons/favicon-72x72.png">
<link rel="apple-touch-icon" sizes="114x114"
	href="${pageContext.request.contextPath }/images/icons/favicon-114x114.png">
<!--Loading bootstrap css-->
<link type="text/css" rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,400,300,700">
<link type="text/css" rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Oswald:400,700,300">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath }/styles/jquery-ui-1.10.4.custom.min.css">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath }/styles/font-awesome.min.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/styles/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/styles/animate.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/styles/all.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/styles/main.css">
<link type="text/css" rel="stylesheet"
	href="styles/style-responsive.css">
<link type="text/css" rel="stylesheet"
	href="styles/zabuto_calendar.min.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/styles/pace.css">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath }/styles/jquery.news-ticker.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/js/validation.js"></script>
<script type="text/javascript">
	$(function() {
		$('#btn-search-addr')
				.click(
						function() {
							var addr = encodeURIComponent($('#search_addr')
									.val());
							$.ajax({
										url : "https://maps.googleapis.com/maps/api/geocode/json?address="
												+ addr
												+ "&key=AIzaSyB8D8imdfmM5AI2jExfk4OMLJcXEE8D4wI",
										type : "POST",
										dataType : "json",
										success : function(result) {
											var address = result.results[0];
											var add1 = "";
											var add2 = address.address_components[0].long_name;
											for (var i = address.address_components.length - 2; i > 0; i--) {
												add1 += address.address_components[i].long_name
														+ " ";
											}

											$('#mem_add1').val(add1+ add2);
										},
										error : function(result) {

										}
									});
						});

		$('#mem_id').keyup(function() {
			if (!$('#mem_id').val().validationID()) {
				$('#mem_id').css("border-color", "red");
				return;
			} else {
				// 			$('#mem_id').css("border-color", "green");

				var params = $('#mem_id').val();
				$.ajax({
					url : "${pageContext.request.contextPath }/join/idCheck.do",
					data : {
						mem_id : params
					},
					type : "POST",
					dataType : "json",
					success : function(result) {
						if (result.dupl == "false") {
							$('#mem_id').css("border-color", "green");
						} else if (result.dupl == "true") {
							$('#mem_id').css("border-color", "red");
						}

					},
					error : function(result) {
						if (result.dupl == "false") {
							$('#mem_id').css("border-color", "green");
						} else if (result.dupl == "true") {
							$('#mem_id').css("border-color", "red");
							return;
						} else {
							$('#mem_id').css("border-color", "green");
						}
					}
				});

			}
		});

		$('#mem_pass').keyup(function() {
			if (!$('#mem_pass').val().validationPWD()) {
				$('#mem_pass').css("border-color", "red");
			} else {
				$('#mem_pass').css("border-color", "green");
			}
		});

		$('#mem_pass_check').keyup(
				function() {
					if (!($('#mem_pass_check').val().validationPWD() && $(
							'#mem_pass_check').val() == $('#mem_pass').val())) {
						$('#mem_pass_check').css("border-color", "red");
					} else {
						$('#mem_pass_check').css("border-color", "green");
					}
				});

		$('#mem_mail').keyup(function() {
			if (!$('#mem_mail').val().validationMAIL()) {
				$('#mem_mail').css("border-color", "red");
			} else {
				$('#mem_mail').css("border-color", "green");
			}
		});

		$('#mem_name').keyup(function() {
			if (!$('#mem_name').val().validationNAME()) {
				$('#mem_name').css("border-color", "red");
			} else {
				$('#mem_name').css("border-color", "green");
			}
		});

		$('#mem_birth').change(function() {
			var num = $('#mem_birth').val();
			console.log(num);
			if (!$('#mem_birth').val().validationBIR()) {
				$('#mem_birth').css("border-color", "red");
			} else {
				$('#mem_birth').css("border-color", "green");
			}
		});

		$('#btn-regist').click(
				function() {
					if (!$('#mem_id').val().validationID()) {
						alert("아이디를 바르게 입력해주세요.");
						return;
					}

					if (!$('#mem_pass').val().validationPWD()) {
						alert("패스워드를 바르게 입력해주세요.")
						return;
					}

					if (!$('#mem_mail').val().validationMAIL()) {
						alert("이메일을 바르게 입력해주세요.")
						return;
					}

					if (!$('#mem_name').val().validationNAME()) {
						alert("이름을 바르게 입력해주세요.")
						return;
					}

					if (!$('#mem_birth').val().validationBIR()) {
						alert("생년월일을 바르게 입력해주세요.")
						return;
					}

					if (!($('#mem_pass_check').val().validationPWD() && $(
							'#mem_pass_check').val() == $('#mem_pass').val())) {
						alert("패스워드 체크를 확인해주세요.");
						return;
					}
					$('#mem_addr').val($('#mem_add1').val() + $('#mem_add2').val());
					$('#form-memberInfo').append($('#mem_addr'));
					
					var params = $('#form-memberInfo').serialize();

					$.ajax({
						url : "${pageContext.request.contextPath }/join/idCheck.do",
						data : params,
						type : "POST",
						dataType : "json",
						success : function(result) {
							if (result.dupl == "false") {
								$.ajax({
									url : "${pageContext.request.contextPath }/join/memberRegistRequest.do",
									data : params,
									type : "POST",
									dataType : "json",
									success : function(result) {
										alert('회원가입이 완료되었습니다.');
										$(location).attr('href',
												'${pageContext.request.contextPath }/join/loginForm.do');
									},
									error : function(result) {
										alert('회원가입이 완료되었습니다.');
										$(location).attr('href',
												'${pageContext.request.contextPath }/join/loginForm.do');
									}
								});
							} else if (result.dupl == "true") {
								alert('ID가 중복되었습니다.');
								return;
							}

						},
						error : function(result) {
							if (result.dupl == "false") {
								alert('회원가입이 완료되었습니다.');
								$(location).attr('href',
										'${pageContext.request.contextPath }/join/loginForm.do');
							} else if (result.dupl == "true") {
								alert('ID가 중복되었습니다.');
								return;
							} else {
								alert('회원가입이 완료되었습니다.');
								$(location).attr('href',
										'${pageContext.request.contextPath }/join/loginForm.do');
							}
						}
					});
				});

	});
</script>


</head>
<body>
	<div class="panel panel-orange">
		<div class="panel-heading">Registration form</div>
		<div class="panel-body pan">
			<form id='form-memberInfo'>
				<div class="form-body pal">
					<div class="form-group">
						<div class="input-icon right">
							<i class="fa fa-user"></i> <input id="mem_id" name="mem_id"
								type="text" maxlength="30" placeholder="User ID"
								class="form-control" />
						</div>
					</div>
					<div class="form-group">
						<div class="input-icon right">
							<i class="fa fa-envelope"></i> <input id="mem_mail"
								name="mem_mail" type="email" maxlength="30"
								placeholder="Email address" class="form-control" />
						</div>
					</div>
					<div class="form-group">
						<div class="input-icon right">
							<i class="fa fa-lock"></i> <input id="mem_pass" name="mem_pass"
								maxlength="30" type="password" placeholder="Password"
								class="form-control" />
						</div>
					</div>
					<div class="form-group">
						<div class="input-icon right">
							<i class="fa fa-lock"></i> <input id="mem_pass_check"
								name="mem_pass_check" maxlength="30" type="password"
								placeholder="Confirm Password" class="form-control" />
						</div>
					</div>
					<hr />
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<input id="mem_name" name="mem_name" type="text"
									placeholder="Name" maxlength="30" class="form-control" />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<input id="mem_hp" name="mem_hp" type="tel" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}"
									placeholder="Phone number" maxlength="30" class="form-control" />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<input id="search_addr" type="text"
									placeholder="member address search" maxlength="30"
									class="form-control" />
								<button type="button" id="btn-search-addr"
									class="btn btn-primary">주소검색</button>
							</div>
						</div>
					</div>


					<div class="row">
						<input type="hidden" name="mem_addr" id="mem_addr"></input>
						<div class="col-md-6">
							<div class="form-group">
								<input id="mem_add1" name="mem_add1" readonly type="text"
									placeholder="검색창에 주소를 검색해주세요" maxlength="40" class="form-control" />
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<input id="mem_add2" name="mem_add2" type="text"
									placeholder="상세 주소를입력해주세요" maxlength="40" class="form-control" />
							</div>
						</div>
					</div>
					<div class="form-group">
						birthday
						<div class="input-icon right">
							<input id="mem_birth" name="mem_birth" type="date"
								placeholder="birth" maxlength="30" class="form-control" />
						</div>
					</div>
				</div>
				<div class="form-actions text-right pal">
					<button type="button" id="btn-regist" class="btn btn-primary">회원가입</button>
					<button type="reset" class="btn btn-primary">초기화</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>





