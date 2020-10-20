
<%@page import="java.io.IOException"%>
<%@page import="java.io.File"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.io.ByteArrayInputStream"%>
<%@page import="java.util.Base64"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="model.chat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <%
 	String filePath = "C:/jspworkspace/201544001_jspProject/WebContent/WEB-INF/image/room";
	String fileName = "/ChatRoom" + ((chat)session.getAttribute("chat")).getChat_no();
	String imgstr = request.getParameter("str").split(",")[1];
	BufferedImage image = null;
	
	
	Base64.Decoder decoder = Base64.getDecoder();
	System.out.print(imgstr);
	byte[] imageByte = decoder.decode(imgstr);
	
	
	try {
		ByteArrayInputStream bis = new ByteArrayInputStream(imageByte);
		image = ImageIO.read(bis);
		bis.close();
		File file = new File(filePath + fileName + ".png");
		file.createNewFile();
		ImageIO.write(image, "png", file);
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
 %>
</body>
</html>