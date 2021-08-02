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
<title>AmorePacific</title>
<script type="text/javascript" src="/js/index.js"></script>
<body>
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
				<div class="navbar-header">
				<c:choose>
						<c:when test="${empty  usernm}">
								<button type="button" onclick='showLogin()' class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> 
									登录
								</button>
						</c:when>
						<c:otherwise>
								<button type="button" onclick="logout();" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> 
									注销
								</button>
								<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> 
									${usernm }
								</button>
						</c:otherwise>
					</c:choose>
					 <!-- <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>  -->
					 <a class="navbar-brand " href="#">AmorePacfic</a>
				</div>
				
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li class="active">
							 <a href="#">Link</a>
						</li>
						<li>
							 <a href="#">Link</a>
						</li>
						<li class="dropdown">
							 <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown<strong class="caret"></strong></a>
							<ul class="dropdown-menu">
								<li>
									 <a href="#">Action</a>
								</li>
								<li>
									 <a href="#">Another action</a>
								</li>
								<li>
									 <a href="#">Something else here</a>
								</li>
								<li class="divider">
								</li>
								<li>
									 <a href="#">Separated link</a>
								</li>
								<li class="divider">
								</li>
								<li>
									 <a href="#">One more separated link</a>
								</li>
							</ul>
						</li>
					</ul>
					<form class="navbar-form navbar-left" role="search">
						<div class="form-group">
							<input type="text" class="form-control" />
						</div> <button type="submit" class="btn btn-default">Submit</button>
					</form>
					<ul class="nav navbar-nav navbar-right" style='margin-right: 10px;'>
					<c:choose>
						<c:when test="${empty  usernm}">
							<li>
								<a href="#" onclick='showLogin()'>登录</a>
							</li>
						</c:when>
						<c:otherwise>
							<li >
								<a href="#">用户名：<mark>${usernm }</mark></a>
							</li>
							<li class='active'>
								<a href="#" onclick="logout();">注销</a>
							</li>
						</c:otherwise>
					</c:choose>
					</ul>
				</div>
				
			</nav>
		</div>
	</div>
	<div class="row clearfix" style='padding: 60px'>
		<div class="col-md-12 column">
			<h1 class="text-center">
				Chat-Room
			</h1>
		</div>
	</div>
	<div class="row clearfix" id='btn_login' style='display:none;'>
		<div class="col-md-6 column">
		</div>
		<div class="col-md-6 column" style='padding: 90px; border: 1px solid #e7e7e7; ' >
			<form class="form-horizontal" role="form" name='form' method="post">
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">用户名</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="usernm" name='usernm' value='${usernm }' placeholder="请输入姓名"/>
					</div>
				</div>
				<!-- <div class="form-group">
					 <label for="inputPassword3" class="col-sm-2 control-label">密码</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="inputPassword3" placeholder="请输入密码"/>
					</div>
				</div> -->
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<div class="checkbox">
							 <label><input type="checkbox" />Remember me</label>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						 <button class="center-block btn btn-success"  onclick="login()">登录</button>   
					</div>
				</div>
			</form>
		</div>
	</div>
	<div class="row clearfix" id='btn_chat'>
		<div class="col-md-12 column navbar navbar-default" id='message' style='height: 300px; overflow: auto; '>
		</div>
		<div class='col-xs-12 col-md-4'></div>
		<div class= 'col-xs-12 col-md-4 form-group'>
			<label class='sr-only' for='text'>text</label>
			<input class="center-block form-control" id="text" type="text" placeholder="请输入聊天内容"/> 
		</div>
	</div>
	<div class="row clearfix" id='btn_send'>
		<div class='col-xs-12 col-md-4'>
		</div>
		<div class='col-xs-12 col-md-4'>
			<button class="btn btn-success center-block"  onclick="send()"> 发送 </button>  
		</div>
		<div class='col-xs-12 col-md-4'>
		</div>
	</div>
	<div class="row clearfix" style='padding: 60px'>
		<div class="col-md-12 column">
			<h1 class="text-center">
				图片欣赏
			</h1>
		</div>
	</div>
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="row">
				<div class="col-md-4">
					<div class="thumbnail">
						<img  class="img-responsive" alt="300x200" src="/images/thumbnail_1.jpg" style="width: 300px; height: 280px;"/>
						<div class="caption">
							<h3>
								青岛啤酒
							</h3>
							<p>
								Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
							</p>
							<p>
								 <a class="btn btn-primary" href="#">Action</a> <a class="btn" href="#">Action</a>
							</p>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="thumbnail">
						<img  class="img-responsive" alt="300x200" src="/images/thumbnail_2.jpg" style="width: 300px; height: 280px;"/>
						<div class="caption">
							<h3>
								项目经理
							</h3>
							<p>
								Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
							</p>
							<p>
								 <a class="btn btn-primary" href="#">Action</a> <a class="btn" href="#">Action</a>
							</p>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="thumbnail">
						<img  class="img-responsive" alt="300x200" src="/images/thumbnail_3.jpg" style="width: 300px; height: 280px;"/>
						<div class="caption">
							<h3>
								项目聚餐
							</h3>
							<p>
								Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
							</p>
							<p>
								 <a class="btn btn-primary" href="#">Action</a> <a class="btn" href="#">Action</a>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row clearfix" style='padding: 60px'>
		<div class="col-md-12 column">
			<h1 class="text-center">
				视频欣赏
			</h1>
		</div>
	</div>
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="jumbotron">
				<video class='center-block' preload="auto"  style="width: 400px;height: 350px;">
			      <source src="/media/video.mp4" type="video/mp4">
			    </video>
			</div>
		</div>
	</div>
</div>
</body>
<script type="text/javascript" src="/js/socket.js"></script>   
</html>
