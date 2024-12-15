<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Homework List</title>
</head>
<body>
<h1>Homeworks for the Selected Student</h1>

<%
    String studentId = request.getParameter("student"); // Retrieve student_id from form

    if (studentId != null && !studentId.equals("none")) {
        String url = "jdbc:postgresql://aws-0-eu-central-1.pooler.supabase.com:6543/postgres?prepareThreshold=0";
        String username = "postgres.ccrgdkpdjdccgocojdtc";
        String password = "vmR4T7ylGljsgSLv";

        try (Connection c = DriverManager.getConnection(url, username, password);
             PreparedStatement pstmt = c.prepareStatement(
                     "SELECT " +
                             "    h.homework_name, " +
                             "    h.homework_deadline, " +
                             "    h.homework_weight, " +
                             "    c.course_name " +
                             "FROM homework h " +
                             "JOIN course c ON h.course_id = c.course_id " +
                             "JOIN student_course sc ON c.course_id = sc.course_id " +
                             "JOIN student s ON sc.student_id = s.student_id " +
                             "WHERE s.student_id = ? " +
                             "ORDER BY h.homework_deadline ASC"
             )) {

            pstmt.setInt(1, Integer.parseInt(studentId)); // Set the parameter for the query

            ResultSet rs = pstmt.executeQuery();
            int counter = 1; // Initialize a counter for serial numbers
%>
<table border="1">
    <tr>
        <th>No.</th>
        <th>Homework Name</th>
        <th>Deadline</th>
        <th>Points</th>
        <th>Course Name</th>
    </tr>
    <%
        while (rs.next()) {
    %>
    <tr>
        <td><%= counter++ %></td>
        <td><%= rs.getString("homework_name") %></td>
        <td><%= rs.getDate("homework_deadline") %></td>
        <td><%= rs.getDouble("homework_weight") %></td>
        <td><%= rs.getString("course_name") %></td>
    </tr>
    <%
        }
    %>
</table>
<%
} catch (Exception e) {
    e.printStackTrace();
%>
<p>Error: <%= e.getMessage() %></p>
<%
    }
} else {
%>
<p>No student selected. Please go back and choose a valid student.</p>
<%
    }
%>

<br>
<a href="index.jsp"><b>Back to the Main Menu</b></a>

</body>
</html>
