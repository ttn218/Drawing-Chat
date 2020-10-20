<%@page import="DAO.memberDAO"%>
<%@ page contentType="text/plain; charset=UTF-8" %>
<%@ page import="model.member" %>
<%
		memberDAO dao = memberDAO.getInstance();
		String str = "FALSE";
		
		
		if(dao.selectID(request.getParameter("id")))
		{
			str = "false";
		}
		else
		{
			str = "true";
		}
		
		out.print(str);
%>