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

<h1>Please choose your name!</h1>

<form action="http://localhost:8080/personalois_war_exploded/homeworkASKed.jsp" method="get">
    <table>

        <tr>
           <td>Select your name
           <td>
               <select id="StudentSelect" name="student">
                   <option value="none" selected> </option>

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
                                   "Select * from student;"
                           );

                           resultSet.beforeFirst();

                           while (resultSet.next()){
                   %>

                   <option value="<%= resultSet.getString("student_id") %>">
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

<br>
<a href="index.jsp"><b>Back to the Main Menu</b></a>

<body>
</html>