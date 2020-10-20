<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="head.jsp"></jsp:include>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
</script>
<script type="text/javascript">
function check()
{
	var userid = frm.ChatName.value; 
    if(!userid)
    {
    	alert("방이름을 입력하세요");
		frm.ChatName.focus();
		//sign.onsubmit = "return false";
		return false;
    }
}
</script>
<title>DrawingChat</title>
</head>
<body>
	<jsp:include page="HeadMenu.jsp"></jsp:include>
	<br><br><br><br><br>
	<div class="main main-raised">
    <div class="container">
      <div class="section text-center">
        <form action="CreateChatAction.do" method="POST" name="frm" onsubmit="return check()">
  			<div class="form-row">
    			<div class="form-group col-md-6">
      				<label for="inputEmail4">채팅방 이름</label>
      				<input type="text" class="form-control" id="inputEmail4" placeholder="채팅방 이름..." name="ChatName">
    			</div>
    			<div class="form-group col-md-6">
      			<label for="inputPassword4">Password</label>
      			<input type="password" class="form-control" id="inputPassword4" placeholder="Password.." name="Chatpw">
    			</div>
  			</div>
  			<div class="form-row">
    			<div class="form-group col-md-3">
      				<label for="inputState">타입</label>
      				<select id="inputState" class="form-control" name="Type">
        				<option selected value="게임">게임</option>
        				<option value="잡담">잡담</option>
       			 		<option value="그림">그림</option>
      				</select>
    			</div>
  			</div>
  			<button type="submit" class="btn btn-primary">개설</button>
		</form>
      </div>
    </div>
  </div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>