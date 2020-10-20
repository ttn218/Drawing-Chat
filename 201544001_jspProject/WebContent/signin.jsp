
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DAO.memberDAO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.member" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="head.jsp"></jsp:include>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
</script>
<script type="text/javascript">
function chackvalue()
	{
		
		if(!sign.id.value)
		{
			alert("ID를 입력하세요");
			sign.id.focus();
			//sign.onsubmit = "return false";
			
			return false;
		}
		if(!sign.pw.value)
		{
			alert("PW를 입력하세요");
			sign.pw.focus();
			//sign.onsubmit = "return false";
			return false;
		}
		if(!sign.name.value)
		{
			alert("이름을 입력하세요");
			sign.name.focus();
			//sign.onsubmit = "return false";
			return false;
		}
		if(!sign.nickname.value)
		{
			alert("닉네임을 입력하세요");
			sign.nickname.focus();
			//sign.onsubmit = "return false";
			return false;
		}
		if(!sign.tel.value)
		{
			alert("전화번호를 입력하세요");
			sign.tel.focus();
			//sign.onsubmit = "return false";
			return false;
		}
		if(!sign.eamil.value)
		{
			alert("eamil를 입력하세요");
			sign.eamil.focus();
			//sign.onsubmit = "return false";
			return false;
		}
		if(!sign.addr.value)
		{
			alert("주소를 입력하세요");
			sign.addr.focus();
			//sign.onsubmit = "return false";
			return false;
		}
		if(!sign.idcheck.value)
		{
			alert("중복체크를 해주세요");
			sign.id.focus();
			//sign.onsubmit = "return false";
			return false;
		}
		if(sign.pw.value != sign.repw.value)
		{
			alert("비밀번호가 다릅니다");
			sign.repw.focus();
			//sign.onsubmit = "return false";
			return false;
		}
	}
	
</script>
<script type="text/javascript">
function check()
{
	var userid = sign.id.value; 
    if(!userid)
    {
    	alert("ID를 입력하세요");
		sign.id.focus();
		//sign.onsubmit = "return false";
		return false;
    }
    $.ajax({
        async: true,
        type : 'POST',
        data : "id="+userid,
        url : "./idcheck.jsp",
        success : function(data) {
            if (data.trim() == "false") {
                
                alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
                //아이디가 존제할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
                
                $sign.id.focus();
                sign.idcheck.value=false;
            
            } else{
                alert("사용가능한 아이디입니다.");
                //아이디가 존제할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
                sign.nickname.focus();
                //아이디가 중복하지 않으면  idck = 1 
                sign.idcheck.value=true;
                
            }
        },
        error : function(error) {
            
            alert("error : " + error.toString());
        }
    });
	
}
</script>
<title>DrawingChat Sign in</title>
</head>
<body>

<jsp:include page="HeadMenu.jsp"></jsp:include>

	<div class="page-header header-filter" style="background-image: url('../assets/img/bg7.jpg'); background-size: cover; background-position: top center;">
    <div class="container" >
      <div class="row">
        <div class="col-lg-5 col-md-5 ml-auto mr-auto">
          <div class="card card-login" >
            <form name="sign" class="form" method="POST" action="SigninAction.do" onsubmit="return chackvalue()">
              <div class="card-header card-header-primary text-center">
                <h4 class="card-title">회원가입</h4>
              </div>
              <p class="description text-center">Or Be Classical</p>
              <div class="card-body">
                <div class="input-group">
                  <div class="input-group-prepend">
                    <span class="input-group-text">
                      <i class="material-icons">face</i>
                    </span>
                  </div>
                  <input type="text" class="form-control" name="id" placeholder="Id...">
                  <input type="button" class="btn btn-primary" value="중복확인" onclick="check()">
                  <input type="hidden"  name="idcheck">
                </div>
                <div class="input-group">
                  <div class="input-group-prepend">
                    <span class="input-group-text">
                      <i class="material-icons">account_circle</i>
                    </span>
                  </div>
                  <input type="text" class="form-control" name="nickname" placeholder="닉네임...">
                </div>
                <div class="input-group">
                  <div class="input-group-prepend">
                    <span class="input-group-text">
                      <i class="material-icons">lock_outline</i>
                    </span>
                  </div>
                  <input type="password" class="form-control" name="pw" placeholder="Password...">
                </div>
                <div class="input-group">
                  <div class="input-group-prepend">
                    <span class="input-group-text">
                      <i class="material-icons">lock_outline</i>
                    </span>
                  </div>
                  <input type="password" class="form-control" name="repw" placeholder="Password 확인...">
                </div>
                <div class="input-group">
                  <div class="input-group-prepend">
                    <span class="input-group-text">
                      <i class="material-icons">account_circle</i>
                    </span>
                  </div>
                  <input type="text" class="form-control" name="name" placeholder="이름...">
                </div>
                <div class="input-group">
                  <div class="input-group-prepend">
                    <span class="input-group-text">
                      <i class="material-icons">stay_primary_portrait</i>
                    </span>
                  </div>
                  <input type="tel" class="form-control" name="tel" placeholder="핸드폰 번호...">
                </div>
                <div class="input-group">
                  <div class="input-group-prepend">
                    <span class="input-group-text">
                      <i class="material-icons">mail</i>
                    </span>
                  </div>
                  <input type="email" class="form-control" name="eamil" placeholder="email...">
                </div>
                <div class="input-group">
                  <div class="input-group-prepend">
                    <span class="input-group-text">
                      <i class="material-icons">room</i>
                    </span>
                  </div>
                  <input type="text" class="form-control" name="addr" placeholder="집주소...">
                </div>
              </div>
              
              <div class="footer text-center">
              	<input type="submit" class="btn btn-primary btn-link btn-wd btn-lg" value="회원가입">  
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