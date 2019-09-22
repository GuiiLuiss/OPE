use master
go
--
if exists(select name from sys.databases where name = 'Interative')
	begin
		drop database Interative
	end
--
create database Interative
go
--
use Interative
go

create table D_GENERO (
	sk_genero int identity not null,
	genero char(9)

	constraint pkGenero primary key (sk_genero)
);

create table D_CLASSIFICACAO (
	sk_classificacao int identity not null,
	classificacao varchar(11)

	constraint pkClassificacao primary key (sk_classificacao),
	constraint ckClassificacao check (classificacao in ('Muito baixo','Baixo,','Médio','Alto','Muito Alto'))
);

create table D_QUARTIL (
	sk_quartil int identity not null,
	quartil tinyint

	constraint pkQuartil primary key (sk_quartil)
	constraint ckQuartil check (quartil in (0,1,2,3))
);


create table D_FAIXA_ETARIA (
	sk_faixaEtaria int identity not null,
	FaixaEtaria varchar(50)

	constraint pkFaixaEtaria primary key (sk_faixaEtaria)
);

create table D_ANO (
	sk_ano int identity not null,
	ano smallint not null

	constraint pkAno primary key (sk_ano)
);

create table D_ESTADO (
	sk_estado int identity not null,
	NomeEstado varchar(50) not null,
	SiglaEstado char(2) not null,
	ContémInvestimento bit

	constraint pkEstado primary key (sk_estado)
);

create table D_TIPO_VEICULO (
	sk_TipoAutomovel int identity not null,
	descricao_tipo_veiculo varchar(50)

	constraint pkTipoVeiculo primary key (sk_TipoAutomovel)
);

create table F_PIB (
	fk_ano int,
	fk_estado int,
	fk_classificacao int,
	fk_quartil int,
	PIB decimal (15,2)

	constraint fk_AnoPIB foreign key (fk_ano) references D_ANO (sk_ano),
	constraint fk_EstadoPIB foreign key (fk_estado) references D_ESTADO (sk_estado),
	constraint fk_ClassificacaoPIB foreign key (fk_classificacao) references D_CLASSIFICACAO (sk_classificacao),
	constraint fk_QuartilPIB foreign key (fk_quartil) references D_QUARTIL (sk_quartil)
);

create table F_POPULACAO (
	fk_genero int,
	fk_ano int,
	fk_estado int,
	fk_faixaEtaria int,
	fk_classificacao int,
	fk_quartil int,
	QuantidadeFaixaEtaria int

	constraint fk_AnoPopulacao foreign key (fk_ano) references D_ANO (sk_ano),
	constraint fk_EstadoPopulacao foreign key (fk_estado) references D_ESTADO (sk_estado),
	constraint fk_GeneroPopulacao foreign key (fk_genero) references D_GENERO (sk_genero),
	constraint fk_FaixaEtariaPopulacao foreign key (fk_faixaEtaria) references D_FAIXA_ETARIA (sk_faixaEtaria),
	constraint fk_QuartilPopulacao foreign key (fk_quartil) references D_QUARTIL (sk_quartil),
	constraint fk_ClassificacaoPopulacao foreign key (fk_classificacao) references D_CLASSIFICACAO (sk_classificacao)
);

create table F_RENDAPERCAPITA (
	fk_ano int,
	fk_estado int,
	fk_classificacao int,
	fk_quartil int,
	Renda decimal (10,2)

	constraint fk_AnoRendaPerCapita foreign key (fk_ano) references D_ANO (sk_ano),
	constraint fk_EstadoRendaPerCapita foreign key (fk_estado) references D_ESTADO (sk_estado),
	constraint fk_ClassificacaoRendaPerCapita foreign key (fk_classificacao) references D_CLASSIFICACAO (sk_classificacao),
	constraint fk_QuartilRendaPerCapita foreign key (fk_quartil) references D_QUARTIL (sk_quartil)
);

create table F_EMPREGO (
	fk_ano int,
	fk_estado int,
	fk_classificacao int,
	fk_quartil int,
	totalAdmissao int,
	TotalDemissao int,
	TaxaDesemprego float

	constraint fk_AnoEmprego foreign key (fk_ano) references D_ANO (sk_ano),
	constraint fk_EstadoEmprego foreign key (fk_estado) references D_ESTADO (sk_estado),
	constraint fk_ClassificacaoEmprego foreign key (fk_classificacao) references D_CLASSIFICACAO (sk_classificacao),
	constraint fk_QuartilEmprego foreign key (fk_quartil) references D_QUARTIL (sk_quartil)
);

