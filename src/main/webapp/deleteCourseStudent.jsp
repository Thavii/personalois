<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <title>Delete Course-Student Relation</title>
</head>
<body>
<%
  String courseId = request.getParameter("course_id");
  String studentId = request.getParameter("student_id");

  if (courseId != null && studentId != null && !courseId.isEmpty() && !studentId.isEmpty()) {
    String url = "jdbc:postgresql://aws-0-eu-central-1.pooler.supabase.com:6543/postgres?prepareThreshold=0";
    String username = "postgres.ccrgdkpdjdccgocojdtc";
    String password = "vmR4T7ylGljsgSLv";

    try (Connection c = DriverManager.getConnection(url, username, password);
         PreparedStatement pstmt = c.prepareStatement(
                 "DELETE FROM student_course WHERE course_id = ? AND student_id = ?"
         )) {

      pstmt.setInt(1, Integer.parseInt(courseId));
      pstmt.setInt(2, Integer.parseInt(studentId));

      int rowsDeleted = pstmt.executeUpdate();

      if (rowsDeleted > 0) {
%>
<p>The course-student relation has been deleted successfully!</p>
<%
} else {
%>
<p>No such course-student relation found.</p>
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
<p>Invalid course or student ID. Please try again.</p>
<%
  }
%>

<br>
<a href="course_student2.jsp"><b>Back to Course-Student Relations</b></a>
</body>
</html>
