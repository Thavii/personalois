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

<h1>Table of All Exams
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
		   		"Select * from exam;"
		   );

        resultSet.beforeFirst();

        %> <table border=1>
    <tr>
        <td bgcolor=eeeeee><b>exam_id</b></td>
        <td bgcolor=eeeeee><b>exam_platform</b></td>
        <td bgcolor=eeeeee><b>exam_weight</b></td>

    </tr>
    <%

        while (resultSet.next()){
    %>
    <tr>
        <td>
            <%= resultSet.getString("exam_id") %>
        </td>
        <td>
            <%= resultSet.getString("exam_platform") %>
        </td>
        <td>
            <%= resultSet.getString("exam_weight") %>

        </td>
    </tr>
    <%
        }

    %> </table>

<br>
<a href="Index.html"><b>Back to the Main Menu</b></a>

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