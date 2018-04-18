<%-- 
    Document   : newuser
    Created on : 6 Apr, 2018, 4:45:36 PM
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
        <title>New User</title>
    </head>
    <body>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
            <div class="navbar-header">
            <a class="navbar-brand" href="#">Blog</a>
            </div>
            <ul class="nav navbar-nav">
            <li class="active"><a href="#">Home</a></li>
            <li><a href="trending.jsp">Trending</a></li>
            <li><a href="#">Help</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
            <!--<li><a href="signup.html"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>-->
            <li><a href="login.html"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
            </ul>
            </div>
        </nav>
        <% 
            int flag=0;
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/blogdb","root","");
            String unm=request.getParameter("username");
            String pswd=request.getParameter("password");
            //out.println(unm+" "+pswd);
            Statement stmt=con.createStatement();
            ResultSet rs=stmt.executeQuery("select * from blog");
            while(rs.next())
            {
                if(rs.getString(2).equals(unm))
                {
                    flag=1;
                    break;
                }
                else
                    flag=0;
            }
            if(flag==0)
            {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/blogdb","root","");
                PreparedStatement pst=con1.prepareStatement("insert into blog(username,password)"+"values(?,?)");
                pst.setString(1, unm);
                pst.setString(2,pswd);
                pst.execute();
                //out.println(unm+" "+pswd);
                out.println("You have signed in successfully!");
            }
            else
            out.println("Username already exists...Try another!!");

        %>
    </body>
</html>
