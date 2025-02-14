use SkolaJosef

-- Roles
INSERT INTO role (name) VALUES
('Lärare'),
('Matematik'),
('Svenska'),
('Engelska'),
('Biologi'),
('Fysik'),
('Rektor'),
('Vaktmästare'),
('Administratör');

-- Employees
INSERT INTO employee (first_name, last_name, salary) VALUES
('Anna', 'Svensson', 30000),
('Erik', 'Johansson', 32500),
('Maria', 'Andersson', 25000),
('Oskar', 'Larsson', 42670),
('Sara', 'Karlsson', 28480);

-- Role grope
Use SkolaJosef;
INSERT INTO role_grope (employee_id, role_id) VALUES
(1, 1),  
(1, 2),  
(1, 3),  
(2, 1),  
(2, 4),  
(2, 5),
(3, 1),  
(3, 4),

(4, 7),  
(4, 9),
(5, 8),    
(5, 7);




-- Class
INSERT INTO class (name, start_date, end_date, mentor_id) VALUES
('9A', '2025-08-17', '2026-06-05', 1),
('8B', '2025-08-17', '2026-06-05', 2);

-- Student
INSERT INTO student (first_name, last_name, personal_code_number, class_id) VALUES
('Alice', 'Karlsson', '20080915-1234', 1),
('Bob', 'Johansson', '20080915-5678', 1),
('Clara', 'Nilsson', '20090123-9101', 1),
('David', 'Olsson', '20090202-1122', 2),
('Eva', 'Mårtensson', '20090401-3344', 2);

-- Subject
INSERT INTO subject (name, discription) VALUES
('Matematik', 'Studier av tal, mätningar och algebra.'),
('Svenska', 'Läsning, skrivning och grammatik.'),
('Engelska', 'Lärande av det engelska språket.'),
('Biologi', 'Studier av levande organismer och deras miljö.');

-- Grade
INSERT INTO grade (level, created_at, updated_at, subject_id, employee_id, student_id) VALUES
('A', '2025-12-15', '2025-12-15', 1, 1, 1),
('B', '2025-12-15', '2025-12-15', 2, 2, 1),
('C', '2025-12-15', '2025-12-15', 1, 1, 2),
('A', '2025-12-15', '2025-12-15', 3, 3, 2),
('B', '2025-12-15', '2025-12-15', 4, 4, 3);

-- Class schema
INSERT INTO class_schema (start_date, end_date, subject_id, class_id) VALUES
('2025-08-17', '2025-12-15', 1, 1), 
('2025-08-17', '2025-12-15', 2, 1), 
('2025-08-17', '2025-12-15', 3, 2), 
('2025-08-17', '2025-12-15', 4, 2); 

-- Generera 100 nya rader för grade tabellen med slumpmässiga datum och betyg
INSERT INTO grade (level, student_id, employee_id, subject_id, created_at, updated_at) 
VALUES
('A', 1, 1, 1, DATEADD(DAY, -FLOOR(RAND() * 1826), GETDATE()), GETDATE()),
('B', 2, 1, 1, DATEADD(DAY, -FLOOR(RAND() * 1826), GETDATE()), GETDATE()),
('C', 3, 2, 1, DATEADD(DAY, -FLOOR(RAND() * 1826), GETDATE()), GETDATE()),
('D', 4, 2, 1, DATEADD(DAY, -FLOOR(RAND() * 1826), GETDATE()), GETDATE()),
('F', 5, 3, 1, DATEADD(DAY, -FLOOR(RAND() * 1826), GETDATE()), GETDATE()),

('A', 1, 1, 2, DATEADD(DAY, -FLOOR(RAND() * 1826), GETDATE()), GETDATE()),
('B', 2, 2, 2, DATEADD(DAY, -FLOOR(RAND() * 1826), GETDATE()), GETDATE()),
('C', 3, 3, 2, DATEADD(DAY, -FLOOR(RAND() * 1826), GETDATE()), GETDATE()),
('D', 4, 4, 2, DATEADD(DAY, -FLOOR(RAND() * 1826), GETDATE()), GETDATE()),
('F', 5, 5, 2, DATEADD(DAY, -FLOOR(RAND() * 1826), GETDATE()), GETDATE()),