create table F_VEICULO (
	fk_ano int,
	fk_estado int,
	fk_TipoAutomovel int,
	fk_classificacao int,
	fk_quartil int,
	QuantidadeVeiculo int

	constraint fk_AnoVeiculo foreign key (fk_ano) references D_ANO (sk_ano),
	constraint fk_EstadoVeiculo foreign key (fk_estado) references D_ESTADO (sk_estado),
	constraint fk_TipoAutomovelVeiculo foreign key (fk_TipoAutomovel) references D_TIPO_VEICULO (sk_TipoAutomovel),
	constraint fk_ClassificacaoVeiculo foreign key (fk_classificacao) references D_CLASSIFICACAO (sk_classificacao),
	constraint fk_QuartilVeiculo foreign key (fk_quartil) references D_QUARTIL (sk_quartil)
);

create table F_RENDIMENTO (
	fk_ano int,
	fk_estado int,
	fk_classificacao int,
	fk_quartil int,
	RendimentoMedio decimal(10,2)

	constraint fk_AnoRendimento foreign key (fk_ano) references D_ANO (sk_ano),
	constraint fk_EstadoRendimento foreign key (fk_estado) references D_ESTADO (sk_estado),
	constraint fk_ClassificacaoRendimento foreign key (fk_classificacao) references D_CLASSIFICACAO (sk_classificacao),
	constraint fk_QuartilRendimento foreign key (fk_quartil) references D_QUARTIL (sk_quartil)
);

create table F_INADIMPLENTE (
	fk_ano int,
	fk_estado int,
	fk_classificacao int,
	fk_quartil int,
	QuantidadeInadimplente int,
	TaxaInadimplente float

	constraint fk_AnoInadimplente foreign key (fk_ano) references D_ANO (sk_ano),
	constraint fk_EstadoInadimplente foreign key (fk_estado) references D_ESTADO (sk_estado),
	constraint fk_ClassificacaoInadimplente foreign key (fk_classificacao) references D_CLASSIFICACAO (sk_classificacao),
	constraint fk_QuartilInadimplente foreign key (fk_quartil) references D_QUARTIL (sk_quartil)
);

create table F_IMPOSTO (
	fk_ano int,
	fk_estado int,
	fk_classificacao int,
	fk_quartil int,
	TotalImposto decimal(15,2)

	constraint fk_AnoImposto foreign key (fk_ano) references D_ANO (sk_ano),
	constraint fk_EstadoImposto foreign key (fk_estado) references D_ESTADO (sk_estado),
	constraint fk_ClassificacaoImposto foreign key (fk_classificacao) references D_CLASSIFICACAO (sk_classificacao),
	constraint fk_QuartilImposto foreign key (fk_quartil) references D_QUARTIL (sk_quartil)
);





--	CARGA DO BANCO DE DADOS
/*
insert into D_CLASSIFICACAO(classificacao)
select
	case
		when dd.Pib > 2000000000 and dd.RendaPerCapita > 3000000000 then 'Muito Alto'
	end as Classificacao
from
	PlanilhaExcel.dbo.PREtodosdados$ as DD
where
	Estado = 'São Paulo';
go


insert into D_QUARTIL(quartil)
select
	case
		when conta  then  0 ,1 , 2 ou 3
	end as Quartil
from
	PlanilhaExcel.dbo.PREtodosdados$ as DD
where
	Estado = 'São Paulo';
go
*/

insert into D_ESTADO (NomeEstado, SiglaEstado)
select distinct
	Estado, 
	Sigla
from
	PlanilhaExcel.dbo.PREtodosdados$;
go

insert into D_ANO (ano)
select distinct
	Ano
from
	PlanilhaExcel.dbo.PREtodosdados$;
go

insert into 
	D_FAIXA_ETARIA(FaixaEtaria)
values 
	('Faixa etária 0 a 1'), 
	('Faixa etária 1 a 4'), 
	('Faixa etária 5 a 9'), 
	('Faixa etária 10 a 14'),
	('Faixa etária 15 a 19'), 
	('Faixa etária 20 a 29'), 
	('Faixa etária 30 a 39'),
	('Faixa etária 40 a 49'),
	('Faixa etária 50 a 59'), 
	('Faixa etária 60 a 69'), 
	('Faixa etária 70 a 79'), 
	('Faixa etária 80 mais')
