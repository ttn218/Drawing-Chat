<%@page import="model.member"%>
<%@page import="model.chat"%>
<%@page import="DAO.chatDAO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="head.jsp"></jsp:include>
	<%
		int Chat_no = Integer.parseInt(request.getParameter("Chat_no"));
		chatDAO dao = chatDAO.getInstance();
		chat chat = dao.SelectChat(Chat_no);
		member member;
		session.setAttribute("chat", chat);
		
		String loginck = session.getAttribute("loginch").toString();
		String NickName;
		if(loginck.equals("false"))
		{
			NickName = "게스트";
		}
		else
		{
			member = (member)session.getAttribute("info");
			NickName = member.getNickname();
		}
		
		
	%>
	<title>${chat.getChat_name() }</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
</script>
<script type="text/javascript" src="http://jsgetip.appspot.com"></script>

<script type="text/javascript">

var pos = {
			drawable : false,
			x: -1,
			y: -1,
			px: -1,
			py: -1,
			data: null
			
	};
	var canvas, ctx;
	var timeid = null;
	var ws
	var msgwindow;
	var inputmsg;
	var no;
	var name = "<%=NickName %>";
	var ipv;
	window.onload = function() {
		canvas = document.getElementById("canvas");
		msgwindow = document.getElementById("messageWindow");
		inputmsg = document.getElementById("inputMessage");
		ctx = canvas.getContext("2d");
		no = getParameterByName('Chat_no');
		getConnection();
		canvas.addEventListener("mousedown",listener);
		canvas.addEventListener("mousemove",listener);
		canvas.addEventListener("mouseup",listener);
		canvas.addEventListener("mouseout",listener);
	}
	
	function listener(event) {
		switch(event.type)
		{
			case "mousedown":
				initDraw(event);
				break;
			case "mousemove":
				if(pos.drawable)
					draw(event);
				break;
			case "mouseout":
			case "mouseup":
				finishDraw();
				break;
		}
	}
	function initDraw(event) {
		ctx.beginPath();
		pos.drawable = true;
		var coors = getPosition(event);
		pos.pX = coors.X;
		pos.pY = coors.Y;
		ctx.moveTo(pos.pX,pos.pY);
		pos.data = ctx.strokeStyle;
	}
	function draw(event) {
		var coors = getPosition(event);
		ctx.lineTo(coors.X, coors.Y);
		pos.X = coors.X;
		pos.Y = coors.Y;
		send("image&" + JSON.stringify(pos));
		ctx.stroke();
		
		pos.pX = coors.X;
		pos.pY = coors.Y;
	}
	function finishDraw() {
		pos.drawable = false;
		pos.X = -1;
		pos.Y = -1;
		pos.pX = -1;
		pos.pY = -1;
		ctx.closePath();
	}
	function getPosition(event) {
		var x = event.offsetX;
		var y = event.offsetY;
		return {X:x , Y:y};
	}
	function clearCanvas() {
		ctx.clearRect(0,0,canvas.width,canvas.height);
		ctx.beginPath();
		
		send("image&clear");
	}
	
	
    //채팅이 많아져 스크롤바가 넘어가더라도 자동적으로 스크롤바가 내려가게함
    window.setInterval(function() {
        var elem = document.getElementById('messageWindow');
        elem.scrollTop = elem.scrollHeight;
    }, 0);
    
    function getConnection(){
        ws = new WebSocket("ws://10.200.43.194:8181" + '<%=request.getContextPath()%>/serverStart');

        // 서버 시작할 때 동작
        ws.onopen = function(event){
        	msgwindow.value += "연결";
        }
        // 서버로부터 메세지를 전달 받을 때 동작하는 메소드

        // 아래에 선언 할 onMessage로 event가 전달된다.

        ws.onmessage = function(event){
              onMessage(event);
        }
                  
        // 서버에서 에러가 발생할 경우 동작할 메소드
        ws.onerror = function(event){
             onError(event);
        }
                  
        // 서버와의 연결이 종료될 경우 동작하는 메소드
        ws.onclose = function(event){
             onClose(event);
        }
   }
    
    function onMessage(event) {
    	var splitstr = event.data.split("&");
    	if(splitstr[0] === no)
    	{
    		if(splitstr[1] === "image")
			{
    			if(splitstr[2] == "clear")
    			{
    				ctx.clearRect(0,0,canvas.width,canvas.height);
    				ctx.beginPath();
    			}
    			if(pos.drawable == true) 
    			{
    				
    				return;
    			}
    			
    			var drawData = JSON.parse(splitstr[2]);
    			var octx = canvas.getContext("2d");
    			octx.strokStyle=drawData.data;
    			octx.beginPath();
    			octx.moveTo(drawData.pX,drawData.pY);
    			octx.lineTo(drawData.X,drawData.Y);
    			octx.stroke();
    			octx.closePath();
    		
			}
    		else
    		{
    			msgwindow.value +="\r\n"+ splitstr[3] + ":" + splitstr[2];
    		}
    	}
	}
    
    function onError(event) {
		alert(event.data);
	}
    function onClose(event){
    	
    }
    function send(msg) {
    	
		ws.send(no+"&"+msg);
	}
    function Msgsend(){
    	var msg = "msg&"+inputmsg.value+"&"+name;
    	inputmsg.value="";
    	send(msg);
    }
    function enterkey() {
        if (window.event.keyCode == 13) {
        	Msgsend();
        }
    }
    function getParameterByName(name) {
    	name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    	var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
    	results = regex.exec(location.search);
    	return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
    	}

</script>
<body>
	<jsp:include page="HeadMenu.jsp"></jsp:include>
	<br><br><br><br><br><br>
	<div class="main main-raised">
    	<div class="container">
    		<div class = "row">
    			<div class="col-md-3">
    				<button class="btn btn-primary btn-sm" onclick="clearCanvas()">초기화</button>
      				<canvas id="canvas" width="800" height="600" style="border: 1px solid black" >
      				</canvas>
      			</div>
      			<div class="inline ml-auto">
       	 			<fieldset>
       	 				<br><br>
       	 				<textarea id="messageWindow" disabled="disabled" cols="35" rows="23" style = "border:1px solid black; background-color: white;" class="h6"></textarea>
           				<br /> <input id="inputMessage" type="text" onkeyup="enterkey()" />
           				<input  class="btn btn-primary btn-sm" type="submit" value="send" onclick="Msgsend()" />
        			</fieldset>
        		</div>
      		</div>
    	</div>
  	</div>	
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>