
create table Supplier (
		supplier_id 		int primary key,
		supplierName	varchar(20),
        location			varchar(20));
        
insert into Supplier values (0101, 'Supplier1', 'City1');
insert into Supplier values (0102, 'Supplier2', 'City1');
insert into Supplier values (0103, 'Supplier3', 'City2');
        
create table Supplier_Phone (
		phone_no 	numeric(10, 0),
		supplier_id 	int,
        primary key (supplier_id, phone_no),
        foreign key (supplier_id) references Supplier(supplier_id));
        
insert into Supplier_Phone values (9834899358, 0101);
insert into Supplier_Phone values (9834899348, 0101);
insert into Supplier_Phone values (9934899358, 0102);
insert into Supplier_Phone values (9034899358, 0103);
        
        
create table Supplier_Email (
		email 	varchar(20),
		supplier_id 	int,
        primary key (supplier_id, email),
        foreign key (supplier_id) references Supplier(supplier_id));
        
insert into Supplier_Email values ('cont@supplier1.com', 0101);
insert into Supplier_Email values ('cont@supplier2.com', 0102);
insert into Supplier_Email values ('cont@supplier3.com', 0103);
insert into Supplier_Email values ('cont@supplier3-2.com', 0103);
        
create table Publisher (
		publisher_id int primary key,
        PublisherName varchar(20),
        city 	varchar(20),
        country varchar(20),
        established_yr numeric(4));
        
insert into Publisher values (0201, 'Publisher1', 'City2', 'Country1', 1976);
insert into Publisher values (0202, 'Publisher2', 'City2', 'Country1', 1975);
insert into Publisher values (0203, 'Publisher3', 'City3', 'Country3', 1999);
        
        
create table Publisher_Phone (
		phone_no 	numeric(10, 0),
		publisher_id 	int,
        primary key (publisher_id, phone_no),
        foreign key (publisher_id) references Publisher(publisher_id));
        
drop table Publisher_Phone;
        
insert into Publisher_Phone values (9007347389, 0201);
insert into Publisher_Phone values (9007547389, 0202);
insert into Publisher_Phone values (9007347489, 0203);
insert into Publisher_Phone values (9007347488, 0203);
        
create table Publisher_Email ( 
		email 	varchar(20),
		publisher_id 	int,
        primary key (publisher_id, email),
        foreign key (publisher_id) references Publisher(publisher_id));
        
insert into Publisher_Email values ('cont@pub1.com', 0201);
insert into Publisher_Email values ('cont@pub2.com', 0202);
insert into Publisher_Email values ('cont@pub3.com', 0203);
insert into Publisher_Email values ('cont@pub3-2.com', 0203);
        
create table Author(
		Author_id int primary key,
        Fname varchar(10),
		Lname varchar(10),
        DOB DATE);

insert into Author values(0301,'a1f','a1l', ' 1999-03-20');
insert into Author values(0302,'a2f','a2l', ' 1902-05-14');
insert into Author values(0303,'a3f','a3l', ' 1917-08-01');
insert into Author values(0304,'a4f','a4l', ' 1954-12-31');

create table Librarian(
		Librarian_id int primary key,
        Fname varchar(10),
		Lname varchar(10),
        salary int,
        working_hrs_per_week int);

INSERT INTO `library`.`Librarian` (`Librarian_id`, `Fname`, `Lname`, `salary`, `working_hrs_per_week`) VALUES ('0401', 'L1F', 'L1L', '30000', '20');
INSERT INTO `library`.`Librarian` (`Librarian_id`, `Fname`, `Lname`, `salary`, `working_hrs_per_week`) VALUES ('0402', 'L2F', 'L2L', '20000', '18');
INSERT INTO `library`.`Librarian` (`Librarian_id`, `Fname`, `Lname`, `salary`, `working_hrs_per_week`) VALUES ('0403', 'L3F', 'L3L', '10000', '15');
INSERT INTO `library`.`Librarian` (`Librarian_id`, `Fname`, `Lname`, `salary`, `working_hrs_per_week`) VALUES ('0404', 'L4F', 'L4L', '40000', '35');
        
create table Librarian_Phone (
		phone_no 	numeric(10,0),
		librarian_id 	int,
        primary key (librarian_id, phone_no),
        foreign key (librarian_id) references Librarian(librarian_id));
        
        
insert into Librarian_Phone values (9000876543, '0401');
insert into Librarian_Phone values (9000876443, '0401');
insert into Librarian_Phone values (9000876243, '0402');
insert into Librarian_Phone values (9000876143, '0403');

        
create table Librarian_Email ( 
		email 	varchar(20),
		librarian_id 	int,
        primary key (librarian_id, email),
        foreign key (librarian_id) references Librarian(librarian_id));
        
