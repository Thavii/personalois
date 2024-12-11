<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<style>
    body {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }
    table {
        border-collapse: collapse;
        width: 700px;
    }
    td {
        border: 0px solid #000;
        text-align: left;
        padding: 8px;
    }
</style>




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
            <br><br>Here you can see all the inserted Students.
        <li><a href="student.jsp">Student</a>
<%--        <br><br>Here you can see all the inserted Exams.
        <li><a href="exam.jsp">Exam</a> --%>
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
<%--            <br><br>Here you can insert NEW Exams
        <li><a href="examINSERT.jsp">Insert Exam</a> --%>
        <br><br>Here you can insert which student studies in which course.
        <li><a href="course_studentINSERT.jsp">Insert Course Students</a>
    </ul>

    <br>
    <h3>More complex useful data combinations</h3>
    <ul>
            Here you can see who studies on witch course - yes just stident_id and course_id :)
        <li><a href="course_student.jsp">Course Students</a>
            <br><br>Here you can see who studies on witch course.
        <li><a href="course_student2.jsp">Course Students 2</a>

    </ul>

            </td>
        </tr>
    </table>

</head>
<body>

</body>
</html>