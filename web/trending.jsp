<%-- 
    Document   : trending
    Created on : 14 Apr, 2018, 11:00:45 AM
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
        <title>Trending</title>
    </head>
    <body>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
            <div class="navbar-header">
            <a class="navbar-brand" href="#">Blog</a>
            </div>
            <ul class="nav navbar-nav">
            
            <li><a href="trending.jsp">Trending</a></li>
            
            </ul>
            </div>
        </nav>
        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/blogdb","root","");
            Statement stmt=con.createStatement();
            ResultSet rs=stmt.executeQuery("select * from blog");
            while(rs.next())
            {
                if(rs.getString(4)==null)
                    continue;
                out.println("<h2><b>"+rs.getString(4)+"</b></h2> by "+rs.getString(2));
                out.println("<br>");
            }
        %>
    </body>
</html>
