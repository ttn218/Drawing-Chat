<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="head.jsp"></jsp:include>
<title>CreateBoard</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
</script>
<script type="text/javascript">
function check()
{
	var userid = frm.Title.value; 
    if(!userid)
    {
    	alert("게시글 타이틀을 입력하세요");
		frm.Title.focus();
		//sign.onsubmit = "return false";
		return false;
    }
}
</script>
</head>
<body>
<jsp:include page="HeadMenu.jsp"></jsp:include>


	<br><br><br>
	<div class="card card-nav-tabs">
		<form action="InsertBoard.do" method="POST" name="frm" onsubmit="return check()">
			<div class="card-header card-header-info">
				<input type="text" name ="Title" class="form-control" placeholder="Title" style="color :white;">
  			</div>
  			<div class="card-body">
  				<div class="form-row">
	   				<div class="col">
	   					<div class="form-group">
	   						<label for="Type">비밀번호 입력</label>
	      					<input type="password" class="form-control" placeholder="Password" name="Board_pw">
	      				</div>
	    			</div>
	    			<div class="col">
	    				<div class="form-group">
    						<label for="Type">게시글 종류</label>
    						<select class="form-control selectpicker" data-style="btn btn-link" id="Type" name="Board_type">
      							<option selected value="그림자랑" >그림자랑</option>
      							<option value="아이콘 공유">아이콘 공유</option>
     			 				<option value="자유">자유</option>
    						</select>
 						</div>
	    			</div>
	  			</div>
	  			<div class="form-row">
	  				<div class="col">
	  					<textarea rows="25" cols="150" placeholder="Content" name="Board_content"></textarea>
	  				</div>
	  				<div class="col">
	  					<input type="submit" value="저장" class="btn btn-primary">
	  				</div>
	  			</div>
  			</div>
  		</form>
	</div>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>