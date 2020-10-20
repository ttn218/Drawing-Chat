package Service;

import java.io.UnsupportedEncodingException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.boardDAO;
import model.board;
import model.member;

public class InsertBoard implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		boardDAO dao = boardDAO.getInstance();
		board board = new board();
		Date date = new Date();
		board.setBoard_name(request.getParameter("Title"));
		board.setBoard_pw(request.getParameter("Board_pw"));
		board.setBoard_content(request.getParameter("Board_content"));
		board.setBoard_type(request.getParameter("Board_type"));
		System.out.println(board.getBoard_type());
		
		board.setCreateDate(date);
		member mem = (member)request.getSession().getAttribute("info");
		board.setID(mem.getID());
		
		dao.Insertboard(board);
		
		return "Menu";
	}
}
