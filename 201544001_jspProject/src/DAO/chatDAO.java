package DAO;

import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.ChatList;
import model.chat;
import model.chat_member;


public class chatDAO {
	private static chatDAO instance = new chatDAO();
	private chatDAO() {
		// TODO Auto-generated constructor stub
	}
	public static chatDAO getInstance()
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
	public int ChatInsert(chat chat){
		
		return session.insert("chatns.insert", chat);
	}
	public int Chat_memberInsert(chat_member chat_member){
		
		return session.insert("chatmemberns.insert", chat_member);
	}
	public Integer Chat_noMax(String Chat_type)
	{
		return session.selectOne("chatns.Chat_NoMax", Chat_type);
	}
	public chat SelectChat(int Chat_no)
	{
		return session.selectOne("chatns.Select",Chat_no);
	}
	public List<chat> SelectChatList(String Chat_type)
	{
		return session.selectList("chatns.SelectList",Chat_type);
	}
	public List<ChatList> SelectList(String Chat_type)
	{
		return session.selectList("chatns.SelectChatList",Chat_type);
	}
	
}
