<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
<head>
    <meta charset="UTF-8">



    <table>
        <tr>
            <td>



    <title>Personal ÕIS</title>

    <h1>Personal ÕIS</h1>
    <h3>Inserted data reading</h3>

    <ul>  Here you can see all the inserted Courses.
        <li><a href="course.jsp">Course</a>
            <br><br>Here you can see all the inserted Homeworks sorted by deadline date.
        <li><a href="homework.jsp">Homework</a>
            <br><br>Here you can see all the inserted Lecturers.
        <li><a href="teacher.jsp">Lecturer</a>
            <br><br>Here you can see all the inserted Students and delete them if needed.
            <br> To delete a student the course-student relationship has to be deleted before
        <li><a href="studentDEL.jsp">Student</a>
    </ul>


            <br>
    <h3>Inserting data</h3>
    <ul>
            Here you can insert NEW Lecturers
        <li><a href="teacherINSERT.jsp">Insert Lecturer</a>
            <br><br>Here you can insert NEW Courses. For this the Lecturer has to be already in the system.
        <li><a href="courseINSERT.jsp">Insert Course</a>
            <br><br>Here you can insert NEW Homework. For this the Lecturer has to be already in the system.
        <li><a href="homeworkINSERT.jsp">Insert Homework</a>
            <br><br>Here you can insert NEW Students.
        <li><a href="studentINSERT.jsp">Insert Student</a>
        <br><br>Here you can insert which student studies in which course.
        <li><a href="course_studentINSERT.jsp">Insert Course Students</a>
    </ul>

    <br>
    <h3>More complex useful data combinations</h3>
    <ul>
        Here you can see who studies on witch course and delete a relation if needed.
        <li><a href="course_student2.jsp">Course Students</a>
            <br><br>Here you can see what are MY homework deadlines.
        <li><a href="homeworkASK.jsp">My homeworks</a>

    </ul>

            </td>
        </tr>
    </table>

</head>
<body>

</body>
</html>