go

insert into D_GENERO(genero)
values ('Masculino'),('Feminino')
go

insert into D_TIPO_VEICULO (
	descricao_tipo_veiculo)
values
	('Automóvel'),
	('Caminhão'),
	('Caminhão Trator'),
	('Caminhonete'),
	('Camioneta'),
	('Ciclomotor'),
	('Microonibus'),
	('Motocicleta'),
	('Motoneta');
go

insert into F_PIB(
	fk_ano,
	fk_estado,
	PIB)
select
	A.sk_ano,
	E.sk_estado,
	DD.Pib
from
	PlanilhaExcel.dbo.PREtodosdados$ as DD join
	D_ANO as A on (dd.Ano = A.ano) join
	D_ESTADO as E on (DD.Estado = E.NomeEstado)
go

--Insert Homem 0 1
insert into F_POPULACAO(
	fk_ano,
	fk_estado,
	fk_genero,
	fk_faixaEtaria,
	QuantidadeFaixaEtaria)
select
	A.sk_ano,
	E.sk_estado,
	1 as 'Masculino',
	1 as '0a1',
	DD.[H_0 a 1]
from
	PlanilhaExcel.dbo.PREtodosdados$ as DD join
	D_ANO as A on (dd.Ano = A.ano) join
	D_ESTADO as E on (DD.Estado = E.NomeEstado)
go

--Insert Homem 1 4
insert into F_POPULACAO(
	fk_ano,
	fk_estado,
	fk_genero,
	fk_faixaEtaria,
	QuantidadeFaixaEtaria)
select
	A.sk_ano,
	E.sk_estado,
	1 as 'Masculino',
	2 as '1a4',
	DD.[H_1 a 4]
from
	PlanilhaExcel.dbo.PREtodosdados$ as DD join
	D_ANO as A on (dd.Ano = A.ano) join
	D_ESTADO as E on (DD.Estado = E.NomeEstado)
go

--Insert Homem 5 9
insert into F_POPULACAO(
	fk_ano,
	fk_estado,
	fk_genero,
	fk_faixaEtaria,
	QuantidadeFaixaEtaria)
select
	A.sk_ano,
	E.sk_estado,
	1 as 'Masculino',
	3 as '5a9',
	DD.[H_5 a 9]
from
	PlanilhaExcel.dbo.PREtodosdados$ as DD join
	D_ANO as A on (dd.Ano = A.ano) join
	D_ESTADO as E on (DD.Estado = E.NomeEstado)
go

--Insert Homem 10 14
insert into F_POPULACAO(
	fk_ano,
	fk_estado,
	fk_genero,
	fk_faixaEtaria,
	QuantidadeFaixaEtaria)
select
	A.sk_ano,
	E.sk_estado,
	1 as 'Masculino',
	4 as '10a14',
	DD.[H_10 a 14]
from
	PlanilhaExcel.dbo.PREtodosdados$ as DD join
	D_ANO as A on (dd.Ano = A.ano) join
	D_ESTADO as E on (DD.Estado = E.NomeEstado)
go

--Insert Homem 15 19
insert into F_POPULACAO(
	fk_ano,
	fk_estado,
	fk_genero,
	fk_faixaEtaria,
	QuantidadeFaixaEtaria)
select
	A.sk_ano,
	E.sk_estado,
	1 as 'Masculino',
	5 as '15a19',
	DD.[H_15 a 19]
from
	PlanilhaExcel.dbo.PREtodosdados$ as DD join
	D_ANO as A on (dd.Ano = A.ano) join
	D_ESTADO as E on (DD.Estado = E.NomeEstado)
go

--Insert Homem 20 29
insert into F_POPULACAO(
	fk_ano,
	fk_estado,
	fk_genero,
	fk_faixaEtaria,
	QuantidadeFaixaEtaria)
select
	A.sk_ano,
	E.sk_estado,
	1 as 'Masculino',
	6 as '20a29',
	DD.[H_20 a 29]
from
	PlanilhaExcel.dbo.PREtodosdados$ as DD join
	D_ANO as A on (dd.Ano = A.ano) join
	D_ESTADO as E on (DD.Estado = E.NomeEstado)
go

--Insert Homem 30 39
insert into F_POPULACAO(
	fk_ano,
	fk_estado,
	fk_genero,
	fk_faixaEtaria,
	QuantidadeFaixaEtaria)
