<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Delete Student</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
<table>
    <tr>
        <td>
<%
    String studentId = request.getParameter("student_id");

    if (studentId != null && !studentId.isEmpty()) {
        String url = "jdbc:postgresql://aws-0-eu-central-1.pooler.supabase.com:6543/postgres?prepareThreshold=0";
        String username = "postgres.ccrgdkpdjdccgocojdtc";
        String password = "vmR4T7ylGljsgSLv";

        try (Connection c = DriverManager.getConnection(url, username, password);
             PreparedStatement pstmt = c.prepareStatement("DELETE FROM student WHERE student_id = ?")) {

            pstmt.setInt(1, Integer.parseInt(studentId));
            int rowsDeleted = pstmt.executeUpdate();

            if (rowsDeleted > 0) {
%>
<p>Student with ID <%= studentId %> has been deleted successfully!</p>
<%
} else {
%>
<p>No student found with ID <%= studentId %>.</p>
<%
    }
} catch (Exception e) {
    e.printStackTrace();
%>
<p>Error: <%= e.getMessage() %></p>
<%
    }
} else {
%>
<p>Invalid student ID. Please try again.</p>
<%
    }
%>

<br>
<a href="studentDEL.jsp"><b>Back to Students</b></a>
</td>
</tr>
</table>
</body>
</html>
