package Service;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.memberDAO;
import model.member;

public class infoUpdate implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		memberDAO dao = memberDAO.getInstance();
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		member mem = (member)request.getSession().getAttribute("info");
		String nick = request.getParameter("nickname");
		String tel = request.getParameter("tel");
		String addr = request.getParameter("addr");
		
		if(!nick.isEmpty())
		{
			mem.setNickname(nick);
		}
		if(!tel.isEmpty())
		{
			mem.setTel(tel);
		}
		if(!addr.isEmpty())
		{
			mem.setAddr(addr);
		}
		
		
		dao.updatemember(mem);
		
		return "Menu";
	}
}
