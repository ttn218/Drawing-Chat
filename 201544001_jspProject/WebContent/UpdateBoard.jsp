<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><jsp:include page="head.jsp"></jsp:include>
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
		<form action="UpdateBoardAction.do" method="POST" name="frm" onsubmit="return check()">
			<div class="card-header card-header-info">
				<input type="text" name ="Title" class="form-control" placeholder="Title" style="color :white;" value="${board.getBoard_name()}">
  			</div>
  			<div class="card-body">
	  			<div class="form-row">
	  				<div class="col">
	  					<textarea rows="25" cols="150" placeholder="Content" name="Board_content">${board.getBoard_content() }</textarea>
	  				</div>
	  				<div class="col">
	  					<input type="submit" value="수정" class="btn btn-primary">
	  				</div>
	  			</div>
  			</div>
  		</form>
	</div>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>