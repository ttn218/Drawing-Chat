package DAO;

import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.member;

public class memberDAO {
	private static memberDAO instance = new memberDAO();
	private memberDAO() {}
	
	public static memberDAO getInstance()
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
	public int Insert(member member){
		
		return session.insert("memberns.insert", member);
	}
	public boolean selectID(String ID)
	{
		member mem= session.selectOne("memberns.selectID", ID);
		if(mem == null)
		{
			return false;
		}
		return true;
	}
	public boolean selectnick(String nickname)
	{
		member mem= session.selectOne("memberns.selectNick", nickname);
		if(mem == null)
		{
			return false;
		}
		return true;
	}
	public List<member> selectList()
	{
		return session.selectList("memberns.list");
	}
	
	public boolean Logincheck(member member)
	{
		member mem = session.selectOne("memberns.login",member);
		if(mem == null)
		{
			return true;
		}
		return false;
	}
	public member selectLogin(String ID)
	{
		return session.selectOne("memberns.selectID", ID);
	}
	public int updatemember(member member)
	{
		
		return session.update("memberns.update", member);
	}
	public void deletemember(String ID) 
	{
		session.delete("memberns.Delete",ID);
	}
	public String getNick(String ID)
	{
		return session.selectOne("memberns.GetNick",ID);
	}
	
	
}
