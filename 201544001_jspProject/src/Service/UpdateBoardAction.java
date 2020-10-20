package Service;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.boardDAO;
import model.board;

public class UpdateBoardAction implements CommandHandler {

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
		board board = (board)request.getSession().getAttribute("board");
		
		String title = request.getParameter("Title");
		String content = request.getParameter("Board_content");
		
		board.setBoard_name(title);
		board.setBoard_content(content);
		
		dao.UpdateBoard(board);
		
		return "Menu";
	}
}
