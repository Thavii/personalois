<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Courses</title>
</head>
<body>

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>

<h1>Table of All Homework
</h1>

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
		   		"Select * from homework;"
		   );

        resultSet.beforeFirst();

        %> <table border=1>
    <tr>
        <td bgcolor=eeeeee><b>homework_name</b></td>
        <td bgcolor=eeeeee><b>homework_deadline</b></td>
        <td bgcolor=eeeeee><b>homework_weight</b></td>
        <td bgcolor=eeeeee><b>course_id</b></td>

    </tr>
    <%

        while (resultSet.next()){
    %>
    <tr>
        <td>
            <%= resultSet.getString("homework_name") %>
        </td>
        <td>
            <%= resultSet.getString("homework_deadline") %>
        </td>
        <td>
            <%= resultSet.getString("homework_weight") %>
        </td>
        <td>
            <%= resultSet.getString("course_id") %>
        </td>
    </tr>
    <%
        }

    %> </table>

<br>
<a href="index.jsp"><b>Back to the Main Menu</b></a>

    <%

        selectStatement.close();
        c.commit();
        c.close();

} catch (Exception e) {
	e.printStackTrace();
    System.err.println(e.getClass().getName() +": " + e.getMessage());
    System.exit(0);
}

%>

<body>
</html>