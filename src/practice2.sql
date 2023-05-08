select * from student;

select * from student where Status = true;

select * from subject where Credit <= 10;

select *
from class
    join student s on class.ClassID = s.ClassID
where class.ClassName = 'A1';

select student.StudentID, StudentName, SubName, Mark
from student
left join mark on student.StudentID = mark.StudentID
left join subject s on mark.SubID = s.SubID
where SubName = 'CF';