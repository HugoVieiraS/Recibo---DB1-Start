create database recibosmaikol;


create table recibo(

idReci int auto_increment not null,
sequencia int  not null,
valor int not null,
datarecibo date not null,
assinatura varchar (30),
referente varchar (100) not null,

idCidade int not null,
idCli int not null,
idUser int not null,

constraint pk_recibo primary key (idReci),
constraint fk_cidade_recibo FOREIGN KEY (IdCidade) references cidade (idCidade),
constraint fk_nomelogin foreign key (idUser) references usuario (idUser),
constraint fk_nome foreign key (idCli) references cliente (idCli)
);

create table endereco(
idEnd int auto_increment not null,
rua varchar(100) not null,
nomecomple varchar (100) not null,
cep numeric(8) not null,

idCidade int not null,

constraint pk_endereco primary key (idEnd),
constraint fk_cidade foreign key (Cidade) references cidade (idCidade)
);

create table cidade(
idCidade int auto_increment not null,
nomecidade varchar(50) not null,
sigla char (2) not null,

constraint pk_cidade primary key (idCidade)
);

create table usuario(
idUser int auto_increment not null,
nomelogin varchar (20) not null,
cpf numeric(11) not null,
senha varchar(50) not null,

idEnd int not null,

constraint pk_user primary key (idUser),
constraint fk_endereco_user foreign key (idEnd) references endereco (idEnd)
);

create table cliente(
idCli int auto_increment not null,
nome varchar(100) not null,
cpf numeric (11) not null,

idEnd int not null,

constraint pk_cliente primary key (idCli),
constraint fk_endereco foreign key (idEnd) references endereco (idEnd)
);


insert into usuario values ('1', 'Maikol','12200890954','DB12019',2);
insert into usuario values ('2', 'Vitor','1220099954','DB12019',1);
/*INSERINDO DADOS NA TABELA ENDERECO*/
insert into endereco values ('2', 'Martins', 'brasil', 71555908, 2);
insert into endereco values ('3', 'Brasil', 'casa', 12345678, 3);
/*INSERINDO DADOS NA TABELA CIDADE*/
insert into cidade (idCidade, nomecidade, sigla) values ('1', 'Maringa', 'PR');
insert into cidade (idCidade, nomecidade, sigla) values ('2', 'Paranavai', 'PR');
insert into cidade (idCidade, nomecidade, sigla) values ('3', 'Mandaguacu', 'PR');
/*INSERINDO DADOS NA TABELA USUARIO*/
insert into usuario values ('1', 'Maikol','12200890954','DB12019',2);
insert into usuario values ('2', 'Vitor','1220099954','DB12019',1);
/*INSERINDO DADOS NA TABELA CLIENTE*/
insert into cliente values (1, 'Aluno1', '23456789101', 3);
/*INSERINDO DADOS NA TABELA RECIBO*/
insert into recibo values (1, 0001, '200','2016-02-27', 'Vitor Hugo da Silva Vieira', 'Compra de imovel', 2, 1,1);
insert into recibo values (2, 0001, '400','2019-01-05', 'Maikol lllllll', 'Compra', 3, 1,2);


select*from recibo where idCidade =3;
select*from usuario where nomelogin ='Maikol';