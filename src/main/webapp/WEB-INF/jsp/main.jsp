<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css">
<script type="text/javascript" src="/js/index.js"></script>
<title>爱茉莉聊天室</title>
<body>
<form class="form-horizontal" name="form" method="post">
	<div class="container">
		<div class='page-header'>
			<h1 class="text-center">AmorePacific</h1>
		</div>
		<div class="row">
			<div class='col-md-4'></div>
			<div class='col-md-4'>
				<label class='sr-only' for='usernm'>Name:</label>
				<input  class="form-control" id="usernm" name="usernm" type="text" placeholder="请输入姓名"/> 
			</div>
			<div class='col-md-4'></div>
		</div>
		<div class="row">
			<div class='col-md-4'></div>
			<div class='col-md-4'>
				<label class='sr-only' for='password'>Password:</label>
				<input  class="form-control" id="password" name="password" type="text" placeholder="请输入密码"/> 
			</div>
			<div class='col-md-4'></div>
		</div>
		<nav class="navbar navbar-default navbar-fixed-bottom"><!--贴在底部，不会消失-->
			<button class="center-block btn btn-success"  onclick="login()">登录</button>   
		</nav> 
	</div>
</form>
</body>
</html>
