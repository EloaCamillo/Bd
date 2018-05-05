CREATE TABLE Enderecos(
	IDEndereco int identity not null,
	Rua varchar(200) not null,
	Bairro varchar(200) not null,
	Cidade varchar(200) not null,
	Numero int not null,
	Complemento varchar(200),
	Estado varchar(2) not null
)
--Tabela Forma de Pagamento
CREATE TABLE FormaPagamento(
	IDFormaPagamento int identity not null,
	Forma_de_Pagamento varchar(200)
)
--Tabela de Assinante
CREATE TABLE Assinante(
	IDAssinante int identity not null ,
	Nome varchar(200) not null,
	CPF varchar(12) not null,
	Email varchar(50),
	Telefone varchar(15) not null,
	Celular varchar(15)	,
	FKEnderecoBoleto int not null
)
--Tabela Revista
CREATE TABLE Revista(
	IDRevista int not null identity,
	NomeRevista varchar(150),
	NumeroEdicao int not null,
	Data_Lancamento date not null,
	Preco_Revista money not null	
)
--Tabela Assinaturas
CREATE TABLE Assinaturas(
	IDAssinatura int identity not null,
	IDAssinante int not null,
	IDRevista int not null,
	IDFormaPagamento int not null,
	IDEnderecoEntrega int not null,
	DataInicioAssinatura date not null
)
--Adicionando a Chave Primária de Enderecos
ALTER TABLE Enderecos ADD CONSTRAINT PKEndereco PRIMARY KEY (IDEndereco)

--Adicionando a Chave Primária de FormaPagamento
ALTER TABLE FormaPagamento ADD CONSTRAINT PKFormaPagamento PRIMARY KEY (IDFormaPagamento)

--Adicionando a Chave Primária e a Estrangeira de Assinante
ALTER TABLE Assinante ADD CONSTRAINT PKAssinante PRIMARY KEY (IDAssinante)

ALTER TABLE Assinante ADD CONSTRAINT FKAssinanteEndereco FOREIGN KEY (FKEnderecoBoleto) REFERENCES Enderecos(IDEndereco)

--Adicionando as Chave Primária de Revista
ALTER TABLE Revista ADD CONSTRAINT PKRevista PRIMARY KEY (IDRevista)

--Adicionando a Chave Primária e as Estrangeiras de Assinaturas
ALTER TABLE Assinaturas ADD CONSTRAINT PKAssinaturas PRIMARY KEY (IDAssinatura)

ALTER TABLE Assinaturas ADD CONSTRAINT FKAssinaturaAssinante FOREIGN KEY (IDAssinante) REFERENCES Assinante(IDAssinante) 

ALTER TABLE Assinaturas ADD CONSTRAINT FKAssinaturaRevista FOREIGN KEY (IDRevista) REFERENCES Revista(IdRevista)

ALTER TABLE Assinaturas ADD CONSTRAINT FKAssinaturaPagamento FOREIGN KEY (IDFormaPagamento) REFERENCES FormaPagamento(IDFormaPagamento)

ALTER TABLE Assinaturas ADD CONSTRAINT FKAssinaturaEndereco FOREIGN KEY (IDEnderecoEntrega) REFERENCES Enderecos(IDEndereco)



/* DROP TABLE APOIO
DROP TABLE ASSINATURAS
DROP TABLE ASSINANTE
DROP TABLE ENDERECOS
DROP TABLE FORMAPAGAMENTO
DROP TABLE REVISTA

*/

