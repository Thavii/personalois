<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Insert A Course</title>
</head>
<body>

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>

<h1>Please Insert a New Teacher!</h1>

<form action="http://localhost:8080/personalois_war_exploded/teacherINSERTed.jsp" method="get">
    <table>

        <tr>
            <td>First Name:
            <td><input type="text" name="first_name"></td>
        </tr>
        <tr>
            <td>Last NAme:
            <td><input type="text" name="last_name"></td>
        </tr>

   </table>
   <br>
   <input type="submit" value="Submit">
</form>

<body>
</html>