<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Insert A Lecturer</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
<table>
    <tr>
        <td>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>

<h1>Please Insert a New Lecturer!</h1>

<form action="${pageContext.request.contextPath}/teacherINSERTed.jsp" method="get">
    <table>

        <tr>
            <td>First Name:
            <td><input type="text" name="first_name"></td>
        </tr>
        <tr>
            <td>Last Name:
            <td><input type="text" name="last_name"></td>
        </tr>

   </table>
   <br>
   <input type="submit" value="Submit">
</form>
        </td>
    </tr>
</table>
<body>
</html>