('A', 1, 1, 3, DATEADD(DAY, -FLOOR(RAND() * 1826), GETDATE()), GETDATE()),
('B', 2, 2, 3, DATEADD(DAY, -FLOOR(RAND() * 1826), GETDATE()), GETDATE()),
('C', 3, 3, 3, DATEADD(DAY, -FLOOR(RAND() * 1826), GETDATE()), GETDATE()),
('D', 4, 4, 3, DATEADD(DAY, -FLOOR(RAND() * 1826), GETDATE()), GETDATE()),
('F', 5, 5, 3, DATEADD(DAY, -FLOOR(RAND() * 1826), GETDATE()), GETDATE()),

('A', 1, 1, 4, DATEADD(DAY, -FLOOR(RAND() * 1826), GETDATE()), GETDATE()),
('B', 2, 2, 4, DATEADD(DAY, -FLOOR(RAND() * 1826), GETDATE()), GETDATE()),
('C', 3, 3, 4, DATEADD(DAY, -FLOOR(RAND() * 1826), GETDATE()), GETDATE()),
('D', 4, 4, 4, DATEADD(DAY, -FLOOR(RAND() * 1826), GETDATE()), GETDATE()),
('F', 5, 5, 4, DATEADD(DAY, -FLOOR(RAND() * 1826), GETDATE()), GETDATE()),

('A', 1, 1, 1, DATEADD(DAY, -FLOOR(RAND() * 1826), GETDATE()), GETDATE()),
('B', 2, 1, 1, DATEADD(DAY, -FLOOR(RAND() * 1826), GETDATE()), GETDATE()),
('C', 3, 2, 1, DATEADD(DAY, -FLOOR(RAND() * 1826), GETDATE()), GETDATE()),
('D', 4, 2, 1, DATEADD(DAY, -FLOOR(RAND() * 1826), GETDATE()), GETDATE()),
('F', 5, 3, 1, DATEADD(DAY, -FLOOR(RAND() * 1826), GETDATE()), GETDATE()),

('A', 1, 1, 2, DATEADD(DAY, -FLOOR(RAND() * 1826), GETDATE()), GETDATE()),
('B', 2, 2, 2, DATEADD(DAY, -FLOOR(RAND() * 1826), GETDATE()), GETDATE()),
('C', 3, 3, 2, DATEADD(DAY, -FLOOR(RAND() * 1826), GETDATE()), GETDATE()),
('D', 4, 4, 2, DATEADD(DAY, -FLOOR(RAND() * 1826), GETDATE()), GETDATE()),
('F', 5, 5, 2, DATEADD(DAY, -FLOOR(RAND() * 1826), GETDATE()), GETDATE()),

('A', 1, 1, 3, DATEADD(DAY, -FLOOR(RAND() * 1826), GETDATE()), GETDATE()),
('B', 2, 2, 3, DATEADD(DAY, -FLOOR(RAND() * 1826), GETDATE()), GETDATE()),
('C', 3, 3, 3, DATEADD(DAY, -FLOOR(RAND() * 1826), GETDATE()), GETDATE()),
('D', 4, 4, 3, DATEADD(DAY, -FLOOR(RAND() * 1826), GETDATE()), GETDATE()),
('F', 5, 5, 3, DATEADD(DAY, -FLOOR(RAND() * 1826), GETDATE()), GETDATE()),

('A', 1, 1, 4, DATEADD(DAY, -FLOOR(RAND() * 1826), GETDATE()), GETDATE()),
('B', 2, 2, 4, DATEADD(DAY, -FLOOR(RAND() * 1826), GETDATE()), GETDATE()),
('C', 3, 3, 4, DATEADD(DAY, -FLOOR(RAND() * 1826), GETDATE()), GETDATE()),
('D', 4, 4, 4, DATEADD(DAY, -FLOOR(RAND() * 1826), GETDATE()), GETDATE()),
('F', 5, 5, 4, DATEADD(DAY, -FLOOR(RAND() * 1826), GETDATE()), GETDATE()),