select
	A.sk_ano,
	E.sk_estado,
	1 as 'Masculino',
	7 as '30a39',
	DD.[H_30 a 39]
from
	PlanilhaExcel.dbo.PREtodosdados$ as DD join
	D_ANO as A on (dd.Ano = A.ano) join
	D_ESTADO as E on (DD.Estado = E.NomeEstado)
go

--Insert Homem 40 49
insert into F_POPULACAO(
	fk_ano,
	fk_estado,
	fk_genero,
	fk_faixaEtaria,
	QuantidadeFaixaEtaria)
select
	A.sk_ano,
	E.sk_estado,
	1 as 'Masculino',
	8 as '40a49',
	DD.[H_40 a 49]
from
	PlanilhaExcel.dbo.PREtodosdados$ as DD join
	D_ANO as A on (dd.Ano = A.ano) join
	D_ESTADO as E on (DD.Estado = E.NomeEstado)
go

--Insert Homem 50 59
insert into F_POPULACAO(
	fk_ano,
	fk_estado,
	fk_genero,
	fk_faixaEtaria,
	QuantidadeFaixaEtaria)
select
	A.sk_ano,
	E.sk_estado,
	1 as 'Masculino',
	9 as '50a59',
	DD.[H_50 a 59]
from
	PlanilhaExcel.dbo.PREtodosdados$ as DD join
	D_ANO as A on (dd.Ano = A.ano) join
	D_ESTADO as E on (DD.Estado = E.NomeEstado)
go

--Insert Homem 60 69
insert into F_POPULACAO(
	fk_ano,
	fk_estado,
	fk_genero,
	fk_faixaEtaria,
	QuantidadeFaixaEtaria)
select
	A.sk_ano,
	E.sk_estado,
	1 as 'Masculino',
	10 as '60a69',
	DD.[H_60 a 69]
from
	PlanilhaExcel.dbo.PREtodosdados$ as DD join
	D_ANO as A on (dd.Ano = A.ano) join
	D_ESTADO as E on (DD.Estado = E.NomeEstado)
go

--Insert Homem 70 79
insert into F_POPULACAO(
	fk_ano,
	fk_estado,
	fk_genero,
	fk_faixaEtaria,
	QuantidadeFaixaEtaria)
select
	A.sk_ano,
	E.sk_estado,
	1 as 'Masculino',
	11 as '70a69',
	DD.[H_70 a 79]
from
	PlanilhaExcel.dbo.PREtodosdados$ as DD join
	D_ANO as A on (dd.Ano = A.ano) join
	D_ESTADO as E on (DD.Estado = E.NomeEstado)
go

--Insert Homem 80 mais
insert into F_POPULACAO(
	fk_ano,
	fk_estado,
	fk_genero,
	fk_faixaEtaria,
	QuantidadeFaixaEtaria)
select
	A.sk_ano,
	E.sk_estado,
	1 as 'Masculino',
	12 as '80 mais',
	DD.[H_80 +]
from
	PlanilhaExcel.dbo.PREtodosdados$ as DD join
	D_ANO as A on (dd.Ano = A.ano) join
	D_ESTADO as E on (DD.Estado = E.NomeEstado)
go


--Insert Mulher 0 1
insert into F_POPULACAO(
	fk_ano,
	fk_estado,
	fk_genero,
	fk_faixaEtaria,
	QuantidadeFaixaEtaria)
select
	A.sk_ano,
	E.sk_estado,
	2 as 'Feminino',
	1 as '0a1',
	DD.[M_0 a 1]
from
	PlanilhaExcel.dbo.PREtodosdados$ as DD join
	D_ANO as A on (dd.Ano = A.ano) join
	D_ESTADO as E on (DD.Estado = E.NomeEstado)
go

--Insert mulher 1 4
insert into F_POPULACAO(
	fk_ano,
	fk_estado,
	fk_genero,
	fk_faixaEtaria,
	QuantidadeFaixaEtaria)
select
	A.sk_ano,
	E.sk_estado,
	2 as 'Feminino',
	2 as '1a4',
	DD.[M_1 a 4]
from
	PlanilhaExcel.dbo.PREtodosdados$ as DD join
	D_ANO as A on (dd.Ano = A.ano) join
	D_ESTADO as E on (DD.Estado = E.NomeEstado)
go

--Insert mulher 5 9
insert into F_POPULACAO(
	fk_ano,
	fk_estado,
	fk_genero,
	fk_faixaEtaria,
	QuantidadeFaixaEtaria)
