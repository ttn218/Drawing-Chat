package Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.memberDAO;
import model.member;

public class deleteMember implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		memberDAO dao = memberDAO.getInstance();
		member mem = (member)request.getSession().getAttribute("info");
		
		dao.deletemember(mem.getID());
		return "Menu";
	}
}
