-- Stored Procedure to insert a new student
-- A procedure is used here to encapsulate the logic for adding a new student to the Students table.
DELIMITER //
CREATE PROCEDURE InsertStudent(
    IN student_name VARCHAR(50),
    IN student_age INT,
    IN student_gender VARCHAR(10)
)
BEGIN
    DECLARE new_id INT;
    SELECT COALESCE(MAX(id), 0) + 1 INTO new_id FROM Students;
    INSERT INTO Students (id, name, age, gender) VALUES (new_id, student_name, student_age, student_gender);
END //
DELIMITER ;

-- Call the InsertStudent procedure
CALL InsertStudent('Ravi', 21, 'Male');

-- Function to get the age of a student by ID
-- Functions are used to encapsulate reusable logic that returns a single value, which can be used in SQL queries.
DELIMITER //
CREATE FUNCTION GetStudentAge(student_id INT) RETURNS INT
BEGIN
    DECLARE student_age INT;
    SELECT age INTO student_age FROM Students WHERE id = student_id;
    RETURN student_age;
END //
DELIMITER ;

-- Call the GetStudentAge function
SELECT GetStudentAge(1) AS AgeOfStudent1;

-- Function to get the course name by course ID
DELIMITER //
CREATE FUNCTION GetCourseName(course_id INT) RETURNS VARCHAR(50)
BEGIN
    DECLARE course_name VARCHAR(50);
    SELECT course_name INTO course_name FROM Courses WHERE course_id = course_id;
    RETURN course_name;
END //
DELIMITER ;

-- Call the GetCourseName function
SELECT GetCourseName(101) AS CourseName;

-- Function to get the number of enrollments for a student
DELIMITER //
CREATE FUNCTION CountStudentEnrollments(student_id INT) RETURNS INT
BEGIN
    DECLARE enrollment_count INT;
    SELECT COUNT(*) INTO enrollment_count FROM Enrollments WHERE id = student_id;
    RETURN enrollment_count;
END //
DELIMITER ;

-- Call the CountStudentEnrollments function
SELECT CountStudentEnrollments(1) AS EnrollmentsForStudent1;

-- Procedure to enroll a student in a course
-- This procedure is used to add a new enrollment record, encapsulating the logic for creating a new enrollment.
DELIMITER //
CREATE PROCEDURE EnrollStudent(
    IN student_id INT,
    IN course_id INT,
    IN enroll_date DATE
)
BEGIN
    DECLARE new_enrollment_id INT;
    SELECT COALESCE(MAX(enrollment_id), 0) + 1 INTO new_enrollment_id FROM Enrollments;
    INSERT INTO Enrollments (enrollment_id, id, course_id, enrollment_date) 
    VALUES (new_enrollment_id, student_id, course_id, enroll_date);
END //
DELIMITER ;

-- Call the EnrollStudent procedure
CALL EnrollStudent(1, 103, '2024-03-01');

-- Function to calculate the average age of all students
DELIMITER //
CREATE FUNCTION AverageAge() RETURNS FLOAT
BEGIN
    DECLARE avg_age FLOAT;
    SELECT AVG(age) INTO avg_age FROM Students;
    RETURN avg_age;
END //
DELIMITER ;

-- Call the AverageAge function
SELECT AverageAge() AS AvgAge;

-- Cursor to iterate over student names
-- This procedure uses a cursor to iterate over all student names and print them. Cursors are useful for row-by-row processing.
DELIMITER //
CREATE PROCEDURE PrintStudentNames()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE s_name VARCHAR(50);
    DECLARE cur CURSOR FOR SELECT name FROM Students;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
    
    OPEN cur;
    
    read_loop: LOOP
        FETCH cur INTO s_name;
        IF done THEN
            LEAVE read_loop;
        END IF;
        SELECT s_name;
    END LOOP;
    
    CLOSE cur;
END //
DELIMITER ;

-- Call the PrintStudentNames procedure
CALL PrintStudentNames();v