select
	A.sk_ano,
	E.sk_estado,
	2 as 'Feminino',
	3 as '5a9',
	DD.[M_5 a 9]
from
	PlanilhaExcel.dbo.PREtodosdados$ as DD join
	D_ANO as A on (dd.Ano = A.ano) join
	D_ESTADO as E on (DD.Estado = E.NomeEstado)
go

--Insert mulher 10 14
insert into F_POPULACAO(
	fk_ano,
	fk_estado,
	fk_genero,
	fk_faixaEtaria,
	QuantidadeFaixaEtaria)
select
	A.sk_ano,
	E.sk_estado,
	2 as 'Feminino',
	4 as '10a14',
	DD.[M_10 a 14]
from
	PlanilhaExcel.dbo.PREtodosdados$ as DD join
	D_ANO as A on (dd.Ano = A.ano) join
	D_ESTADO as E on (DD.Estado = E.NomeEstado)
go

--Insert mulher 15 19
insert into F_POPULACAO(
	fk_ano,
	fk_estado,
	fk_genero,
	fk_faixaEtaria,
	QuantidadeFaixaEtaria)
select
	A.sk_ano,
	E.sk_estado,
	2 as 'Feminino',
	5 as '15a19',
	DD.[M_15 a 19]
from
	PlanilhaExcel.dbo.PREtodosdados$ as DD join
	D_ANO as A on (dd.Ano = A.ano) join
	D_ESTADO as E on (DD.Estado = E.NomeEstado)
go

--Insert mulher 20 29
insert into F_POPULACAO(
	fk_ano,
	fk_estado,
	fk_genero,
	fk_faixaEtaria,
	QuantidadeFaixaEtaria)
select
	A.sk_ano,
	E.sk_estado,
	2 as 'Feminino',
	6 as '20a29',
	DD.[M_20 a 29]
from
	PlanilhaExcel.dbo.PREtodosdados$ as DD join
	D_ANO as A on (dd.Ano = A.ano) join
	D_ESTADO as E on (DD.Estado = E.NomeEstado)
go

--Insert mulher 30 39
insert into F_POPULACAO(
	fk_ano,
	fk_estado,
	fk_genero,
	fk_faixaEtaria,
	QuantidadeFaixaEtaria)
select
	A.sk_ano,
	E.sk_estado,
	2 as 'Feminino',
	7 as '30a39',
	DD.[M_30 a 39]
from
	PlanilhaExcel.dbo.PREtodosdados$ as DD join
	D_ANO as A on (dd.Ano = A.ano) join
	D_ESTADO as E on (DD.Estado = E.NomeEstado)
go

--Insert mulher 40 49
insert into F_POPULACAO(
	fk_ano,
	fk_estado,
	fk_genero,
	fk_faixaEtaria,
	QuantidadeFaixaEtaria)
select
	A.sk_ano,
	E.sk_estado,
	2 as 'Feminino',
	8 as '40a49',
	DD.[M_40 a 49]
from
	PlanilhaExcel.dbo.PREtodosdados$ as DD join
	D_ANO as A on (dd.Ano = A.ano) join
	D_ESTADO as E on (DD.Estado = E.NomeEstado)
go

--Insert mulher 50 59
insert into F_POPULACAO(
	fk_ano,
	fk_estado,
	fk_genero,
	fk_faixaEtaria,
	QuantidadeFaixaEtaria)
select
	A.sk_ano,
	E.sk_estado,
	2 as 'Feminino',
	9 as '50a59',
	DD.[M_50 a 59]
from
	PlanilhaExcel.dbo.PREtodosdados$ as DD join
	D_ANO as A on (dd.Ano = A.ano) join
	D_ESTADO as E on (DD.Estado = E.NomeEstado)
go

--Insert mulher 60 69
insert into F_POPULACAO(
	fk_ano,
	fk_estado,
	fk_genero,
	fk_faixaEtaria,
	QuantidadeFaixaEtaria)
select
	A.sk_ano,
	E.sk_estado,
	2 as 'Feminino',
	10 as '60a69',
	DD.[M_60 a 69]
from
	PlanilhaExcel.dbo.PREtodosdados$ as DD join
	D_ANO as A on (dd.Ano = A.ano) join
	D_ESTADO as E on (DD.Estado = E.NomeEstado)
go

