 /* Regra de Negócio: Universo dos Heróis - Liga da Justiça
 
Formação da Liga da Justiça:
A Liga da Justiça é formada por heróis e seus parceiros unidos para combater Vilões.

Cidades:
Uma cidade pode ser o lar de vários heróis e vilões.
Um vilão ou um Herói só pode pertencer a no maximo uma cidade.

Heróis & Vilões:
Vilões & Heróis podem ter no máximo um parceiro, formando uma dupla dinâmica.

Combates:
Vários Heróis pode enfrentar vários Vilões, e vários Vilões podem enfrentar vários Heróis.

Poderes:
Vilões & Heróis podem ter vários poderes diferentes.

*/
-------------------------------------- 

DROP DATABASE liga_da_justica;

CREATE DATABASE liga_da_justica;

USE liga_da_justica;

-------------------------------------- 

CREATE table cidade(
idCidade INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45) NOT NULL,
descricao VARCHAR(200) NOT NULL
);

CREATE TABLE heroi (
idHeroi INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45) NOT NULL,
identidadeSecreta VARCHAR(45) NOT NULL,
historia VARCHAR (300) NOT NULL,
descricao VARCHAR(200) NOT NULL,
fkParceiroH INT,
CONSTRAINT fkParceiroH FOREIGN KEY (fkParceiroH)
REFERENCES heroi (idHeroi),
fkCidade INT NOT NULL,
CONSTRAINT fkCidadeH FOREIGN KEY (fkCidade)
REFERENCES cidade (idCidade)
);

CREATE TABLE vilao (
idVilao INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45) NOT NULL,
identidadeSecreta VARCHAR(45) NOT NULL,
historia VARCHAR(300) NOT NULL,
descricao VARCHAR(200) NOT NULL,
fkParceiroV INT,
CONSTRAINT fkParceiroV FOREIGN KEY (fkParceiroV)
REFERENCES vilao (idVilao),
fkCidade INT NOT NULL,
CONSTRAINT fkCidadeV FOREIGN KEY (fkCidade)
REFERENCES cidade (idCidade)
);

CREATE TABLE combate (
idCombate int auto_increment,
fkHeroi INT NOT NULL,
CONSTRAINT fkHeroi FOREIGN KEY (fkHeroi)
REFERENCES heroi (idHeroi),
fkVilao INT NOT NULL,
CONSTRAINT fkVilao FOREIGN KEY (fkVilao)
REFERENCES vilao (idVilao),
vencedor varchar(45) NOT NULL,
constraint chkVencedor check (vencedor in ('Vilão', 'Herói')),
primary key (idCombate, fkHeroi, fkVilao)
);

CREATE TABLE poderes (
idPoder int primary key auto_increment,
nomePoder varchar(50) not null,
descricao varchar(200) not null
);

create table poderVilao (
fkVilao int,
constraint fkVilaoPoder foreign key (fkVilao) references vilao (idVilao),
fkPoder int,
constraint fkPoderVilao foreign key (fkPoder) references poderes (idPoder),
primary key (fkVilao, fkPoder)
);

create table poderHeroi (
fkHeroi int,
constraint fkHeroiPoder foreign key (fkHeroi) references heroi (idHeroi),
fkPoder int,
constraint fkPoderHeroi foreign key (fkPoder) references poderes (idPoder),
primary key (fkHeroi, fkPoder)
);

-------------------------------------- 

