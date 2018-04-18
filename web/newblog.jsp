<%-- 
    Document   : newblog
    Created on : 13 Apr, 2018, 9:03:58 PM
    Author     : A
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New Blog</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
            <div class="navbar-header">
            <a class="navbar-brand" href="#">Blog</a>
            </div>
            <ul class="nav navbar-nav">
            <li><a href="allblogs.jsp">All blogs</a></li>
            <li><a href="trending.jsp">Trending</a></li>
            <li><a href="myprofile.jsp">My Profile</a></li>
            </ul>
            </div>
        </nav>
        
        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/blogdb","root","");
            String title=request.getParameter("title");
            String text=request.getParameter("text");
            String name=(String)session.getAttribute("unm"); 
            String password=(String)session.getAttribute("pswd"); 
            PreparedStatement pst=con.prepareStatement("insert into blog(username,password,title,text)"+"values(?,?,?,?)");
            pst.setString(1, name);
            pst.setString(2, password);
            pst.setString(3, title);
            pst.setString(4, text);
            pst.execute();
            response.sendRedirect("myprofile.jsp");
        %>
    </body>
</html>