insert into Librarian_Email values ('cont@lib1.com', 0401);
insert into Librarian_Email values ('cont@lib2.com', 0402);
insert into Librarian_Email values ('cont@lib2-2.com', 0402);
insert into Librarian_Email values ('cont@lib3.com', 0403);
        
create table Section (
		section_id int primary key,
        genre varchar(20),
        librarian_id int,
        foreign key (librarian_id) references Librarian(librarian_id));
        
insert into Section values (0501, 'Genre1', 0401);
insert into Section values (0502, 'Genre2', 0401);
insert into Section values (0503, 'Genre3', 0402);
insert into Section values (0504, 'Genre4', 0403);
                
create table Library_User(
		user_id int primary key,
		Fname varchar(10),
		Lname varchar(10),
        occupation varchar(20),
        DOB date,
        due_fines int);
        
insert into Library_User values (0501, 'User1F', 'User1L', 'Student', '2000-02-07', 40); 
insert into Library_User values (0502, 'User2F', 'User2L', 'Student', '2000-02-07', 30); 
insert into Library_User values (0503, 'User3F', 'User3L', 'Professor', '2000-02-07', 0); 
insert into Library_User values (0504, 'User4F', 'User4L', 'Professor', '2000-02-07', 0); 
insert into Library_User values (0505, 'User5F', 'User5L', 'Student', '2000-02-07', 200); 
insert into Library_User values (0506, 'User6F', 'User6L', 'Professor', '2000-02-07', 0); 

create table Library_User_Phone (
		phone_no 	numeric(10),
		user_id 	int,
        primary key (user_id, phone_no),
        foreign key (user_id) references Library_User(user_id));
		
insert into Library_User_Phone values (9765478382, 0501);
insert into Library_User_Phone values (9735478382, 0501);
insert into Library_User_Phone values (9725478382, 0502);
insert into Library_User_Phone values (9715478382, 0503);
insert into Library_User_Phone values (9795478382, 0504);

        
create table Library_User_Email ( 
		email 	varchar(20),
		user_id 	int,
        primary key (user_id, email),
        foreign key (user_id) references Library_User(user_id));
        
insert into Library_User_Email values ('cont@user1.com', 0501);
insert into Library_User_Email values ('cont@user4.com', 0504);
insert into Library_User_Email values ('cont@user5.com', 0505);
insert into Library_User_Email values ('cont@user6.com', 0506);
insert into Library_User_Email values ('cont@user6-2.com', 0506);


create table Book (
		book_id int primary key,
        book_name varchar(40),
        book_lang	varchar(10),
        pages			int);
        
insert into Book values (0601, 'Book1', 'English', 432);
insert into Book values (0602, 'Book2', 'French', 200);
insert into Book values (0603, 'Book3', 'Telugu', 309);
insert into Book values (0604, 'Book4', 'English', 101);
insert into Book values (0605, 'Book5', 'English', 1281);
insert into Book values (0606, 'Book6', 'English', 988);
insert into Book values (0607, 'Book7', 'English', 1200);
insert into Book values (0608, 'Book8', 'English', 348);
insert into Book values (0609, 'Book9', 'English', 290);
insert into Book values (0610, 'Book10', 'English', 101);
insert into book values(0611,'Book11','ENGLISH',400);

create table Published (
		year_of_publish	numeric(4,0),
        book_id 				int,
        publisher_id		 	int,
        foreign key (book_id) references Book(book_id),
        foreign key (publisher_id) references Publisher(publisher_id),
        primary key (book_id));
                
insert into Published values (2000, 0601, 0201);
insert into Published values (1975, 0603, 0201);
insert into Published values (2012, 0604, 0202);
insert into Published values (2016, 0605, 0201);
insert into Published values (1978, 0606, 0203);
insert into Published values (2010, 0607, 0203);
insert into Published values (2010, 0602, 0201);
insert into Published values (2010, 0608, 0202);
insert into Published values (2010, 0609, 0203);
insert into Published values (2010, 0610, 0201);
insert into published values (1999,0611,0201);

create table Supplied (
		copies_supplied	int,
        price					int,
        date_of_supply	date,
        supplier_id	int,
        book_id		int,
        foreign key(supplier_id) references Supplier(supplier_id),
        foreign key (book_id) references Book(book_id),
		primary key (book_id, supplier_id));
        
