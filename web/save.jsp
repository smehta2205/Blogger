<%-- 
    Document   : save
    Created on : 12 Apr, 2018, 6:02:26 PM
    Author     : A
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Save</title>
    </head>
    <body>
        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/blogdb","root","");
            String etitle=request.getParameter("title");
            String text=request.getParameter("text");
            String title=(String)session.getAttribute("title");
            String name=(String)session.getAttribute("unm");
            PreparedStatement pst=con.prepareStatement("update blog set title=?,text=? where username=? and title=?");
            pst.setString(1,etitle);
            pst.setString(2,text);
            pst.setString(3,name);
            pst.setString(4,title);
            pst.executeUpdate();
            response.sendRedirect("myprofile.jsp");
        %>
    </body>
</html>
