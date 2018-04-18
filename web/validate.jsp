<%-- 
    Document   : validate
    Created on : 7 Apr, 2018, 10:29:26 AM
    Author     : A
--%>

<%@page import="java.lang.String"%>
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
        <title>Validation</title>
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
            </div>
        </nav>
        <%
            int flag=0;
            String unm=request.getParameter("username");
            String pswd=request.getParameter("password");
            session.setAttribute("unm",unm);
            session.setAttribute("pswd",pswd);
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/blogdb","root","");
            Statement stmt=con.createStatement();
            ResultSet rs=stmt.executeQuery("select * from blog");
            while(rs.next())
            {
                if((rs.getString(2).equals(unm))&&(rs.getString(3).equals(pswd)))
                {
                    flag=1;
                    break;
                }
                else
                    continue;
              
            }
            if(flag==1)
            response.sendRedirect("myprofile.jsp");
            else
            out.println("Incorrect username or password.");
        %>
    </body>
</html>
