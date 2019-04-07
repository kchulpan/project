<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>웹개발</title>
<style>
	.wrap{
		background-color: #383b3f;
	}
	
	.loginBox{
		width: 500px;
		height: 500px;
		background-color: #63a6ff;
		border: 1px solid #ffffff;
		align: center;
		
	}
	.title{
		text-align: center;
	}
	.inputBox{
		height:30px;
	}
	.btn_summit{
		background-color: #143ee5;
		color: #ffffff;
		font-size: 20px;
	}
	.btn_reset{
		background-color: #ff0000;
		color: #ffffff;
		font-size: 20px;
	}
</style>
</head>
<body class="wrap">
	<div class="loginBox">
		<h3 class="title">Sign In</h3>
		<form action="/newMember" method="GET">
			<div class="inputBox">
				email : <input type="email" name="id" required/>
			</div>
			<div class="inputBox">
				password : <input type="password" name="pwd" required/>
			</div>
			<div class="inputBox">
				password confirm : <input type="password" name="pwdconfirm" required/>
			</div>
			<div>
				<button class="btn_summit">회원가입</button>
				<button class="btn_reset" type="reset">취소</button>
			</div>
		</form>
	</div>
</body>
</html>