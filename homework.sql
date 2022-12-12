CREATE TABLE Interns(
	InternID SERIAL PRIMARY KEY,
	FirstName VARCHAR(30) NOT NULL,
	LastName VARCHAR(30) NOT NULL,
	OIB VARCHAR(11) UNIQUE CHECK(LENGHT(OIB)=11),
	BirthDate TIMESTAMP NOT NULL CHECK(DATE_PART('year', CURENT_DATE) - DATE_PART('year', BirthDate) BETWEEN 16 AND 24),
	Gender VARCHAR(1) NOT NULL CHECK (Gender='F' OR Gender='M'),
	PlaceOfResidence VARCHAR(30) NOT NULL,
	);


INSERT INTO Interns(InternID, FirstName, LastName, OIB, BirthDate, Gender, PlaceOfResidence) VALUES
(default, 'Luce', 'Latin', '123456789123', '1999-07-16', 'F', 'Sibenik'),
(default, 'Maria', 'Maric', '987456123564', '2001-07-16', 'F', 'Zagreb'),
(default, 'Ante', 'Maretic', '77756421397', '1999-05-15', 'M', 'Zadar'),
(default, 'Filip', 'Juric', '56942378126', '2000-07-07', 'M', 'Zagreb'),
(default, 'Ana', 'Anic', '87546952134', '2002-01-25', 'F', 'Split'),
(default, 'Stipe', 'Horvat', '78546923514', '1999-12-03', 'M', 'Split'),
(default, 'Jure', 'Kovac', '78456321096', '2001-08-16', 'M', 'Zagreb'),
(default, 'Sara', 'Matic', '55562148332', '1999-09-14', 'F', 'Sibenik'),
(default, 'Ivana', 'Ivanic', '78403169552', '1999-07-16', 'F', 'Zagreb'),
(default, 'Karlo', 'Lovric', '89754112364', '2002-10-16', 'M', 'Split')




CREATE TABLE Members(
	MemberID SERIAL PRIMARY KEY,
	FirstName VARCHAR(30) NOT NULL,
	LastName VARCHAR(30) NOT NULL,
	OIB VARCHAR(11) UNIQUE CHECK(LENGHT(OIB)=11),
	BirthDate TIMEsTAMP NOT NULL,
	Gender VARCHAR(1) NOT NULL CHECK (Gender='F' OR Gender='M'),
	PlaceOfResidence VARCHAR(30) NOT NULL
	
	);


INSERT INTO Members(MemberID, FirstName, LastName, OIB, BirthDate, Gender, PlaceOfResidence) VALUES
(default, 'Lana', 'Markov', '52136498752', '1998-12-30', 'F', 'Zagreb'),
(default, 'Maja', 'Majic', '23653214256', '1999-07-16', 'F', 'Split'),
(default, 'Ivan', 'Ivic', '78546321985', '2001-07-15', 'M', 'Zadar'),
(default, 'Josip', 'Josipovic', '23458124569', '2002-07-08', 'M', 'Zagreb'),
(default, 'Lucija', 'Lucic', '02582587649', '2002-11-25', 'F', 'Zagreb'),
(default, 'Ante', 'Antic', '12345215469', '2001-11-03', 'M', 'Zagreb'),
(default, 'Toni', 'Pavlov', '89787456245', '2002-01-16', 'M', 'Zadar'),
(default, 'Karmen', 'Jozic', '85213648957', '1999-08-14', 'F', 'Sibenik'),
(default, 'Tea', 'Lovran', '85236945236', '1999-06-16', 'F', 'Sibenik'),
(default, 'Ivo', 'Ivic', '23002523696', '2001-11-16', 'M', 'Split')




CREATE TABLE Fields(
	FieldID SERIAL PRIMARY KEY,
	Name VARCHAR(20) NOT NULL UNIQUE CHECK ( Name IN ('Developing', 'Design', 'Multimedia', 'Marketing')),
	MemberID INT REFERENCES Members(MemberID)
	);

INSERT INto Fields(FieldID, Name, MemberID) VALUES
(default, 'Developing', 2),
(default, 'Design', 7),
(default, 'Multimedia', 3),
(default, 'Marketing', 1)

CREATE TABLE StatusOfIntern(
	Status VARCHAR(30) NOT NULL CHECK(Status IN('Intern', 'Kicked out', 'Completed Internship')),
	FieldID INT REFERENCES Fields(FieldID),
	InternID INT REFERENCES Interns(InternID)
	);

CREATE TABLE Homeworks(
	HomeworkID SERIAL PRIMARY KEY,
	Grade INT NOT NULL CHECK(Grade BETWEEN 1 AND 5),
	InternID INT REFERENCES Interns(InternID),
	MemberID INT REFERENCES Members(MemberID)
	);