--Insert mulher 70 79
insert into F_POPULACAO(
	fk_ano,
	fk_estado,
	fk_genero,
	fk_faixaEtaria,
	QuantidadeFaixaEtaria)
select
	A.sk_ano,
	E.sk_estado,
	2 as 'Feminino',
	11 as '70a69',
	DD.[M_70 a 79]
from
	PlanilhaExcel.dbo.PREtodosdados$ as DD join
	D_ANO as A on (dd.Ano = A.ano) join
	D_ESTADO as E on (DD.Estado = E.NomeEstado)
go

--Insert mulher 80 mais
insert into F_POPULACAO(
	fk_ano,
	fk_estado,
	fk_genero,
	fk_faixaEtaria,
	QuantidadeFaixaEtaria)
select
	A.sk_ano,
	E.sk_estado,
	2 as 'Feminino',
	12 as '80 mais',
	DD.[M_80 +]
from
	PlanilhaExcel.dbo.PREtodosdados$ as DD join
	D_ANO as A on (dd.Ano = A.ano) join
	D_ESTADO as E on (DD.Estado = E.NomeEstado)
go

--insert into F_POPULACAO(
--	fk_ano,
--	fk_estado,
--	fk_faixaEtaria,
--	fk_genero,
--	TotalPopulacao)
--select
--	A.sk_ano,
--	E.sk_estado,
--	FT.sk_faixaEtaria,
--	G.sk_genero,
--	(select
--		sum(g2.homem + g2.mulher)
--	from
--		D_GENERO as G2
--	where
--		g2.sk_genero = g.sk_genero) as TotalPopulacao
--from
--	PlanilhaExcel.dbo.PREtodosdados$ as DD join
--	D_ANO as A on (dd.Ano = A.ano) join
--	D_ESTADO as E on (DD.Estado = E.NomeEstado) join
--	D_FAIXA_ETARIA as FT on (DD.[H_80 +] = FT.Faixa80MaisH) join
--	D_GENERO as G on (DD.TotalMulher = G.mulher)
--go

insert into F_RENDAPERCAPITA(
	fk_ano,
	fk_estado,
	Renda)
select
	A.sk_ano,
	E.sk_estado,
	DD.RendaPerCapita
from
	PlanilhaExcel.dbo.PREtodosdados$ as DD join
	D_ANO as A on (dd.Ano = A.ano) join
	D_ESTADO as E on (DD.Estado = E.NomeEstado)
go

insert into F_EMPREGO(
	fk_ano,
	fk_estado,
	totalAdmissao,
	TotalDemissao,
	TaxaDesemprego)
select
	A.sk_ano,
	E.sk_estado,
	DD.TotalAdmissao,
	DD.TotalDemissao,
	DD.TaxaDesemprego
from
	PlanilhaExcel.dbo.PREtodosdados$ as DD join
	D_ANO as A on (dd.Ano = A.ano) join
	D_ESTADO as E on (DD.Estado = E.NomeEstado)
go

-- Insert automovel
insert into F_VEICULO(
	fk_ano,
	fk_estado,
	fk_TipoAutomovel,
	QuantidadeVeiculo)
select
	A.sk_ano,
	E.sk_estado,
	1 as 'Tipo Veiculo',
	DD.Automovel
from
	PlanilhaExcel.dbo.PREtodosdados$ as DD join
	D_ANO as A on (dd.Ano = A.ano) join
	D_ESTADO as E on (DD.Estado = E.NomeEstado)
go

-- Insert caminhao
insert into F_VEICULO(
	fk_ano,
	fk_estado,
	fk_TipoAutomovel,
	QuantidadeVeiculo)
select
	A.sk_ano,
	E.sk_estado,
	2 as 'Tipo Veiculo',
	DD.Caminhao
from
	PlanilhaExcel.dbo.PREtodosdados$ as DD join
	D_ANO as A on (dd.Ano = A.ano) join
	D_ESTADO as E on (DD.Estado = E.NomeEstado)
go

-- Insert caminhaoTrator
insert into F_VEICULO(
	fk_ano,
	fk_estado,
	fk_TipoAutomovel,
	QuantidadeVeiculo)
select
	A.sk_ano,
	E.sk_estado,
	3 as 'Tipo Veiculo',
	DD.CaminhaoTrator
from
	PlanilhaExcel.dbo.PREtodosdados$ as DD join
	D_ANO as A on (dd.Ano = A.ano) join
	D_ESTADO as E on (DD.Estado = E.NomeEstado)
