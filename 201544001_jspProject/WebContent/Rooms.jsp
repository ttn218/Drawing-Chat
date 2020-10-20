<%@page import="Controller.MyUtill"%>
<%@page import="model.ChatList"%>
<%@page import="model.chat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="head.jsp"></jsp:include>
<%
	List<ChatList> list = (List<ChatList>)session.getAttribute("Chatlist");
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
	
	String listUrl = "Rooms.jsp";
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
            <th class="text-center">방번호</th>
            <th>채팅방 이름</th>
            <th>타입</th>
            <th>생성자</th>
            <th class="text-left">생성일</th>
            <th class="text-right">참가</th>
        </tr>
    </thead>
    <tbody>
    	<c:forEach var="room" items="${Chatlist}" begin="${start-1 }" end="${end-1 }">
        	<tr>
        	    <td class="text-center">${room.getChat_no() }</td>
        	    <td>${room.getChat_name() }</td>
        	    <td>${room.getChat_type() }</td>
        	    <td>${room.getNickname() }</td>
        	    <td class="text-left">${room.getCreateDate() }</td>
        	    <td class="td-actions text-right">
        	        <a href="Room.jsp?Chat_no=${room.getChat_no()}" class="btn btn-primary btn-lg" role="button"  onclick="return Pwchek(${room.getChat_pw()})">
        	            <i class="material-icons">chat</i>
        	        </a>
        	    </td>
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