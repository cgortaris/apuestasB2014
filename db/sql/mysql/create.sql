create database apuestas;
grant all privileges on apuestas.* to 'apiuser'@'localhost' identified by '';

create table duelo (
    id int auto_increment,
    name varchar(100),
    PRIMARY KEY (id)
) ENGINE=InnoDB;

create table usuario (
    id int auto_increment,
    email varchar(500) not null,
    PRIMARY KEY(id)
) ENGINE=InnoDB;

create table duelo_usuario (
    id int auto_increment,
    duelo_id int not null,
    usuario_id int not null,
    PRIMARY KEY(id),
    FOREIGN KEY (duelo_id) REFERENCES duelo(id),
    FOREIGN KEY (duelo_id) REFERENCES usuario(id)
) ENGINE=InnoDB;

create table team_group(
    id int auto_increment,
    name char(1) NOT NULL,
    PRIMARY KEY(id)
) ENGINE=InnoDB;
insert into team_group(name) values('A');
insert into team_group(name) values('B');
insert into team_group(name) values('C');
insert into team_group(name) values('D');
insert into team_group(name) values('E');
insert into team_group(name) values('F');
insert into team_group(name) values('G');
insert into team_group(name) values('H');

create table team(
    id int auto_increment,
    name varchar(100) NOT NULL,
    code char(3) NOT NULL,
    team_group_id int NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (team_group_id) REFERENCES team_group(id)
) ENGINE=InnoDB;
-- Group A
insert into team(name, code, team_group_id) values ('Brazil', 'BRA', (select id from team_group where name='A'));
insert into team(name, code, team_group_id) values ('Croatia', 'CRO', (select id from team_group where name='A'));
insert into team(name, code, team_group_id) values ('Mexico', 'MEX', (select id from team_group where name='A'));
insert into team(name, code, team_group_id) values ('Cameroon', 'CMR', (select id from team_group where name='A'));
-- Group B
insert into team(name, code, team_group_id) values ('Spain', 'ESP', (select id from team_group where name='B'));
insert into team(name, code, team_group_id) values ('Netherlands', 'NED', (select id from team_group where name='B'));
insert into team(name, code, team_group_id) values ('Chile', 'CHI', (select id from team_group where name='B'));
insert into team(name, code, team_group_id) values ('Australia', 'AUS', (select id from team_group where name='B'));
-- Group C
insert into team(name, code, team_group_id) values ('Colombia', 'COL', (select id from team_group where name='C'));
insert into team(name, code, team_group_id) values ('Greece', 'GRE', (select id from team_group where name='C'));
insert into team(name, code, team_group_id) values ('Côte d''Ivoire', 'CIV', (select id from team_group where name='C'));
insert into team(name, code, team_group_id) values ('Japan', 'JPN', (select id from team_group where name='C'));
-- Group D
insert into team(name, code, team_group_id) values ('Uruguay', 'URU', (select id from team_group where name='D'));
insert into team(name, code, team_group_id) values ('Costa Rica', 'CRC', (select id from team_group where name='D'));
insert into team(name, code, team_group_id) values ('England', 'ENG', (select id from team_group where name='D'));
insert into team(name, code, team_group_id) values ('Italy', 'ITA', (select id from team_group where name='D'));
-- Group E
insert into team(name, code, team_group_id) values ('Switzerland', 'SUI', (select id from team_group where name='E'));
insert into team(name, code, team_group_id) values ('Ecuador', 'ECU', (select id from team_group where name='E'));
insert into team(name, code, team_group_id) values ('France', 'FRA', (select id from team_group where name='E'));
insert into team(name, code, team_group_id) values ('Honduras', 'HON', (select id from team_group where name='E'));
-- Group F
insert into team(name, code, team_group_id) values ('Argentina', 'ARG', (select id from team_group where name='F'));
insert into team(name, code, team_group_id) values ('Bosnia-Herzegovina', 'BIH', (select id from team_group where name='F'));
insert into team(name, code, team_group_id) values ('Iran', 'IRN', (select id from team_group where name='F'));
insert into team(name, code, team_group_id) values ('Nigeria', 'NGA', (select id from team_group where name='F'));
-- Group G
insert into team(name, code, team_group_id) values ('Germany', 'GER', (select id from team_group where name='G'));
insert into team(name, code, team_group_id) values ('Portugal', 'POR', (select id from team_group where name='G'));
insert into team(name, code, team_group_id) values ('Ghana', 'GHA', (select id from team_group where name='G'));
insert into team(name, code, team_group_id) values ('USA', 'USA', (select id from team_group where name='G'));
-- Group H
insert into team(name, code, team_group_id) values ('Belgium', 'BEL', (select id from team_group where name='H'));
insert into team(name, code, team_group_id) values ('Algeria', 'ALG', (select id from team_group where name='H'));
insert into team(name, code, team_group_id) values ('Russia', 'RUS', (select id from team_group where name='H'));
insert into team(name, code, team_group_id) values ('Korea Republic', 'KOR', (select id from team_group where name='H'));
alter table team add column name_es varchar(100) not null default '';
update team set name_es = 'Brasil' where id = 1;
update team set name_es = 'Croacia' where id = 2;
update team set name_es = 'Mexico' where id = 3;
update team set name_es = 'Camerun' where id = 4;
update team set name_es = 'Espana' where id = 5;
update team set name_es = 'Holanda' where id = 6;
update team set name_es = 'Chile' where id = 7;
update team set name_es = 'Australia' where id = 8;
update team set name_es = 'Colombia' where id = 9;
update team set name_es = 'Grecia' where id = 10;
update team set name_es = 'Costa De Marfil' where id = 11;
update team set name_es = 'Japon' where id = 12;
update team set name_es = 'Uruguay' where id = 13;
update team set name_es = 'Costa Rica' where id = 14;
update team set name_es = 'Inglaterra' where id = 15;
update team set name_es = 'Italia' where id = 16;
update team set name_es = 'Suiza' where id = 17;
update team set name_es = 'Ecuador' where id = 18;
update team set name_es = 'Francia' where id = 19;
update team set name_es = 'Honduras' where id = 20;
update team set name_es = 'Argentina' where id = 21;
update team set name_es = 'Bosnia-Herzegovina' where id = 22;
update team set name_es = 'Iran' where id = 23;
update team set name_es = 'Nigeria' where id = 24;
update team set name_es = 'Alemania' where id = 25;
update team set name_es = 'Portugal' where id = 26;
update team set name_es = 'Ghana' where id = 27;
update team set name_es = 'Estados Unidos' where id = 28;
update team set name_es = 'Belgica' where id = 29;
update team set name_es = 'Algeria' where id = 30;
update team set name_es = 'Rusia' where id = 31;
update team set name_es = 'Republica de Korea' where id = 32;

