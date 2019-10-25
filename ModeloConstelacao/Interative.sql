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

create table D_INVESTIMENTO (
	sk_investimento int identity not null,
	ContemInvestimento char(3)

	constraint pkInvestimento primary key (sk_investimento)
);

create table D_CLASSIFICACAO (
	sk_classificacao int identity not null,
	classificacao varchar(30)

	constraint pkClassificacao primary key (sk_classificacao)
);

create table D_SCORE (
	sk_score int identity not null,
	score int

	constraint pkQuartil primary key (sk_score)
);


create table D_FAIXA_ETARIA (
	sk_faixaEtaria int identity not null,
	FaixaEtaria varchar(50)

	constraint pkFaixaEtaria primary key (sk_faixaEtaria)
);

create table D_ANO (
	sk_ano int identity not null,
	ano char(4) not null

	constraint pkAno primary key (sk_ano)
);

create table D_ESTADO (
	sk_estado int identity not null,
	NomeEstado varchar(50) not null,
	SiglaEstado char(2) not null

	constraint pkEstado primary key (sk_estado)
);

create table D_TIPO_VEICULO (
	sk_TipoAutomovel int identity not null,
	descricao_tipo_veiculo varchar(50)

	constraint pkTipoVeiculo primary key (sk_TipoAutomovel)
);

create table F_PIB (
	fk_ano int not null,
	fk_estado int not null,
	fk_classificacao int not null,
--	fk_score int,
	fk_investimento int not null,
	Score int,
	PIB decimal (15,2)

	constraint fk_AnoPIB foreign key (fk_ano) references D_ANO (sk_ano),
	constraint fk_EstadoPIB foreign key (fk_estado) references D_ESTADO (sk_estado),
	constraint fk_ClassificacaoPIB foreign key (fk_classificacao) references D_CLASSIFICACAO (sk_classificacao),
	--constraint fk_ScorePIB foreign key (fk_score) references D_SCORE (sk_score),
	constraint fk_InvestimentoPIB foreign key (fk_investimento) references D_INVESTIMENTO (sk_investimento)
	
);

create table F_POPULACAO (
	fk_genero int not null,
	fk_ano int not null,
	fk_estado int not null,
	fk_faixaEtaria int not null,
	fk_classificacao int not null,
	--fk_score int,
	fk_investimento int not null,
	Score int,
	QuantidadeFaixaEtaria int

	constraint fk_AnoPopulacao foreign key (fk_ano) references D_ANO (sk_ano),
	constraint fk_EstadoPopulacao foreign key (fk_estado) references D_ESTADO (sk_estado),
	constraint fk_GeneroPopulacao foreign key (fk_genero) references D_GENERO (sk_genero),
	constraint fk_FaixaEtariaPopulacao foreign key (fk_faixaEtaria) references D_FAIXA_ETARIA (sk_faixaEtaria),
--	constraint fk_ScorePopulacao foreign key (fk_score) references D_SCORE (sk_score),
	constraint fk_ClassificacaoPopulacao foreign key (fk_classificacao) references D_CLASSIFICACAO (sk_classificacao),
	constraint fk_InvestimentoPopulacao foreign key (fk_investimento) references D_INVESTIMENTO (sk_investimento)
);

create table F_RENDAPERCAPITA (
	fk_ano int not null,
	fk_estado int not null,
	fk_classificacao int not null,
	--fk_score int,
	fk_investimento int not null,
	Score int,
	Renda decimal (10,2)

	constraint fk_AnoRendaPerCapita foreign key (fk_ano) references D_ANO (sk_ano),
	constraint fk_EstadoRendaPerCapita foreign key (fk_estado) references D_ESTADO (sk_estado),
	constraint fk_ClassificacaoRendaPerCapita foreign key (fk_classificacao) references D_CLASSIFICACAO (sk_classificacao),
	--constraint fk_ScoreRendaPerCapita foreign key (fk_score) references D_SCORE (sk_score),
	constraint fk_InvestimentoRendaPerCapita foreign key (fk_investimento) references D_INVESTIMENTO (sk_investimento)
);

create table F_EMPREGO (
	fk_ano int not null,
	fk_estado int not null,
	fk_classificacao int not null,
	--fk_score int,
	fk_investimento int not null,
	Score int,
	totalAdmissao int not null,
	TotalDemissao int not null,
	TaxaDesemprego float

	constraint fk_AnoEmprego foreign key (fk_ano) references D_ANO (sk_ano),
	constraint fk_EstadoEmprego foreign key (fk_estado) references D_ESTADO (sk_estado),
	constraint fk_ClassificacaoEmprego foreign key (fk_classificacao) references D_CLASSIFICACAO (sk_classificacao),
	--constraint fk_ScoreEmprego foreign key (fk_score) references D_SCORE (sk_score),
	constraint fk_InvestimentoEmprego foreign key (fk_investimento) references D_INVESTIMENTO (sk_investimento)
);

create table F_VEICULO (
	fk_ano int not null,
	fk_estado int not null,
	fk_TipoAutomovel int not null,
	fk_classificacao int not null,
	--fk_score int,
	fk_investimento  int not null,
	Score int,
	QuantidadeVeiculo int

	constraint fk_AnoVeiculo foreign key (fk_ano) references D_ANO (sk_ano),
	constraint fk_EstadoVeiculo foreign key (fk_estado) references D_ESTADO (sk_estado),
	constraint fk_TipoAutomovelVeiculo foreign key (fk_TipoAutomovel) references D_TIPO_VEICULO (sk_TipoAutomovel),
	constraint fk_ClassificacaoVeiculo foreign key (fk_classificacao) references D_CLASSIFICACAO (sk_classificacao),
	--constraint fk_ScoreVeiculo foreign key (fk_score) references D_SCORE (sk_score),
	constraint fk_InvestimentoVeiculo foreign key (fk_investimento) references D_INVESTIMENTO (sk_investimento)
);

create table F_RENDIMENTO (
	fk_ano int not null,
	fk_estado int not null,
	fk_classificacao int not null,
	--fk_score int,
	fk_investimento int not null,
	Score int,
	RendimentoMedio decimal(10,2)

	constraint fk_AnoRendimento foreign key (fk_ano) references D_ANO (sk_ano),
	constraint fk_EstadoRendimento foreign key (fk_estado) references D_ESTADO (sk_estado),
	constraint fk_ClassificacaoRendimento foreign key (fk_classificacao) references D_CLASSIFICACAO (sk_classificacao),
	--constraint fk_ScoreRendimento foreign key (fk_score) references D_SCORE (sk_score),
	constraint fk_InvestimentoRendimento foreign key (fk_investimento) references D_INVESTIMENTO (sk_investimento)
);

