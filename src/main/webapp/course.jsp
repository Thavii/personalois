<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Courses</title>
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

<h1>Table of All Courses</h1>

<%

    Connection c = null;

    try {

        String url = "jdbc:postgresql://aws-0-eu-central-1.pooler.supabase.com:6543/postgres?prepareThreshold=0";
        String username = "postgres.ccrgdkpdjdccgocojdtc";
        String password = "vmR4T7ylGljsgSLv";
        Class.forName("org.postgresql.Driver");

        c = DriverManager.getConnection(url, username, password);
        c.setAutoCommit(false);

        Statement selectStatement = c.createStatement(
                ResultSet.TYPE_SCROLL_SENSITIVE,
                ResultSet.CONCUR_READ_ONLY
        );

        ResultSet resultSet = selectStatement.executeQuery(
                "SELECT course.course_id, course.course_name, course.course_code, " +
                        "teacher.first_name, teacher.last_name " +
                        "FROM course " +
                        "LEFT JOIN teacher ON course.teacher_id = teacher.teacher_id;"
        );

        resultSet.beforeFirst();

%>
<table border=1>
    <tr>
        <td bgcolor=eeeeee><b>Course ID</b></td>
        <td bgcolor=eeeeee><b>Course Name</b></td>
        <td bgcolor=eeeeee><b>Course Code</b></td>
        <td bgcolor=eeeeee><b>Lecturer First Name</b></td>
        <td bgcolor=eeeeee><b>Lecturer Last Name</b></td>
    </tr>
    <%

        while (resultSet.next()) {
    %>
    <tr>
        <td><%= resultSet.getString("course_id") %></td>
        <td><%= resultSet.getString("course_name") %></td>
        <td><%= resultSet.getString("course_code") %></td>
        <td><%= resultSet.getString("first_name") != null ? resultSet.getString("first_name") : "N/A" %></td>
        <td><%= resultSet.getString("last_name") != null ? resultSet.getString("last_name") : "N/A" %></td>
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

