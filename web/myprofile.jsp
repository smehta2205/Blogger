<%-- 
    Document   : myprofile
    Created on : 9 Apr, 2018, 9:50:45 AM
    Author     : A
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <title>My Profile</title>
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
            
            String name=(String)session.getAttribute("unm"); 
            String password=(String)session.getAttribute("pswd"); 
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/blogdb","root","");
            out.println("<a href='createblog.jsp'>Create New Blog</a>");
            PreparedStatement pstmt=con.prepareStatement("select * from blog where username=?");
            pstmt.setString(1,name);
            ResultSet rs=pstmt.executeQuery();
            while(rs.next())
            {   
                session.setAttribute("title",rs.getString(4));
                if(rs.getString(4)==null)
                    continue;
                out.println("<h2><u>"+rs.getString(4)+"</u></h2>"+"<h6><a href='edit.jsp'>edit</a></h6><h6><a href='delete.jsp'>delete</a></h6>");
                out.println("<h4>"+rs.getString(5)+"</h4>");
            }
        %>
    </body>
</html>