create table F_INADIMPLENTE (
	fk_ano int not null,
	fk_estado int not null,
	fk_classificacao int not null,
	--fk_score int,
	fk_investimento int not null,
	QuantidadeInadimplente int,
	Score int,
	TaxaInadimplente float

	constraint fk_AnoInadimplente foreign key (fk_ano) references D_ANO (sk_ano),
	constraint fk_EstadoInadimplente foreign key (fk_estado) references D_ESTADO (sk_estado),
	constraint fk_ClassificacaoInadimplente foreign key (fk_classificacao) references D_CLASSIFICACAO (sk_classificacao),
	--constraint fk_ScoreInadimplente foreign key (fk_score) references D_SCORE (sk_score),
	constraint fk_InvestimentoInadimplente foreign key (fk_investimento) references D_INVESTIMENTO (sk_investimento)
);

create table F_IMPOSTO (
	fk_ano int not null,
	fk_estado int not null,
	fk_classificacao int not null,
	--fk_score int,
	fk_investimento int not null,
	Score int,
	TotalImposto decimal(15,2)

	constraint fk_AnoImposto foreign key (fk_ano) references D_ANO (sk_ano),
	constraint fk_EstadoImposto foreign key (fk_estado) references D_ESTADO (sk_estado),
	constraint fk_ClassificacaoImposto foreign key (fk_classificacao) references D_CLASSIFICACAO (sk_classificacao),
	--constraint fk_ScoreImposto foreign key (fk_score) references D_SCORE (sk_score),
	constraint fk_InvestimentoImposto foreign key (fk_investimento) references D_INVESTIMENTO (sk_investimento)
);





--	CARGA DO BANCO DE DADOS
insert into D_INVESTIMENTO ( ContemInvestimento)
values ('Sim'),('Não');
go

insert into D_CLASSIFICACAO (classificacao)
values ('Muito baixo'),('Baixo'),('Médio'),('Alto'),('Muito Alto')

insert into D_ESTADO (NomeEstado, SiglaEstado)
select distinct
	Estado, 
	Sigla
from
	PlanilhaExcel.dbo.PREtodosdados$ as dd;
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
	fk_classificacao,
	fk_investimento,
	Score,
	PIB)
select
	A.sk_ano,
	E.sk_estado,
	(select 
		case 
			when dd.s_Pib < 2 then 1
			when dd.s_Pib between 2 and 9 then 2
			when dd.s_Pib between 10 and 18 then 3
			when dd.s_Pib between 19 and 26 then 4
			when dd.s_Pib > 26 then 5
		end as 'case'
	from 
		PlanilhaExcel.dbo.PREtodosdados$ as dd
	where ano = a.ano and Estado = e.NomeEstado),
	case
		when a.ano = 2016 and e.SiglaEstado = 'SP' then 1
		when a.ano = 2017 and e.SiglaEstado in ('SP','PR','ES','MG','SC') then 1
		when a.ano = 2018 and e.SiglaEstado in ('SP','PR','ES','MG','SC','MT','MS','GO','DF','RS') then 1
		else 2
	end as Casezinho,
	dd.Score,
	DD.Pib
from
	PlanilhaExcel.dbo.PREtodosdados$ as DD join
	D_ANO as A on (dd.Ano = A.ano) join
	D_ESTADO as E on (DD.Estado = E.NomeEstado)
go


/*

*/

--Insert Homem 0 1
insert into F_POPULACAO(
	fk_ano,
	fk_estado,
	fk_genero,
	fk_faixaEtaria,
	fk_classificacao,
	fk_investimento,
	Score,
	QuantidadeFaixaEtaria)
select
	A.sk_ano,
	E.sk_estado,
	1 as 'Masculino',
	1 as '0a1',
	(select 
		case 
			when dd.[s_H_0 a 1] < 2 then 1
			when dd.[s_H_0 a 1] between 2 and 9 then 2
			when dd.[s_H_0 a 1] between 10 and 18 then 3
			when dd.[s_H_0 a 1] between 19 and 26 then 4
			when dd.[s_H_0 a 1] > 26 then 5
		end as 'case'
	from 
		PlanilhaExcel.dbo.PREtodosdados$ as dd
	where ano = a.ano and Estado = e.NomeEstado),
	case
		when a.ano = 2016 and e.SiglaEstado = 'SP' then 1
		when a.ano = 2017 and e.SiglaEstado in ('SP','PR','ES','MG','SC') then 1
		when a.ano = 2018 and e.SiglaEstado in ('SP','PR','ES','MG','SC','MT','MS','GO','DF','RS') then 1
		else 2
	end as Casezinho,
	dd.Score,
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
	fk_classificacao,
	fk_investimento,
	Score,
	QuantidadeFaixaEtaria)
select
	A.sk_ano,
	E.sk_estado,
	1 as 'Masculino',
	2 as '1a4',
	(select 
		case 
			when dd.[s_H_1 a 4] < 2 then 1
			when dd.[s_H_1 a 4] between 2 and 9 then 2
			when dd.[s_H_1 a 4] between 10 and 18 then 3
			when dd.[s_H_1 a 4] between 19 and 26 then 4
			when dd.[s_H_1 a 4] > 26 then 5
		end as 'case'
	from 
		PlanilhaExcel.dbo.PREtodosdados$ as dd
	where ano = a.ano and Estado = e.NomeEstado),
	case
		when a.ano = 2016 and e.SiglaEstado = 'SP' then 1
		when a.ano = 2017 and e.SiglaEstado in ('SP','PR','ES','MG','SC') then 1
		when a.ano = 2018 and e.SiglaEstado in ('SP','PR','ES','MG','SC','MT','MS','GO','DF','RS') then 1
		else 2
	end as Casezinho,
	dd.Score,
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
	fk_classificacao,
	fk_investimento,
	Score,
	QuantidadeFaixaEtaria)
select
	A.sk_ano,
	E.sk_estado,
	1 as 'Masculino',
	3 as '5a9',
	(select 
		case 
			when dd.[s_H_5 a 9] < 2 then 1
			when dd.[s_H_5 a 9] between 2 and 9 then 2
			when dd.[s_H_5 a 9] between 10 and 18 then 3
			when dd.[s_H_5 a 9] between 19 and 26 then 4
			when dd.[s_H_5 a 9] > 26 then 5
		end as 'case'
	from 
		PlanilhaExcel.dbo.PREtodosdados$ as dd
	where ano = a.ano and Estado = e.NomeEstado),
	case
		when a.ano = 2016 and e.SiglaEstado = 'SP' then 1
		when a.ano = 2017 and e.SiglaEstado in ('SP','PR','ES','MG','SC') then 1
		when a.ano = 2018 and e.SiglaEstado in ('SP','PR','ES','MG','SC','MT','MS','GO','DF','RS') then 1
		else 2
	end as Casezinho,
	dd.Score,
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
	fk_classificacao,
	fk_investimento,
	Score,
	QuantidadeFaixaEtaria)
