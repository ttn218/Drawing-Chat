package Service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.chatDAO;
import model.ChatList;

public class PaintRooms implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		chatDAO dao = chatDAO.getInstance();
		List<ChatList> list = dao.SelectList("±×¸²");
		if(list.isEmpty())
		{
			return "Menu";
		}
		request.getSession().setAttribute("Chatlist", list);
		return "Rooms";
	}
}
