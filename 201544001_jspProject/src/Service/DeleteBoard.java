package Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.boardDAO;
import model.board;

public class DeleteBoard implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		boardDAO dao = boardDAO.getInstance();
		board Board = (board)request.getSession().getAttribute("board");
		
		int Board_no = Board.getBoard_no();
		
		dao.DeleteBoard(Board_no);
		
		return "Menu";
	}
}
