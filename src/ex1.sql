use quanlysinhvien;

select * from student where left(StudentName, 1) = 'h';

select * from class where extract(month from StartDate) = 12;

select * from subject where Credit >= 3 and Credit <= 5;

update student
set ClassID = 2
where StudentName = 'Hung';

select StudentName, SubName, Mark
from student
left join mark m on student.StudentID = m.StudentID
left join subject s on s.SubID = m.SubID
order by Mark desc, StudentName asc;