go

-- Insert caminhonete
insert into F_VEICULO(
	fk_ano,
	fk_estado,
	fk_TipoAutomovel,
	QuantidadeVeiculo)
select
	A.sk_ano,
	E.sk_estado,
	4 as 'Tipo Veiculo',
	DD.Caminhonete
from
	PlanilhaExcel.dbo.PREtodosdados$ as DD join
	D_ANO as A on (dd.Ano = A.ano) join
	D_ESTADO as E on (DD.Estado = E.NomeEstado)
go

-- Insert camioneta
insert into F_VEICULO(
	fk_ano,
	fk_estado,
	fk_TipoAutomovel,
	QuantidadeVeiculo)
select
	A.sk_ano,
	E.sk_estado,
	5 as 'Tipo Veiculo',
	DD.Camioneta
from
	PlanilhaExcel.dbo.PREtodosdados$ as DD join
	D_ANO as A on (dd.Ano = A.ano) join
	D_ESTADO as E on (DD.Estado = E.NomeEstado)
go

-- Insert ciclomotor
insert into F_VEICULO(
	fk_ano,
	fk_estado,
	fk_TipoAutomovel,
	QuantidadeVeiculo)
select
	A.sk_ano,
	E.sk_estado,
	6 as 'Tipo Veiculo',
	DD.Camioneta
from
	PlanilhaExcel.dbo.PREtodosdados$ as DD join
	D_ANO as A on (dd.Ano = A.ano) join
	D_ESTADO as E on (DD.Estado = E.NomeEstado)
go

-- Insert microonibus
insert into F_VEICULO(
	fk_ano,
	fk_estado,
	fk_TipoAutomovel,
	QuantidadeVeiculo)
select
	A.sk_ano,
	E.sk_estado,
	7 as 'Tipo Veiculo',
	DD.Camioneta
from
	PlanilhaExcel.dbo.PREtodosdados$ as DD join
	D_ANO as A on (dd.Ano = A.ano) join
	D_ESTADO as E on (DD.Estado = E.NomeEstado)
go

-- Insert Motocicleta
insert into F_VEICULO(
	fk_ano,
	fk_estado,
	fk_TipoAutomovel,
	QuantidadeVeiculo)
select
	A.sk_ano,
	E.sk_estado,
	8 as 'Tipo Veiculo',
	DD.Motocicleta
from
	PlanilhaExcel.dbo.PREtodosdados$ as DD join
	D_ANO as A on (dd.Ano = A.ano) join
	D_ESTADO as E on (DD.Estado = E.NomeEstado)
go

-- Insert Motoneta
insert into F_VEICULO(
	fk_ano,
	fk_estado,
	fk_TipoAutomovel,
	QuantidadeVeiculo)
select
	A.sk_ano,
	E.sk_estado,
	9 as 'Tipo Veiculo',
	DD.Motoneta
from
	PlanilhaExcel.dbo.PREtodosdados$ as DD join
	D_ANO as A on (dd.Ano = A.ano) join
	D_ESTADO as E on (DD.Estado = E.NomeEstado)
go


insert into F_RENDIMENTO(
	fk_ano,
	fk_estado,
	RendimentoMedio)
select
	A.sk_ano,
	E.sk_estado,
	RendimentoMedio
from
	PlanilhaExcel.dbo.PREtodosdados$ as DD join
	D_ANO as A on (dd.Ano = A.ano) join
	D_ESTADO as E on (DD.Estado = E.NomeEstado)
go

insert into F_INADIMPLENTE(
	fk_ano,
	fk_estado,
	QuantidadeInadimplente,
	TaxaInadimplente)
select
	A.sk_ano,
	E.sk_estado,
	DD.QtdInadimplentes,
	DD.TaxaInadimplencia
from
	PlanilhaExcel.dbo.PREtodosdados$ as DD join
	D_ANO as A on (dd.Ano = A.ano) join
	D_ESTADO as E on (DD.Estado = E.NomeEstado)
go

insert into F_IMPOSTO(
	fk_ano,
	fk_estado,
	TotalImposto)
select
	A.sk_ano,
	E.sk_estado,
	DD.ImpostoSobreProduto
from
	PlanilhaExcel.dbo.PREtodosdados$ as DD join
	D_ANO as A on (dd.Ano = A.ano) join
	D_ESTADO as E on (DD.Estado = E.NomeEstado)
go