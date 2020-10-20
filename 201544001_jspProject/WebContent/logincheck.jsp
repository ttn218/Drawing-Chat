<%@ page import="DAO.memberDAO"%>
<%@ page contentType="text/plain; charset=UTF-8" %>
<%@ page import="model.member" %>
<%
		memberDAO dao = memberDAO.getInstance();
		member mem = new member();
		String str = "";
		String id = request.getParameter("id");
		mem.setID(id);
		mem.setPw(request.getParameter("pw"));
		
		if(!dao.Logincheck(mem))
		{
			str = "true";
			mem = dao.selectLogin(id);
			session.setAttribute("loginch", "true");
			session.setAttribute("info", mem);
		}
		else
		{
			str = "false";
			session.setAttribute("loginch", "false");
		}
		
		out.print(str);
%>