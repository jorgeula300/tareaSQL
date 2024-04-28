--	Crea la base de datos--
--Crea la tabla de usuarios--

create table users (
id serial primary key,
	first_name varchar(50),
	last_name varchar(50),
	email varchar(30)
);

--Añade 3 usuarios--
insert into users (first_name, last_name, email) values
('Jorge','Sanchez','jorge@gmail.com'),
('Yirlena','Mosquera','yirlena@hotmail.com'),
('Sofia','Martinez','sofia@outlook.com');

select * from users

--Crea la tabla de posts--
create table posts (
id serial primary key,
	creator_id int references users(id),
	title varchar(50),
	text text
);

--Añade 5 posts--
insert into posts (
 creator_id,
	title,
	text
) values

(1,'La vida es muy rica','Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto.'),
(3,'Nadie que me escriba!','Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto.'),
(2,'Quien me regala un Iphone?','Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto.'),
(2,'Resumen del partido psg vs Barca ','Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto.'),
(3,'NBA playoffs','Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto.');

select * from posts


--Crea la tabla de likes--
create table likes (
id serial primary key,
	user_id int references users(id),
	post_id int references posts(id)
);


--Añade 5 likes.--
insert into likes (
	user_id,
	post_id
) values 
(1,3),
(2,3),
(1,3),
(3,1),
(2,1);

select * from likes

--Trae todos los posts y la información del usuario del campo creator_id--
select * from posts inner join users on posts.creator_id = users.id;

--Trae todos los posts, con la información de los usuarios que les dieron like.--
select * from posts inner join likes
on posts.id = likes.user_id  inner join users
on likes.user_id = users.id;