insert into Supplied values (100, 150, '2000-12-03', 0101, 0601);
insert into Supplied values (200, 199, '2012-04-12', 0101, 0602);
insert into Supplied values (150, 249, '2015-11-05', 0102, 0605);
insert into Supplied values (300, 149, '1990-05-28', 0102, 0608);
insert into Supplied values (500, 399, '1980-02-12', 0103, 0610);
insert into Supplied values (50, 99, '2018-08-08', 0103, 0602);
insert into Supplied values (100, 399, '1998-09-12', 0103, 0603);
insert into Supplied values (200, 199, '1996-12-12', 0103, 0604);
insert into Supplied values (300, 499, '2012-04-12', 0103, 0606);
insert into Supplied values (170, 79, '2015-12-12', 0103, 0607);
insert into Supplied values (200, 219, '1988-03-12', 0103, 0609);

create table Is_In (
		shelf_no	 	int,
		section_id 	int,
        book_id		int,
		foreign key(section_id) references Section(section_id),
        foreign key (book_id) references Book(book_id),
		primary key (book_id));      
        
        
insert into Is_In values (3, 0501, 0601);
insert into Is_In values (2, 0502, 0602);
insert into Is_In values (3, 0503, 0603);
insert into Is_In values (1, 0501, 0604);
insert into Is_In values (4, 0502, 0605);
insert into Is_In values (3, 0503, 0606);
insert into Is_In values (1, 0504, 0607);
insert into Is_In values (2, 0501, 0608);
insert into Is_In values (4, 0504, 0609);
insert into Is_In values (5, 0504, 0610);

create table Wrote(
		Author_id int,
        Book_id int,
        foreign key(Author_id) references Author(Author_id),
        foreign key(Book_id) references Book(Book_id),
        primary key(Book_id, Author_ID));
        
        
insert into Wrote values (0301, 0601);
insert into Wrote values (0302, 0601);
insert into Wrote values (0301, 0602);
insert into Wrote values (0302, 0603);
insert into Wrote values (0303, 0604);
insert into Wrote values (0301, 0605);
insert into Wrote values (0302, 0606);
insert into Wrote values (0303, 0607);
insert into Wrote values (0301, 0608);
insert into Wrote values (0302, 0609);
insert into Wrote values (0303, 0610);
insert into wrote values (0304,0611);
insert into wrote values(0301, 0604);

        
create table Borrows_Book(
		date_of_borrow date,
        Book_id int,
        user_id int,
        foreign key(Book_id) references Book(Book_id),
        foreign key(user_id) references Library_user(user_id));
        
insert into Borrows_Book values ('2018-08-09', 0601, 0501);
insert into Borrows_Book values ('2019-01-09', 0601, 0502);
insert into Borrows_Book values ('2019-01-19', 0602, 0502);
insert into Borrows_Book values ('2018-02-18', 0608, 0504);
insert into Borrows_Book values ('2018-09-20', 0610, 0503);

        
create table Returns_Book(
		date_of_submission date,
		fine int,
		is_damaged bool,
		book_id int,
		user_id int,
        foreign key(Book_id) references Book(Book_id),
        foreign key(user_id) references Library_user(user_id));
                
insert into Returns_Book values ('2018-09-09', 0, false, 0601, 0501);
insert into Returns_Book values ('2019-02-09', 0, false, 0601, 0502);
insert into Returns_Book values ('2019-03-19', 30, false, 0602, 0502);
insert into Returns_Book values ('2018-03-18', 200, true, 0608, 0504);
insert into Returns_Book values ('2018-10-20', 0, false, 0610, 0503);


        
        
        
        

select avg(fine) as Average_Fine
from returns_book, (select book_id 
								from  published ,(select publisher_id as p_id, count(*) as amountpub
															from published
															group by publisher_id
															limit 1) as pub
								where publisher_id =  pub.p_id) as fam_book
where fam_book.book_id = returns_book.book_id;
                                        																	

select min(fine) as Minimum_Fine
from returns_book
where book_id in (select returns_book.book_id
							 from returns_book, wrote, (select supplier_id, count(*) as amountaut1
																		from supplied
																		group by supplier_id
																		order by amountaut1 asc
																		limit 1) as sup,
																		(select author_id as a_id, count(*) as amountaut2
																		from wrote
																		group by author_id
																		limit 1) as aut, supplied
							where returns_book.book_id =wrote.book_id and wrote.author_id=aut.a_id and sup.supplier_id = supplied.supplier_id and supplied.book_id = returns_book.book_id);


select count(*) as Average_Count
from returns_book, 	(select published.book_id 
								 from published,(select publisher_id as sp_id, count(distinct(author_id)) as amt
															from wrote natural join published
															group by publisher_id
															having amt =  (select count(author_id)
																					from author)) as sp 
								where publisher_id = sp.sp_id) as sp2
where fine = 0 and returns_book.book_id = sp2.book_id;
        
        
        
        
        
        

