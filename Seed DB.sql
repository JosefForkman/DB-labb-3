use SkolaJosef

-- Roles
INSERT INTO role (name) VALUES
('Lärare'),
('Matematik'),
('Svenska Lärare'),
('Engelska Lärare'),
('Biologi Lärare'),
('Fysik Lärare'),
('Rektor'),
('Vaktmästare'),
('Administratör');

-- Employees
INSERT INTO employee (first_name, last_name) VALUES
('Anna', 'Svensson'),
('Erik', 'Johansson'),
('Maria', 'Andersson'),
('Oskar', 'Larsson'),
('Sara', 'Karlsson');

-- Role grope
INSERT INTO role_grope (employee_id, role_id) VALUES
(1, 1),  
(1, 2),  
(1, 3),  
(2, 1),  
(2, 4),  
(2, 5),  
(3, 7),  
(4, 8),  
(5, 9);


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
