<%-- 
    Document   : createblog
    Created on : 13 Apr, 2018, 9:28:00 PM
    Author     : A
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adding new blog</title>
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
        
        <form action="newblog.jsp" method="POST">
            Title:<textarea rows="5" cols="20" name="title"></textarea>
            <br>
            <br>
            Text:<textarea rows="10" cols="50" name="text"></textarea>
            <br>
            <br>
            <input type="submit" value="Save">
        </form>
        <% 
            String name=(String)session.getAttribute("unm"); 
            String password=(String)session.getAttribute("pswd"); 
        %>
    </body>
</html>