create table city(
    id int auto_increment,
    name varchar(100) NOT NULL,
    PRIMARY KEY(id)
) ENGINE=InnoDB;
insert into city(name) values('Belo Horizonte');
insert into city(name) values('Brasilia');
insert into city(name) values('Cuiaba');
insert into city(name) values('Curitiba');
insert into city(name) values('Fortaleza');
insert into city(name) values('Manaus');
insert into city(name) values('Natal');
insert into city(name) values('Porto Alegre');
insert into city(name) values('Recife');
insert into city(name) values('Rio de Janeiro');
insert into city(name) values('Salvador');
insert into city(name) values('Sao Paulo');

create table stadium(
    id int auto_increment,
    name varchar(100) NOT NULL,
    city_id int not null,
    PRIMARY KEY(id),
    foreign key(city_id) references city(id)
) ENGINE=InnoDB;
insert into stadium(name, city_id) values ('Estadio Mineirao', 1);
insert into stadium(name, city_id) values ('Estadio Nacional', 2);
insert into stadium(name, city_id) values ('Arena Pantanal', 3);
insert into stadium(name, city_id) values ('Arena da Baixada', 4);
insert into stadium(name, city_id) values ('Estadio Castelao', 5);
insert into stadium(name, city_id) values ('Arena Amazonia', 6);
insert into stadium(name, city_id) values ('Estadio das Dunas', 7);
insert into stadium(name, city_id) values ('Estadio Beira-Rio', 8);
insert into stadium(name, city_id) values ('Arena Pernambuco', 9);
insert into stadium(name, city_id) values ('Estadio do Maracana', 10);
insert into stadium(name, city_id) values ('Arena Fonte Nova', 11);
insert into stadium(name, city_id) values ('Arena de Sao Paulo', 12);