--Inserindo Valores em Enderecos
INSERT INTO Enderecos(Rua, Bairro, Cidade, Numero,Complemento, Estado) VALUES
('Rua A','Bairro A', 'Cidade A', 10,  'Casa', 'SP'),
('Rua B','Bairro B', 'Cidade A', 121, 'Casa', 'SP'),
('Rua A','Bairro C', 'Cidade A', 13,  'Bloco C APT 13', 'SP'),
('Rua D','Bairro D', 'Cidade C', 321, 'Apartamento', 'PE'),
('Rua E','Bairro E', 'Cidade D', 34,  'Sem Complemento', 'RO'),
('Rua F','Bairro F', 'Cidade E', 18, 'Sem Complemento', 'RJ'),
('Rua G','Bairro G', 'Cidade F', 64,  'Sem Complemento', 'MG'),
('Rua H','Bairro H', 'Cidade G', 33, 'Bloco A apt 4', 'RR')

--Inserindo Valores em Assinante
INSERT INTO Assinante(Nome, CPF,Email, Telefone, Celular,FKEnderecoBoleto) VALUES
('Luiz','00000000000', 'email@email.email','(15)0000-0000','(11)00000-0000', 1),
('Lucas','00000000000', 'asd@asd.asd','(15)0000-0000','(11)00000-0000', 2),
('Leticia','00000000000', '123@123.123','(15)0000-0000','(11)00000-0000', 3),
('Matheus','00000000000','qwert@qwert.com','(15)0000-0000','(11)00000-0000', 4),
('Marcos', '00000000000', 'zxc@zxc.zxc', '(15)0000-0000','(11)00000-0000', 5)

--Inserindo Valores em Revista
INSERT INTO Revista(NumeroEdicao, NomeRevista, Data_Lancamento, Preco_Revista) VALUES
(1,'Revista A', getdate(),10), 
(2,'Revista A', getdate(),10),
(3,'Revista A', getdate(),10),
(1,'Revista B', getdate(),15),
(2,'Revista B', getdate(),15),
(3,'Revista B', getdate(),15),
(1,'Revista C', getdate(),20),
(1,'Revista D', getdate(),20),
(1,'Revista E', getdate(),30)

--Inserindo valores em Forma de Pagamento
INSERT INTO  FormaPagamento(Forma_de_Pagamento) VALUES
('Cartao Credito 1X'),
('Cartao Credito 2X'),
('Cartao Credito 3X'),
('Cartao Credito 6X'),
('Cartao Credito 12X'),
('Boleto Bancario 1X'),
('Transferêcia Bancária 1X'),
('Cupom')

--Inserindo Valores em Assinaturas
INSERT INTO Assinaturas(IDAssinante,IDRevista,IDFormaPagamento, IDEnderecoEntrega,DataInicioAssinatura) VALUES 
(1,1,1,1, GETDATE()),
(1,2,2,1, GETDATE()),
(1,3,3,2, GETDATE()),
(1,7,4,6, GETDATE()),
(2,1,5,3, GETDATE()),
(3,4,1,8, GETDATE()),
(3,5,2,2, GETDATE()),
(3,6,3,4, GETDATE()),
(2,1,4,5, GETDATE()),
(4,4,5,6, GETDATE()),
(4,8,1,7, GETDATE()),
(5,7,2,2, GETDATE())

--Mostra o número da edição  e nome das revitas onde o preço é  maior que a media do valor das revistas
Select NumeroEdicao, NomeRevista from Revista  
where Preco_Revista > (select avg(Revista.Preco_Revista) from Revista)
-------------------------------IN---------------------------
--nome do assinante que comprou revista lançada no dia 
select Nome, Email
 from Assinante
 where IDAssinante in (select IDAssinante
 from Revista
 where Data_Lancamento = '24/05/17')
 --------------------Not in-------------------------------
--Retorna os assintes que nao moram na cidade A
select Nome from Assinante
where IDAssinante in (select IDAssinante from Assinante
where FKEnderecoBoleto not in (select IDEndereco from Enderecos where cidade = 'cidade a'))
-----------------------Exits-----------------------------
--buscar o nome da revista paga com cartão de crédito 1x
select NomeRevista
 from Revista 
 where exists (select *
 from FormaPagamento
 where Forma_de_Pagamento ='Cartao Credito 1X'
 and IDRevista = IDFormaPagamento)
 ----------------------------------------------------------