('C', 1, 1, 1, DATEADD(DAY, -FLOOR(RAND() * 1826), GETDATE()), GETDATE()),
('A', 2, 2, 1, DATEADD(DAY, -FLOOR(RAND() * 1826), GETDATE()), GETDATE()),
('B', 3, 3, 1, DATEADD(DAY, -FLOOR(RAND() * 1826), GETDATE()), GETDATE()),
('F', 4, 4, 1, DATEADD(DAY, -FLOOR(RAND() * 1826), GETDATE()), GETDATE()),
('D', 5, 5, 1, DATEADD(DAY, -FLOOR(RAND() * 1826), GETDATE()), GETDATE()),

('D', 1, 1, 2, DATEADD(DAY, -FLOOR(RAND() * 1826), GETDATE()), GETDATE()),
('C', 2, 2, 2, DATEADD(DAY, -FLOOR(RAND() * 1826), GETDATE()), GETDATE()),
('B', 3, 3, 2, DATEADD(DAY, -FLOOR(RAND() * 1826), GETDATE()), GETDATE()),
('A', 4, 4, 2, DATEADD(DAY, -FLOOR(RAND() * 1826), GETDATE()), GETDATE()),
('F', 5, 5, 2, DATEADD(DAY, -FLOOR(RAND() * 1826), GETDATE()), GETDATE()),

('C', 1, 1, 3, DATEADD(DAY, -FLOOR(RAND() * 1826), GETDATE()), GETDATE()),
('B', 2, 2, 3, DATEADD(DAY, -FLOOR(RAND() * 1826), GETDATE()), GETDATE()),
('A', 3, 3, 3, DATEADD(DAY, -FLOOR(RAND() * 1826), GETDATE()), GETDATE()),
('F', 4, 4, 3, DATEADD(DAY, -FLOOR(RAND() * 1826), GETDATE()), GETDATE()),
('D', 5, 5, 3, DATEADD(DAY, -FLOOR(RAND() * 1826), GETDATE()), GETDATE()),

('B', 1, 1, 4, DATEADD(DAY, -FLOOR(RAND() * 1826), GETDATE()), GETDATE()),
('C', 2, 2, 4, DATEADD(DAY, -FLOOR(RAND() * 1826), GETDATE()), GETDATE()),
('A', 3, 3, 4, DATEADD(DAY, -FLOOR(RAND() * 1826), GETDATE()), GETDATE()),
('D', 4, 4, 4, DATEADD(DAY, -FLOOR(RAND() * 1826), GETDATE()), GETDATE()),
('F', 5, 5, 4, DATEADD(DAY, -FLOOR(RAND() * 1826), GETDATE()), GETDATE());

-- Stored procedure
-- Check if the procedure exists before creating it
IF NOT EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'getStudentInfo')
BEGIN
    -- Create the procedure
    EXEC('
        CREATE PROCEDURE getStudentInfo
            @StudentID INT
        AS 
        BEGIN
            SELECT student.first_name + '' '' + student.last_name as ''student_name'', employee.first_name + '' '' + employee.last_name as ''teacher_name'', class.name as ''class_name'', class.start_date as ''start'', class.end_date as ''end'' FROM dbo.student 
                JOIN dbo.class ON student.class_id = class.id
                JOIN dbo.employee ON class.mentor_id = employee.id
            WHERE student.id = @StudentID
        END'
    );
    PRINT 'Procedure getStudentInfo created';
END;

-- Check if the procedure exists before creating it
IF NOT EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'setStudentGrades')
BEGIN
    -- Create the procedure 
    EXEC('
        CREATE PROCEDURE setStudentGrades
            @level NVARCHAR(1),
            @student_id INT,
            @employee_id INT,
            @subject_id INT
        AS
        BEGIN
            BEGIN TRY
            BEGIN TRANSACTION 
            INSERT INTO dbo.grade (level, student_id, employee_id, subject_id) 
                VALUES (@level, @student_id, @employee_id, @subject_id);
            COMMIT TRANSACTION
            END TRY
            BEGIN CATCH
                ROLLBACK TRANSACTION
            END CATCH
        END
    ');
    PRINT 'Procedure setStudentGrades created';
END;


