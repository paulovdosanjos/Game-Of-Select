create database Fabula;
use Fabula;

create table cidade(
idCidade int primary key auto_increment,
nome varchar(50),
descricao varchar(555));


create table SuperHeroi(
idSuper int auto_increment,
nome varchar(45),
identidadeSecreta varchar(45),
poder varchar(30),
historia varchar(555),
descricao varchar(555),
fkCidade int,
primary key (idSuper, fkCidade),
 constraint fkCidade foreign key (fkCidade) references cidade(idCidade),
fkParceiro int,
constraint fkParceiro foreign key (fkParceiro)
references SuperHeroi (idSuper));

       
create table vilao(
idVilao int primary key auto_increment,
nome varchar(45),
identidadeSecreta varchar(45),
poder varchar(30),
historia varchar(555),
descricao varchar(555));

create table LigaDaJustica(
fkSuper int,
fkCidadeSuper int,
fkVilao int,
primary key (fkSuper, fkCidadeSuper, fkVilao),
constraint fkSuper foreign key (fkSuper)
references SuperHeroi (idSuper),
constraint fkCidadeSuper foreign key (fkCidadeSuper)
references SuperHeroi (fkCidade),
    constraint fkVilao foreign key (fkVilao)
references vilao (idVilao));

insert into SuperHeroi values
(null,'Lanterna Verde','Hal Jordan','Poder do Anel da Tropa dos Lanternas Verde','Hal 
Jordan é um piloto de caça, um membro e, ocasionalmente, líder de uma força policial intergaláctica chamada tropa dos 
Lanternas Verdes. Ele luta contra o mal através do universo com um anel que lhe dá uma variedade de superpoderes','Alto, branco, cabelos curtos e castanhos, 
uniforme verde e preto','1',null),
(null,'Cyborg','Victor Stone','Intelecto de gênio, Tecnopatia, Auto-reparo, Canhão sônico, Repulsores de vôo, Manipulação da Caixa Materna e
evolução tecnológica.','Victor era um atleta, que num acidente perdeu grande parte de seu corpo, e graças ao seu pai cientista, 
conseguiu substituir a massa perdida por componentes robóticos, e com isso acabou virando um ciborgue.','2', null),
(null,'Robin','Dick Grayson','Artes Marciais','Após sua familia morrer em acidente de circu, ele é adotado pelo Bruce Wayme, vulgo Batman','Trave vermelho, preto e
capa amarela','2',null),
(null,'Super-Man','Clark Joseph Kent','Hábilidades Sobrehumanas','Um extraterrestre que foi enviado para terra quando era um recem nascido pois seu planeta natal estava
sendo destruido','Roupa azul, capa vermelha e um S no peito','3',null),
(null,'Flash','Barry Allen','Super Velocidade','Após ser atingido por um raio durante a explosão de acelerador de particulas, o mesmo ganhou super velocidade','Roupa 
vermelha bordada com um raio no peito','4', null),
(null,'Aquaman','Arthur Corry','Fala com animais marinhos, respirar em baixo da agua e ter vantagens subaquaticas','Herdeiro do trono de Atlântida','Escamas Douradas e 
um Tridente Dourado','5',null),
(null,'Mulher-Maravilha','Diana','Super-força, Invulnerabilidade, Fator de Cura e Sentidos Aprimorados','Filha da Rainha Hipólita da civilização de amazonas 
da ilha paradisíaca Themysira, a Princesa Diana foi mandada como Mulher-Maravilha ao Mundo dos Homens para propagar a paz, sendo a defensora da verdade e 
da vida na luta entre os homens e o firmamento, entre os mortais e os deuses.','Traje vermelho, dourado e azul, braceletes dourados e chicote','6',null),
(null,'Batman','Bruce Wayne','Milionário','Após seus pais serem assassinados em um beco em sua infâcia, quando cresceu, decidiu se tornar um justiceiro',
'Seu uniforme preto reflete um homem-morcego','2','3');

insert into vilao values
(null,'Coringa','Arthur Fleck','Não tem',' acompanha um comediante fracassado que é contratado pela máfia para roubar a usina nuclear em que trabalhava','Aparencia de uma palhaço'),
(null,'Lanterna amarela','Sinestro','Poder da laterna amarela','Thaal Sinestro era um arqueólogo em seu planeta natal, Korugar, quando viu um Lanterna Verde caiu numa escavação próxima, 
o lanterna enfrentava um alien feroz, que ô tinha destroçado. ','Possui um traje amarelo, um pele avermelhada'),
(null,'Ares','Ares','Fisiologia Divina','Ares era o Velho Deus da Guerra, e o filho mais temido de Zeus, que era adorado pelos antigos gregos e romanos ','Tem um armadura grega, e dentro tem apenas um sombra'),
(null,'capitão bumerangue','George "Digger" Harkness,','Contrala um bumerangue ','filho ilegítimo de um soldado americano e uma mulher australiana, cresceu em extrema pobreza, mas desenvolveu um talento inato na 
confecção de bumerangues e aprendeu a usá-los brilhantemente como armas','Traje azul com um bumerangue');

insert into cidade values
(null,'Coast City','é uma cidade fictícia criada para as histórias em quadrinhos (ou banda desenhada) da DC Comics.'),
(null,'gotham',' é uma cidade localizada em Nova Iorque. Famosa por sua corrupção, pobreza, infestações de vermes, poluição e inúmeras ondas de crime, 
é uma das maiores e mais decadentes cidades do estado.'),
(null,'Metrópolis','é uma cidade fictícia localizada nos Estados Unidos que aparece nas histórias da DC Comics, sendo o lar do Superman e cenário 
para a maioria das suas aventuras.'),
(null,'Central City','localizada do outro lado do Rio Missouri em relação a Keystone City, Kansas, foi fundada no século XIX e se tornou uma parada importante 
para a criação de gado.'),
(null,'Atlântida' ,' uma cidade submersa no oceano'),
(null,'Themyscity ','uma ilha paradisíaca dos tempos da Grécia Antiga, quando os deuses ainda andavam pela Terra.');
select * from cidade;
