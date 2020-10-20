<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <!--     Fonts and icons     -->
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
  <!-- Material Kit CSS -->
  <link href="assets/css/material-kit.css?v=2.0.6" rel="stylesheet" />

  
<title></title>
</head>
<body>
  <%
 	 	Enumeration<String> en = session.getAttributeNames();
  		boolean check = false;
  		while(en.hasMoreElements())
  		{
  			if(!en.nextElement().equals("loginch"))
  			{
  				check = true;
  			}
  		}
  		if(!check)
  		{
  				session.setAttribute("loginch", "false");
  		}
  		
  %>
</body>
</html>