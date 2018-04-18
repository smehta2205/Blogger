<%-- 
    Document   : edit
    Created on : 12 Apr, 2018, 5:14:05 PM
    Author     : A
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit</title>
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
            String name=(String)session.getAttribute("unm"); 
            String title=(String)session.getAttribute("title");
            PreparedStatement pst=con.prepareStatement("select * from blog where username=? and title=?");
            pst.setString(1,name);
            pst.setString(2,title);
            ResultSet rs=pst.executeQuery();
            while(rs.next())
            {
                out.println("<form action='save.jsp' method='POST'>");
                out.println("Title:<textarea rows=5 cols=10 name='title'>"+rs.getString(4) +"</textarea>");
                out.println("Text:<textarea rows=6 cols=20 name='text'>"+rs.getString(5) +"</textarea>");
                out.println("<input type='submit' value='Submit'>");
            }
        %>
    </body>
</html>