select
	A.sk_ano,
	E.sk_estado,
	1 as 'Masculino',
	4 as '10a14',
	(select 
		case 
			when dd.[s_H_10 a 14] < 2 then 1
			when dd.[s_H_10 a 14] between 2 and 9 then 2
			when dd.[s_H_10 a 14] between 10 and 18 then 3
			when dd.[s_H_10 a 14] between 19 and 26 then 4
			when dd.[s_H_10 a 14] > 26 then 5
		end as 'case'
	from 
		PlanilhaExcel.dbo.PREtodosdados$ as dd
	where ano = a.ano and Estado = e.NomeEstado),
	case
		when a.ano = 2016 and e.SiglaEstado = 'SP' then 1
		when a.ano = 2017 and e.SiglaEstado in ('SP','PR','ES','MG','SC') then 1
		when a.ano = 2018 and e.SiglaEstado in ('SP','PR','ES','MG','SC','MT','MS','GO','DF','RS') then 1
		else 2
	end as Casezinho,
	dd.Score,
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
	fk_classificacao,
	fk_investimento,
	Score,
	QuantidadeFaixaEtaria)
select
	A.sk_ano,
	E.sk_estado,
	1 as 'Masculino',
	5 as '15a19',
	(select 
		case 
			when dd.[s_H_15 a 19] < 2 then 1
			when dd.[s_H_15 a 19] between 2 and 9 then 2
			when dd.[s_H_15 a 19] between 10 and 18 then 3
			when dd.[s_H_15 a 19] between 19 and 26 then 4
			when dd.[s_H_15 a 19] > 26 then 5
		end as 'case'
	from 
		PlanilhaExcel.dbo.PREtodosdados$ as dd
	where ano = a.ano and Estado = e.NomeEstado),
	case
		when a.ano = 2016 and e.SiglaEstado = 'SP' then 1
		when a.ano = 2017 and e.SiglaEstado in ('SP','PR','ES','MG','SC') then 1
		when a.ano = 2018 and e.SiglaEstado in ('SP','PR','ES','MG','SC','MT','MS','GO','DF','RS') then 1
		else 2
	end as Casezinho,
	dd.Score,
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
	fk_classificacao,
	fk_investimento,
	Score,
	QuantidadeFaixaEtaria)
select
	A.sk_ano,
	E.sk_estado,
	1 as 'Masculino',
	6 as '20a29',
	(select 
		case 
			when dd.[s_H_20 a 29] < 2 then 1
			when dd.[s_H_20 a 29] between 2 and 9 then 2
			when dd.[s_H_20 a 29] between 10 and 18 then 3
			when dd.[s_H_20 a 29] between 19 and 26 then 4
			when dd.[s_H_20 a 29] > 26 then 5
		end as 'case'
	from 
		PlanilhaExcel.dbo.PREtodosdados$ as dd
	where ano = a.ano and Estado = e.NomeEstado),
	case
		when a.ano = 2016 and e.SiglaEstado = 'SP' then 1
		when a.ano = 2017 and e.SiglaEstado in ('SP','PR','ES','MG','SC') then 1
		when a.ano = 2018 and e.SiglaEstado in ('SP','PR','ES','MG','SC','MT','MS','GO','DF','RS') then 1
		else 2
	end as Casezinho,
	dd.Score,
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
	fk_classificacao,
	fk_investimento,
	Score,
	QuantidadeFaixaEtaria)
select
	A.sk_ano,
	E.sk_estado,
	1 as 'Masculino',
	7 as '30a39',
	(select 
		case 
			when dd.[s_H_30 a 39] < 2 then 1
			when dd.[s_H_30 a 39] between 2 and 9 then 2
			when dd.[s_H_30 a 39] between 10 and 18 then 3
			when dd.[s_H_30 a 39] between 19 and 26 then 4
			when dd.[s_H_30 a 39] > 26 then 5
		end as 'case'
	from 
		PlanilhaExcel.dbo.PREtodosdados$ as dd
	where ano = a.ano and Estado = e.NomeEstado),
	case
		when a.ano = 2016 and e.SiglaEstado = 'SP' then 1
		when a.ano = 2017 and e.SiglaEstado in ('SP','PR','ES','MG','SC') then 1
		when a.ano = 2018 and e.SiglaEstado in ('SP','PR','ES','MG','SC','MT','MS','GO','DF','RS') then 1
		else 2
	end as Casezinho,
	dd.Score,
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
	fk_classificacao,
	fk_investimento,
	Score,
	QuantidadeFaixaEtaria)
select
	A.sk_ano,
	E.sk_estado,
	1 as 'Masculino',
	8 as '40a49',
	(select 
		case 
			when dd.[s_H_40 a 49] < 2 then 1
			when dd.[s_H_40 a 49] between 2 and 9 then 2
			when dd.[s_H_40 a 49] between 10 and 18 then 3
			when dd.[s_H_40 a 49] between 19 and 26 then 4
			when dd.[s_H_40 a 49] > 26 then 5
		end as 'case'
	from 
		PlanilhaExcel.dbo.PREtodosdados$ as dd
	where ano = a.ano and Estado = e.NomeEstado),
	case
		when a.ano = 2016 and e.SiglaEstado = 'SP' then 1
		when a.ano = 2017 and e.SiglaEstado in ('SP','PR','ES','MG','SC') then 1
		when a.ano = 2018 and e.SiglaEstado in ('SP','PR','ES','MG','SC','MT','MS','GO','DF','RS') then 1
		else 2
	end as Casezinho,
	dd.Score,
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
	fk_classificacao,
	fk_investimento,
	Score,
	QuantidadeFaixaEtaria)
select
	A.sk_ano,
	E.sk_estado,
	1 as 'Masculino',
	9 as '50a59',
	(select 
		case 
			when dd.[s_H_50 a 59] < 2 then 1
			when dd.[s_H_50 a 59] between 2 and 9 then 2
			when dd.[s_H_50 a 59] between 10 and 18 then 3
			when dd.[s_H_50 a 59] between 19 and 26 then 4
			when dd.[s_H_50 a 59] > 26 then 5
		end as 'case'
	from 
		PlanilhaExcel.dbo.PREtodosdados$ as dd
	where ano = a.ano and Estado = e.NomeEstado),
	case
		when a.ano = 2016 and e.SiglaEstado = 'SP' then 1
		when a.ano = 2017 and e.SiglaEstado in ('SP','PR','ES','MG','SC') then 1
		when a.ano = 2018 and e.SiglaEstado in ('SP','PR','ES','MG','SC','MT','MS','GO','DF','RS') then 1
		else 2
	end as Casezinho,
	dd.Score,
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
	fk_classificacao,
	fk_investimento,
	Score,
	QuantidadeFaixaEtaria)
