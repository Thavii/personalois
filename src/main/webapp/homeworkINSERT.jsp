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

<h1>Please Insert a New Homework!</h1>

<form action="http://localhost:8080/personalois_war_exploded/homeworkINSERTed.jsp" method="get">
    <table>

        <tr>
            <td>Homework Name:
            <td><input type="text" name="homework_name"></td>
        </tr>
        <tr>
            <td>Homework Deadline:
            <td><input type="text" name="homework_deadline" VALUE="2025-12-30"></td>
        </tr>
        <tr>
            <td>Homework Weight:
            <td><input type="text" name="homework_weight"></td>
        </tr>
        <tr>
            <td>Course ID:
            <td><input type="text" name="course_id"></td>
        </tr>

 <%--
        <tr>
            <td>Course start date:
            <td><input type="text" name="start_date" value="2024-12-12"></td>
        </tr>   --%>



<%--       <tr>
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
                                   "Select * from course;"
                           );

                           resultSet.beforeFirst();

                           while (resultSet.next()){
                   %>
                   <option value="<%= resultSet.getString("id") %>">
                       <%= resultSet.getString("course_name") %>
                       <%= resultSet.getString("course_code") %>
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

        --%>


   </table>
   <br>
   <input type="submit" value="Submit">
</form>

<body>
</html>