<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Homeworks</title>
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

<h1>Table of All Homeworks</h1>

<%
    Connection c = null;
    try {
        String url = "jdbc:postgresql://aws-0-eu-central-1.pooler.supabase.com:6543/postgres?prepareThreshold=0";
        String username = "postgres.ccrgdkpdjdccgocojdtc";
        String password = "vmR4T7ylGljsgSLv"; // Your password
        Class.forName("org.postgresql.Driver");

        c = DriverManager.getConnection(url, username, password);
        c.setAutoCommit(false);

        Statement selectStatement = c.createStatement(
                ResultSet.TYPE_SCROLL_SENSITIVE,
                ResultSet.CONCUR_READ_ONLY
        );

        // READ DATA
        ResultSet resultSet = selectStatement.executeQuery(
                "SELECT homework.homework_id, " +
                        "       homework.homework_name, " +
                        "       homework.homework_deadline, " +
                        "       homework.homework_weight, " +
                        "       course.course_name " +
                        "FROM homework " +
                        "JOIN course ON homework.course_id = course.course_id " +
                        "ORDER BY homework.homework_deadline;"
        );

        resultSet.beforeFirst();
        int counter = 1; // Initialize the counter for numbering rows
%>

<table border="1">
    <tr>
        <td bgcolor="eeeeee"><b>No.</b></td>
        <td bgcolor="eeeeee"><b>Homework Name</b></td>
        <td bgcolor="eeeeee"><b>Deadline</b></td>
        <td bgcolor="eeeeee"><b>Points</b></td>
        <td bgcolor="eeeeee"><b>Course Name</b></td>
        <td bgcolor="eeeeee"><b>Action</b></td>
    </tr>
    <%
        while (resultSet.next()) {
    %>
    <tr>
        <td><%= counter++ %></td>
        <td><%= resultSet.getString("homework_name") %></td>
        <td><%= resultSet.getString("homework_deadline") %></td>
        <td><%= resultSet.getString("homework_weight") %></td>
        <td><%= resultSet.getString("course_name") %></td>
        <td>
            <form action="deleteHomework.jsp" method="post" style="display:inline;">
                <input type="hidden" name="homework_id" value="<%= resultSet.getString("homework_id") %>" />
                <input type="submit" value="Delete" />
            </form>
        </td>
    </tr>
    <%
        }
    %>
</table>

<br>
<a href="index.jsp"><b>Back to the Main Menu</b></a>

<%
        selectStatement.close();
        c.commit();
        c.close();
    } catch (Exception e) {
        e.printStackTrace();
        System.err.println(e.getClass().getName() + ": " + e.getMessage());
        System.exit(0);
    }
%>
</td>
</tr>
</table>
</body>
</html>
