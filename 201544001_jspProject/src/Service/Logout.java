package Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Logout implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		request.getSession().setAttribute("loginch", "false");
		request.getSession().removeAttribute("info");
		return "Menu";
	}
}
