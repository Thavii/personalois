<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Insert A Course</title>
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

<h1>Please Insert a New Course!</h1>

<form action="${pageContext.request.contextPath}/courseINSERTed.jsp" method="get">
    <table>
        <tr>
            <td>Course Name :
            <td><input type="text" name="course_name"></td>
        </tr>

       <tr>
            <td>Course Code:
            <td><input type="text" name="course_code"></td>
       </tr>
        <tr>
           <td>Lecturer
           <td>
               <select id="lecturerSelect" name="lecturer">

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
                                   "Select * from teacher;"
                           );

                           resultSet.beforeFirst();

                           while (resultSet.next()){
                   %>
                   <option value="<%= resultSet.getString("teacher_id") %>">
                       <%= resultSet.getString("first_name") %>
                       <%= resultSet.getString("last_name") %>
                   </option>
                   <%
                           }

                           selectStatement.close();
                           c.commit();
                           c.close();

                       } catch (Exception e) {
                           e.printStackTrace();
                           System.err.println(e.getClass().getName() +": " + e.getMessage());
                           System.exit(0);
                       }

                   %>
               </select>
           </td>
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