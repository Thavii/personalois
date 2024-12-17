<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <title>Delete Homework</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
<table>
  <tr>
    <td>
<%
  String homeworkId = request.getParameter("homework_id");

  if (homeworkId != null && !homeworkId.isEmpty()) {
    String url = "jdbc:postgresql://aws-0-eu-central-1.pooler.supabase.com:6543/postgres?prepareThreshold=0";
    String username = "postgres.ccrgdkpdjdccgocojdtc";
    String password = "vmR4T7ylGljsgSLv";

    try (Connection c = DriverManager.getConnection(url, username, password);
         PreparedStatement pstmt = c.prepareStatement(
                 "DELETE FROM homework WHERE homework_id = ?"
         )) {

      pstmt.setInt(1, Integer.parseInt(homeworkId));
      int rowsDeleted = pstmt.executeUpdate();

      if (rowsDeleted > 0) {
%>
<p>Homework has been deleted successfully!</p>
<%
} else {
%>
<p>No such homework found.</p>
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
<p>Invalid homework ID. Please try again.</p>
<%
  }
%>

<br>
<a href="homework.jsp"><b>Back to Homeworks</b></a>
    </td>
  </tr>
</table>
</body>
</html>