create table matches(
    id int auto_increment,
    code char(7) NOT NULL,
    mdate timestamp NOT NULL,
    team_id1 int not null,
    team_id2 int not null,
    stadium_id int not null,
    primary key(id),
    foreign key(team_id1) references team(id),
    foreign key(team_id2) references team(id),
    foreign key(stadium_id) references stadium(id)
) ENGINE=InnoDB;

insert into matches(code, mdate, team_id1, team_id2, stadium_id) values (
    'BRA-CRO', 
    '2014-06-12 17:00:00 -3:00', 
    (select id from team where code='BRA'), 
    (select id from team where code='CRO'), 
    (select id from stadium where name='Arena de Sao Paulo')
);
-- Match 2
insert into matches(code, mdate, team_id1, team_id2, stadium_id) values (
    'MEX-CMR',
    '2014-06-13 13:00:00 -3:00', 
    (select id from team where code='MEX'), 
    (select id from team where code='CMR'), 
    (select id from stadium where name='Estadio das Dunas')
);
-- Match 3
insert into matches(code, mdate, team_id1, team_id2, stadium_id) values (
    'ESP-NED',
    '2014-06-13 16:00:00 -3:00', 
    (select id from team where code='ESP'), 
    (select id from team where code='NED'), 
    (select id from stadium where name='Arena Fonte Nova')
);
-- Match 4
insert into matches(code, mdate, team_id1, team_id2, stadium_id) values (
    'CHI-AUS',
    '2014-06-13 18:00:00 -4:00', 
    (select id from team where code='CHI'), 
    (select id from team where code='AUS'), 
    (select id from stadium where name='Arena Pantanal')
);
-- Match 5
insert into matches(code, mdate, team_id1, team_id2, stadium_id) values (
    'COL-GRE',
    '2014-06-14 13:00:00 -3:00', 
    (select id from team where code='COL'),
    (select id from team where code='GRE'),
    (select id from stadium where name='Estadio Mineirao')
);
-- Match 6
insert into matches(code, mdate, team_id1, team_id2, stadium_id) values (
    'CIV-JPN',
    '2014-06-14 22:00:00 -3:00', 
    (select id from team where code='CIV'),
    (select id from team where code='JPN'),
    (select id from stadium where name='Arena Pernambuco')
);
-- Match 7
insert into matches(code, mdate, team_id1, team_id2, stadium_id) values (
    'URU-CRC',
    '2014-06-14 16:00:00 -3:00', 
    (select id from team where code='URU'),
    (select id from team where code='CRC'),
    (select id from stadium where name='Estadio Castelao')
);
-- Match 8 
insert into matches(code, mdate, team_id1, team_id2, stadium_id) values (
    'ENG-ITA',
    '2014-06-14 18:00:00 -4:00', 
    (select id from team where code='ENG'),
    (select id from team where code='ITA'),
    (select id from stadium where name='Arena Amazonia')
);
-- Match 9 
insert into matches(code, mdate, team_id1, team_id2, stadium_id) values (
    'SUI-ECU',
    '2014-06-15 13:00:00 -3:00', 
    (select id from team where code='SUI'),
    (select id from team where code='ECU'),
    (select id from stadium where name='Estadio Nacional')
);
-- Match 10 
insert into matches(code, mdate, team_id1, team_id2, stadium_id) values (
    'FRA-HON',
    '2014-06-15 16:00:00 -3:00', 
    (select id from team where code='FRA'),
    (select id from team where code='HON'),
    (select id from stadium where name='Estadio Beira-Rio')
);
-- Match 11 
insert into matches(code, mdate, team_id1, team_id2, stadium_id) values (
    'ARG-BIH',
    '2014-06-15 19:00:00 -3:00',
    (select id from team where code='ARG'),
    (select id from team where code='BIH'),
    (select id from stadium where name='Estadio do Maracana')
);
-- Match 12 
insert into matches(code, mdate, team_id1, team_id2, stadium_id) values (
    'IRN-NGA',
    '2014-06-16 16:00:00 -3:00',
    (select id from team where code='IRN'),
    (select id from team where code='NGA'),
    (select id from stadium where name='Arena da Baixada')
);
-- Match 13 
insert into matches(code, mdate, team_id1, team_id2, stadium_id) values (
    'GER-POR',
    '2014-06-16 13:00:00 -3:00',
    (select id from team where code='GER'),
    (select id from team where code='POR'),
    (select id from stadium where name='Arena Fonte Nova')
);
-- Match 14 
insert into matches(code, mdate, team_id1, team_id2, stadium_id) values (
    'GHA-USA',
    '2014-06-16 19:00:00 -3:00',
    (select id from team where code='GHA'),
    (select id from team where code='USA'),
    (select id from stadium where name='Estadio das Dunas')
);
-- Match 15 
insert into matches(code, mdate, team_id1, team_id2, stadium_id) values (
    'BEL-ALG',
    '2014-06-17 13:00:00 -3:00',
    (select id from team where code='BEL'),
    (select id from team where code='ALG'),
    (select id from stadium where name='Estadio Mineirao')
);
-- Match 16 
insert into matches(code, mdate, team_id1, team_id2, stadium_id) values (
    'RUS-KOR',
    '2014-06-17 13:00:00 -4:00',
    (select id from team where code='RUS'),
    (select id from team where code='KOR'),
    (select id from stadium where name='Arena Pantanal')
);
-- Match 17 
insert into matches(code, mdate, team_id1, team_id2, stadium_id) values (
    'BRA-MEX',
    '2014-06-17 16:00:00 -3:00',
    (select id from team where code='BRA'),
    (select id from team where code='MEX'),
    (select id from stadium where name='Estadio Castelao')
);
-- Match 18 
insert into matches(code, mdate, team_id1, team_id2, stadium_id) values (
    'CMR-CRO',
    '2014-06-18 18:00:00 -4:00',
    (select id from team where code='CMR'),
    (select id from team where code='CRO'),
    (select id from stadium where name='Arena Amazonia')
);
-- Match 19 
insert into matches(code, mdate, team_id1, team_id2, stadium_id) values (
    'ESP-CHI',
    '2014-06-18 16:00:00 -3:00',
    (select id from team where code='ESP'),
    (select id from team where code='CHI'),
    (select id from stadium where name='Estadio do Maracana')
);
-- Match 20 
insert into matches(code, mdate, team_id1, team_id2, stadium_id) values (
    'AUS-NED',
    '2014-06-18 13:00:00 -3:00',
    (select id from team where code='AUS'),
    (select id from team where code='NED'),
    (select id from stadium where name='Estadio Beira-Rio')
);
-- Match 21
insert into matches(code, mdate, team_id1, team_id2, stadium_id) values (
    'COL-CIV',
    '2014-06-19 13:00:00 -3:00',
    (select id from team where code='COL'),
    (select id from team where code='CIV'),
    (select id from stadium where name='Estadio Nacional')
);
-- Match 22
insert into matches(code, mdate, team_id1, team_id2, stadium_id) values (
    'JPN-GRE',
    '2014-06-19 19:00:00 -3:00',
    (select id from team where code='JPN'),
    (select id from team where code='GRE'),
    (select id from stadium where name='Estadio das Dunas')
);
-- Match 23
insert into matches(code, mdate, team_id1, team_id2, stadium_id) values (
    'URU-ENG',
    '2014-06-19 16:00:00 -3:00',
    (select id from team where code='URU'),
    (select id from team where code='ENG'),
    (select id from stadium where name='Arena de Sao Paulo')
);
-- Match 24
insert into matches(code, mdate, team_id1, team_id2, stadium_id) values (
    'ITA-CRC',
    '2014-06-20 13:00:00 -3:00',
    (select id from team where code='ITA'),
    (select id from team where code='CRC'),
    (select id from stadium where name='Arena Pernambuco')
);
-- Match 25
insert into matches(code, mdate, team_id1, team_id2, stadium_id) values (
    'SUI-FRA',
    '2014-06-20 16:00:00 -3:00',
    (select id from team where code='SUI'),
    (select id from team where code='FRA'),
    (select id from stadium where name='Arena Fonte Nova')
);
-- Match 26
insert into matches(code, mdate, team_id1, team_id2, stadium_id) values (
    'HON-ECU',
    '2014-06-20 19:00:00 -3:00',
    (select id from team where code='HON'),
    (select id from team where code='ECU'),
    (select id from stadium where name='Arena da Baixada')
);
-- Match 27
insert into matches(code, mdate, team_id1, team_id2, stadium_id) values (
    'ARG-IRN',
    '2014-06-21 13:00:00 -3:00',
    (select id from team where code='ARG'),
    (select id from team where code='IRN'),
    (select id from stadium where name='Estadio Mineirao')
);
-- Match 28
insert into matches(code, mdate, team_id1, team_id2, stadium_id) values (
    'NGA-BIH',
    '2014-06-21 18:00:00 -4:00',
    (select id from team where code='NGA'),
    (select id from team where code='BIH'),
    (select id from stadium where name='Arena Pantanal')
);
-- Match 29
insert into matches(code, mdate, team_id1, team_id2, stadium_id) values (
    'GER-GHA',
    '2014-06-21 16:00:00 -3:00',
    (select id from team where code='GER'),
    (select id from team where code='GHA'),
    (select id from stadium where name='Estadio Castelao')
);
-- Match 30
insert into matches(code, mdate, team_id1, team_id2, stadium_id) values (
    'USA-POR',
    '2014-06-22 18:00:00 -4:00',
    (select id from team where code='USA'),
    (select id from team where code='POR'),
    (select id from stadium where name='Arena Amazonia')
);
-- Match 31
insert into matches(code, mdate, team_id1, team_id2, stadium_id) values (
    'BEL-RUS',
    '2014-06-22 13:00:00 -3:00',
    (select id from team where code='BEL'),
    (select id from team where code='RUS'),
    (select id from stadium where name='Estadio do Maracana')
);
-- Match 32
insert into matches(code, mdate, team_id1, team_id2, stadium_id) values (
    'KOR-ALG',
    '2014-06-22 16:00:00 -3:00',
    (select id from team where code='KOR'),
    (select id from team where code='ALG'),
    (select id from stadium where name='Estadio Beira-Rio')
);
-- Match 33
insert into matches(code, mdate, team_id1, team_id2, stadium_id) values (
    'CMR-BRA',
    '2014-06-23 17:00:00 -3:00',
    (select id from team where code='CMR'),
    (select id from team where code='BRA'),
    (select id from stadium where name='Estadio Nacional')
);
-- Match 34
insert into matches(code, mdate, team_id1, team_id2, stadium_id) values (
    'CRO-MEX',
    '2014-06-23 17:00:00 -3:00',
    (select id from team where code='CRO'),
    (select id from team where code='MEX'),
    (select id from stadium where name='Arena Pernambuco')
);
-- Match 35
insert into matches(code, mdate, team_id1, team_id2, stadium_id) values (
    'AUS-ESP',
    '2014-06-23 13:00:00 -3:00',
    (select id from team where code='AUS'),
    (select id from team where code='ESP'),
    (select id from stadium where name='Arena da Baixada')
);
-- Match 36
insert into matches(code, mdate, team_id1, team_id2, stadium_id) values (
    'NED-CHI',
    '2014-06-23 13:00:00 -3:00',
    (select id from team where code='NED'),
    (select id from team where code='CHI'),
    (select id from stadium where name='Arena de Sao Paulo')
);
-- Match 37
insert into matches(code, mdate, team_id1, team_id2, stadium_id) values (
    'JPN-COL',
    '2014-06-24 16:00:00 -4:00',
    (select id from team where code='JPN'),
    (select id from team where code='COL'),
    (select id from stadium where name='Arena Pantanal')
);
-- Match 38
insert into matches(code, mdate, team_id1, team_id2, stadium_id) values (
    'GRE-CIV',
    '2014-06-24 17:00:00 -3:00',
    (select id from team where code='GRE'),
    (select id from team where code='CIV'),
    (select id from stadium where name='Estadio Castelao')
);
-- Match 39
insert into matches(code, mdate, team_id1, team_id2, stadium_id) values (
    'ITA-URU',
    '2014-06-24 13:00:00 -3:00',
    (select id from team where code='ITA'),
    (select id from team where code='URU'),
    (select id from stadium where name='Estadio das Dunas')
);
-- Match 40
insert into matches(code, mdate, team_id1, team_id2, stadium_id) values (
    'CRC-ENG',
    '2014-06-24 13:00:00 -3:00',
    (select id from team where code='CRC'),
    (select id from team where code='ENG'),
    (select id from stadium where name='Estadio Mineirao')
);
-- Match 41
insert into matches(code, mdate, team_id1, team_id2, stadium_id) values (
    'HON-SUI',
    '2014-06-25 16:00:00 -4:00',
    (select id from team where code='HON'),
    (select id from team where code='SUI'),
    (select id from stadium where name='Arena Amazonia')
);
-- Match 42
insert into matches(code, mdate, team_id1, team_id2, stadium_id) values (
    'ECU-FRA',
    '2014-06-25 17:00:00 -3:00',
    (select id from team where code='ECU'),
    (select id from team where code='FRA'),
    (select id from stadium where name='Estadio do Maracana')
);
-- Match 43
insert into matches(code, mdate, team_id1, team_id2, stadium_id) values (
    'NGA-ARG',
    '2014-06-25 13:00:00 -3:00',
    (select id from team where code='NGA'),
    (select id from team where code='ARG'),
    (select id from stadium where name='Estadio Beira-Rio')
);
-- Match 44
insert into matches(code, mdate, team_id1, team_id2, stadium_id) values (
    'BIH-IRN',
    '2014-06-25 13:00:00 -3:00',
    (select id from team where code='BIH'),
    (select id from team where code='IRN'),
    (select id from stadium where name='Arena Fonte Nova')
);
-- Match 45
insert into matches(code, mdate, team_id1, team_id2, stadium_id) values (
    'USA-GER',
    '2014-06-26 13:00:00 -3:00',
    (select id from team where code='USA'),
    (select id from team where code='GER'),
    (select id from stadium where name='Arena Pernambuco')
);
-- Match 46
insert into matches(code, mdate, team_id1, team_id2, stadium_id) values (
    'POR-GHA',
    '2014-06-26 13:00:00 -3:00',
    (select id from team where code='POR'),
    (select id from team where code='GHA'),
    (select id from stadium where name='Estadio Nacional')
);
-- Match 47
insert into matches(code, mdate, team_id1, team_id2, stadium_id) values (
    'KOR-BEL',
    '2014-06-26 17:00:00 -3:00',
    (select id from team where code='KOR'),
    (select id from team where code='BEL'),
    (select id from stadium where name='Arena de Sao Paulo')
);
-- Match 48
insert into matches(code, mdate, team_id1, team_id2, stadium_id) values (
    'ALG-RUS',
    '2014-06-26 17:00:00 -3:00',
    (select id from team where code='ALG'),
    (select id from team where code='RUS'),
    (select id from stadium where name='Arena da Baixada')
);

