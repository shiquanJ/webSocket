	function login(){
		var frm = document.form;
		var name = document.getElementById('usernm').value;
		if(name == ''){
			alert('请输入名字！！！！');
		}else{
			frm.action ='/login';
			frm.submit();
		}
	}
	function showLogin(){
		document.getElementById('btn_login').style.display='';
		document.getElementById('btn_chat').style.display='none';
		document.getElementById('btn_send').style.display='none';
	}