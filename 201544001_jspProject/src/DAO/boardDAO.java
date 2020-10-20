package DAO;

import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.board;

public class boardDAO {
	private static boardDAO instance = new boardDAO();
	private boardDAO() {
		// TODO Auto-generated constructor stub
	}
	
	public static boardDAO getInstance()
	{
		return instance;
	}
	private static SqlSession session;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("/configuration.xml");
			
			SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
			session = ssf.openSession(true); // true로 설정하면 auto commit
			reader.close();
		}catch(Exception e)
		{
			System.out.println("Session 생성 에러 : " + e.getMessage());
		}
	}
	
	public board Selectboard(int Board_no)
	{
		return session.selectOne("boardns.SelectBoard",Board_no);
	}
	
	public int Insertboard(board board)
	{
		return session.insert("boardns.InsertBoard",board);
	}
	
	public List<board> SelectList(String Board_type)
	{
		return session.selectList("boardns.BoardList",Board_type);
	}
	public void DeleteBoard(int Board_no)
	{
		session.delete("boardns.DeleteBoard",Board_no);
	}
	public int UpdateBoard(board board)
	{
		return session.update("boardns.UpdateBoard",board);
	}
}