create table field_position (
    id int auto_increment,
    name varchar(50),
    PRIMARY KEY(id)
) ENGINE=InnoDB;
insert into field_position(name) values('Goalkeeper');
insert into field_position(name) values('Defender');
insert into field_position(name) values('Midfielder');
insert into field_position(name) values('Forward');
insert into field_position(name) values('Coach');

create table player (
    id int auto_increment,
    team_id int not null,
    name varchar(200) not null,
    field_position_id int not null,
    club varchar (100) not null,
    primary key(id),
    foreign key(team_id) references team(id),
    foreign key(field_position_id) references field_position(id)
) ENGINE=InnoDB;

create table duelo (
    id int auto_increment,
    nombre varchar(200) not null unique,
    primary key(id)
) ENGINE=InnoDB;

create table usuario(
    id int auto_increment,
    email varchar(500),
    akey varchar(32) not null unique,
    primary key(id)
) ENGINE=InnoDB;

create table duelo_usuario (
    id int auto_increment,
    duelo_id int not null,
    usuario_id int not null,
    primary key(id),
    foreign key(duelo_id) references duelo(id),
    foreign key(usuario_id) references usuario(id)
) ENGINE=InnoDB;

create table apuesta(
    id int auto_increment,
    duelo_usuario_id int not null,
    match_id int not null,
    team_id int not null,
    goles smallint not null,
    primary key(id),
    foreign key(duelo_usuario_id) references duelo_usuario(id),
    foreign key(match_id) references matches(id),
    foreign key(team_id) references team(id)
) ENGINE=InnoDB;
