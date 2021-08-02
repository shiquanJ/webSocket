var url = window.location.host;
var name = document.getElementById('usernm').value;
	console.log(url);
	console.log(name);
	//判断当前浏览器是否支持WebSocket
	if('WebSocket' in window){
		if(name == ''){
			name='stranger';
		}
		//closeWebSocket();
		websocket = new WebSocket("ws://"+url+"/websocket/monitor/"+name+"");
		console.log(window)
	}else{
		alert('Not support websocket')
	}
	//连接发生错误的回调方法
	websocket.onerror = function(e){
		console.log(e);
		setMessageInnerHTML("error");
	};
	
	//连接成功建立的回调方法
	websocket.onopen = function(event){
		setMessageInnerHTML("您好~");
	}
	console.log("-----")
	//接收到消息的回调方法
	websocket.onmessage = function(event){
		setMessageInnerHTML(event.data);
	}
	
	//连接关闭的回调方法
	/* websocket.onclose = function(){
	      setMessageInnerHTML("close");
	    } */
	
	//监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
	window.onbeforeunload = function(){
		websocket.close();
	}
	//将消息显示在网页上
	function setMessageInnerHTML(innerHTML){
		//接送消息
		document.getElementById('message').innerHTML += '<p class="text-left text-info">'+innerHTML + '</p>';
		//把滚动条拉到最底部
		setScrollBar();
	}
       
	//关闭连接
	function closeWebSocket(){
		websocket.close();
	}
       
	//发送消息
	function send(){
		var message = document.getElementById('text').value;
		if(message ==''){
			alert('请输入内容！');
			return;
		}
		websocket.send(message);
		document.getElementById('text').value ='';
		document.getElementById('text').focus();
		
	}
	//注销
	function logout(){
		closeWebSocket();
		document.location.href = '/logout';
		
	}
	function setScrollBar(){
		var div = document.getElementById('message');
		div.scrollTop = div.scrollHeight;
	}