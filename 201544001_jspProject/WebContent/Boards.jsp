<%@page import="DAO.memberDAO"%>
<%@page import="Controller.MyUtill"%>
<%@page import="model.board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="head.jsp"></jsp:include>
<%
	List<board> list = (List<board>)session.getAttribute("BoardList");
	memberDAO dao = memberDAO.getInstance();
	
	MyUtill util = new MyUtill();
	String pageNum = request.getParameter("pageNum");
	int currentPage = 1;
	if(pageNum != null)
	{
		currentPage = Integer.parseInt(pageNum);
	}
	
	int dataCount = list.size();
	int numpage = 10;
	

	int totalpage = util.getPageCount(numpage, dataCount);
	if(currentPage > totalpage)
	{
		currentPage = totalpage;
	}
	int start = (currentPage-1)*numpage+1;
	int end = currentPage*numpage;
	
	session.setAttribute("start", start);
	session.setAttribute("end", end);
	
	String listUrl = "Boards.jsp";
	String pageindexList = util.pageindexList(currentPage, totalpage, listUrl);
%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
</script>
<script type="text/javascript">
	function Pwchek(pw) {
		
		if(pw == null)
		{
			return true;
		}
		else
		{
			var PaW = prompt("비밀번호");
			if(pw == PaW)
			{
				return true;
			}
			else
			{
				return false;
			}
		}
	}
</script>

<title>Insert title here</title>
</head>
<body>
<jsp:include page="HeadMenu.jsp"></jsp:include>

<table class="table">
    <thead>
        <tr>
            <th class="text-left">게시글번호</th>
            <th>제목</th>
            <th class="text-right">닉네임</th>
        </tr>
    </thead>
    <tbody>
    	<c:forEach var="room" items="${BoardList}" begin="${start-1 }" end="${end-1 }">
        	<tr>
        	    <td class="text-left">${room.getBoard_no() }</td>
        	    <td>
        	    	<a href="Board.jsp?Board_no=${room.getBoard_no()}" onclick="return Pwchek(${room.getBoard_pw()})">
        	    		${room.getBoard_name() }
        	    	</a>
        	    </td>
        	    <c:set var="id" value="${room.getID()}"></c:set>
        	    <td class="text-right"><%=dao.getNick(pageContext.getAttribute("id").toString()) %></td>
        	</tr>
        </c:forEach>
    </tbody>
</table>


<nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
    <%=pageindexList %>
  </ul>
</nav>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>