select
	A.sk_ano,
	E.sk_estado,
	1 as 'Masculino',
	10 as '60a69',
	(select 
		case 
			when dd.[s_H_60 a 69] < 2 then 1
			when dd.[s_H_60 a 69] between 2 and 9 then 2
			when dd.[s_H_60 a 69] between 10 and 18 then 3
			when dd.[s_H_60 a 69] between 19 and 26 then 4
			when dd.[s_H_60 a 69] > 26 then 5
		end as 'case'
	from 
		PlanilhaExcel.dbo.PREtodosdados$ as dd
	where ano = a.ano and Estado = e.NomeEstado),
	case
		when a.ano = 2016 and e.SiglaEstado = 'SP' then 1
		when a.ano = 2017 and e.SiglaEstado in ('SP','PR','ES','MG','SC') then 1
		when a.ano = 2018 and e.SiglaEstado in ('SP','PR','ES','MG','SC','MT','MS','GO','DF','RS') then 1
		else 2
	end as Casezinho,
	dd.Score,
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
	fk_classificacao,
	fk_investimento,
	Score,
	QuantidadeFaixaEtaria)
select
	A.sk_ano,
	E.sk_estado,
	1 as 'Masculino',
	11 as '70a69',
	(select 
		case 
			when dd.[s_H_70 a 79] < 2 then 1
			when dd.[s_H_70 a 79] between 2 and 9 then 2
			when dd.[s_H_70 a 79] between 10 and 18 then 3
			when dd.[s_H_70 a 79] between 19 and 26 then 4
			when dd.[s_H_70 a 79] > 26 then 5
		end as 'case'
	from 
		PlanilhaExcel.dbo.PREtodosdados$ as dd
	where ano = a.ano and Estado = e.NomeEstado),
	case
		when a.ano = 2016 and e.SiglaEstado = 'SP' then 1
		when a.ano = 2017 and e.SiglaEstado in ('SP','PR','ES','MG','SC') then 1
		when a.ano = 2018 and e.SiglaEstado in ('SP','PR','ES','MG','SC','MT','MS','GO','DF','RS') then 1
		else 2
	end as Casezinho,
	dd.Score,
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
	fk_classificacao,
	fk_investimento,
	Score,
	QuantidadeFaixaEtaria)
select
	A.sk_ano,
	E.sk_estado,
	1 as 'Masculino',
	12 as '80 mais',
	(select 
		case 
			when dd.[s_H_80 +] < 2 then 1
			when dd.[s_H_80 +] between 2 and 9 then 2
			when dd.[s_H_80 +] between 10 and 18 then 3
			when dd.[s_H_80 +] between 19 and 26 then 4
			when dd.[s_H_80 +] > 26 then 5
		end as 'case'
	from 
		PlanilhaExcel.dbo.PREtodosdados$ as dd
	where ano = a.ano and Estado = e.NomeEstado),
	case
		when a.ano = 2016 and e.SiglaEstado = 'SP' then 1
		when a.ano = 2017 and e.SiglaEstado in ('SP','PR','ES','MG','SC') then 1
		when a.ano = 2018 and e.SiglaEstado in ('SP','PR','ES','MG','SC','MT','MS','GO','DF','RS') then 1
		else 2
	end as Casezinho,
	dd.Score,
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
	fk_classificacao,
	fk_investimento,
	Score,
	QuantidadeFaixaEtaria)
select
	A.sk_ano,
	E.sk_estado,
	2 as 'Feminino',
	1 as '0a1',
	(select 
		case 
			when dd.[s_M_0 a 1] < 2 then 1
			when dd.[s_M_0 a 1] between 2 and 9 then 2
			when dd.[s_M_0 a 1] between 10 and 18 then 3
			when dd.[s_M_0 a 1] between 19 and 26 then 4
			when dd.[s_M_0 a 1] > 26 then 5
		end as 'case'
	from 
		PlanilhaExcel.dbo.PREtodosdados$ as dd
	where ano = a.ano and Estado = e.NomeEstado),
	case
		when a.ano = 2016 and e.SiglaEstado = 'SP' then 1
		when a.ano = 2017 and e.SiglaEstado in ('SP','PR','ES','MG','SC') then 1
		when a.ano = 2018 and e.SiglaEstado in ('SP','PR','ES','MG','SC','MT','MS','GO','DF','RS') then 1
		else 2
	end as Casezinho,
	dd.Score,
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
	fk_classificacao,
	fk_investimento,
	Score,
	QuantidadeFaixaEtaria)
select
	A.sk_ano,
	E.sk_estado,
	2 as 'Feminino',
	2 as '1a4',
	(select 
		case 
			when dd.[s_M_1 a 4] < 2 then 1
			when dd.[s_M_1 a 4] between 2 and 9 then 2
			when dd.[s_M_1 a 4] between 10 and 18 then 3
			when dd.[s_M_1 a 4] between 19 and 26 then 4
			when dd.[s_M_1 a 4] > 26 then 5
		end as 'case'
	from 
		PlanilhaExcel.dbo.PREtodosdados$ as dd
	where ano = a.ano and Estado = e.NomeEstado),
	case
		when a.ano = 2016 and e.SiglaEstado = 'SP' then 1
		when a.ano = 2017 and e.SiglaEstado in ('SP','PR','ES','MG','SC') then 1
		when a.ano = 2018 and e.SiglaEstado in ('SP','PR','ES','MG','SC','MT','MS','GO','DF','RS') then 1
		else 2
	end as Casezinho,
	dd.Score,
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
	fk_classificacao,
	fk_investimento,
	Score,
	QuantidadeFaixaEtaria)
select
	A.sk_ano,
	E.sk_estado,
	2 as 'Feminino',
	3 as '5a9',
	(select 
		case 
			when dd.[s_M_5 a 9] < 2 then 1
			when dd.[s_M_5 a 9] between 2 and 9 then 2
			when dd.[s_M_5 a 9] between 10 and 18 then 3
			when dd.[s_M_5 a 9] between 19 and 26 then 4
			when dd.[s_M_5 a 9] > 26 then 5
		end as 'case'
	from 
		PlanilhaExcel.dbo.PREtodosdados$ as dd
	where ano = a.ano and Estado = e.NomeEstado),
	case
		when a.ano = 2016 and e.SiglaEstado = 'SP' then 1
		when a.ano = 2017 and e.SiglaEstado in ('SP','PR','ES','MG','SC') then 1
		when a.ano = 2018 and e.SiglaEstado in ('SP','PR','ES','MG','SC','MT','MS','GO','DF','RS') then 1
		else 2
	end as Casezinho,
	dd.Score,
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
	fk_classificacao,
	fk_investimento,
	Score,
	QuantidadeFaixaEtaria)
