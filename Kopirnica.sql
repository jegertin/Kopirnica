# c:\xampp\mysql\bin\mysql -uedunova -pedunova < c:\PHP\Kopirnica.sql
drop database if exists kopirnica;
create database kopirnica character set utf8mb4 COLLATE utf8mb4_croatian_ci;
use kopirnica;

create table uprava(
    sifra int not null primary key auto_increment,
    naziv varchar(20) not null,
    grad varchar(25) not null,
    adresa varchar(50) not null,
    telefon varchar(20) not null,
    djelatnici int,
    radkopirnice int
);

create table radkopirnice(
    sifra int not null primary key auto_increment,
    vrstausluge int not null,
    cijenausluge int not null,
    email varchar(40)
);

create table djelatnik(
    sifra int not null primary key auto_increment,
    ime varchar(15),
    prezime varchar(15),
    oib char(11),
    iban varchar(50)
);

create table vrstausluge(
    sifra int not null primary key auto_increment,
    kopiranje varchar(4) not null,
    skeniranje varchar(4) not null,
    uvezivanje varchar(4) not null,
    vrstapapira int
);

create table cijenausluge(
    sifra int not null primary key auto_increment,
    kopiranje char(4) not null,
    skeniranje char(4) not null,
    uvezivanje char(4) not null
);

create table vrstapapira(
    sifra int not null primary key auto_increment,
    sjajni char(1),
    mat char(1),
    80gramski char(1),
    250gramski char(1)
);

alter table uprava add foreign key (djelatnici) references djelatnik (sifra);
alter table uprava add foreign key (radkopirnice) references radkopirnice (sifra);
alter table radkopirnice add foreign key (vrstausluge) references djelatnik (sifra);
alter table radkopirnice add foreign key (vrstausluge) references vrstausluge (sifra);
alter table radkopirnice add foreign key (cijenausluge) references cijenausluge (sifra);
alter table vrstausluge add foreign key (vrstapapira) references vrstapapira (sifra);