INSERT INTO cidade VALUES
(null,'Coast City','É uma cidade fictícia criada para as histórias em quadrinhos (ou banda desenhada) da DC Comics.'),
(null,'Gotham','É uma cidade localizada em Nova Iorque. Famosa por sua corrupção, pobreza, infestações de vermes, poluição e inúmeras ondas de crime, 
é uma das maiores e mais decadentes cidades do estado.'),
(null,'Metrópolis','É uma cidade fictícia localizada nos Estados Unidos que aparece nas histórias da DC Comics, sendo o lar do Superman e cenário 
para a maioria das suas aventuras.'),
(null,'Central City','Localizada do outro lado do Rio Missouri em relação a Keystone City, Kansas, foi fundada no século XIX e se tornou uma parada importante 
para a criação de gado.'),
(null,'Atlântida' ,'Uma cidade submersa no oceano'),
(null,'Themyscity ','Uma ilha paradisíaca dos tempos da Grécia Antiga, quando os deuses ainda andavam pela Terra.');

INSERT INTO heroi VALUES
(null,'Lanterna Verde','Hal Jordan','Poder do Anel da Tropa dos Lanternas Verde','Hal 
Jordan é um piloto de caça, um membro e, ocasionalmente, líder de uma força policial intergaláctica chamada tropa dos 
Lanternas Verdes. Ele luta contra o mal através do universo com um anel que lhe dá uma variedade de superpoderes','Alto, branco, cabelos curtos e castanhos, 
uniforme verde e preto',null,1),
(null,'Cyborg','Victor Stone','Intelecto de gênio, Tecnopatia, Auto-reparo, Canhão sônico, Repulsores de vôo, Manipulação da Caixa Materna e
evolução tecnológica.','Victor era um atleta, que num acidente perdeu grande parte de seu corpo, e graças ao seu pai cientista, 
conseguiu substituir a massa perdida por componentes robóticos, e com isso acabou virando um ciborgue.', 'Alto, negro, corpo de máquina', null, 2),
(null,'Robin','Dick Grayson','Artes Marciais','Após sua familia morrer em acidente de circu, ele é adotado pelo Bruce Wayme, vulgo Batman','Traje vermelho, preto e
capa amarela',null, 2),
(null,'Super-Man','Clark Joseph Kent','Hábilidades Sobrehumanas','Um extraterrestre que foi enviado para terra quando era um recem nascido pois seu planeta natal estava
sendo destruido','Roupa azul, capa vermelha e um S no peito', null, 3),
(null,'Flash','Barry Allen','Super Velocidade','Após ser atingido por um raio durante a explosão de acelerador de particulas, o mesmo ganhou super velocidade','Roupa 
vermelha bordada com um raio no peito', null, 4),
(null,'Aquaman','Arthur Corry','Fala com animais marinhos, respirar em baixo da agua e ter vantagens subaquaticas','Herdeiro do trono de Atlântida','Escamas Douradas e 
um Tridente Dourado', null, 5),
(null,'Mulher-Maravilha','Diana','Super-força, Invulnerabilidade, Fator de Cura e Sentidos Aprimorados','Filha da Rainha Hipólita da civilização de amazonas 
da ilha paradisíaca Themysira, a Princesa Diana foi mandada como Mulher-Maravilha ao Mundo dos Homens para propagar a paz, sendo a defensora da verdade e 
da vida na luta entre os homens e o firmamento, entre os mortais e os deuses.','Traje vermelho, dourado e azul, braceletes dourados e chicote', null, 6),
(null,'Batman','Bruce Wayne','Milionário','Após seus pais serem assassinados em um beco em sua infâcia, quando cresceu, decidiu se tornar um justiceiro',
'Seu uniforme preto reflete um homem-morcego', 3, 2);

INSERT vilao VALUES
(null,'Coringa','Arthur Fleck','Não tem','Acompanha um comediante fracassado que é contratado pela máfia para roubar a usina nuclear em que trabalhava','Aparencia de uma palhaço', 2),
(null,'Lanterna Amarela','Sinestro','Poder da laterna amarela','Thaal Sinestro era um arqueólogo em seu planeta natal, Korugar, quando viu um Lanterna Verde caiu numa escavação próxima, 
o lanterna enfrentava um alien feroz, que ô tinha destroçado. ','Possui um traje amarelo, um pele avermelhada', 1),
(null,'Ares','Ares','Fisiologia Divina','Ares era o Velho Deus da Guerra, e o filho mais temido de Zeus, que era adorado pelos antigos gregos e romanos ','Tem um armadura grega, e dentro tem apenas um sombra', 5),
(null,'Capitão Bumerangue','George "Digger" Harkness,','Controla um Bumerangue ','filho ilegítimo de um soldado americano e uma mulher australiana, cresceu em extrema pobreza, mas desenvolveu um talento inato na 
confecção de bumerangues e aprendeu a usá-los brilhantemente como armas','Traje azul com um bumerangue', 4);

INSERT ligaDaJustica VALUES 
(1,null,2),
(8,2,1),
(5,null,3);

-------------------------------------- 

SELECT * FROM cidade;
SELECT * FROM heroi;
SELECT * FROM vilao;
SELECT * FROM ligaDaJustica;