select
	A.sk_ano,
	E.sk_estado,
	2 as 'Feminino',
	4 as '10a14',
	(select 
		case 
			when dd.[s_M_10 a 14] < 2 then 1
			when dd.[s_M_10 a 14] between 2 and 9 then 2
			when dd.[s_M_10 a 14] between 10 and 18 then 3
			when dd.[s_M_10 a 14] between 19 and 26 then 4
			when dd.[s_M_10 a 14] > 26 then 5
		end as 'case'
	from 
		PlanilhaExcel.dbo.PREtodosdados$ as dd
	where ano = a.ano and Estado = e.NomeEstado),
	case
		when a.ano = 2016 and e.SiglaEstado = 'SP' then 1
		when a.ano = 2017 and e.SiglaEstado in ('SP','PR','ES','MG','SC') then 1
		when a.ano = 2018 and e.SiglaEstado in ('SP','PR','ES','MG','SC','MT','MS','GO','DF','RS') then 1
		else 2
	end as Casezinho,
	dd.Score,
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
	fk_classificacao,
	fk_investimento,
	Score,
	QuantidadeFaixaEtaria)
select
	A.sk_ano,
	E.sk_estado,
	2 as 'Feminino',
	5 as '15a19',
	(select 
		case 
			when dd.[s_M_15 a 19] < 2 then 1
			when dd.[s_M_15 a 19] between 2 and 9 then 2
			when dd.[s_M_15 a 19] between 10 and 18 then 3
			when dd.[s_M_15 a 19] between 19 and 26 then 4
			when dd.[s_M_15 a 19] > 26 then 5
		end as 'case'
	from 
		PlanilhaExcel.dbo.PREtodosdados$ as dd
	where ano = a.ano and Estado = e.NomeEstado),
	case
		when a.ano = 2016 and e.SiglaEstado = 'SP' then 1
		when a.ano = 2017 and e.SiglaEstado in ('SP','PR','ES','MG','SC') then 1
		when a.ano = 2018 and e.SiglaEstado in ('SP','PR','ES','MG','SC','MT','MS','GO','DF','RS') then 1
		else 2
	end as Casezinho,
	dd.Score,
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
	fk_classificacao,
	fk_investimento,
	Score,
	QuantidadeFaixaEtaria)
select
	A.sk_ano,
	E.sk_estado,
	2 as 'Feminino',
	6 as '20a29',
	(select 
		case 
			when dd.[s_M_20 a 29] < 2 then 1
			when dd.[s_M_20 a 29] between 2 and 9 then 2
			when dd.[s_M_20 a 29] between 10 and 18 then 3
			when dd.[s_M_20 a 29] between 19 and 26 then 4
			when dd.[s_M_20 a 29] > 26 then 5
		end as 'case'
	from 
		PlanilhaExcel.dbo.PREtodosdados$ as dd
	where ano = a.ano and Estado = e.NomeEstado),
	case
		when a.ano = 2016 and e.SiglaEstado = 'SP' then 1
		when a.ano = 2017 and e.SiglaEstado in ('SP','PR','ES','MG','SC') then 1
		when a.ano = 2018 and e.SiglaEstado in ('SP','PR','ES','MG','SC','MT','MS','GO','DF','RS') then 1
		else 2
	end as Casezinho,
	dd.Score,
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
	fk_classificacao,
	fk_investimento,
	Score,
	QuantidadeFaixaEtaria)
select
	A.sk_ano,
	E.sk_estado,
	2 as 'Feminino',
	7 as '30a39',
	(select 
		case 
			when dd.[s_M_30 a 39] < 2 then 1
			when dd.[s_M_30 a 39] between 2 and 9 then 2
			when dd.[s_M_30 a 39] between 10 and 18 then 3
			when dd.[s_M_30 a 39] between 19 and 26 then 4
			when dd.[s_M_30 a 39] > 26 then 5
		end as 'case'
	from 
		PlanilhaExcel.dbo.PREtodosdados$ as dd
	where ano = a.ano and Estado = e.NomeEstado),
	case
		when a.ano = 2016 and e.SiglaEstado = 'SP' then 1
		when a.ano = 2017 and e.SiglaEstado in ('SP','PR','ES','MG','SC') then 1
		when a.ano = 2018 and e.SiglaEstado in ('SP','PR','ES','MG','SC','MT','MS','GO','DF','RS') then 1
		else 2
	end as Casezinho,
	dd.Score,
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
	fk_classificacao,
	fk_investimento,
	Score,
	QuantidadeFaixaEtaria)
select
	A.sk_ano,
	E.sk_estado,
	2 as 'Feminino',
	8 as '40a49',
	(select 
		case 
			when [s_40 a 49] < 2 then 1
			when [s_40 a 49] between 2 and 9 then 2
			when [s_40 a 49] between 10 and 18 then 3
			when [s_40 a 49] between 19 and 26 then 4
			when [s_40 a 49] > 26 then 5
		end as 'case'
	from 
		PlanilhaExcel.dbo.PREtodosdados$ as dd
	where ano = a.ano and Estado = e.NomeEstado),
	case
		when a.ano = 2016 and e.SiglaEstado = 'SP' then 1
		when a.ano = 2017 and e.SiglaEstado in ('SP','PR','ES','MG','SC') then 1
		when a.ano = 2018 and e.SiglaEstado in ('SP','PR','ES','MG','SC','MT','MS','GO','DF','RS') then 1
		else 2
	end as Casezinho,
	dd.Score,
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
	fk_classificacao,
	fk_investimento,
	Score,
	QuantidadeFaixaEtaria)
select
	A.sk_ano,
	E.sk_estado,
	2 as 'Feminino',
	9 as '50a59',
	(select 
		case 
			when [s_M_50 a 59] < 2 then 1
			when [s_M_50 a 59] between 2 and 9 then 2
			when [s_M_50 a 59] between 10 and 18 then 3
			when [s_M_50 a 59] between 19 and 26 then 4
			when [s_M_50 a 59] > 26 then 5
		end as 'case'
	from 
		PlanilhaExcel.dbo.PREtodosdados$ as dd
	where ano = a.ano and Estado = e.NomeEstado),
	case
		when a.ano = 2016 and e.SiglaEstado = 'SP' then 1
		when a.ano = 2017 and e.SiglaEstado in ('SP','PR','ES','MG','SC') then 1
		when a.ano = 2018 and e.SiglaEstado in ('SP','PR','ES','MG','SC','MT','MS','GO','DF','RS') then 1
		else 2
	end as Casezinho,
	dd.Score,
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
	fk_classificacao,
	fk_investimento,
	Score,
	QuantidadeFaixaEtaria)
