create table duelo (
    id serial primary key,
    nombre varchar(200) not null unique
);

create table usuario(
    id serial primary key,
    email varchar(500),
    key varchar(32) not null
);

create table duelo_usuario (
    id serial primary key,
    duelo_id int references duelo,
    usuario_id int references usuario
);

create table apuesta(
    id serial primary key,
    usuario_id int references usuario,
    match_id int references match,
    team_id int references team,
    goles smallint not null
);
