<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css">
<script type="text/javascript" src="/js/jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/js/jquery/jquery-ui.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.bxslider.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.cookie.js"></script>
<title>爱茉莉聊天室</title>
<body>
	<input type="hidden" name="usernm" id="usernm" value="${usernm }">
	<div class="container">
		<div class="row">
			<div class='col-xs-6 col-md-4'></div>
			<div class='col-xs-6 col-md-4'>
				<h1 class="text-center">爱茉莉聊天室</h1>
			</div>
			<div class='col-xs-6 col-md-4'>
				<h1 class="text-center">
					<button class="pull-right btn btn-danger center-block" onclick="logout()"> 注销 </button>
				</h1>  
			</div>
		</div>
		<div class="row">
			<div class='navbar navbar-default' id="message" style='height: 400px; overflow: auto;'>
			</div>
			<nav class="navbar navbar-default navbar-fixed-bottom"><!--贴在底部，不会消失-->
				<div class='col-xs-12 col-md-4'></div>
				<div class= 'col-xs-12 col-md-4 form-group'>
					<label class='sr-only' for='text'>text</label>
					<input class="center-block form-control" id="text" type="text" placeholder="请输入聊天内容"/> 
				</div>
				<div class='col-xs-12 col-md-4'>
					<button class="pull-left btn btn-success" onclick="send()"> 发送 </button>  
				</div>
			</nav> 
		</div>
	</div>
<script type="text/javascript" src="/js/socket.js"></script>        
</body>
</html>