select
	A.sk_ano,
	E.sk_estado,
	2 as 'Feminino',
	10 as '60a69',
	(select 
		case 
			when [s_M_60 a 69] < 2 then 1
			when [s_M_60 a 69] between 2 and 9 then 2
			when [s_M_60 a 69] between 10 and 18 then 3
			when [s_M_60 a 69] between 19 and 26 then 4
			when [s_M_60 a 69] > 26 then 5
		end as 'case'
	from 
		PlanilhaExcel.dbo.PREtodosdados$ as dd
	where ano = a.ano and Estado = e.NomeEstado),
	case
		when a.ano = 2016 and e.SiglaEstado = 'SP' then 1
		when a.ano = 2017 and e.SiglaEstado in ('SP','PR','ES','MG','SC') then 1
		when a.ano = 2018 and e.SiglaEstado in ('SP','PR','ES','MG','SC','MT','MS','GO','DF','RS') then 1
		else 2
	end as Casezinho,
	dd.Score,
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
	fk_classificacao,
	fk_investimento,
	Score,
	QuantidadeFaixaEtaria)
select
	A.sk_ano,
	E.sk_estado,
	2 as 'Feminino',
	11 as '70a79',
	(select 
		case 
			when dd.[s_M_70 a 79] < 2 then 1
			when dd.[s_M_70 a 79] = 2 then 2
			when dd.[s_M_70 a 79] = 3 then 3
			when dd.[s_M_70 a 79] = 4 then 4
			when dd.[s_M_70 a 79] = 5 then 5
		end as 'case'
	from 
		PlanilhaExcel.dbo.PREtodosdados$ as dd
	where ano = a.ano and Estado = e.NomeEstado),
	case
		when a.ano = 2016 and e.SiglaEstado = 'SP' then 1
		when a.ano = 2017 and e.SiglaEstado in ('SP','PR','ES','MG','SC') then 1
		when a.ano = 2018 and e.SiglaEstado in ('SP','PR','ES','MG','SC','MT','MS','GO','DF','RS') then 1
		else 2
	end as Casezinho,
	dd.Score,
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
	fk_classificacao,
	fk_investimento,
	Score,
	QuantidadeFaixaEtaria)
select
	A.sk_ano,
	E.sk_estado,
	2 as 'Feminino',
	12 as '80 mais',
	(select 
		case 
			when dd.[s_M_80 +] < 2 then 1
			when dd.[s_M_80 +] between 2 and 9 then 2
			when dd.[s_M_80 +] between 10 and 18 then 3
			when dd.[s_M_80 +] between 19 and 26 then 4
			when dd.[s_M_80 +] > 26 then 5
		end as 'case'
	from 
		PlanilhaExcel.dbo.PREtodosdados$ as dd
	where ano = a.ano and Estado = e.NomeEstado),
	case
		when a.ano = 2016 and e.SiglaEstado = 'SP' then 1
		when a.ano = 2017 and e.SiglaEstado in ('SP','PR','ES','MG','SC') then 1
		when a.ano = 2018 and e.SiglaEstado in ('SP','PR','ES','MG','SC','MT','MS','GO','DF','RS') then 1
		else 2
	end as Casezinho,
	dd.Score,
	DD.[M_80 +]
from
	PlanilhaExcel.dbo.PREtodosdados$ as DD join
	D_ANO as A on (dd.Ano = A.ano) join
	D_ESTADO as E on (DD.Estado = E.NomeEstado)
go

insert into F_RENDAPERCAPITA(
	fk_ano,
	fk_estado,
	fk_classificacao,
	fk_investimento,
	Score,
	Renda)
select
	A.sk_ano,
	E.sk_estado,
	(select 
		case 
			when dd.s_RendaPerCapita < 2 then 1
			when dd.s_RendaPerCapita = 2 then 2
			when dd.s_RendaPerCapita = 3 then 3
			when dd.s_RendaPerCapita = 4 then 4
			when dd.s_RendaPerCapita = 5 then 5
		end as 'case'
	from 
		PlanilhaExcel.dbo.PREtodosdados$ as dd
	where ano = a.ano and Estado = e.NomeEstado),
	case
		when a.ano = 2016 and e.SiglaEstado = 'SP' then 1
		when a.ano = 2017 and e.SiglaEstado in ('SP','PR','ES','MG','SC') then 1
		when a.ano = 2018 and e.SiglaEstado in ('SP','PR','ES','MG','SC','MT','MS','GO','DF','RS') then 1
		else 2
	end as Casezinho,
	dd.Score,
	DD.RendaPerCapita
from
	PlanilhaExcel.dbo.PREtodosdados$ as DD join
	D_ANO as A on (dd.Ano = A.ano) join
	D_ESTADO as E on (DD.Estado = E.NomeEstado)
go

insert into F_EMPREGO(
	fk_ano,
	fk_estado,
	fk_classificacao,
	fk_investimento,
	Score,
	totalAdmissao,
	TotalDemissao,
	TaxaDesemprego)
select
	A.sk_ano,
	E.sk_estado,
	(select 
		case 
			when dd.s_TaxaDesemprego < 2 and dd.s_TotalAdmissao < 2 or dd.s_TotalDemissao < 2 then 1
			when dd.s_TaxaDesemprego = 2 and dd.s_TotalAdmissao between 2 and 9 or dd.s_TotalDemissao between 2 and 9 then 2
			when dd.s_TaxaDesemprego = 3 and dd.s_TotalAdmissao between 10 and 18 or dd.s_TotalDemissao between 10 and 18 then 3
			when dd.s_TaxaDesemprego = 4 and dd.s_TotalAdmissao between 19 and 26 or dd.s_TotalDemissao between 19 and 26 then 4
			when dd.s_TaxaDesemprego = 5 and dd.s_TotalAdmissao > 26 or dd.s_TotalDemissao > 26 then 5
		end as 'case'
	from 
		PlanilhaExcel.dbo.PREtodosdados$ as dd
	where ano = a.ano and Estado = e.NomeEstado),
	case
		when a.ano = 2016 and e.SiglaEstado = 'SP' then 1
		when a.ano = 2017 and e.SiglaEstado in ('SP','PR','ES','MG','SC') then 1
		when a.ano = 2018 and e.SiglaEstado in ('SP','PR','ES','MG','SC','MT','MS','GO','DF','RS') then 1
		else 2
	end as Casezinho,
	dd.Score,
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
	fk_classificacao,
	fk_investimento,
	Score,
	QuantidadeVeiculo)
