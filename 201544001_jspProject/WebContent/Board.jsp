<%@page import="model.member"%>
<%@page import="DAO.memberDAO"%>
<%@page import="model.board"%>
<%@page import="DAO.boardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="head.jsp"></jsp:include>

<%
	int Board_no = Integer.parseInt(request.getParameter("Board_no"));
	boardDAO dao = boardDAO.getInstance();
	board board = dao.Selectboard(Board_no);
	memberDAO mdao = memberDAO.getInstance();
	
	String Nick = mdao.getNick(board.getID());
	member mem;
	String ID="";
	session.setAttribute("board", board);
	String loginck = session.getAttribute("loginch").toString(); 
	if(loginck == "true")
	{
		mem = (member)session.getAttribute("info");
		ID = mem.getID();
	}

%>

<title>Insert title here</title>
</head>
<body>
	<jsp:include page="HeadMenu.jsp"></jsp:include>
	<br><br><br>
	<div class="card card-nav-tabs">
		<div class="card-header card-header-primary">
    		${board.getBoard_name() }
  		</div>
  			<div class="card-body">
  				${board.getBoard_content() }
  			</div>
  			<div class="card-footer text-muted">
  				<div class="row">
  					<div class="col">
    					<p class="h6">작성자 : <%=Nick %></p>
    				</div>
    				<%
            			if(ID.equals(board.getID())){
            		%>
    					<div class="col-md-3">
    						<a href="UpdateBoard.do" class="btn btn-info btn-sm">수정</a>
    					</div>
    					<div class="col-md-3">
    						<a href="DeleteBoard.do" class="btn btn-info btn-sm">삭제</a>
    					</div>
    				<%
            			}
            		%>
            		<div class="col" align="right" >
            			<a href="main.do" class="btn btn-info btn-sm">확인</a>
            		</div>
    			</div>
  			</div>
		</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>