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
	var userid = frm.id.value; 
	var str = "false"
    if(!userid)
    {
    	alert("ID를 입력하세요");
		frm.id.focus();
		//sign.onsubmit = "return false";
		return false;
    }
    if(!frm.pw.value)
    {
    	alert("패스워드를 입력하세요");
		frm.pw.focus();
		//sign.onsubmit = "return false";
		return false;
   	}
    $.ajax({
        async: false,
        type : 'POST',
        data : "id="+userid + "&pw="+frm.pw.value,
        url : "logincheck.jsp",
        success : function(data) {
            if (data.trim() == "true") {
                //아이디가 존제할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
                str = "true";
            
            } else{
                alert("아이디나 비밀번호가 틀립니다.");
                //아이디가 존제할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
                //아이디가 중복하지 않으면  idck = 1 
                str = "false";
            }
        },
        error : function(error) {
            
            alert("error : " + error.toString());
        }
    });
	if(str == "true")
	{
		return true;	
	}
	else
	{
		return false;	
	}
}
</script>
<title>DrawingChat Login</title>
</head>
<body>

<jsp:include page="HeadMenu.jsp"></jsp:include>
	<div class="page-header header-filter" style="background-image: url('../assets/img/bg7.jpg'); background-size: cover; background-position: top center;">
    <div class="container">
      <div class="row">
        <div class="col-lg-4 col-md-6 ml-auto mr-auto">
          <div class="card card-login">
            <form class="form" method="POST" action="LoginAction.do" name="frm" onsubmit="return check()">
              <div class="card-header card-header-primary text-center">
                <h4 class="card-title">Login</h4>
              </div>
              <p class="description text-center">Or Be Classical</p>
              <div class="card-body">
                <div class="input-group">
                  <div class="input-group-prepend">
                    <span class="input-group-text">
                      <i class="material-icons">face</i>
                    </span>
                  </div>
                  <input type="text" class="form-control" placeholder="Id..." name="id">
                </div>
                <div class="input-group">
                  <div class="input-group-prepend">
                    <span class="input-group-text">
                      <i class="material-icons">lock_outline</i>
                    </span>
                  </div>
                  <input type="password" class="form-control" placeholder="Password..." name="pw">
                </div>
              </div>
              <div class="footer text-center">
              	<input type="submit" class="btn btn-primary btn-link btn-wd btn-lg" value="로그인">  
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
 </div>
 
 <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>