select
	A.sk_ano,
	E.sk_estado,
	1 as 'Tipo Veiculo',
	(select 
		case 
			when dd.s_Automovel < 2 then 1
			when dd.s_Automovel between 2 and 9 then 2
			when dd.s_Automovel between 10 and 18 then 3
			when dd.s_Automovel between 19 and 26 then 4
			when dd.s_Automovel > 26 then 5
		end as 'case'
	from 
		PlanilhaExcel.dbo.PREtodosdados$ as dd
	where ano = a.ano and Estado = e.NomeEstado),
	case
		when a.ano = 2016 and e.SiglaEstado = 'SP' then 1
		when a.ano = 2017 and e.SiglaEstado in ('SP','PR','ES','MG','SC') then 1
		when a.ano = 2018 and e.SiglaEstado in ('SP','PR','ES','MG','SC','MT','MS','GO','DF','RS') then 1
		else 2
	end as Casezinho,
	dd.Score,
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
	fk_classificacao,
	fk_investimento,
	Score,
	QuantidadeVeiculo)
select
	A.sk_ano,
	E.sk_estado,
	2 as 'Tipo Veiculo',
	(select 
		case 
			when dd.s_Caminhao < 2 then 1
			when dd.s_Caminhao between 2 and 9 then 2
			when dd.s_Caminhao between 10 and 18 then 3
			when dd.s_Caminhao between 19 and 26 then 4
			when dd.s_Caminhao > 26 then 5
		end as 'case'
	from 
		PlanilhaExcel.dbo.PREtodosdados$ as dd
	where ano = a.ano and Estado = e.NomeEstado),
	case
		when a.ano = 2016 and e.SiglaEstado = 'SP' then 1
		when a.ano = 2017 and e.SiglaEstado in ('SP','PR','ES','MG','SC') then 1
		when a.ano = 2018 and e.SiglaEstado in ('SP','PR','ES','MG','SC','MT','MS','GO','DF','RS') then 1
		else 2
	end as Casezinho,
	dd.Score,
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
	fk_classificacao,
	fk_investimento,
	Score,
	QuantidadeVeiculo)
select
	A.sk_ano,
	E.sk_estado,
	3 as 'Tipo Veiculo',
	(select 
		case 
			when dd.s_CaminhaoTrator < 2 then 1
			when dd.s_CaminhaoTrator between 2 and 9 then 2
			when dd.s_CaminhaoTrator between 10 and 18 then 3
			when dd.s_CaminhaoTrator between 19 and 26 then 4
			when dd.s_CaminhaoTrator > 26 then 5
		end as 'case'
	from 
		PlanilhaExcel.dbo.PREtodosdados$ as dd
	where ano = a.ano and Estado = e.NomeEstado),
	case
		when a.ano = 2016 and e.SiglaEstado = 'SP' then 1
		when a.ano = 2017 and e.SiglaEstado in ('SP','PR','ES','MG','SC') then 1
		when a.ano = 2018 and e.SiglaEstado in ('SP','PR','ES','MG','SC','MT','MS','GO','DF','RS') then 1
		else 2
	end as Casezinho,
	dd.Score,
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
	fk_classificacao,
	fk_investimento,
	Score,
	QuantidadeVeiculo)
select
	A.sk_ano,
	E.sk_estado,
	4 as 'Tipo Veiculo',
	(select 
		case 
			when dd.s_Caminhonete < 2 then 1
			when dd.s_Caminhonete between 2 and 9 then 2
			when dd.s_Caminhonete between 10 and 18 then 3
			when dd.s_Caminhonete between 19 and 26 then 4
			when dd.s_Caminhonete > 26 then 5
		end as 'case'
	from 
		PlanilhaExcel.dbo.PREtodosdados$ as dd
	where ano = a.ano and Estado = e.NomeEstado),
	case
		when a.ano = 2016 and e.SiglaEstado = 'SP' then 1
		when a.ano = 2017 and e.SiglaEstado in ('SP','PR','ES','MG','SC') then 1
		when a.ano = 2018 and e.SiglaEstado in ('SP','PR','ES','MG','SC','MT','MS','GO','DF','RS') then 1
		else 2
	end as Casezinho,
	dd.Score,
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
	fk_classificacao,
	fk_investimento,
	Score,
	QuantidadeVeiculo)
select
	A.sk_ano,
	E.sk_estado,
	5 as 'Tipo Veiculo',
	(select 
		case 
			when dd.s_Camioneta < 2 then 1
			when dd.s_Camioneta between 2 and 9 then 2
			when dd.s_Camioneta between 10 and 18 then 3
			when dd.s_Camioneta between 19 and 26 then 4
			when dd.s_Camioneta > 26 then 5
		end as 'case'
	from 
		PlanilhaExcel.dbo.PREtodosdados$ as dd
	where ano = a.ano and Estado = e.NomeEstado),
	case
		when a.ano = 2016 and e.SiglaEstado = 'SP' then 1
		when a.ano = 2017 and e.SiglaEstado in ('SP','PR','ES','MG','SC') then 1
		when a.ano = 2018 and e.SiglaEstado in ('SP','PR','ES','MG','SC','MT','MS','GO','DF','RS') then 1
		else 2
	end as Casezinho,
	dd.Score,
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
	fk_classificacao,
	fk_investimento,
	Score,
	QuantidadeVeiculo)
select
	A.sk_ano,
	E.sk_estado,
	6 as 'Tipo Veiculo',
	(select 
		case 
			when dd.s_Ciclomotor < 2 then 1
			when dd.s_Ciclomotor between 2 and 9 then 2
			when dd.s_Ciclomotor between 10 and 18 then 3
			when dd.s_Ciclomotor between 19 and 26 then 4
			when dd.s_Ciclomotor > 26 then 5
		end as 'case'
	from 
		PlanilhaExcel.dbo.PREtodosdados$ as dd
	where ano = a.ano and Estado = e.NomeEstado),
	case
		when a.ano = 2016 and e.SiglaEstado = 'SP' then 1
		when a.ano = 2017 and e.SiglaEstado in ('SP','PR','ES','MG','SC') then 1
		when a.ano = 2018 and e.SiglaEstado in ('SP','PR','ES','MG','SC','MT','MS','GO','DF','RS') then 1
		else 2
	end as Casezinho,
	dd.Score,
	DD.Ciclomotor
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
	fk_classificacao,
	fk_investimento,
	Score,
	QuantidadeVeiculo)
select
	A.sk_ano,
	E.sk_estado,
	7 as 'Tipo Veiculo',
	(select 
		case 
			when dd.s_Microonibus < 2 then 1
			when dd.s_Microonibus between 2 and 9 then 2
			when dd.s_Microonibus between 10 and 18 then 3
			when dd.s_Microonibus between 19 and 26 then 4
			when dd.s_Microonibus > 26 then 5
		end as 'case'
	from 
		PlanilhaExcel.dbo.PREtodosdados$ as dd
	where ano = a.ano and Estado = e.NomeEstado),
	case
		when a.ano = 2016 and e.SiglaEstado = 'SP' then 1
		when a.ano = 2017 and e.SiglaEstado in ('SP','PR','ES','MG','SC') then 1
		when a.ano = 2018 and e.SiglaEstado in ('SP','PR','ES','MG','SC','MT','MS','GO','DF','RS') then 1
		else 2
	end as Casezinho,
	dd.Score,
	DD.Microonibus
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
	fk_classificacao,
	fk_investimento,
	Score,
	QuantidadeVeiculo)
