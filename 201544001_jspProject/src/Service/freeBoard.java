package Service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.boardDAO;
import model.board;

public class freeBoard implements CommandHandler {
 
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		boardDAO dao = boardDAO.getInstance();
		List<board> list = dao.SelectList("ÀÚÀ¯");
		if(list.isEmpty())
		{
			return "Menu";
		}
		request.getSession().setAttribute("BoardList", list);
		
		return "Boards";
	}
}
