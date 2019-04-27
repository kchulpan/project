<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">

<title>Sign in</title>

<!-- Custom styles for this template -->
<link href="/css/signin.css" rel="stylesheet">

</head>

<body>
      <form action="/signin" method="GET">
      	<div class="imgcontainer">
      		<img src="/img/img_avatar.png" alt="imgae_avatar" class="avatar">
      	</div>
      	<div class="container">
	        <label for="inputEmail"><b>Username<b></b></label>
	        <input type="email" id="inputEmail" name="userId" class="form-control" placeholder="Email address" required autofocus>
	        
	        <label for="inputPassword"><b>Password</b></label>
	        <input type="password" id="inputPassword" name="userPwd" class="form-control" placeholder="Password" required>
			
			<button type="submit">Sign in</button>       
          <label>
            <input type="checkbox" value="remember-me"> Remember me
          </label>
        </div>
        <div class="container">
       		<a href="/regmember"><button type="button" class="signupbtn">Sign up</button></a>
        	<button type="button" class="cancelbtn">Cancel</button>
        </div>
        
        <span class="psw"><a href="#">Forgot password?</a></span>
        
        
       <!--  <a href="/regmember" class="btn btn-lg btn-primary btn-block">Sign up</a> -->

      </form>
        <!-- <a href="/excel" class="btn btn-lg btn-primary btn-block">�����ٿ�ε�</a> -->
		
    </div> <!-- /container -->
</body>
</html>