select
	A.sk_ano,
	E.sk_estado,
	8 as 'Tipo Veiculo',
	(select 
		case 
			when dd.s_Motocicleta < 2 then 1
			when dd.s_Motocicleta between 2 and 9 then 2
			when dd.s_Motocicleta between 10 and 18 then 3
			when dd.s_Motocicleta between 19 and 26 then 4
			when dd.s_Motocicleta > 26 then 5
		end as 'case'
	from 
		PlanilhaExcel.dbo.PREtodosdados$ as dd
	where ano = a.ano and Estado = e.NomeEstado),
	case
		when a.ano = 2016 and e.SiglaEstado = 'SP' then 1
		when a.ano = 2017 and e.SiglaEstado in ('SP','PR','ES','MG','SC') then 1
		when a.ano = 2018 and e.SiglaEstado in ('SP','PR','ES','MG','SC','MT','MS','GO','DF','RS') then 1
		else 2
	end as Casezinho,
	dd.Score,
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
	fk_classificacao,
	fk_investimento,
	Score,
	QuantidadeVeiculo)
select
	A.sk_ano,
	E.sk_estado,
	9 as 'Tipo Veiculo',
	(select 
		case 
			when dd.s_Motoneta < 2 then 1
			when dd.s_Motoneta between 2 and 9 then 2
			when dd.s_Motoneta between 10 and 18 then 3
			when dd.s_Motoneta between 19 and 26 then 4
			when dd.s_Motoneta > 26 then 5
		end as 'case'
	from 
		PlanilhaExcel.dbo.PREtodosdados$ as dd
	where ano = a.ano and Estado = e.NomeEstado),
	case
		when a.ano = 2016 and e.SiglaEstado = 'SP' then 1
		when a.ano = 2017 and e.SiglaEstado in ('SP','PR','ES','MG','SC') then 1
		when a.ano = 2018 and e.SiglaEstado in ('SP','PR','ES','MG','SC','MT','MS','GO','DF','RS') then 1
		else 2
	end as Casezinho,
	dd.Score,
	DD.Motoneta
from
	PlanilhaExcel.dbo.PREtodosdados$ as DD join
	D_ANO as A on (dd.Ano = A.ano) join
	D_ESTADO as E on (DD.Estado = E.NomeEstado)
go

insert into F_RENDIMENTO(
	fk_ano,
	fk_estado,
	fk_classificacao,
	fk_investimento,
	Score,
	RendimentoMedio)
select
	A.sk_ano,
	E.sk_estado,
	(select 
		case 
			when dd.s_RendimentoMedio < 2 then 1
			when dd.s_RendimentoMedio = 2 then 2
			when dd.s_RendimentoMedio = 3 then 3
			when dd.s_RendimentoMedio = 4 then 4
			when dd.s_RendimentoMedio = 5 then 5
		end as 'case'
	from 
		PlanilhaExcel.dbo.PREtodosdados$ as dd
	where ano = a.ano and Estado = e.NomeEstado),
	case
		when a.ano = 2016 and e.SiglaEstado = 'SP' then 1
		when a.ano = 2017 and e.SiglaEstado in ('SP','PR','ES','MG','SC') then 1
		when a.ano = 2018 and e.SiglaEstado in ('SP','PR','ES','MG','SC','MT','MS','GO','DF','RS') then 1
		else 2
	end as Casezinho,
	dd.Score,
	RendimentoMedio
from
	PlanilhaExcel.dbo.PREtodosdados$ as DD join
	D_ANO as A on (dd.Ano = A.ano) join
	D_ESTADO as E on (DD.Estado = E.NomeEstado)
go

insert into F_INADIMPLENTE(
	fk_ano,
	fk_estado,
	fk_classificacao,
	QuantidadeInadimplente,
	fk_investimento,
	Score,
	TaxaInadimplente)
select
	A.sk_ano,
	E.sk_estado,
	(select 
		case 
			when dd.s_TaxaInadimplencia < 2 then 1
			when dd.s_TaxaInadimplencia = 2 then 2
			when dd.s_TaxaInadimplencia = 3 then 3
			when dd.s_TaxaInadimplencia = 4 then 4
			when dd.s_TaxaInadimplencia = 5 then 5
		end as 'case'
	from 
		PlanilhaExcel.dbo.PREtodosdados$ as dd
	where ano = a.ano and Estado = e.NomeEstado),
	DD.QtdInadimplentes,
	case
		when a.ano = 2016 and e.SiglaEstado = 'SP' then 1
		when a.ano = 2017 and e.SiglaEstado in ('SP','PR','ES','MG','SC') then 1
		when a.ano = 2018 and e.SiglaEstado in ('SP','PR','ES','MG','SC','MT','MS','GO','DF','RS') then 1
		else 2
	end as Casezinho,
	dd.Score,
	DD.TaxaInadimplencia
from
	PlanilhaExcel.dbo.PREtodosdados$ as DD join
	D_ANO as A on (dd.Ano = A.ano) join
	D_ESTADO as E on (DD.Estado = E.NomeEstado)
go

insert into F_IMPOSTO(
	fk_ano,
	fk_estado,
	fk_classificacao,
	fk_investimento,
	Score,
	TotalImposto)
select
	A.sk_ano,
	E.sk_estado,
	(select 
		case 
			when dd.s_ImpostoSobreProduto < 2 then 1
			when dd.s_ImpostoSobreProduto between 2 and 9 then 2
			when dd.s_ImpostoSobreProduto between 10 and 18 then 3
			when dd.s_ImpostoSobreProduto between 19 and 26 then 4
			when dd.s_ImpostoSobreProduto > 26 then 5
		end as 'case'
	from 
		PlanilhaExcel.dbo.PREtodosdados$ as dd
	where ano = a.ano and Estado = e.NomeEstado),
	case
		when a.ano = 2016 and e.SiglaEstado = 'SP' then 1
		when a.ano = 2017 and e.SiglaEstado in ('SP','PR','ES','MG','SC') then 1
		when a.ano = 2018 and e.SiglaEstado in ('SP','PR','ES','MG','SC','MT','MS','GO','DF','RS') then 1
		else 2
	end as Casezinho,
	dd.Score,
	DD.ImpostoSobreProduto
from
	PlanilhaExcel.dbo.PREtodosdados$ as DD join
	D_ANO as A on (dd.Ano = A.ano) join
	D_ESTADO as E on (DD.Estado = E.NomeEstado)
go