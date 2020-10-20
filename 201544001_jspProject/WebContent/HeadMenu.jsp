<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<%
	String loginch = session.getAttribute("loginch").toString(); 
%>
<nav class="navbar navbar-expand-lg bg-primary">
  <div class="container">
    <a class="navbar-brand" href="main.do">DrawingChat</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
    <span class="sr-only">Toggle navigation</span>
    <span class="navbar-toggler-icon"></span>
    <span class="navbar-toggler-icon"></span>
    <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
      <ul class="navbar-nav">
        <!-- <li class="nav-item">
          <a class="nav-link" href="#">공지사항 <span class="sr-only">(current)</span></a>
        </li> -->
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            	채팅
          </a>
          <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
            <a class="dropdown-item" href="GameRooms.do">게임</a>
            <a class="dropdown-item" href="TalkRooms.do">잡담</a>
            <a class="dropdown-item" href="PaintRooms.do">그림</a>
            <%
            	if(loginch.equals("true")){
            	%>	
            	<a class="dropdown-item" href="CreateChat.do">채팅방개설</a>
            <%
            	}
            %>
          </div>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
           	게시판
          </a>
          <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
            <a class="dropdown-item" href="PaintBoard.do">그림자랑</a>
            <a class="dropdown-item" href="iconBoard.do">아이콘 공유</a>
            <a class="dropdown-item" href="freeBoard.do">자유</a>
            <%
            	if(loginch.equals("true")){
            	%>	
            	<a class="dropdown-item" href="CreateBoard.do">게시글 생성</a>
            <%
            	}
            %>
          </div>
        </li>
      </ul>
      <%
      		
      
      		if(loginch.equals("false"))
      		{
      			%>
      			<ul class = "navbar-nav ml-auto">
      				<li class="nav-item" >
          				<a class="nav-link" href="login.do">로그인 <span class="sr-only">(current)</span></a>
        			</li>
        			<li class="nav-item" >
          				<a class="nav-link" href="signin.do">회원가입 <span class="sr-only">(current)</span></a>
        			</li>
      			</ul>
      			<%
      		}
      		else
      		{
      			%>
      			<ul class = "navbar-nav ml-auto">
      				<!-- <li class="nav-item" >
          				<a class="nav-link" href="Atelier.do">아틀리에 <span class="sr-only">(current)</span></a>
        			</li> -->
      				<li class="nav-item" >
          				<a class="nav-link" href="info.do">회원정보 <span class="sr-only">(current)</span></a>
        			</li>
        			<li class="nav-item" >
          				<a class="nav-link" href="logout.do">로그아웃 <span class="sr-only">(current)</span></a>
        			</li>
      			</ul>
      			<%
      		}
      %>
      
      
    </div>
  </div>
</nav>
<!--   Core JS Files   -->
<script src="assets/js/core/jquery.min.js" type="text/javascript"></script>
<script src="assets/js/core/popper.min.js" type="text/javascript"></script>
<script src="assets/js/core/bootstrap-material-design.min.js" type="text/javascript"></script>
<script src="assets/js/plugins/moment.min.js"></script>
<!--	Plugin for the Datepicker, full documentation here: https://github.com/Eonasdan/bootstrap-datetimepicker -->
<script src="assets/js/plugins/bootstrap-datetimepicker.js" type="text/javascript"></script>
<!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
<script src="assets/js/plugins/nouislider.min.js" type="text/javascript"></script>
<!--  Google Maps Plugin  -->
<!-- Place this tag in your head or just before your close body tag. -->
<script async defer src="https://buttons.github.io/buttons.js"></script>
<!-- Control Center for Material Kit: parallax effects, scripts for the example pages etc -->
<script src="assets/js/material-kit.js?v=2.0.6" type="text/javascript"></script>
</body>
</html>