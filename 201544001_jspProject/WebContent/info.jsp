<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="head.jsp"></jsp:include>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="HeadMenu.jsp"></jsp:include>
	
<form action="infoUpdate.do" method="POST" class="from">
  	<div class="form-group">
    	<label style="color: black;">이름 : ${info.getName() }</label>
<!--     	<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
  	</div>
  	<div class="form-group">
    	<label for="InputNickName" style="color: black;">닉네임 : ${info.getNickname() } Level : ${info.getLevel() }</label>
    	
    	<input type="text" class="form-control" id="InputNickName" placeholder="변경할 닉네임" name="nickname">
  	</div>
  	<div class="form-group">
    	<label for="Inputtel" style="color: black;">전화번호 : ${info.getTel() }</label>
    	<input type="text" class="form-control" id="tel" placeholder="변경할 전화번호" name="tel">
  	</div>
  	<div class="form-group">
    	<label for="InputAddr" style="color: black;">주소 : ${info.getAddr() }</label>
    	<input type="text" class="form-control" id="InputAddr" placeholder="변경할 주소" name = "addr">
  	</div>

  	<button type="submit" class="btn btn-primary">회원정보 수정</button>
  	<a href="main.do" class="btn btn-primary" role="button">확인</a>
  	<!-- <a href="deleteMember.do" class="btn btn-primary right" role="button" >회원탈퇴</a> -->
  </form>
	
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>