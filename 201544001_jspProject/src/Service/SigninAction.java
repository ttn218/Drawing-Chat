package Service;

import java.io.UnsupportedEncodingException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.memberDAO;
import model.member;

public class SigninAction implements CommandHandler {

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
		
		member member = new member();
		Date date = new Date();
		member.setID(request.getParameter("id"));
		member.setPw(request.getParameter("pw"));
		member.setName(request.getParameter("name"));
		member.setNickname(request.getParameter("nickname"));
		member.setTel(request.getParameter("tel"));
		member.setEmail(request.getParameter("eamil"));
		member.setAddr(request.getParameter("addr"));
		member.setLevel(1);
		member.setReg_date(date);
		
		dao.Insert(member);
		
		return "Login";
	}
}
