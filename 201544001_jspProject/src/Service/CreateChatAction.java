package Service;

import java.io.UnsupportedEncodingException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.chatDAO;
import model.chat;
import model.chat_member;
import model.member;

public class CreateChatAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		chatDAO dao = chatDAO.getInstance();
		chat chat = new chat();
		chat_member chat_member = new chat_member();
		Date date = new Date();
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		member member = (member)request.getSession().getAttribute("info");
		String Chat_name = request.getParameter("ChatName");
		String Chat_pw = request.getParameter("Chatpw");
		String Type = request.getParameter("Type");
		Integer Chat_no = dao.Chat_noMax(Type);
		if(Chat_no == null)
		{
			switch(Type)
			{
				case "게임":
					Chat_no = 1001;
					break;
				case "잡담":
					Chat_no = 2001;
					break;
				case "그림":
					Chat_no = 3001;
					break;
			}
		}
		else
		{
			Chat_no++;
		}
		chat.setChat_no(Chat_no);
		chat.setChat_name(Chat_name);
		if(!Chat_pw.isEmpty())
			chat.setChat_pw(Chat_pw);
		chat.setChat_type(Type);
		chat.setCreateDate(date);
		
		dao.ChatInsert(chat);
		
		chat_member.setChat_no(Chat_no);
		chat_member.setCreate("생성자");
		chat_member.setID(member.getID());
		
		dao.Chat_memberInsert(chat_member);
		
		
		
		return "Menu";
	}
}
