package Controller;

import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Service.CommandHandler;
/**
 * Servlet implementation class ControllerUsingFile
 */
@WebServlet(urlPatterns = "*.do",
	initParams = {@WebInitParam(name = "configFile",value="/WEB-INF/commandHandler.properties")})
public class ControllerUsingFile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	private Map<String , CommandHandler> commandHandlerMap = new HashMap<>();
    public ControllerUsingFile() {
        super();
        // TODO Auto-generated constructor stub
    }
    public void init(ServletConfig config) throws ServletException{
    	String configFile = config.getInitParameter("configFile");
    	Properties  prop = new Properties();
    	String configFilePath = config.getServletContext().getRealPath(configFile);
    	
    	try(FileReader fis = new FileReader(configFilePath)){
    		prop.load(fis);
    	}catch(IOException e)
    	{
    		throw new ServletException(e);
    	}
    	
    	Iterator<Object> ketIter = prop.keySet().iterator();
    	while(ketIter.hasNext())
    	{
    		String command = (String)ketIter.next();
    		String handlerClassName  = prop.getProperty(command);
    		try {
    			Class<?> handlerClass = Class.forName(handlerClassName);
    			CommandHandler handlerInstance = (CommandHandler)handlerClass.newInstance();
    			commandHandlerMap.put(command, handlerInstance);
    		}catch(ClassNotFoundException | InstantiationException| IllegalAccessException e)
    		{
    			throw new ServletException(e);
    		}
    	}
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		process(request,response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		process(request,response);
	}
	
	private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		//uri => /week14/main.do
	    String command = request.getRequestURI();
	    command = command.substring(request.getContextPath().length()+1);
	    
		CommandHandler handler = commandHandlerMap.get(command);
	    String viewPage =null;
		
		try {
			viewPage = handler.process(request, response);
			
		}catch(Exception e)
		{
			throw new ServletException(e);
		}
		if(viewPage != null)
		{
			if(viewPage.contains("?")) {
				
				String pram = viewPage.substring(viewPage.indexOf("?"));
				RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage + ".jsp" + pram);
				dispatcher.forward(request, response);
			}
			else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage + ".jsp");
				dispatcher.forward(request, response);
			}
		}
	}
	
	

}
