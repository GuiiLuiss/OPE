# -*- coding: utf-8 -*-
"""
Created on Sat Aug 31 20:22:36 2019

@author: guilh
"""

import pandas as pd
import numpy as np

#Importando a base de dados
df = pd.read_csv('C:/Users/guilh/Desktop/OPE - Interative/Dados/Csv/TodosDados.csv')

#Tratando coluna Estado - Tirando os acentos
df['Estado'] = [x.replace('ã','a').replace('é','e').replace('ç','c').replace('í','i').replace('ô','o').replace('á','a') for x in df['Estado']]

#Tratando coluna Imposto sobre Produto
df['ImpostoSobreProduto']=df['ImpostoSobreProduto'].astype('str')
df['ImpostoSobreProduto'] = df['ImpostoSobreProduto'].apply(lambda x:x.replace(',',''))
df['ImpostoSobreProduto'] = df['ImpostoSobreProduto'].astype('int64')

#Tratando coluna Pib
df['Pib']=df['Pib'].astype('str')
df['Pib'] = df['Pib'].apply(lambda x:x.replace(',',''))
df['Pib'] = df['Pib'].astype('int64')

#Transformando coluna Renda per capita
df['RendaPerCapita']=df['RendaPerCapita'].astype('str')
df['RendaPerCapita'] = df['RendaPerCapita'].apply(lambda x:x.replace('$','').replace(',','').replace('R',''))
df['RendaPerCapita'] = df['RendaPerCapita'].astype('float64')

#Transformando coluna Rendimento Médio
df['RendimentoMedio']=df['RendimentoMedio'].astype('str')
df['RendimentoMedio'] = df['RendimentoMedio'].apply(lambda x:x.replace('$','').replace(',','').replace('R',''))
df['RendimentoMedio'] = df['RendimentoMedio'].astype('float64')

#Transformando coluna TaxaDesemprego
df['TaxaDesemprego'] = df['TaxaDesemprego'].apply(lambda x:x.replace('%','')).astype('float')
df['TaxaDesemprego'] = [x/100 for x in df['TaxaDesemprego']]

#Transformando coluna TaxaInadimplencia
df['TaxaInadimplencia'] = df['TaxaInadimplencia'].apply(lambda x:x.replace('%','')).astype('float')
df['TaxaInadimplencia'] = [x/100 for x in df['TaxaInadimplencia']]

#Baixando o CSV

df.to_csv('C:\Files\PREtodosdados.csv',index=False)
