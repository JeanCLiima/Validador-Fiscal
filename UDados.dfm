object FDados: TFDados
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 1680
  Width = 694
  object SItemVenda: TSQLDataSet
    CommandText = 
      'SELECT VE.DATA_EMISSAO, VE.COD_NOTA, IV.COD_PROD, IV.NOMEPROD, I' +
      'V.PICMS AS ALIQUOTA, IV.CST_CSOSN AS CST, IV.CFOP, '#39'Venda de Mer' +
      'cadoria'#39' AS FINALIDADE,'#39'NFC-e'#39' AS ORIGEM, '#39'Diverg'#234'ncia de CST co' +
      'm CFOP'#39' AS ERRO, IC.MENSAGEM_ICMS AS ICMS'#13#10'FROM ITEMVENDA IV'#13#10'IN' +
      'NER JOIN VENDAS VE ON VE.COD_NOTA = IV.COD_NOTA '#13#10'INNER JOIN ICM' +
      'S IC ON IV.COD_ICMS = IC.COD_ICMS'#13#10'WHERE (VE.DATA_EMISSAO BETWEE' +
      'N :DATA1 AND :DATA2) '#13#10'AND (VE.NUM_NFC IS NOT NULL)'#13#10'AND (VE.NFC' +
      '_FLAG='#39'T'#39')'#13#10'AND ( ( ((IV.CST_CSOSN NOT IN ('#39'40'#39', '#39'00'#39', '#39'20'#39')) AN' +
      'D (IV.CFOP IN ('#39'5102'#39'))) OR '#13#10'((IV.CST_CSOSN NOT IN ('#39'60'#39')) AND ' +
      '(IV.CFOP IN ('#39'5405'#39', '#39'5656'#39'))) )'#13#10'OR ( ((IV.CST_CSOSN IN ('#39'40'#39', ' +
      #39'00'#39', '#39'20'#39')) AND (IV.CFOP NOT IN ('#39'5102'#39'))) OR '#13#10'((IV.CST_CSOSN ' +
      'IN ('#39'60'#39')) AND (IV.CFOP NOT IN ('#39'5405'#39', '#39'5656'#39'))) ) )'#13#10'ORDER BY ' +
      'VE.DATA_EMISSAO, VE.COD_NOTA, IV.COD_PROD'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'DATA1'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA2'
        ParamType = ptInput
      end>
    SQLConnection = Dados
    Left = 40
    Top = 183
    object SItemVendaCOD_NOTA: TIntegerField
      FieldName = 'COD_NOTA'
      Required = True
    end
    object SItemVendaCOD_PROD: TIntegerField
      FieldName = 'COD_PROD'
    end
    object SItemVendaNOMEPROD: TStringField
      FieldName = 'NOMEPROD'
      Size = 50
    end
    object SItemVendaCST: TStringField
      FieldName = 'CST'
      Size = 3
    end
    object SItemVendaCFOP: TStringField
      FieldName = 'CFOP'
      Size = 4
    end
    object SItemVendaFINALIDADE: TStringField
      Alignment = taCenter
      FieldName = 'FINALIDADE'
      Required = True
      FixedChar = True
      Size = 19
    end
    object SItemVendaERRO: TStringField
      DisplayWidth = 40
      FieldName = 'ERRO'
      Required = True
      FixedChar = True
      Size = 27
    end
    object SItemVendaDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
    end
    object SItemVendaALIQUOTA: TFMTBCDField
      Alignment = taCenter
      FieldName = 'ALIQUOTA'
      Precision = 18
      Size = 2
    end
    object SItemVendaORIGEM: TStringField
      Alignment = taCenter
      FieldName = 'ORIGEM'
      Required = True
      FixedChar = True
      Size = 5
    end
    object SItemVendaICMS: TStringField
      FieldName = 'ICMS'
      Size = 30
    end
  end
  object CItemVenda: TClientDataSet
    Aggregates = <>
    Filtered = True
    Params = <>
    ProviderName = 'DPItemVenda'
    Left = 40
    Top = 231
    object CItemVendaCOD_NOTA: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'COD_NOTA'
      Required = True
    end
    object CItemVendaCOD_PROD: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'COD_PROD'
    end
    object CItemVendaNOMEPROD: TStringField
      FieldName = 'NOMEPROD'
      Size = 50
    end
    object CItemVendaCST: TStringField
      Alignment = taCenter
      FieldName = 'CST'
      Size = 3
    end
    object CItemVendaCFOP: TStringField
      Alignment = taCenter
      FieldName = 'CFOP'
      Size = 4
    end
    object CItemVendaFINALIDADE: TStringField
      FieldName = 'FINALIDADE'
      Required = True
      FixedChar = True
      Size = 19
    end
    object CItemVendaERRO: TStringField
      Alignment = taCenter
      FieldName = 'ERRO'
      Required = True
      FixedChar = True
      Size = 27
    end
    object CItemVendaDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
    end
    object CItemVendaALIQUOTA: TFMTBCDField
      FieldName = 'ALIQUOTA'
      Precision = 18
      Size = 2
    end
    object CItemVendaORIGEM: TStringField
      FieldName = 'ORIGEM'
      Required = True
      FixedChar = True
      Size = 5
    end
    object CItemVendaICMS: TStringField
      FieldName = 'ICMS'
      Size = 30
    end
  end
  object DPItemVenda: TDataSetProvider
    DataSet = SItemVenda
    Left = 40
    Top = 279
  end
  object SItemNotaEmit: TSQLDataSet
    CommandText = 
      'SELECT DATA_EMISSAO, COD_NOTA, COD_PROD, NOMEPROD, ALIQUOTA, ALI' +
      'QUOTA_ST, CST, CFOP, FINALIDADE, ORIGEM, ICMS,  ERRO FROM'#13#10'('#13#10'SE' +
      'LECT NP.DESCRICAO AS FINALIDADE, '#39'NF-e '#209' Consum Final'#39' AS ORIGEM' +
      ', '#39'Diverg'#234'ncia de CST com CFOP'#39' AS ERRO, IC.MENSAGEM_ICMS AS ICM' +
      'S, NE.COD_NOTA AS COD_NOTA, IE.COD_PROD AS COD_PROD, IE.NOME_PRO' +
      'D AS NOMEPROD ,IE.ALIQUOTA_ICMS AS ALIQUOTA, IE.ALIQUOTA_ICMS_ST' +
      ' AS ALIQUOTA_ST, IE.CST AS CST, IE.CFOP AS CFOP, NE.DATA_EMISSAO' +
      ' AS DATA_EMISSAO FROM ITEMNOTAEMITIDA IE'#13#10'INNER JOIN NOTASEMITID' +
      'AS NE ON NE.COD_NOTA=IE.COD_NOTA'#13#10'INNER JOIN NATUREZA_OPERACAO N' +
      'P ON NP.CODIGO=NE.COD_NATUREZA_OPERACAO'#13#10'INNER JOIN ICMS IC ON I' +
      'E.COD_ICMS=IC.COD_ICMS'#13#10'WHERE (NE.INDFINAL=0)'#13#10'AND (NE.STATUS='#39'A' +
      'utorizada'#39')'#13#10'AND ( ('#13#10'      ((SUBSTRING (IE.CST FROM 2 FOR 3) IN' +
      ' ('#39'00'#39', '#39'20'#39', '#39'40'#39')) AND (IE.CFOP NOT IN (6202, 5202, 5102, 6102' +
      ')))'#13#10'OR ((SUBSTRING (IE.CST FROM 2 FOR 3) IN ('#39'50'#39')) AND (IE.CFO' +
      'P NOT IN ( 6915)))'#13#10'OR ((SUBSTRING (IE.CST FROM 2 FOR 3) IN ('#39'51' +
      #39', '#39'41'#39')) AND (IE.CFOP NOT IN ( 5915)))'#13#10#13#10'OR ((SUBSTRING (IE.CS' +
      'T FROM 2 FOR 3) IN ('#39'10'#39')) AND (IE.CFOP NOT IN (6403)))'#13#10'OR ((SU' +
      'BSTRING (IE.CST FROM 2 FOR 3) IN ('#39'60'#39')) AND (IE.CFOP NOT IN (54' +
      '11, 6411, 5405, 5661, 6661)))'#13#10#13#10' ) OR ('#13#10#13#10'      ((SUBSTRING (I' +
      'E.CST FROM 2 FOR 3) NOT IN ('#39'00'#39', '#39'20'#39', '#39'40'#39')) AND (IE.CFOP IN (' +
      '6202, 5202, 5102, 6102)))'#13#10'OR ((SUBSTRING (IE.CST FROM 2 FOR 3) ' +
      'NOT IN ('#39'50'#39')) AND (IE.CFOP IN ( 6915)))'#13#10'OR ((SUBSTRING (IE.CST' +
      ' FROM 2 FOR 3) NOT IN ('#39'51'#39', '#39'41'#39')) AND (IE.CFOP IN ( 5915)))'#13#10#13 +
      #10'OR ((SUBSTRING (IE.CST FROM 2 FOR 3) NOT IN ('#39'10'#39')) AND (IE.CFO' +
      'P IN (6403)))'#13#10'OR ((SUBSTRING (IE.CST FROM 2 FOR 3) NOT IN ('#39'60'#39 +
      ')) AND (IE.CFOP IN (5411, 6411, 5405, 5661, 6661)))'#13#10#13#10') )'#13#10#13#10'UN' +
      'ION'#13#10#13#10'SELECT  NP.DESCRICAO AS FINALIDADE, '#39'NF-e Consum Final'#39' A' +
      'S ORIGEM, '#39'Diverg'#234'ncia de CST com CFOP'#39' AS ERRO, IC.MENSAGEM_ICM' +
      'S AS ICMS, NE.COD_NOTA AS COD_NOTA, IE.COD_PROD, IE.NOME_PROD AS' +
      ' NOMEPROD, IE.ALIQUOTA_ICMS AS ALIQUOTA, IE.ALIQUOTA_ICMS_ST AS ' +
      'ALIQUOTA_ST, IE.CST_CONSUM_FINAL AS CST, IE.CFOP_CONSUM_FINAL AS' +
      ' CFOP, NE.DATA_EMISSAO AS DATA_EMISSAO  FROM ITEMNOTAEMITIDA IE'#13 +
      #10'INNER JOIN NOTASEMITIDAS NE ON NE.COD_NOTA=IE.COD_NOTA'#13#10'INNER J' +
      'OIN NATUREZA_OPERACAO NP ON NP.CODIGO=NE.COD_NATUREZA_OPERACAO'#13#10 +
      'INNER JOIN ICMS IC ON IE.COD_ICMS=IC.COD_ICMS'#13#10'WHERE (NE.INDFINA' +
      'L=1)'#13#10'AND (NE.STATUS='#39'Autorizada'#39')'#13#10'AND ( ('#13#10#13#10'  ((SUBSTRING (IE' +
      '.CST_CONSUM_FINAL FROM 2 FOR 3) NOT IN ('#39'00'#39', '#39'20'#39', '#39'40'#39')) AND (' +
      'IE.CFOP_CONSUM_FINAL IN (5102, 6102, 1202, 2202)))'#13#10'OR  ((SUBSTR' +
      'ING (IE.CST_CONSUM_FINAL FROM 2 FOR 3) NOT IN ('#39'60'#39')) AND  (IE.C' +
      'FOP_CONSUM_FINAL IN (5405, 5656, 6404, 6656,  6108, 1411, 2411, ' +
      '1662, 2662)))'#13#10'OR  ((SUBSTRING (IE.CST_CONSUM_FINAL FROM 2 FOR 3' +
      ') NOT IN ('#39'90'#39')) AND  (IE.CFOP_CONSUM_FINAL IN (5949, 6949)))'#13#10#13 +
      #10') OR ( '#13#10#13#10'  ((SUBSTRING (IE.CST_CONSUM_FINAL FROM 2 FOR 3) IN ' +
      '('#39'00'#39', '#39'20'#39', '#39'40'#39')) AND (IE.CFOP_CONSUM_FINAL NOT IN (5102, 6102' +
      ', 1202, 2202, 5910, 5929)))'#13#10'OR  ((SUBSTRING (IE.CST_CONSUM_FINA' +
      'L FROM 2 FOR 3) IN ('#39'60'#39'))  AND (IE.CFOP_CONSUM_FINAL NOT IN (54' +
      '05, 5656, 6404, 6656, 6108, 1411, 2411, 1662, 2662, 5910, 5929))' +
      ')'#13#10'OR  ((SUBSTRING (IE.CST_CONSUM_FINAL FROM 2 FOR 3) IN ('#39'90'#39'))' +
      '  AND (IE.CFOP_CONSUM_FINAL NOT IN (5949, 6949)))'#13#10#13#10' ) )'#13#10#13#10'UNI' +
      'ON'#13#10#13#10'SELECT NP.DESCRICAO AS FINALIDADE,  '#39'NF-e '#209' Consum Final'#39' ' +
      'AS ORIGEM, '#39'Consultar disponibilidade CST com CFOP'#39' AS ERRO, IC.' +
      'MENSAGEM_ICMS AS ICMS, NE.COD_NOTA AS COD_NOTA, IE.COD_PROD, IE.' +
      'NOME_PROD AS NOMEPROD, IE.ALIQUOTA_ICMS AS ALIQUOTA, IE.ALIQUOTA' +
      '_ICMS_ST AS ALIQUOTA_ST, IE.CST AS CST, IE.CFOP AS CFOP, NE.DATA' +
      '_EMISSAO AS DATA_EMISSAO FROM ITEMNOTAEMITIDA IE'#13#10'INNER JOIN NOT' +
      'ASEMITIDAS NE ON NE.COD_NOTA=IE.COD_NOTA'#13#10'INNER JOIN NATUREZA_OP' +
      'ERACAO NP ON NP.CODIGO=NE.COD_NATUREZA_OPERACAO'#13#10'INNER JOIN ICMS' +
      ' IC ON IE.COD_ICMS=IC.COD_ICMS'#13#10'WHERE  (NE.INDFINAL=0)'#13#10'AND  (NE' +
      '.STATUS='#39'Autorizada'#39')  '#13#10'AND (SUBSTRING (IE.CST FROM 2 FOR 3) IN' +
      ' ('#39'70'#39'))'#13#10#13#10'UNION'#13#10#13#10'SELECT  NP.DESCRICAO AS FINALIDADE, '#39'NF-e C' +
      'onsum Final'#39' AS ORIGEM, '#39'Consultar disponibilidade CST com CFOP'#39 +
      ' AS ERRO, IC.MENSAGEM_ICMS AS ICMS,  NE.COD_NOTA AS COD_NOTA, IE' +
      '.COD_PROD, IE.NOME_PROD AS NOMEPROD, IE.ALIQUOTA_ICMS AS ALIQUOT' +
      'A, IE.ALIQUOTA_ICMS_ST AS ALIQUOTA_ST, IE.CST_CONSUM_FINAL AS CS' +
      'T, IE.CFOP_CONSUM_FINAL AS CFOP, NE.DATA_EMISSAO AS DATA_EMISSAO' +
      '  FROM ITEMNOTAEMITIDA IE'#13#10'INNER JOIN NOTASEMITIDAS NE ON NE.COD' +
      '_NOTA=IE.COD_NOTA'#13#10'INNER JOIN NATUREZA_OPERACAO NP ON NP.CODIGO=' +
      'NE.COD_NATUREZA_OPERACAO'#13#10'INNER JOIN ICMS IC ON IE.COD_ICMS=IC.C' +
      'OD_ICMS'#13#10'WHERE (NE.INDFINAL=1)'#13#10'AND (NE.STATUS='#39'Autorizada'#39')'#13#10'AN' +
      'D  (SUBSTRING (IE.CST_CONSUM_FINAL FROM 2 FOR 3) IN ('#39'10'#39', '#39'50'#39',' +
      ' '#39'51'#39', '#39'41'#39', '#39'70'#39')) '#13#10')'#13#10'WHERE DATA_EMISSAO BETWEEN :DATA1 AND :' +
      'DATA2'#13#10'ORDER BY DATA_EMISSAO, COD_NOTA, COD_PROD'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'DATA1'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA2'
        ParamType = ptInput
      end>
    SQLConnection = Dados
    Left = 40
    Top = 359
    object SItemNotaEmitDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
    end
    object SItemNotaEmitCOD_NOTA: TIntegerField
      FieldName = 'COD_NOTA'
    end
    object SItemNotaEmitCOD_PROD: TIntegerField
      FieldName = 'COD_PROD'
    end
    object SItemNotaEmitNOMEPROD: TStringField
      FieldName = 'NOMEPROD'
      Size = 50
    end
    object SItemNotaEmitALIQUOTA: TFMTBCDField
      FieldName = 'ALIQUOTA'
      Precision = 18
      Size = 2
    end
    object SItemNotaEmitCST: TStringField
      FieldName = 'CST'
      Size = 4
    end
    object SItemNotaEmitCFOP: TIntegerField
      FieldName = 'CFOP'
    end
    object SItemNotaEmitFINALIDADE: TStringField
      FieldName = 'FINALIDADE'
      Size = 50
    end
    object SItemNotaEmitORIGEM: TStringField
      FieldName = 'ORIGEM'
      Required = True
      FixedChar = True
      Size = 19
    end
    object SItemNotaEmitERRO: TStringField
      FieldName = 'ERRO'
      Required = True
      FixedChar = True
      Size = 29
    end
    object SItemNotaEmitICMS: TStringField
      FieldName = 'ICMS'
      Size = 30
    end
    object SItemNotaEmitALIQUOTA_ST: TFMTBCDField
      FieldName = 'ALIQUOTA_ST'
      Precision = 18
      Size = 2
    end
  end
  object CItemNotaEmit: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DPItemNotaEmit'
    Left = 40
    Top = 407
    object CItemNotaEmitDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
    end
    object CItemNotaEmitCOD_NOTA: TIntegerField
      FieldName = 'COD_NOTA'
    end
    object CItemNotaEmitCOD_PROD: TIntegerField
      FieldName = 'COD_PROD'
    end
    object CItemNotaEmitNOMEPROD: TStringField
      FieldName = 'NOMEPROD'
      Size = 50
    end
    object CItemNotaEmitCST: TStringField
      FieldName = 'CST'
      Size = 4
    end
    object CItemNotaEmitCFOP: TIntegerField
      FieldName = 'CFOP'
    end
    object CItemNotaEmitFINALIDADE: TStringField
      FieldName = 'FINALIDADE'
      Size = 50
    end
    object CItemNotaEmitERRO: TStringField
      FieldName = 'ERRO'
      Required = True
      FixedChar = True
      Size = 29
    end
    object CItemNotaEmitALIQUOTA: TFMTBCDField
      FieldName = 'ALIQUOTA'
      Precision = 18
      Size = 2
    end
    object CItemNotaEmitORIGEM: TStringField
      FieldName = 'ORIGEM'
      Required = True
      FixedChar = True
      Size = 19
    end
    object CItemNotaEmitICMS: TStringField
      FieldName = 'ICMS'
      Size = 30
    end
    object CItemNotaEmitALIQUOTA_ST: TFMTBCDField
      Alignment = taCenter
      FieldName = 'ALIQUOTA_ST'
      Precision = 18
      Size = 2
    end
  end
  object DPItemNotaEmit: TDataSetProvider
    DataSet = SItemNotaEmit
    Left = 40
    Top = 455
  end
  object SItemNotaEnt: TSQLDataSet
    CommandText = 
      'SELECT DATA_EMISSAO, DATA_RECEBIM, COD_NOTA, XML,  COD_PROD, NOM' +
      'EPROD, CST_CSOSN_FORN, CFOP_FORN, CST_ENTRADA, CFOP_ENTRADA, FIN' +
      'ALIDADE, ERRO, TIPO_EMP, ITEM_NOTA, MAX_ITEM FROM'#13#10'( SELECT '#39'Ana' +
      'lisar Trib. de Entrada baseando-se na CST'#39' AS ERRO, '#39'Simples Nac' +
      'ional'#39' AS TIPO_EMP, NE.COD_NOTAFORN AS COD_NOTA, NE.CHAVE_NOTA A' +
      'S XML, IE.COD_PROD AS COD_PROD, IE.XPROD AS NOMEPROD, IE.CSON AS' +
      ' CST_CSOSN_FORN, IE.CFOP AS CFOP_FORN, IE.CST_ENTRADA, IE.CFOP_O' +
      'POSTO AS CFOP_ENTRADA, NE.DATA_EMISSAO, NE.DATA_RECEBIM, NE.NAT_' +
      'OPERACAO AS FINALIDADE, IE.ITEM_NOTA, (SELECT COUNT (N.COD_NOTA)' +
      ' FROM ITEMNOTAENT N WHERE N.COD_NOTA=IE.COD_NOTA) AS MAX_ITEM FR' +
      'OM ITEMNOTAENT IE'#13#10'INNER JOIN NOTASENTRADA NE ON NE.COD_NOTA=IE.' +
      'COD_NOTA'#13#10'WHERE ((IE.CSON IS NOT NULL) AND (IE.CSON > 0))'#13#10'AND (' +
      '  (((IE.CSON IN ('#39'500'#39', '#39'201'#39')) AND (IE.CFOP IN (5103, 6103))) A' +
      'ND (IE.CFOP_OPOSTO NOT IN (1403)))'#13#10'OR  (((IE.CSON IN ('#39'102'#39', '#39'1' +
      '01'#39')) AND (IE.CFOP IN (5103, 6103))) AND (IE.CFOP_OPOSTO NOT IN ' +
      '(1102)))'#13#10'OR  (((IE.CSON IN ('#39'500'#39', '#39'201'#39')) AND (IE.CFOP IN (510' +
      '4, 6103))) AND (IE.CFOP_OPOSTO NOT IN (1403)))'#13#10'OR  (((IE.CSON I' +
      'N ('#39'300'#39')) AND (IE.CFOP IN (5114, 6114))) AND (IE.CFOP_OPOSTO NO' +
      'T IN (1113)))'#13#10'OR  (((IE.CSON IN ('#39'102'#39', '#39'101'#39')) AND (IE.CFOP IN' +
      ' (5104, 6104))) AND (IE.CFOP_OPOSTO NOT IN (1102)))'#13#10'OR  (((IE.C' +
      'SON IN ('#39'500'#39', '#39'201'#39')) AND (IE.CFOP IN (5105, 6105))) AND (IE.CF' +
      'OP_OPOSTO NOT IN (1403)))'#13#10'OR  (((IE.CSON IN ('#39'102'#39')) AND (IE.CF' +
      'OP IN (5105, 6105))) AND (IE.CFOP_OPOSTO NOT IN (1102)))'#13#10'OR  ((' +
      '(IE.CSON IN ('#39'500'#39', '#39'201'#39')) AND (IE.CFOP IN (5106, 6106))) AND (' +
      'IE.CFOP_OPOSTO NOT IN (1403)))'#13#10'OR  (((IE.CSON IN ('#39'102'#39', '#39'101'#39')' +
      ') AND (IE.CFOP IN (5106, 6106))) AND (IE.CFOP_OPOSTO NOT IN (110' +
      '2)))  )'#13#10#13#10'UNION'#13#10#13#10'SELECT '#39'Analisar Trib. de Entrada baseando-s' +
      'e na CST'#39' AS ERRO, '#39'Categoria Geral'#39' AS TIPO_EMP, NE.COD_NOTAFOR' +
      'N AS COD_NOTA, NE.CHAVE_NOTA AS XML, IE.COD_PROD AS COD_PROD, IE' +
      '.XPROD AS NOMEPROD, IE.CST AS CST_CSOSN_FORN, IE.CFOP AS CFOP_FO' +
      'RN, IE.CST_ENTRADA, IE.CFOP_OPOSTO AS CFOP_ENTRADA, NE.DATA_EMIS' +
      'SAO, NE.DATA_RECEBIM, NE.NAT_OPERACAO AS FINALIDADE, IE.ITEM_NOT' +
      'A, (SELECT COUNT (N.COD_NOTA) FROM ITEMNOTAENT N WHERE N.COD_NOT' +
      'A=IE.COD_NOTA) AS MAX_ITEM FROM ITEMNOTAENT IE'#13#10'INNER JOIN NOTAS' +
      'ENTRADA NE ON NE.COD_NOTA=IE.COD_NOTA'#13#10'WHERE ((IE.CSON IS  NULL)' +
      ' OR (IE.CSON = 0))'#13#10'AND  (  (((IE.CST IN ('#39'60'#39', '#39'10'#39', '#39'70'#39')) AND' +
      ' (IE.CFOP IN (5103, 6103))) AND (IE.CFOP_OPOSTO NOT IN (1403)))'#13 +
      #10'OR  (((IE.CST IN ('#39'00'#39','#39'20'#39')) AND (IE.CFOP IN (5103, 6103))) AN' +
      'D (IE.CFOP_OPOSTO NOT IN (1102)))'#13#10'OR  (((IE.CST IN ('#39'60'#39', '#39'10'#39',' +
      ' '#39'70'#39')) AND (IE.CFOP IN (5104, 6104))) AND (IE.CFOP_OPOSTO NOT I' +
      'N (1403)))'#13#10'OR  (((IE.CST IN ('#39'00'#39','#39'20'#39')) AND (IE.CFOP IN (5104,' +
      ' 6104))) AND (IE.CFOP_OPOSTO NOT IN (1102)))'#13#10'OR  (((IE.CST IN (' +
      #39'60'#39', '#39'10'#39', '#39'70'#39')) AND (IE.CFOP IN (5105, 6105))) AND (IE.CFOP_O' +
      'POSTO NOT IN (1403)))'#13#10'OR  (((IE.CST IN ('#39'00'#39','#39'20'#39')) AND (IE.CFO' +
      'P IN (5105, 6105))) AND (IE.CFOP_OPOSTO NOT IN (1102)))  '#13#10'OR  (' +
      '((IE.CST IN ('#39'60'#39', '#39'10'#39', '#39'70'#39')) AND (IE.CFOP IN (5106, 6106))) A' +
      'ND (IE.CFOP_OPOSTO NOT IN (1403)))'#13#10'OR  (((IE.CST IN ('#39'00'#39','#39'20'#39')' +
      ') AND (IE.CFOP IN (5106, 6106))) AND (IE.CFOP_OPOSTO NOT IN (110' +
      '2)))  )'#13#10#13#10'UNION'#13#10#13#10'SELECT '#39'Diverg'#234'ncia de CST de Entrada com CF' +
      'OP de Entrada'#39' AS ERRO,  '#39'Simples Nacional'#39' AS TIPO_EMP, NE.COD_' +
      'NOTAFORN AS COD_NOTA, NE.CHAVE_NOTA AS XML, IE.COD_PROD AS COD_P' +
      'ROD, IE.XPROD AS NOMEPROD, IE.CSON AS CST_CSOSN_FORN, IE.CFOP AS' +
      ' CFOP_FORN, IE.CST_ENTRADA, IE.CFOP_OPOSTO AS CFOP_ENTRADA, NE.D' +
      'ATA_EMISSAO, NE.DATA_RECEBIM, NE.NAT_OPERACAO AS FINALIDADE, IE.' +
      'ITEM_NOTA, (SELECT COUNT (N.COD_NOTA) FROM ITEMNOTAENT N WHERE N' +
      '.COD_NOTA=IE.COD_NOTA) AS MAX_ITEM FROM ITEMNOTAENT IE'#13#10'INNER JO' +
      'IN NOTASENTRADA NE ON NE.COD_NOTA=IE.COD_NOTA'#13#10'WHERE ((IE.CSON I' +
      'S NOT NULL) AND (IE.CSON > 0))'#13#10'AND (  (  ((IE.CST_ENTRADA NOT I' +
      'N ('#39'90'#39')) AND (IE.CFOP_OPOSTO IN (1353, 2353, 1556, 2556, 1407, ' +
      '2407,1923, 2923, 1406, 2406, 1551, 2551, 1552, 2552)))'#13#10'OR  ((IE' +
      '.CST_ENTRADA NOT IN ('#39'60'#39')) AND (IE.CFOP_OPOSTO IN (1403, 2403, ' +
      '1652, 2652)))'#13#10'OR  ((IE.CST_ENTRADA NOT IN ('#39'00'#39', '#39'40'#39', '#39'20'#39', '#39'5' +
      '1'#39')) AND (IE.CFOP_OPOSTO IN (1102, 2102)))'#13#10') OR (  ((IE.CST_ENT' +
      'RADA  IN ('#39'90'#39')) AND (IE.CFOP_OPOSTO NOT IN (1353, 2353, 1556, 2' +
      '556, 1407, 2407, 1923, 2923, 1406, 2406, 1949, 2949, 1551, 2551,' +
      ' 1552, 2552, 1403, 2403)))'#13#10'OR  ((IE.CST_ENTRADA  IN ('#39'60'#39')) AND' +
      ' (IE.CFOP_OPOSTO NOT IN (1403, 2403, 1652, 2652, 1910, 2910, 194' +
      '9, 2949, 1911, 2911)))'#13#10'OR  ((IE.CST_ENTRADA  IN ('#39'00'#39', '#39'40'#39', '#39'2' +
      '0'#39', '#39'51'#39')) AND (IE.CFOP_OPOSTO NOT IN (1102, 2102, 1910, 2910, 1' +
      '949, 2949, 1911, 2911)))  )  )'#13#10#13#10'UNION'#13#10#13#10'SELECT '#39'Diverg'#234'ncia d' +
      'e CST de Entrada com CFOP de Entrada'#39' AS ERRO,  '#39'Categoria Geral' +
      #39' AS TIPO_EMP, NE.COD_NOTAFORN AS COD_NOTA, NE.CHAVE_NOTA AS XML' +
      ', IE.COD_PROD AS COD_PROD, IE.XPROD AS NOMEPROD, IE.CST AS CST_C' +
      'SOSN_FORN, IE.CFOP AS CFOP_FORN, IE.CST_ENTRADA, IE.CFOP_OPOSTO ' +
      'AS CFOP_ENTRADA, NE.DATA_EMISSAO, NE.DATA_RECEBIM, NE.NAT_OPERAC' +
      'AO AS FINALIDADE, IE.ITEM_NOTA, (SELECT COUNT (N.COD_NOTA) FROM ' +
      'ITEMNOTAENT N WHERE N.COD_NOTA=IE.COD_NOTA) AS MAX_ITEM FROM ITE' +
      'MNOTAENT IE'#13#10'INNER JOIN NOTASENTRADA NE ON NE.COD_NOTA=IE.COD_NO' +
      'TA'#13#10'WHERE ((IE.CSON IS  NULL) OR (IE.CSON = 0))'#13#10'AND (  (  ((IE.' +
      'CST_ENTRADA NOT IN ('#39'90'#39')) AND (IE.CFOP_OPOSTO IN (1353, 2353, 1' +
      '556, 2556, 1407, 2407, 1923, 2923, 1406, 2406, 1551, 2551, 1552,' +
      ' 2552)))'#13#10'OR  ((IE.CST_ENTRADA NOT IN ('#39'60'#39')) AND (IE.CFOP_OPOST' +
      'O IN (1403, 2403, 1652, 2652)))'#13#10'OR  ((IE.CST_ENTRADA NOT IN ('#39'0' +
      '0'#39', '#39'40'#39', '#39'20'#39', '#39'51'#39')) AND (IE.CFOP_OPOSTO IN (1102, 2102)))'#13#10') ' +
      'OR (  ((IE.CST_ENTRADA  IN ('#39'90'#39')) AND (IE.CFOP_OPOSTO NOT IN (1' +
      '353, 2353, 1556, 2556, 1407, 2407, 1923, 2923, 1406, 2406, 1949,' +
      ' 2949, 1551, 2551, 1552, 2552)))'#13#10'OR  ((IE.CST_ENTRADA  IN ('#39'60'#39 +
      ')) AND (IE.CFOP_OPOSTO NOT IN (1403, 2403, 1652, 2652, 1910, 291' +
      '0, 1949, 2949, 1911, 2911)))'#13#10'OR  ((IE.CST_ENTRADA  IN ('#39'00'#39', '#39'4' +
      '0'#39', '#39'20'#39', '#39'51'#39')) AND (IE.CFOP_OPOSTO NOT IN (1102, 2102, 1910, 2' +
      '910, 1949, 2949, 1911, 2911)))   )  )'#13#10')'#13#10'WHERE DATA_RECEBIM BET' +
      'WEEN :DATA1 AND :DATA2'#13#10'ORDER BY DATA_EMISSAO, COD_NOTA, ITEM_NO' +
      'TA'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'DATA1'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA2'
        ParamType = ptInput
      end>
    SQLConnection = Dados
    Left = 40
    Top = 535
    object SItemNotaEntDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
    end
    object SItemNotaEntDATA_RECEBIM: TDateField
      FieldName = 'DATA_RECEBIM'
    end
    object SItemNotaEntCOD_NOTA: TIntegerField
      FieldName = 'COD_NOTA'
    end
    object SItemNotaEntXML: TStringField
      FieldName = 'XML'
      Size = 44
    end
    object SItemNotaEntCOD_PROD: TIntegerField
      FieldName = 'COD_PROD'
    end
    object SItemNotaEntNOMEPROD: TStringField
      FieldName = 'NOMEPROD'
      Size = 120
    end
    object SItemNotaEntCST_CSOSN_FORN: TStringField
      FieldName = 'CST_CSOSN_FORN'
      Size = 3
    end
    object SItemNotaEntCFOP_FORN: TStringField
      FieldName = 'CFOP_FORN'
      Size = 4
    end
    object SItemNotaEntCST_ENTRADA: TStringField
      FieldName = 'CST_ENTRADA'
      Size = 4
    end
    object SItemNotaEntCFOP_ENTRADA: TStringField
      FieldName = 'CFOP_ENTRADA'
      Size = 4
    end
    object SItemNotaEntFINALIDADE: TStringField
      FieldName = 'FINALIDADE'
      Size = 60
    end
    object SItemNotaEntERRO: TStringField
      FieldName = 'ERRO'
      Required = True
      FixedChar = True
      Size = 49
    end
    object SItemNotaEntTIPO_EMP: TStringField
      FieldName = 'TIPO_EMP'
      Required = True
      FixedChar = True
      Size = 16
    end
    object SItemNotaEntITEM_NOTA: TIntegerField
      Alignment = taCenter
      FieldName = 'ITEM_NOTA'
      Required = True
    end
    object SItemNotaEntMAX_ITEM: TIntegerField
      Alignment = taCenter
      FieldName = 'MAX_ITEM'
    end
  end
  object CItemNotaEnt: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'DATA_EMISSAO'
        DataType = ftDate
      end
      item
        Name = 'DATA_RECEBIM'
        DataType = ftDate
      end
      item
        Name = 'COD_NOTA'
        DataType = ftInteger
      end
      item
        Name = 'XML'
        DataType = ftString
        Size = 44
      end
      item
        Name = 'COD_PROD'
        DataType = ftInteger
      end
      item
        Name = 'NOMEPROD'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'CST_CSOSN_FORN'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'CFOP_FORN'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'CST_ENTRADA'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'CFOP_ENTRADA'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'FINALIDADE'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'ERRO'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 49
      end
      item
        Name = 'TIPO_EMP'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 16
      end
      item
        Name = 'ITEM_NOTA'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'MAX_ITEM'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'DPItemNotaEnt'
    StoreDefs = True
    Left = 40
    Top = 583
    object CItemNotaEntDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
    end
    object CItemNotaEntDATA_RECEBIM: TDateField
      FieldName = 'DATA_RECEBIM'
    end
    object CItemNotaEntCOD_NOTA: TIntegerField
      FieldName = 'COD_NOTA'
    end
    object CItemNotaEntXML: TStringField
      FieldName = 'XML'
      Size = 44
    end
    object CItemNotaEntCOD_PROD: TIntegerField
      FieldName = 'COD_PROD'
    end
    object CItemNotaEntNOMEPROD: TStringField
      FieldName = 'NOMEPROD'
      Size = 120
    end
    object CItemNotaEntCST_CSOSN_FORN: TStringField
      FieldName = 'CST_CSOSN_FORN'
      Size = 3
    end
    object CItemNotaEntCFOP_FORN: TStringField
      FieldName = 'CFOP_FORN'
      Size = 4
    end
    object CItemNotaEntCST_ENTRADA: TStringField
      FieldName = 'CST_ENTRADA'
      Size = 4
    end
    object CItemNotaEntCFOP_ENTRADA: TStringField
      FieldName = 'CFOP_ENTRADA'
      Size = 4
    end
    object CItemNotaEntFINALIDADE: TStringField
      FieldName = 'FINALIDADE'
      Size = 60
    end
    object CItemNotaEntERRO: TStringField
      FieldName = 'ERRO'
      Required = True
      FixedChar = True
      Size = 49
    end
    object CItemNotaEntTIPO_EMP: TStringField
      FieldName = 'TIPO_EMP'
      Required = True
      FixedChar = True
      Size = 16
    end
    object CItemNotaEntITEM_NOTA: TIntegerField
      Alignment = taCenter
      FieldName = 'ITEM_NOTA'
      Required = True
    end
    object CItemNotaEntMAX_ITEM: TIntegerField
      Alignment = taCenter
      FieldName = 'MAX_ITEM'
    end
  end
  object DPItemNotaEnt: TDataSetProvider
    DataSet = SItemNotaEnt
    Left = 40
    Top = 631
  end
  object SItemVendaCBenef: TSQLDataSet
    CommandText = 
      'SELECT DATA_EMISSAO, COD_NOTA, COD_PROD, NOMEPROD, CST, CFOP, FI' +
      'NALIDADE, ERRO, ALIQUOTA, ORIGEM, ICMS FROM'#13#10'( '#13#10'SELECT VE.DATA_' +
      'EMISSAO AS DATA_EMISSAO, VE.COD_NOTA AS COD_NOTA, IV.COD_PROD AS' +
      ' COD_PROD, IV.NOMEPROD AS NOMEPROD,IV.PICMS AS ALIQUOTA, IV.CST_' +
      'CSOSN AS CST, IV.CFOP AS CFOP, '#39'Venda de Mercadoria'#39' AS FINALIDA' +
      'DE, '#39'NFC-e'#39' AS ORIGEM, '#39'N'#195'O informado Base Legal'#39' AS ERRO, IC.ME' +
      'NSAGEM_ICMS AS ICMS'#13#10'FROM ITEMVENDA IV'#13#10'INNER JOIN VENDAS VE ON ' +
      'VE.COD_NOTA = IV.COD_NOTA '#13#10'INNER JOIN ICMS IC ON IV.COD_ICMS = ' +
      'IC.COD_ICMS'#13#10'WHERE (VE.NUM_NFC IS NOT NULL)'#13#10'AND (VE.NFC_FLAG='#39'T' +
      #39')'#13#10'AND ( (IV.CST_CSOSN IN ('#39'10'#39', '#39'20'#39','#39'40'#39','#39'41'#39','#39'50'#39','#39'51'#39','#39'60'#39',' +
      #39'70'#39')) AND (IV.CBENEF IS NULL) ) '#13#10#13#10'UNION'#13#10#13#10'SELECT VE.DATA_EMI' +
      'SSAO AS DATA_EMISSAO, VE.COD_NOTA AS COD_NOTA, IV.COD_PROD AS CO' +
      'D_PROD, IV.NOMEPROD AS NOMEPROD,IV.PICMS AS ALIQUOTA, IV.CST_CSO' +
      'SN AS CST, IV.CFOP AS CFOP, '#39'Venda de Mercadoria'#39' AS FINALIDADE,' +
      #39'NFC-e'#39' AS ORIGEM, '#39'Informado Base Legal'#39' AS ERRO, IC.MENSAGEM_I' +
      'CMS AS ICMS'#13#10'FROM ITEMVENDA IV'#13#10'INNER JOIN VENDAS VE ON VE.COD_N' +
      'OTA = IV.COD_NOTA '#13#10'INNER JOIN ICMS IC ON IV.COD_ICMS = IC.COD_I' +
      'CMS'#13#10'WHERE (VE.NUM_NFC IS NOT NULL)'#13#10'AND (VE.NFC_FLAG='#39'T'#39')'#13#10'AND ' +
      '( (IV.CST_CSOSN  IN (00)) AND (IV.CBENEF IS NOT NULL) ) '#13#10#13#10'UNIO' +
      'N'#13#10#13#10'SELECT VE.DATA_EMISSAO AS DATA_EMISSAO, VE.COD_NOTA AS COD_' +
      'NOTA, IV.COD_PROD AS COD_PROD, IV.NOMEPROD AS NOMEPROD,IV.PICMS ' +
      'AS ALIQUOTA, IV.CST_CSOSN AS CST, IV.CFOP AS CFOP, '#39'Venda de Mer' +
      'cadoria'#39' AS FINALIDADE,'#39'NFC-e'#39' AS ORIGEM, '#39'Base Legal difere do ' +
      'CFOP'#39' AS ERRO, IC.MENSAGEM_ICMS AS ICMS'#13#10'FROM ITEMVENDA IV'#13#10'INNE' +
      'R JOIN VENDAS VE ON VE.COD_NOTA = IV.COD_NOTA '#13#10'INNER JOIN ICMS ' +
      'IC ON IV.COD_ICMS = IC.COD_ICMS'#13#10'WHERE (VE.NUM_NFC IS NOT NULL)'#13 +
      #10'AND (VE.NFC_FLAG='#39'T'#39')'#13#10'AND ( ((IV.CFOP LIKE '#39'54%'#39') AND (IV.CBEN' +
      'EF NOT LIKE '#39'RS052'#39')) '#13#10'OR ((IV.CFOP LIKE '#39'51%'#39') AND (IV.CBENEF ' +
      'NOT LIKE '#39'RS051'#39')) )'#13#10')'#13#10'WHERE DATA_EMISSAO BETWEEN :DATA1 AND :' +
      'DATA2'#13#10'ORDER BY COD_PROD, DATA_EMISSAO, COD_NOTA'
    DataSource = FFiscal.DSItemVenda
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'DATA1'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA2'
        ParamType = ptInput
      end>
    SQLConnection = Dados
    Left = 152
    Top = 183
    object IntegerField1: TIntegerField
      FieldName = 'COD_NOTA'
      Required = True
    end
    object IntegerField2: TIntegerField
      FieldName = 'COD_PROD'
    end
    object StringField1: TStringField
      FieldName = 'NOMEPROD'
      Size = 50
    end
    object StringField2: TStringField
      FieldName = 'CST'
      Size = 3
    end
    object StringField3: TStringField
      FieldName = 'CFOP'
      Size = 4
    end
    object StringField4: TStringField
      Alignment = taCenter
      FieldName = 'FINALIDADE'
      Required = True
      FixedChar = True
      Size = 19
    end
    object StringField5: TStringField
      FieldName = 'ERRO'
      Required = True
      FixedChar = True
      Size = 24
    end
    object SItemVendaCBenefDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
    end
    object SItemVendaCBenefALIQUOTA: TFMTBCDField
      Alignment = taCenter
      FieldName = 'ALIQUOTA'
      Precision = 18
      Size = 2
    end
    object SItemVendaCBenefORIGEM: TStringField
      Alignment = taCenter
      FieldName = 'ORIGEM'
      Required = True
      FixedChar = True
      Size = 5
    end
    object SItemVendaCBenefICMS: TStringField
      FieldName = 'ICMS'
      Size = 30
    end
  end
  object CItemVendaCBenef: TClientDataSet
    Aggregates = <>
    Filtered = True
    Params = <>
    ProviderName = 'DPItemVendaCBenef'
    Left = 152
    Top = 231
    object CItemVendaCBenefCOD_NOTA: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'COD_NOTA'
      Required = True
    end
    object CItemVendaCBenefCOD_PROD: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'COD_PROD'
    end
    object CItemVendaCBenefNOMEPROD: TStringField
      FieldName = 'NOMEPROD'
      Size = 50
    end
    object CItemVendaCBenefCST: TStringField
      Alignment = taCenter
      FieldName = 'CST'
      Size = 3
    end
    object CItemVendaCBenefCFOP: TStringField
      Alignment = taCenter
      FieldName = 'CFOP'
      Size = 4
    end
    object CItemVendaCBenefFINALIDADE: TStringField
      FieldName = 'FINALIDADE'
      Required = True
      FixedChar = True
      Size = 19
    end
    object CItemVendaCBenefERRO: TStringField
      FieldName = 'ERRO'
      Required = True
      FixedChar = True
      Size = 24
    end
    object CItemVendaCBenefDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
    end
    object CItemVendaCBenefALIQUOTA: TFMTBCDField
      FieldName = 'ALIQUOTA'
      Precision = 18
      Size = 2
    end
    object CItemVendaCBenefORIGEM: TStringField
      FieldName = 'ORIGEM'
      Required = True
      FixedChar = True
      Size = 5
    end
    object CItemVendaCBenefICMS: TStringField
      FieldName = 'ICMS'
      Size = 30
    end
  end
  object DPItemVendaCBenef: TDataSetProvider
    DataSet = SItemVendaCBenef
    Left = 152
    Top = 279
  end
  object SItemVendaRedBC: TSQLDataSet
    CommandText = 
      'SELECT DATA_EMISSAO, COD_NOTA, COD_PROD, NOMEPROD, ALIQUOTA, CST' +
      ', CFOP, FINALIDADE, ORIGEM, ERRO, ICMS FROM'#13#10'('#13#10'SELECT VE.DATA_E' +
      'MISSAO, IV.COD_NOTA, IV.COD_PROD, IV.NOMEPROD, IV.PICMS AS ALIQU' +
      'OTA, IV.CST_CSOSN AS CST, IV.CFOP, '#39'Venda de Mercadoria'#39' AS FINA' +
      'LIDADE,'#39'NFC-e'#39' AS ORIGEM, '#39'CST Difere da Red de BC'#39' AS ERRO, IC.' +
      'MENSAGEM_ICMS AS ICMS'#13#10'FROM ITEMVENDA IV'#13#10'INNER JOIN VENDAS VE O' +
      'N VE.COD_NOTA=IV.COD_NOTA'#13#10'INNER JOIN ICMS IC ON IV.COD_ICMS = I' +
      'C.COD_ICMS'#13#10'WHERE (VE.NUM_NFC IS NOT NULL)'#13#10'AND (VE.NFC_FLAG='#39'T'#39 +
      ')'#13#10'AND ( ((IV.CST_CSOSN IN ('#39'20'#39')) AND (IV.PREDBC=0))'#13#10'OR ((IV.C' +
      'ST_CSOSN IN ('#39'00'#39', '#39'40'#39')) AND (IV.PREDBC > 0))  )'#13#10#13#10'UNION'#13#10#13#10'SE' +
      'LECT VE.DATA_EMISSAO, IV.COD_NOTA, IV.COD_PROD, IV.NOMEPROD, IV.' +
      'PICMS AS ALIQUOTA, IV.CST_CSOSN AS CST, IV.CFOP, '#39'Venda de Merca' +
      'doria'#39' AS FINALIDADE,'#39'NFC-e'#39' AS ORIGEM, '#39'CST Difere da Red de BC' +
      #39' AS ERRO, IC.MENSAGEM_ICMS AS ICMS'#13#10'FROM ITEMVENDA IV'#13#10'INNER JO' +
      'IN VENDAS VE ON VE.COD_NOTA=IV.COD_NOTA'#13#10'INNER JOIN PRODUTOS PR ' +
      'ON PR.COD_PROD = IV.COD_PROD'#13#10'INNER JOIN ICMS IC ON IC.COD_ICMS ' +
      '= PR.COD_ICMS'#13#10'WHERE (VE.NUM_NFC IS NOT NULL)'#13#10'AND (VE.NFC_FLAG=' +
      #39'T'#39')'#13#10'AND ( ((IV.CST_CSOSN IN ('#39'60'#39')) AND (IV.PREDBCEFET = 0) AN' +
      'D (IC.BASE_ICMS_ST < 100))'#13#10'OR ((IV.CST_CSOSN IN ('#39'60'#39')) AND (IV' +
      '.PREDBCEFET > 0) AND (IC.BASE_ICMS_ST = 100)) )'#13#10#13#10')'#13#10'WHERE DATA' +
      '_EMISSAO BETWEEN :DATA1 AND :DATA2'#13#10'ORDER BY COD_PROD, DATA_EMIS' +
      'SAO, COD_NOTA'
    DataSource = FFiscal.DSItemVenda
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'DATA1'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA2'
        ParamType = ptInput
      end>
    SQLConnection = Dados
    Left = 272
    Top = 183
    object IntegerField3: TIntegerField
      FieldName = 'COD_NOTA'
      Required = True
    end
    object IntegerField4: TIntegerField
      FieldName = 'COD_PROD'
    end
    object StringField6: TStringField
      FieldName = 'NOMEPROD'
      Size = 50
    end
    object StringField7: TStringField
      FieldName = 'CST'
      Size = 3
    end
    object StringField8: TStringField
      FieldName = 'CFOP'
      Size = 4
    end
    object StringField9: TStringField
      Alignment = taCenter
      FieldName = 'FINALIDADE'
      Required = True
      FixedChar = True
      Size = 19
    end
    object StringField10: TStringField
      FieldName = 'ERRO'
      Required = True
      FixedChar = True
      Size = 23
    end
    object SItemVendaRedBCDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
    end
    object SItemVendaRedBCALIQUOTA: TFMTBCDField
      Alignment = taCenter
      FieldName = 'ALIQUOTA'
      Precision = 18
      Size = 2
    end
    object SItemVendaRedBCORIGEM: TStringField
      Alignment = taCenter
      FieldName = 'ORIGEM'
      Required = True
      FixedChar = True
      Size = 5
    end
    object SItemVendaRedBCICMS: TStringField
      FieldName = 'ICMS'
      Size = 30
    end
  end
  object CItemVendaRedBC: TClientDataSet
    Aggregates = <>
    Filtered = True
    Params = <>
    ProviderName = 'DPItemVendaRedBC'
    Left = 272
    Top = 231
    object CItemVendaRedBCCOD_NOTA: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'COD_NOTA'
      Required = True
    end
    object CItemVendaRedBCCOD_PROD: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'COD_PROD'
    end
    object CItemVendaRedBCNOMEPROD: TStringField
      FieldName = 'NOMEPROD'
      Size = 50
    end
    object CItemVendaRedBCCST: TStringField
      Alignment = taCenter
      FieldName = 'CST'
      Size = 3
    end
    object CItemVendaRedBCCFOP: TStringField
      Alignment = taCenter
      FieldName = 'CFOP'
      Size = 4
    end
    object CItemVendaRedBCFINALIDADE: TStringField
      FieldName = 'FINALIDADE'
      Required = True
      FixedChar = True
      Size = 19
    end
    object CItemVendaRedBCERRO: TStringField
      FieldName = 'ERRO'
      Required = True
      FixedChar = True
      Size = 23
    end
    object CItemVendaRedBCDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
    end
    object CItemVendaRedBCALIQUOTA: TFMTBCDField
      FieldName = 'ALIQUOTA'
      Precision = 18
      Size = 2
    end
    object CItemVendaRedBCORIGEM: TStringField
      FieldName = 'ORIGEM'
      Required = True
      FixedChar = True
      Size = 5
    end
    object CItemVendaRedBCICMS: TStringField
      FieldName = 'ICMS'
      Size = 30
    end
  end
  object DPItemVendaRedBC: TDataSetProvider
    DataSet = SItemVendaRedBC
    Left = 272
    Top = 279
  end
  object SItemVendaAliq: TSQLDataSet
    CommandText = 
      'SELECT DATA_EMISSAO, COD_NOTA, COD_PROD, NOMEPROD, ALIQUOTA, CST' +
      ', CFOP, FINALIDADE, ORIGEM,  ERRO, ICMS FROM'#13#10'('#13#10'SELECT VE.DATA_' +
      'EMISSAO, IV.COD_NOTA, IV.COD_PROD, IV.NOMEPROD, IV.PICMS AS ALIQ' +
      'UOTA, IV.CST_CSOSN AS CST, IV.CFOP, '#39'Venda de Mercadoria'#39' AS FIN' +
      'ALIDADE,'#39'NFC-e'#39' AS ORIGEM, '#39'CST difere da Aliq. (%)'#39' AS ERRO, IC' +
      '.MENSAGEM_ICMS AS ICMS'#13#10'FROM ITEMVENDA IV'#13#10'INNER JOIN VENDAS VE ' +
      'ON VE.COD_NOTA=IV.COD_NOTA'#13#10'INNER JOIN ICMS IC ON IV.COD_ICMS = ' +
      'IC.COD_ICMS'#13#10'WHERE (VE.NUM_NFC IS NOT NULL)'#13#10'AND (VE.NFC_FLAG='#39'T' +
      #39')'#13#10'AND  (  ((IV.CST_CSOSN IN ('#39'00'#39','#39'20'#39') ) AND (IV.PICMS=0) ) '#13 +
      #10'OR ((IV.CST_CSOSN IN ('#39'40'#39') ) AND (IV.PICMS>0))  )'#13#10#13#10'UNION'#13#10#13#10 +
      'SELECT VE.DATA_EMISSAO, IV.COD_NOTA, IV.COD_PROD, IV.NOMEPROD, I' +
      'V.PICMSEFET AS ALIQUOTA, IV.CST_CSOSN AS CST, IV.CFOP, '#39'Venda de' +
      ' Mercadoria'#39' AS FINALIDADE,'#39'NFC-e'#39' AS ORIGEM, '#39'CST difere da Ali' +
      'q. ST (%)'#39' AS ERRO, IC.MENSAGEM_ICMS AS ICMS'#13#10'FROM ITEMVENDA IV'#13 +
      #10'INNER JOIN VENDAS VE ON VE.COD_NOTA=IV.COD_NOTA'#13#10'INNER JOIN ICM' +
      'S IC ON IV.COD_ICMS = IC.COD_ICMS'#13#10'WHERE  (VE.NUM_NFC IS NOT NUL' +
      'L)'#13#10'AND (VE.NFC_FLAG='#39'T'#39')'#13#10'AND ((IV.CST_CSOSN IN ('#39'60'#39') ) AND (I' +
      'V.PICMSEFET=0))'#13#10')'#13#10'WHERE DATA_EMISSAO BETWEEN :DATA1 AND :DATA2' +
      #13#10'ORDER BY COD_PROD, DATA_EMISSAO, COD_NOTA'
    DataSource = FFiscal.DSItemVenda
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'DATA1'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA2'
        ParamType = ptInput
      end>
    SQLConnection = Dados
    Left = 384
    Top = 183
    object IntegerField7: TIntegerField
      FieldName = 'COD_NOTA'
      Required = True
    end
    object IntegerField8: TIntegerField
      FieldName = 'COD_PROD'
    end
    object StringField16: TStringField
      FieldName = 'NOMEPROD'
      Size = 50
    end
    object StringField17: TStringField
      FieldName = 'CST'
      Size = 3
    end
    object StringField18: TStringField
      FieldName = 'CFOP'
      Size = 4
    end
    object StringField19: TStringField
      Alignment = taCenter
      FieldName = 'FINALIDADE'
      Required = True
      FixedChar = True
      Size = 19
    end
    object StringField20: TStringField
      FieldName = 'ERRO'
      Required = True
      FixedChar = True
      Size = 26
    end
    object SItemVendaAliqDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
    end
    object SItemVendaAliqALIQUOTA: TFMTBCDField
      Alignment = taCenter
      FieldName = 'ALIQUOTA'
      Precision = 18
      Size = 2
    end
    object SItemVendaAliqORIGEM: TStringField
      Alignment = taCenter
      FieldName = 'ORIGEM'
      Required = True
      FixedChar = True
      Size = 5
    end
    object SItemVendaAliqICMS: TStringField
      FieldName = 'ICMS'
      Size = 30
    end
  end
  object CItemVendaAliq: TClientDataSet
    Aggregates = <>
    Filtered = True
    Params = <>
    ProviderName = 'DPItemVendaAliq'
    Left = 384
    Top = 231
    object CItemVendaAliqCOD_NOTA: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'COD_NOTA'
      Required = True
    end
    object CItemVendaAliqCOD_PROD: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'COD_PROD'
    end
    object CItemVendaAliqNOMEPROD: TStringField
      FieldName = 'NOMEPROD'
      Size = 50
    end
    object CItemVendaAliqCST: TStringField
      Alignment = taCenter
      FieldName = 'CST'
      Size = 3
    end
    object CItemVendaAliqCFOP: TStringField
      Alignment = taCenter
      FieldName = 'CFOP'
      Size = 4
    end
    object CItemVendaAliqFINALIDADE: TStringField
      FieldName = 'FINALIDADE'
      Required = True
      FixedChar = True
      Size = 19
    end
    object CItemVendaAliqERRO: TStringField
      DisplayWidth = 40
      FieldName = 'ERRO'
      Required = True
      FixedChar = True
      Size = 26
    end
    object CItemVendaAliqDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
    end
    object CItemVendaAliqALIQUOTA: TFMTBCDField
      FieldName = 'ALIQUOTA'
      Precision = 18
      Size = 2
    end
    object CItemVendaAliqORIGEM: TStringField
      FieldName = 'ORIGEM'
      Required = True
      FixedChar = True
      Size = 5
    end
    object CItemVendaAliqICMS: TStringField
      FieldName = 'ICMS'
      Size = 30
    end
  end
  object DPItemVendaAliq: TDataSetProvider
    DataSet = SItemVendaAliq
    Left = 384
    Top = 279
  end
  object CImportTxt: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 632
    Top = 991
    object CImportTxtDATA_EMISSAO: TStringField
      Alignment = taCenter
      FieldName = 'DATA_EMISSAO'
      Size = 50
    end
    object CImportTxtDATA_ENT_SAI: TStringField
      Alignment = taCenter
      FieldName = 'DATA_ENT_SAI'
      Size = 50
    end
    object CImportTxtIE_EMIT: TStringField
      Alignment = taCenter
      FieldName = 'IE_EMIT'
      Size = 50
    end
    object CImportTxtUF_EMIT: TStringField
      Alignment = taCenter
      FieldName = 'UF_EMIT'
      Size = 50
    end
    object CImportTxtCNPJ_EMIT: TStringField
      Alignment = taCenter
      FieldName = 'CNPJ_EMIT'
      Size = 50
    end
    object CImportTxtRAZAO_EMIT: TStringField
      Alignment = taCenter
      FieldName = 'RAZAO_EMIT'
      Size = 50
    end
    object CImportTxtIE_DEST_REMET: TStringField
      Alignment = taCenter
      FieldName = 'IE_DEST_REMET'
      Size = 50
    end
    object CImportTxtUF_DEST_REMET: TStringField
      Alignment = taCenter
      FieldName = 'UF_DEST_REMET'
      Size = 50
    end
    object CImportTxtCNPJ_DEST_REMET: TStringField
      Alignment = taCenter
      FieldName = 'CNPJ_DEST_REMET'
      Size = 50
    end
    object CImportTxtRAZAO_DEST_REMET: TStringField
      Alignment = taCenter
      FieldName = 'RAZAO_DEST_REMET'
      Size = 50
    end
    object CImportTxtMOD: TStringField
      Alignment = taCenter
      FieldName = 'MOD'
      Size = 50
    end
    object CImportTxtSERIE: TStringField
      Alignment = taCenter
      FieldName = 'SERIE'
      Size = 50
    end
    object CImportTxtCOD_NOTA: TStringField
      FieldName = 'COD_NOTA'
      Size = 50
    end
    object CImportTxtTOTAL_NFE: TStringField
      FieldName = 'TOTAL_NFE'
      Size = 50
    end
    object CImportTxtTOTAL_BC_ICMS: TStringField
      FieldName = 'TOTAL_BC_ICMS'
      Size = 50
    end
    object CImportTxtTOTAL_ICMS: TStringField
      FieldName = 'TOTAL_ICMS'
      Size = 50
    end
    object CImportTxtTOTAL_BC_ICMS_ST: TStringField
      FieldName = 'TOTAL_BC_ICMS_ST'
      Size = 50
    end
    object CImportTxtTOTAL_ICMS_ST: TStringField
      FieldName = 'TOTAL_ICMS_ST'
      Size = 50
    end
    object CImportTxtSIT: TStringField
      Alignment = taCenter
      FieldName = 'SIT'
      Size = 50
    end
    object CImportTxtE_S: TStringField
      Alignment = taCenter
      FieldName = 'E_S'
      Size = 50
    end
    object CImportTxtCHAVE: TStringField
      Alignment = taCenter
      FieldName = 'CHAVE'
      Size = 50
    end
  end
  object SItemNotaEmitCBenef: TSQLDataSet
    CommandText = 
      'SELECT DATA_EMISSAO, COD_NOTA, COD_PROD, NOMEPROD, ALIQUOTA, CST' +
      ', CFOP, FINALIDADE, ORIGEM, ERRO, ICMS FROM'#13#10'('#13#10'SELECT NE.COD_NO' +
      'TA AS COD_NOTA, IE.COD_PROD AS COD_PROD, IE.NOME_PROD AS NOMEPRO' +
      'D ,IE.ALIQUOTA_ICMS AS ALIQUOTA, IE.CST AS CST, IE.CFOP AS CFOP,' +
      ' NE.DATA_EMISSAO AS DATA_EMISSAO, NP.DESCRICAO AS FINALIDADE, '#39'N' +
      'F-e '#209' Consum Final'#39' AS ORIGEM, '#39'N'#195'O informado Base Legal'#39' AS ERR' +
      'O, IC.MENSAGEM_ICMS AS ICMS FROM ITEMNOTAEMITIDA IE'#13#10'INNER JOIN ' +
      'NOTASEMITIDAS NE ON NE.COD_NOTA=IE.COD_NOTA'#13#10'INNER JOIN NATUREZA' +
      '_OPERACAO NP ON NP.CODIGO=NE.COD_NATUREZA_OPERACAO'#13#10'INNER JOIN I' +
      'CMS IC ON IE.COD_ICMS=IC.COD_ICMS'#13#10'WHERE (NE.INDFINAL=0)'#13#10'AND (N' +
      'E.STATUS='#39'Autorizada'#39')'#13#10'AND ((SUBSTRING (IE.CST FROM 2 FOR 3) IN' +
      ' ('#39'20'#39','#39'40'#39','#39'41'#39','#39'50'#39','#39'51'#39')) AND (IE.CBENEF IS NULL))'#13#10#13#10'UNION'#13#10 +
      #13#10'SELECT NE.COD_NOTA AS COD_NOTA, IE.COD_PROD AS COD_PROD, IE.NO' +
      'ME_PROD AS NOMEPROD ,IE.ALIQUOTA_ICMS_ST AS ALIQUOTA, IE.CST AS ' +
      'CST, IE.CFOP AS CFOP, NE.DATA_EMISSAO AS DATA_EMISSAO, NP.DESCRI' +
      'CAO AS FINALIDADE, '#39'NF-e '#209' Consum Final'#39' AS ORIGEM, '#39'N'#195'O informa' +
      'do Base Legal'#39' AS ERRO, IC.MENSAGEM_ICMS AS ICMS FROM ITEMNOTAEM' +
      'ITIDA IE'#13#10'INNER JOIN NOTASEMITIDAS NE ON NE.COD_NOTA=IE.COD_NOTA' +
      #13#10'INNER JOIN NATUREZA_OPERACAO NP ON NP.CODIGO=NE.COD_NATUREZA_O' +
      'PERACAO'#13#10'INNER JOIN ICMS IC ON IE.COD_ICMS=IC.COD_ICMS'#13#10'WHERE (N' +
      'E.INDFINAL=0)'#13#10'AND (NE.STATUS='#39'Autorizada'#39')'#13#10'AND ((SUBSTRING (IE' +
      '.CST FROM 2 FOR 3) IN ('#39'10'#39','#39'60'#39','#39'70'#39')) AND (IE.CBENEF IS NULL))' +
      #13#10#13#10'UNION'#13#10#13#10'SELECT NE.COD_NOTA AS COD_NOTA, IE.COD_PROD AS COD_' +
      'PROD, IE.NOME_PROD AS NOMEPROD ,IE.ALIQUOTA_ICMS AS ALIQUOTA, IE' +
      '.CST AS CST, IE.CFOP AS CFOP, NE.DATA_EMISSAO AS DATA_EMISSAO, N' +
      'P.DESCRICAO AS FINALIDADE, '#39'NF-e '#209' Consum Final'#39' AS ORIGEM, '#39'Bas' +
      'e Legal difere do CFOP'#39' AS ERRO, IC.MENSAGEM_ICMS AS ICMS FROM I' +
      'TEMNOTAEMITIDA IE'#13#10'INNER JOIN NOTASEMITIDAS NE ON NE.COD_NOTA=IE' +
      '.COD_NOTA'#13#10'INNER JOIN NATUREZA_OPERACAO NP ON NP.CODIGO=NE.COD_N' +
      'ATUREZA_OPERACAO'#13#10'INNER JOIN ICMS IC ON IE.COD_ICMS=IC.COD_ICMS'#13 +
      #10'WHERE (NE.INDFINAL=0)'#13#10'AND (NE.STATUS='#39'Autorizada'#39')'#13#10'AND ((IE.C' +
      'FOP LIKE '#39'51%'#39') AND (IE.CBENEF NOT LIKE '#39'RS051%'#39'))'#13#10#13#10'UNION'#13#10#13#10'S' +
      'ELECT NE.COD_NOTA AS COD_NOTA, IE.COD_PROD AS COD_PROD, IE.NOME_' +
      'PROD AS NOMEPROD ,IE.ALIQUOTA_ICMS_ST AS ALIQUOTA, IE.CST AS CST' +
      ', IE.CFOP AS CFOP, NE.DATA_EMISSAO AS DATA_EMISSAO, NP.DESCRICAO' +
      ' AS FINALIDADE, '#39'NF-e '#209' Consum Final'#39' AS ORIGEM, '#39'Base Legal dif' +
      'ere do CFOP'#39' AS ERRO, IC.MENSAGEM_ICMS AS ICMS FROM ITEMNOTAEMIT' +
      'IDA IE'#13#10'INNER JOIN NOTASEMITIDAS NE ON NE.COD_NOTA=IE.COD_NOTA'#13#10 +
      'INNER JOIN NATUREZA_OPERACAO NP ON NP.CODIGO=NE.COD_NATUREZA_OPE' +
      'RACAO'#13#10'INNER JOIN ICMS IC ON IE.COD_ICMS=IC.COD_ICMS'#13#10'WHERE (NE.' +
      'INDFINAL=0)'#13#10'AND (NE.STATUS='#39'Autorizada'#39')'#13#10'AND (((IE.CFOP LIKE '#39 +
      '54%'#39') OR (IE.CFOP LIKE '#39'56%'#39')) AND (IE.CBENEF NOT LIKE '#39'RS052%'#39')' +
      ')'#13#10#13#10'UNION'#13#10#13#10'SELECT NE.COD_NOTA AS COD_NOTA, IE.COD_PROD AS COD' +
      '_PROD, IE.NOME_PROD AS NOMEPROD ,IE.ALIQUOTA_ICMS AS ALIQUOTA, I' +
      'E.CST AS CST, IE.CFOP AS CFOP, NE.DATA_EMISSAO AS DATA_EMISSAO, ' +
      'NP.DESCRICAO AS FINALIDADE, '#39'NF-e '#209' Consum Final'#39' AS ORIGEM, '#39'In' +
      'formado Base Legal'#39' AS ERRO, IC.MENSAGEM_ICMS AS ICMS FROM ITEMN' +
      'OTAEMITIDA IE'#13#10'INNER JOIN NOTASEMITIDAS NE ON NE.COD_NOTA=IE.COD' +
      '_NOTA'#13#10'INNER JOIN NATUREZA_OPERACAO NP ON NP.CODIGO=NE.COD_NATUR' +
      'EZA_OPERACAO'#13#10'INNER JOIN ICMS IC ON IE.COD_ICMS=IC.COD_ICMS'#13#10'WHE' +
      'RE (NE.INDFINAL=0)'#13#10'AND (NE.STATUS='#39'Autorizada'#39')'#13#10'AND ((SUBSTRIN' +
      'G (IE.CST FROM 2 FOR 3) IN ('#39'00'#39')) AND (IE.CBENEF IS NOT NULL)) ' +
      #13#10#13#10'UNION'#13#10#13#10'SELECT NE.COD_NOTA AS COD_NOTA, IE.COD_PROD, IE.NOM' +
      'E_PROD AS NOMEPROD, IE.ALIQUOTA_ICMS AS ALIQUOTA, IE.CST_CONSUM_' +
      'FINAL AS CST, IE.CFOP_CONSUM_FINAL AS CFOP, NE.DATA_EMISSAO AS D' +
      'ATA_EMISSAO,  NP.DESCRICAO AS FINALIDADE, '#39'NF-e Consum Final'#39' AS' +
      ' ORIGEM, '#39'N'#195'O informado Base Legal'#39' AS ERRO, IC.MENSAGEM_ICMS AS' +
      ' ICMS  FROM ITEMNOTAEMITIDA IE'#13#10'INNER JOIN NOTASEMITIDAS NE ON N' +
      'E.COD_NOTA=IE.COD_NOTA'#13#10'INNER JOIN NATUREZA_OPERACAO NP ON NP.CO' +
      'DIGO=NE.COD_NATUREZA_OPERACAO'#13#10'INNER JOIN ICMS IC ON IE.COD_ICMS' +
      '=IC.COD_ICMS'#13#10'WHERE (NE.INDFINAL=1)'#13#10'AND (NE.STATUS='#39'Autorizada'#39 +
      ')'#13#10'AND ((SUBSTRING (IE.CST_CONSUM_FINAL FROM 2 FOR 3) IN ('#39'20'#39','#39 +
      '40'#39','#39'41'#39','#39'50'#39','#39'51'#39','#39'60'#39','#39'70'#39')) AND (IE.CBENEF IS NULL))'#13#10#13#10'UNION' +
      #13#10#13#10'SELECT NE.COD_NOTA AS COD_NOTA, IE.COD_PROD, IE.NOME_PROD AS' +
      ' NOMEPROD, IE.ALIQUOTA_ICMS_ST AS ALIQUOTA, IE.CST_CONSUM_FINAL ' +
      'AS CST, IE.CFOP_CONSUM_FINAL AS CFOP, NE.DATA_EMISSAO AS DATA_EM' +
      'ISSAO,  NP.DESCRICAO AS FINALIDADE, '#39'NF-e Consum Final'#39' AS ORIGE' +
      'M, '#39'N'#195'O informado Base Legal'#39' AS ERRO, IC.MENSAGEM_ICMS AS ICMS ' +
      ' FROM ITEMNOTAEMITIDA IE'#13#10'INNER JOIN NOTASEMITIDAS NE ON NE.COD_' +
      'NOTA=IE.COD_NOTA'#13#10'INNER JOIN NATUREZA_OPERACAO NP ON NP.CODIGO=N' +
      'E.COD_NATUREZA_OPERACAO'#13#10'INNER JOIN ICMS IC ON IE.COD_ICMS=IC.CO' +
      'D_ICMS'#13#10'WHERE (NE.INDFINAL=1)'#13#10'AND (NE.STATUS='#39'Autorizada'#39')'#13#10'AND' +
      ' ((SUBSTRING (IE.CST_CONSUM_FINAL FROM 2 FOR 3) IN ('#39'10'#39','#39'60'#39','#39'7' +
      '0'#39')) AND (IE.CBENEF IS NULL))'#13#10#13#10'UNION'#13#10#13#10'SELECT NE.COD_NOTA AS ' +
      'COD_NOTA, IE.COD_PROD, IE.NOME_PROD AS NOMEPROD, IE.ALIQUOTA_ICM' +
      'S AS ALIQUOTA, IE.CST_CONSUM_FINAL AS CST, IE.CFOP_CONSUM_FINAL ' +
      'AS CFOP, NE.DATA_EMISSAO AS DATA_EMISSAO,  NP.DESCRICAO AS FINAL' +
      'IDADE, '#39'NF-e Consum Final'#39' AS ORIGEM, '#39'Base Legal incompat'#237'vel c' +
      'om CFOP'#39' AS ERRO, IC.MENSAGEM_ICMS AS ICMS  FROM ITEMNOTAEMITIDA' +
      ' IE'#13#10'INNER JOIN NOTASEMITIDAS NE ON NE.COD_NOTA=IE.COD_NOTA'#13#10'INN' +
      'ER JOIN NATUREZA_OPERACAO NP ON NP.CODIGO=NE.COD_NATUREZA_OPERAC' +
      'AO'#13#10'INNER JOIN ICMS IC ON IE.COD_ICMS=IC.COD_ICMS'#13#10'WHERE (NE.IND' +
      'FINAL=1)'#13#10'AND (NE.STATUS='#39'Autorizada'#39')'#13#10'AND ((IE.CFOP LIKE '#39'51%'#39 +
      ') AND (IE.CBENEF NOT LIKE '#39'RS051%'#39'))'#13#10#13#10'UNION'#13#10#13#10'SELECT NE.COD_N' +
      'OTA AS COD_NOTA, IE.COD_PROD, IE.NOME_PROD AS NOMEPROD, IE.ALIQU' +
      'OTA_ICMS_ST AS ALIQUOTA, IE.CST_CONSUM_FINAL AS CST, IE.CFOP_CON' +
      'SUM_FINAL AS CFOP, NE.DATA_EMISSAO AS DATA_EMISSAO,  NP.DESCRICA' +
      'O AS FINALIDADE, '#39'NF-e Consum Final'#39' AS ORIGEM, '#39'Base Legal inco' +
      'mpat'#237'vel com CFOP'#39' AS ERRO, IC.MENSAGEM_ICMS AS ICMS  FROM ITEMN' +
      'OTAEMITIDA IE'#13#10'INNER JOIN NOTASEMITIDAS NE ON NE.COD_NOTA=IE.COD' +
      '_NOTA'#13#10'INNER JOIN NATUREZA_OPERACAO NP ON NP.CODIGO=NE.COD_NATUR' +
      'EZA_OPERACAO'#13#10'INNER JOIN ICMS IC ON IE.COD_ICMS=IC.COD_ICMS'#13#10'WHE' +
      'RE (NE.INDFINAL=1)'#13#10'AND (NE.STATUS='#39'Autorizada'#39')'#13#10'AND (((IE.CFOP' +
      ' LIKE '#39'54%'#39') OR (IE.CFOP LIKE '#39'56%'#39')) AND (IE.CBENEF NOT LIKE '#39'R' +
      'S052%'#39'))'#13#10#13#10'UNION'#13#10#13#10'SELECT NE.COD_NOTA AS COD_NOTA, IE.COD_PROD' +
      ', IE.NOME_PROD AS NOMEPROD, IE.ALIQUOTA_ICMS AS ALIQUOTA, IE.CST' +
      '_CONSUM_FINAL AS CST, IE.CFOP_CONSUM_FINAL AS CFOP, NE.DATA_EMIS' +
      'SAO AS DATA_EMISSAO,  NP.DESCRICAO AS FINALIDADE, '#39'NF-e Consum F' +
      'inal'#39' AS ORIGEM, '#39'Informado Base Legal'#39' AS ERRO, IC.MENSAGEM_ICM' +
      'S AS ICMS  FROM ITEMNOTAEMITIDA IE'#13#10'INNER JOIN NOTASEMITIDAS NE ' +
      'ON NE.COD_NOTA=IE.COD_NOTA'#13#10'INNER JOIN NATUREZA_OPERACAO NP ON N' +
      'P.CODIGO=NE.COD_NATUREZA_OPERACAO'#13#10'INNER JOIN ICMS IC ON IE.COD_' +
      'ICMS=IC.COD_ICMS'#13#10'WHERE (NE.INDFINAL=1)'#13#10'AND (NE.STATUS='#39'Autoriz' +
      'ada'#39')'#13#10'AND  ((SUBSTRING (IE.CST_CONSUM_FINAL FROM 2 FOR 3) IN ('#39 +
      '00'#39')) AND (IE.CBENEF IS NOT NULL))'#13#10')'#13#10'WHERE DATA_EMISSAO BETWEE' +
      'N :DATA1 AND :DATA2'#13#10'ORDER BY DATA_EMISSAO, COD_NOTA, COD_PROD'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'DATA1'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA2'
        ParamType = ptInput
      end>
    SQLConnection = Dados
    Left = 152
    Top = 359
    object SItemNotaEmitCBenefDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
    end
    object SItemNotaEmitCBenefCOD_NOTA: TIntegerField
      FieldName = 'COD_NOTA'
    end
    object SItemNotaEmitCBenefCOD_PROD: TIntegerField
      FieldName = 'COD_PROD'
    end
    object SItemNotaEmitCBenefNOMEPROD: TStringField
      FieldName = 'NOMEPROD'
      Size = 50
    end
    object SItemNotaEmitCBenefALIQUOTA: TFMTBCDField
      FieldName = 'ALIQUOTA'
      Precision = 18
      Size = 2
    end
    object SItemNotaEmitCBenefCST: TStringField
      FieldName = 'CST'
      Size = 4
    end
    object SItemNotaEmitCBenefCFOP: TIntegerField
      FieldName = 'CFOP'
    end
    object SItemNotaEmitCBenefFINALIDADE: TStringField
      FieldName = 'FINALIDADE'
      Size = 50
    end
    object SItemNotaEmitCBenefORIGEM: TStringField
      FieldName = 'ORIGEM'
      Required = True
      FixedChar = True
      Size = 19
    end
    object SItemNotaEmitCBenefERRO: TStringField
      FieldName = 'ERRO'
      Required = True
      FixedChar = True
      Size = 24
    end
    object SItemNotaEmitCBenefICMS: TStringField
      FieldName = 'ICMS'
      Size = 30
    end
  end
  object CItemNotaEmitCBenef: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DPItemNotaEmitCBenef'
    Left = 152
    Top = 407
    object CItemNotaEmitCBenefDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
    end
    object CItemNotaEmitCBenefCOD_NOTA: TIntegerField
      FieldName = 'COD_NOTA'
    end
    object CItemNotaEmitCBenefCOD_PROD: TIntegerField
      FieldName = 'COD_PROD'
    end
    object CItemNotaEmitCBenefNOMEPROD: TStringField
      FieldName = 'NOMEPROD'
      Size = 50
    end
    object CItemNotaEmitCBenefCST: TStringField
      FieldName = 'CST'
      Size = 4
    end
    object CItemNotaEmitCBenefCFOP: TIntegerField
      FieldName = 'CFOP'
    end
    object CItemNotaEmitCBenefFINALIDADE: TStringField
      FieldName = 'FINALIDADE'
      Size = 50
    end
    object CItemNotaEmitCBenefERRO: TStringField
      FieldName = 'ERRO'
      Required = True
      FixedChar = True
      Size = 24
    end
    object CItemNotaEmitCBenefALIQUOTA: TFMTBCDField
      FieldName = 'ALIQUOTA'
      Precision = 18
      Size = 2
    end
    object CItemNotaEmitCBenefORIGEM: TStringField
      FieldName = 'ORIGEM'
      Required = True
      FixedChar = True
      Size = 19
    end
    object CItemNotaEmitCBenefICMS: TStringField
      FieldName = 'ICMS'
      Size = 30
    end
  end
  object DPItemNotaEmitCBenef: TDataSetProvider
    DataSet = SItemNotaEmitCBenef
    Left = 152
    Top = 455
  end
  object SItemNotaEmitRedBC: TSQLDataSet
    CommandText = 
      'SELECT DATA_EMISSAO, COD_NOTA, COD_PROD, NOMEPROD, ALIQUOTA, CST' +
      ', CFOP, FINALIDADE, ORIGEM, ERRO, ICMS FROM'#13#10'('#13#10'SELECT NE.COD_NO' +
      'TA AS COD_NOTA, IE.COD_PROD AS COD_PROD, IE.NOME_PROD AS NOMEPRO' +
      'D ,IE.ALIQUOTA_ICMS AS ALIQUOTA, IE.CST AS CST, IE.CFOP AS CFOP,' +
      ' NE.DATA_EMISSAO AS DATA_EMISSAO, NP.DESCRICAO AS FINALIDADE, '#39'N' +
      'F-e '#209' Consum Final'#39' AS ORIGEM, '#39'CST Difere com Redu'#231#227'o de BC'#39' AS' +
      ' ERRO, IC.MENSAGEM_ICMS AS ICMS FROM ITEMNOTAEMITIDA IE'#13#10'INNER J' +
      'OIN NOTASEMITIDAS NE ON NE.COD_NOTA=IE.COD_NOTA'#13#10'INNER JOIN NATU' +
      'REZA_OPERACAO NP ON NP.CODIGO=NE.COD_NATUREZA_OPERACAO'#13#10'INNER JO' +
      'IN ICMS IC ON IC.COD_ICMS=IE.COD_ICMS'#13#10'WHERE (NE.INDFINAL=0)'#13#10'AN' +
      'D (NE.STATUS='#39'Autorizada'#39')'#13#10'AND (  ((SUBSTRING (IE.CST FROM 2 FO' +
      'R 3) IN ('#39'20'#39')) AND (IE.REDUCAO_ICMS=0))'#13#10'OR ((SUBSTRING (IE.CST' +
      ' FROM 2 FOR 3) IN ('#39'00'#39')) AND (IE.REDUCAO_ICMS>0)) )  '#13#10#13#10'UNION'#13 +
      #10#13#10'SELECT NE.COD_NOTA AS COD_NOTA, IE.COD_PROD AS COD_PROD, IE.N' +
      'OME_PROD AS NOMEPROD ,IE.ALIQUOTA_ICMS_ST AS ALIQUOTA, IE.CST AS' +
      ' CST, IE.CFOP AS CFOP, NE.DATA_EMISSAO AS DATA_EMISSAO, NP.DESCR' +
      'ICAO AS FINALIDADE, '#39'NF-e '#209' Consum Final'#39' AS ORIGEM, '#39'CST Difere' +
      ' com Redu'#231#227'o de BC'#39' AS ERRO, IC.MENSAGEM_ICMS AS ICMS FROM ITEMN' +
      'OTAEMITIDA IE'#13#10'INNER JOIN NOTASEMITIDAS NE ON NE.COD_NOTA=IE.COD' +
      '_NOTA'#13#10'INNER JOIN NATUREZA_OPERACAO NP ON NP.CODIGO=NE.COD_NATUR' +
      'EZA_OPERACAO'#13#10'INNER JOIN ICMS IC ON IC.COD_ICMS=IE.COD_ICMS'#13#10'WHE' +
      'RE (NE.INDFINAL=0)'#13#10'AND (NE.STATUS='#39'Autorizada'#39')'#13#10'AND (  ((SUBST' +
      'RING (IE.CST FROM 2 FOR 3) IN ('#39'60'#39')) AND (IE.PREDBCEFET = 0) AN' +
      'D (IC.BASE_ICMS_ST < 100))'#13#10'OR ((SUBSTRING (IE.CST FROM 2 FOR 3)' +
      ' IN ('#39'60'#39')) AND (IE.PREDBCEFET > 0) AND (IC.BASE_ICMS_ST = 100))' +
      ' )  '#13#10#13#10'UNION'#13#10#13#10'SELECT NE.COD_NOTA AS COD_NOTA, IE.COD_PROD, IE' +
      '.NOME_PROD AS NOMEPROD, IE.ALIQUOTA_ICMS AS ALIQUOTA, IE.CST_CON' +
      'SUM_FINAL AS CST, IE.CFOP_CONSUM_FINAL AS CFOP, NE.DATA_EMISSAO ' +
      'AS DATA_EMISSAO,  NP.DESCRICAO AS FINALIDADE, '#39'NF-e Consum Final' +
      #39' AS ORIGEM, '#39'CST Difere com Redu'#231#227'o de BC'#39' AS ERRO, IC.MENSAGEM' +
      '_ICMS AS ICMS  FROM ITEMNOTAEMITIDA IE'#13#10'INNER JOIN NOTASEMITIDAS' +
      ' NE ON NE.COD_NOTA=IE.COD_NOTA'#13#10'INNER JOIN NATUREZA_OPERACAO NP ' +
      'ON NP.CODIGO=NE.COD_NATUREZA_OPERACAO'#13#10'INNER JOIN ICMS IC ON IC.' +
      'COD_ICMS=IE.COD_ICMS'#13#10'WHERE (NE.INDFINAL=1)'#13#10'AND (NE.STATUS='#39'Aut' +
      'orizada'#39')'#13#10'AND (  ((SUBSTRING (IE.CST_CONSUM_FINAL FROM 2 FOR 3)' +
      ' IN ('#39'20'#39')) AND (IE.REDUCAO_ICMS=0))'#13#10'OR ((SUBSTRING (IE.CST_CON' +
      'SUM_FINAL FROM 2 FOR 3) IN ('#39'00'#39')) AND (IE.REDUCAO_ICMS>0))  ) '#13 +
      #10#13#10'UNION'#13#10#13#10'SELECT NE.COD_NOTA AS COD_NOTA, IE.COD_PROD, IE.NOME' +
      '_PROD AS NOMEPROD, IE.ALIQUOTA_ICMS_ST AS ALIQUOTA, IE.CST_CONSU' +
      'M_FINAL AS CST, IE.CFOP_CONSUM_FINAL AS CFOP, NE.DATA_EMISSAO AS' +
      ' DATA_EMISSAO,  NP.DESCRICAO AS FINALIDADE, '#39'NF-e Consum Final'#39' ' +
      'AS ORIGEM, '#39'CST Difere com Redu'#231#227'o de BC'#39' AS ERRO, IC.MENSAGEM_I' +
      'CMS AS ICMS  FROM ITEMNOTAEMITIDA IE'#13#10'INNER JOIN NOTASEMITIDAS N' +
      'E ON NE.COD_NOTA=IE.COD_NOTA'#13#10'INNER JOIN NATUREZA_OPERACAO NP ON' +
      ' NP.CODIGO=NE.COD_NATUREZA_OPERACAO'#13#10'INNER JOIN ICMS IC ON IC.CO' +
      'D_ICMS=IE.COD_ICMS'#13#10'WHERE (NE.INDFINAL=1)'#13#10'AND (NE.STATUS='#39'Autor' +
      'izada'#39')'#13#10'AND (  ((SUBSTRING (IE.CST_CONSUM_FINAL FROM 2 FOR 3) I' +
      'N ('#39'60'#39')) AND (IE.PREDBCEFET = 0) AND (IC.BASE_ICMS_ST < 100))'#13#10 +
      'OR ((SUBSTRING (IE.CST_CONSUM_FINAL FROM 2 FOR 3) IN ('#39'60'#39')) AND' +
      ' (IE.PREDBCEFET > 0) AND (IC.BASE_ICMS_ST = 100))  ) '#13#10')'#13#10'WHERE ' +
      'DATA_EMISSAO BETWEEN :DATA1 AND :DATA2'#13#10'ORDER BY DATA_EMISSAO, C' +
      'OD_NOTA, COD_PROD'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'DATA1'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA2'
        ParamType = ptInput
      end>
    SQLConnection = Dados
    Left = 272
    Top = 359
    object SItemNotaEmitRedBCDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
    end
    object SItemNotaEmitRedBCCOD_NOTA: TIntegerField
      FieldName = 'COD_NOTA'
    end
    object SItemNotaEmitRedBCCOD_PROD: TIntegerField
      FieldName = 'COD_PROD'
    end
    object SItemNotaEmitRedBCNOMEPROD: TStringField
      FieldName = 'NOMEPROD'
      Size = 50
    end
    object SItemNotaEmitRedBCALIQUOTA: TFMTBCDField
      FieldName = 'ALIQUOTA'
      Precision = 18
      Size = 2
    end
    object SItemNotaEmitRedBCCST: TStringField
      FieldName = 'CST'
      Size = 4
    end
    object SItemNotaEmitRedBCCFOP: TIntegerField
      FieldName = 'CFOP'
    end
    object SItemNotaEmitRedBCFINALIDADE: TStringField
      FieldName = 'FINALIDADE'
      Size = 50
    end
    object SItemNotaEmitRedBCORIGEM: TStringField
      FieldName = 'ORIGEM'
      Required = True
      FixedChar = True
      Size = 19
    end
    object SItemNotaEmitRedBCERRO: TStringField
      FieldName = 'ERRO'
      Required = True
      FixedChar = True
      Size = 28
    end
    object SItemNotaEmitRedBCICMS: TStringField
      FieldName = 'ICMS'
      Size = 30
    end
  end
  object CItemNotaEmitRedBC: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DPItemNotaEmitRedBC'
    Left = 272
    Top = 407
    object CItemNotaEmitRedBCDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
    end
    object CItemNotaEmitRedBCCOD_NOTA: TIntegerField
      FieldName = 'COD_NOTA'
    end
    object CItemNotaEmitRedBCCOD_PROD: TIntegerField
      FieldName = 'COD_PROD'
    end
    object CItemNotaEmitRedBCNOMEPROD: TStringField
      FieldName = 'NOMEPROD'
      Size = 50
    end
    object CItemNotaEmitRedBCCST: TStringField
      FieldName = 'CST'
      Size = 4
    end
    object CItemNotaEmitRedBCCFOP: TIntegerField
      FieldName = 'CFOP'
    end
    object CItemNotaEmitRedBCFINALIDADE: TStringField
      FieldName = 'FINALIDADE'
      Size = 50
    end
    object CItemNotaEmitRedBCERRO: TStringField
      FieldName = 'ERRO'
      Required = True
      FixedChar = True
      Size = 28
    end
    object CItemNotaEmitRedBCALIQUOTA: TFMTBCDField
      FieldName = 'ALIQUOTA'
      Precision = 18
      Size = 2
    end
    object CItemNotaEmitRedBCORIGEM: TStringField
      FieldName = 'ORIGEM'
      Required = True
      FixedChar = True
      Size = 19
    end
    object CItemNotaEmitRedBCICMS: TStringField
      FieldName = 'ICMS'
      Size = 30
    end
  end
  object DPItemNotaEmitRedBC: TDataSetProvider
    DataSet = SItemNotaEmitRedBC
    Left = 272
    Top = 455
  end
  object SItemNotaEmitAliq: TSQLDataSet
    CommandText = 
      'SELECT DATA_EMISSAO, COD_NOTA, COD_PROD, NOMEPROD, ALIQUOTA, CST' +
      ', CFOP, FINALIDADE, ORIGEM, ERRO, ICMS FROM'#13#10'('#13#10'SELECT NE.COD_NO' +
      'TA AS COD_NOTA, IE.COD_PROD AS COD_PROD, IE.NOME_PROD AS NOMEPRO' +
      'D ,IE.ALIQUOTA_ICMS AS ALIQUOTA, IE.CST AS CST, IE.CFOP AS CFOP,' +
      ' NE.DATA_EMISSAO AS DATA_EMISSAO, NP.DESCRICAO AS FINALIDADE, '#39'N' +
      'F-e '#209' Consum Final'#39' AS ORIGEM, '#39'CST difere da Aliq. (%)'#39' AS ERRO' +
      ', IC.MENSAGEM_ICMS AS ICMS FROM ITEMNOTAEMITIDA IE'#13#10'INNER JOIN N' +
      'OTASEMITIDAS NE ON NE.COD_NOTA=IE.COD_NOTA'#13#10'INNER JOIN NATUREZA_' +
      'OPERACAO NP ON NP.CODIGO=NE.COD_NATUREZA_OPERACAO'#13#10'INNER JOIN IC' +
      'MS IC ON IC.COD_ICMS=IE.COD_ICMS'#13#10'WHERE (NE.INDFINAL=0)'#13#10'AND (NE' +
      '.STATUS='#39'Autorizada'#39')'#13#10'AND ( ((SUBSTRING (IE.CST FROM 2 FOR 3) I' +
      'N ('#39'10'#39')) AND (IE.CFOP IN (6403)) AND (IE.ALIQUOTA_ICMS=0))'#13#10'OR ' +
      '((SUBSTRING (IE.CST FROM 2 FOR 3) IN ('#39'00'#39', '#39'20'#39')) AND (IE.ALIQU' +
      'OTA_ICMS=0))'#13#10'OR ((SUBSTRING (IE.CST FROM 2 FOR 3) IN ('#39'40'#39')) AN' +
      'D (IE.ALIQUOTA_ICMS>0)) )'#13#10#13#10'UNION'#13#10#13#10'SELECT NE.COD_NOTA AS COD_' +
      'NOTA, IE.COD_PROD AS COD_PROD, IE.NOME_PROD AS NOMEPROD ,IE.ALIQ' +
      'UOTA_ICMS AS ALIQUOTA, IE.CST AS CST, IE.CFOP AS CFOP, NE.DATA_E' +
      'MISSAO AS DATA_EMISSAO, NP.DESCRICAO AS FINALIDADE, '#39'NF-e '#209' Cons' +
      'um Final'#39' AS ORIGEM, '#39'CST difere da Aliq. ST (%)'#39' AS ERRO, IC.ME' +
      'NSAGEM_ICMS AS ICMS FROM ITEMNOTAEMITIDA IE'#13#10'INNER JOIN NOTASEMI' +
      'TIDAS NE ON NE.COD_NOTA=IE.COD_NOTA'#13#10'INNER JOIN NATUREZA_OPERACA' +
      'O NP ON NP.CODIGO=NE.COD_NATUREZA_OPERACAO'#13#10'INNER JOIN ICMS IC O' +
      'N IC.COD_ICMS=IE.COD_ICMS'#13#10'WHERE (NE.INDFINAL=0)'#13#10'AND (NE.STATUS' +
      '='#39'Autorizada'#39')'#13#10'AND ( ((SUBSTRING (IE.CST FROM 2 FOR 3) IN ('#39'10'#39 +
      ')) AND (IE.CFOP IN (6403)) AND (IE.ALIQUOTA_ICMS_ST=0))'#13#10'OR ((SU' +
      'BSTRING (IE.CST_CONSUM_FINAL FROM 2 FOR 3) IN ('#39'60'#39')) AND (IE.PI' +
      'CMSEFET=0)) )'#13#10#13#10'UNION'#13#10#13#10'SELECT NE.COD_NOTA AS COD_NOTA, IE.COD' +
      '_PROD AS COD_PROD, IE.NOME_PROD AS NOMEPROD ,IE.ALIQUOTA_ICMS AS' +
      ' ALIQUOTA, IE.CST_CONSUM_FINAL AS CST, IE.CFOP_CONSUM_FINAL AS C' +
      'FOP, NE.DATA_EMISSAO AS DATA_EMISSAO, NP.DESCRICAO AS FINALIDADE' +
      ', '#39'NF-e Consum Final'#39' AS ORIGEM, '#39'CST difere da Aliq. (%)'#39' AS ER' +
      'RO, IC.MENSAGEM_ICMS AS ICMS FROM ITEMNOTAEMITIDA IE'#13#10'INNER JOIN' +
      ' NOTASEMITIDAS NE ON NE.COD_NOTA=IE.COD_NOTA'#13#10'INNER JOIN NATUREZ' +
      'A_OPERACAO NP ON NP.CODIGO=NE.COD_NATUREZA_OPERACAO'#13#10'INNER JOIN ' +
      'ICMS IC ON IC.COD_ICMS=IE.COD_ICMS'#13#10'WHERE (NE.INDFINAL=1)'#13#10'AND (' +
      'NE.STATUS='#39'Autorizada'#39') '#13#10'AND ( ((SUBSTRING (IE.CST_CONSUM_FINAL' +
      ' FROM 2 FOR 3) IN ('#39'00'#39', '#39'20'#39')) AND (IE.ALIQUOTA_ICMS=0))'#13#10'OR ((' +
      'SUBSTRING (IE.CST_CONSUM_FINAL FROM 2 FOR 3) IN ('#39'40'#39')) AND (IE.' +
      'ALIQUOTA_ICMS>0)) )'#13#10#13#10'UNION'#13#10#13#10'SELECT NE.COD_NOTA AS COD_NOTA, ' +
      'IE.COD_PROD AS COD_PROD, IE.NOME_PROD AS NOMEPROD ,IE.ALIQUOTA_I' +
      'CMS AS ALIQUOTA, IE.CST_CONSUM_FINAL AS CST, IE.CFOP_CONSUM_FINA' +
      'L AS CFOP, NE.DATA_EMISSAO AS DATA_EMISSAO, NP.DESCRICAO AS FINA' +
      'LIDADE, '#39'NF-e Consum Final'#39' AS ORIGEM, '#39'CST difere da Aliq. ST (' +
      '%)'#39' AS ERRO, IC.MENSAGEM_ICMS AS ICMS FROM ITEMNOTAEMITIDA IE'#13#10'I' +
      'NNER JOIN NOTASEMITIDAS NE ON NE.COD_NOTA=IE.COD_NOTA'#13#10'INNER JOI' +
      'N NATUREZA_OPERACAO NP ON NP.CODIGO=NE.COD_NATUREZA_OPERACAO'#13#10'IN' +
      'NER JOIN ICMS IC ON IC.COD_ICMS=IE.COD_ICMS'#13#10'WHERE (NE.INDFINAL=' +
      '1)'#13#10'AND (NE.STATUS='#39'Autorizada'#39') '#13#10'AND ((SUBSTRING (IE.CST_CONSU' +
      'M_FINAL FROM 2 FOR 3) IN ('#39'60'#39')) AND (IE.PICMSEFET=0))'#13#10')'#13#10'WHERE' +
      ' DATA_EMISSAO BETWEEN :DATA1 AND :DATA2'#13#10'ORDER BY DATA_EMISSAO, ' +
      'COD_NOTA, COD_PROD'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'DATA1'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA2'
        ParamType = ptInput
      end>
    SQLConnection = Dados
    Left = 488
    Top = 359
    object SItemNotaEmitAliqDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
    end
    object SItemNotaEmitAliqCOD_NOTA: TIntegerField
      FieldName = 'COD_NOTA'
    end
    object SItemNotaEmitAliqCOD_PROD: TIntegerField
      FieldName = 'COD_PROD'
    end
    object SItemNotaEmitAliqNOMEPROD: TStringField
      FieldName = 'NOMEPROD'
      Size = 50
    end
    object SItemNotaEmitAliqALIQUOTA: TFMTBCDField
      FieldName = 'ALIQUOTA'
      Precision = 18
      Size = 2
    end
    object SItemNotaEmitAliqCST: TStringField
      FieldName = 'CST'
      Size = 4
    end
    object SItemNotaEmitAliqCFOP: TIntegerField
      FieldName = 'CFOP'
    end
    object SItemNotaEmitAliqFINALIDADE: TStringField
      FieldName = 'FINALIDADE'
      Size = 50
    end
    object SItemNotaEmitAliqORIGEM: TStringField
      FieldName = 'ORIGEM'
      Required = True
      FixedChar = True
      Size = 19
    end
    object SItemNotaEmitAliqERRO: TStringField
      FieldName = 'ERRO'
      Required = True
      FixedChar = True
      Size = 26
    end
    object SItemNotaEmitAliqICMS: TStringField
      FieldName = 'ICMS'
      Size = 30
    end
  end
  object CItemNotaEmitAliq: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DPItemNotaEmitAliq'
    Left = 488
    Top = 407
    object CItemNotaEmitAliqDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
    end
    object CItemNotaEmitAliqCOD_NOTA: TIntegerField
      FieldName = 'COD_NOTA'
    end
    object CItemNotaEmitAliqCOD_PROD: TIntegerField
      FieldName = 'COD_PROD'
    end
    object CItemNotaEmitAliqNOMEPROD: TStringField
      FieldName = 'NOMEPROD'
      Size = 50
    end
    object CItemNotaEmitAliqCST: TStringField
      FieldName = 'CST'
      Size = 4
    end
    object CItemNotaEmitAliqCFOP: TIntegerField
      FieldName = 'CFOP'
    end
    object CItemNotaEmitAliqFINALIDADE: TStringField
      FieldName = 'FINALIDADE'
      Size = 50
    end
    object CItemNotaEmitAliqERRO: TStringField
      FieldName = 'ERRO'
      Required = True
      FixedChar = True
      Size = 26
    end
    object CItemNotaEmitAliqALIQUOTA: TFMTBCDField
      FieldName = 'ALIQUOTA'
      Precision = 18
      Size = 2
    end
    object CItemNotaEmitAliqORIGEM: TStringField
      FieldName = 'ORIGEM'
      Required = True
      FixedChar = True
      Size = 19
    end
    object CItemNotaEmitAliqICMS: TStringField
      FieldName = 'ICMS'
      Size = 30
    end
  end
  object DPItemNotaEmitAliq: TDataSetProvider
    DataSet = SItemNotaEmitAliq
    Left = 488
    Top = 455
  end
  object SItemNotaEmitMVA: TSQLDataSet
    CommandText = 
      'SELECT NE.COD_NOTA AS COD_NOTA, IE.COD_PROD AS COD_PROD, IE.NOME' +
      '_PROD AS NOMEPROD ,IE.ALIQUOTA_ICMS_ST AS ALIQUOTA, IE.CST AS CS' +
      'T, IE.CFOP AS CFOP, NE.DATA_EMISSAO AS DATA_EMISSAO, NP.DESCRICA' +
      'O AS FINALIDADE, '#39'NF-e '#209' Consum Final'#39' AS ORIGEM, '#39'N'#195'O informado' +
      ' MVA.'#39' AS ERRO, IC.MENSAGEM_ICMS AS ICMS FROM ITEMNOTAEMITIDA IE' +
      #13#10'INNER JOIN NOTASEMITIDAS NE ON NE.COD_NOTA=IE.COD_NOTA'#13#10'INNER ' +
      'JOIN NATUREZA_OPERACAO NP ON NP.CODIGO=NE.COD_NATUREZA_OPERACAO'#13 +
      #10'INNER JOIN ICMS IC ON IC.COD_ICMS=IE.COD_ICMS'#13#10'WHERE  NE.DATA_E' +
      'MISSAO BETWEEN :DATA1 AND :DATA2'#13#10'AND (NE.INDFINAL=0)'#13#10'AND (NE.S' +
      'TATUS='#39'Autorizada'#39')'#13#10'AND  ((SUBSTRING (IE.CST FROM 2 FOR 3) IN (' +
      #39'10'#39')) AND (IE.CFOP IN (6403)) AND (IE.MVA =0))'#13#10'ORDER BY DATA_E' +
      'MISSAO, COD_NOTA, COD_PROD'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'DATA1'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA2'
        ParamType = ptInput
      end>
    SQLConnection = Dados
    Left = 384
    Top = 359
    object SItemNotaEmitMVADATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
    end
    object SItemNotaEmitMVACOD_NOTA: TIntegerField
      FieldName = 'COD_NOTA'
    end
    object SItemNotaEmitMVACOD_PROD: TIntegerField
      FieldName = 'COD_PROD'
    end
    object SItemNotaEmitMVANOMEPROD: TStringField
      FieldName = 'NOMEPROD'
      Size = 50
    end
    object SItemNotaEmitMVAALIQUOTA: TFMTBCDField
      FieldName = 'ALIQUOTA'
      Precision = 18
      Size = 2
    end
    object SItemNotaEmitMVACST: TStringField
      FieldName = 'CST'
      Size = 4
    end
    object SItemNotaEmitMVACFOP: TIntegerField
      FieldName = 'CFOP'
    end
    object SItemNotaEmitMVAFINALIDADE: TStringField
      FieldName = 'FINALIDADE'
      Size = 50
    end
    object SItemNotaEmitMVAORIGEM: TStringField
      FieldName = 'ORIGEM'
      Required = True
      FixedChar = True
      Size = 19
    end
    object SItemNotaEmitMVAERRO: TStringField
      FieldName = 'ERRO'
      Required = True
      FixedChar = True
      Size = 18
    end
    object SItemNotaEmitMVAICMS: TStringField
      FieldName = 'ICMS'
      Size = 30
    end
  end
  object CItemNotaEmitMVA: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DPItemNotaEmitMVA'
    Left = 384
    Top = 407
    object CItemNotaEmitMVADATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
    end
    object CItemNotaEmitMVACOD_NOTA: TIntegerField
      FieldName = 'COD_NOTA'
    end
    object CItemNotaEmitMVACOD_PROD: TIntegerField
      FieldName = 'COD_PROD'
    end
    object CItemNotaEmitMVANOMEPROD: TStringField
      FieldName = 'NOMEPROD'
      Size = 50
    end
    object CItemNotaEmitMVACST: TStringField
      FieldName = 'CST'
      Size = 4
    end
    object CItemNotaEmitMVACFOP: TIntegerField
      FieldName = 'CFOP'
    end
    object CItemNotaEmitMVAFINALIDADE: TStringField
      FieldName = 'FINALIDADE'
      Size = 50
    end
    object CItemNotaEmitMVAERRO: TStringField
      FieldName = 'ERRO'
      Required = True
      FixedChar = True
      Size = 29
    end
    object CItemNotaEmitMVAALIQUOTA: TFMTBCDField
      FieldName = 'ALIQUOTA'
      Precision = 18
      Size = 2
    end
    object CItemNotaEmitMVAORIGEM: TStringField
      FieldName = 'ORIGEM'
      Required = True
      FixedChar = True
      Size = 19
    end
    object CItemNotaEmitMVAICMS: TStringField
      FieldName = 'ICMS'
      Size = 30
    end
  end
  object DPItemNotaEmitMVA: TDataSetProvider
    DataSet = SItemNotaEmitMVA
    Left = 384
    Top = 455
  end
  object SConferNfce: TSQLDataSet
    CommandText = 
      'SELECT DATA_EMISSAO, NUM_NFC AS COD_NOTA, SERIE_IMPFISCAL AS SER' +
      'IE, SUBSTRING(NFC_NOMEARQ_XML FROM 1 FOR 44) AS  XML, '#39'65'#39' AS MO' +
      'D, '#39'N'#227'o consta no sistema.'#39' AS CASO, '#39'VENDA '#192' CONSUMIDOR FINAL'#39' ' +
      'AS OPERACAO  FROM VENDAS'#13#10'WHERE (NUM_NFC IS NOT NULL) AND (NFC_F' +
      'LAG='#39'T'#39')'#13#10'AND DATA_EMISSAO BETWEEN :DATA1 AND :DATA2'#13#10'ORDER BY D' +
      'ATA_EMISSAO, COD_NOTA'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'DATA1'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA2'
        ParamType = ptInput
      end>
    SQLConnection = Dados
    Left = 40
    Top = 1467
    object SConferNfceDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
    end
    object SConferNfceCOD_NOTA: TIntegerField
      FieldName = 'COD_NOTA'
    end
    object SConferNfceSERIE: TIntegerField
      FieldName = 'SERIE'
    end
    object SConferNfceXML: TStringField
      FieldName = 'XML'
      Size = 53
    end
    object SConferNfceMOD: TStringField
      Alignment = taCenter
      FieldName = 'MOD'
      Required = True
      FixedChar = True
      Size = 2
    end
    object SConferNfceCASO: TStringField
      FieldName = 'CASO'
      Required = True
      FixedChar = True
      Size = 22
    end
    object SConferNfceOPERACAO: TStringField
      FieldName = 'OPERACAO'
      Required = True
      FixedChar = True
      Size = 24
    end
  end
  object CConferNfce: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DPConferNfce'
    Left = 40
    Top = 1523
    object CConferNfceDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
    end
    object CConferNfceCOD_NOTA: TIntegerField
      FieldName = 'COD_NOTA'
    end
    object CConferNfceSERIE: TIntegerField
      FieldName = 'SERIE'
    end
    object CConferNfceXML: TStringField
      FieldName = 'XML'
      Size = 53
    end
    object CConferNfceMOD: TStringField
      FieldName = 'MOD'
      Required = True
      FixedChar = True
      Size = 2
    end
    object CConferNfceCASO: TStringField
      FieldName = 'CASO'
      Required = True
      FixedChar = True
      Size = 22
    end
    object CConferNfceOPERACAO: TStringField
      FieldName = 'OPERACAO'
      Required = True
      FixedChar = True
      Size = 24
    end
  end
  object DPConferNfce: TDataSetProvider
    DataSet = SConferNfce
    Left = 40
    Top = 1579
  end
  object CResultConfe: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 632
    Top = 935
    object CResultConfeCOD_NOTA: TIntegerField
      FieldName = 'COD_NOTA'
    end
    object CResultConfeSERIE: TIntegerField
      FieldName = 'SERIE'
    end
    object CResultConfeXML: TStringField
      FieldName = 'XML'
      Size = 50
    end
    object CResultConfeMOD: TStringField
      Alignment = taCenter
      FieldName = 'MOD'
      Size = 10
    end
    object CResultConfeCASO: TStringField
      FieldName = 'CASO'
      Size = 50
    end
    object CResultConfeDATA_EMISSAO: TStringField
      Alignment = taCenter
      FieldName = 'DATA_EMISSAO'
      Size = 10
    end
    object CResultConfeOPERACAO: TStringField
      Alignment = taCenter
      FieldName = 'OPERACAO'
      Size = 50
    end
    object CResultConfeDATA_RECEBIM: TStringField
      FieldName = 'DATA_RECEBIM'
      Size = 15
    end
  end
  object SConferNfe: TSQLDataSet
    CommandText = 
      'SELECT NE.DATA_EMISSAO, NE.COD_NOTA, NE.SERIE, NE.CHAVE_NFE AS X' +
      'ML, '#39'55'#39' AS MOD, '#39'N'#227'o consta no sistema.'#39' AS CASO, NT.DESCRICAO ' +
      'AS OPERACAO  FROM NOTASEMITIDAS NE'#13#10'INNER JOIN NATUREZA_OPERACAO' +
      ' NT ON NE.COD_NATUREZA_OPERACAO = NT.CODIGO'#13#10'WHERE (NE.STATUS='#39'A' +
      'utorizada'#39')'#13#10'AND (NT.ESTOQUE='#39'S'#39')'#13#10'AND NE.DATA_EMISSAO BETWEEN :' +
      'DATA1 AND :DATA2'#13#10'ORDER BY NE.DATA_EMISSAO, NE.COD_NOTA'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'DATA1'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA2'
        ParamType = ptInput
      end>
    SQLConnection = Dados
    Left = 152
    Top = 1467
    object SConferNfeDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
    end
    object SConferNfeCOD_NOTA: TIntegerField
      FieldName = 'COD_NOTA'
    end
    object SConferNfeSERIE: TIntegerField
      FieldName = 'SERIE'
    end
    object SConferNfeXML: TStringField
      FieldName = 'XML'
      Size = 44
    end
    object SConferNfeMOD: TStringField
      Alignment = taCenter
      FieldName = 'MOD'
      Required = True
      FixedChar = True
      Size = 2
    end
    object SConferNfeCASO: TStringField
      FieldName = 'CASO'
      Required = True
      FixedChar = True
      Size = 22
    end
    object SConferNfeOPERACAO: TStringField
      Alignment = taCenter
      FieldName = 'OPERACAO'
      Size = 50
    end
  end
  object CConferNfe: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DPConferNfe'
    Left = 152
    Top = 1523
    object CConferNfeDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
    end
    object CConferNfeCOD_NOTA: TIntegerField
      FieldName = 'COD_NOTA'
    end
    object CConferNfeSERIE: TIntegerField
      FieldName = 'SERIE'
    end
    object CConferNfeXML: TStringField
      FieldName = 'XML'
      Size = 44
    end
    object CConferNfeMOD: TStringField
      FieldName = 'MOD'
      Required = True
      FixedChar = True
      Size = 2
    end
    object CConferNfeCASO: TStringField
      FieldName = 'CASO'
      Required = True
      FixedChar = True
      Size = 22
    end
    object CConferNfeOPERACAO: TStringField
      FieldName = 'OPERACAO'
      Size = 50
    end
  end
  object DPConferNfe: TDataSetProvider
    DataSet = SConferNfe
    Left = 152
    Top = 1579
  end
  object SInfoEmp: TSQLDataSet
    CommandText = 'SELECT NOME_FANTASIA FROM PARAMETROSNFE'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Dados
    Left = 632
    Top = 719
    object SInfoEmpNOME_FANTASIA: TStringField
      FieldName = 'NOME_FANTASIA'
      Size = 50
    end
  end
  object CInfoEmp: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DPInfoEmp'
    Left = 632
    Top = 775
    object CInfoEmpNOME_FANTASIA: TStringField
      FieldName = 'NOME_FANTASIA'
      Size = 50
    end
  end
  object DPInfoEmp: TDataSetProvider
    DataSet = SInfoEmp
    Left = 632
    Top = 831
  end
  object SConferEnt: TSQLDataSet
    CommandText = 
      'SELECT DATA_EMISSAO, DATA_RECEBIM, COD_NOTAFORN, SERIE, NAT_OPER' +
      'ACAO AS OPERACAO, CHAVE_NOTA AS XML, '#39'55'#39' AS MOD, '#39'N'#227'o consta no' +
      ' sistema.'#39' AS CASO  FROM NOTASENTRADA'#13#10'WHERE DATA_EMISSAO BETWEE' +
      'N :DATA1 AND :DATA2'#13#10'ORDER BY DATA_EMISSAO, COD_NOTAFORN'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'DATA1'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA2'
        ParamType = ptInput
      end>
    SQLConnection = Dados
    Left = 272
    Top = 1467
    object SConferEntDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
    end
    object SConferEntSERIE: TIntegerField
      FieldName = 'SERIE'
    end
    object SConferEntXML: TStringField
      FieldName = 'XML'
      Size = 44
    end
    object SConferEntMOD: TStringField
      Alignment = taCenter
      FieldName = 'MOD'
      Required = True
      FixedChar = True
      Size = 2
    end
    object SConferEntCASO: TStringField
      FieldName = 'CASO'
      Required = True
      FixedChar = True
      Size = 22
    end
    object SConferEntDATA_RECEBIM: TDateField
      FieldName = 'DATA_RECEBIM'
    end
    object SConferEntCOD_NOTAFORN: TIntegerField
      FieldName = 'COD_NOTAFORN'
    end
    object SConferEntOPERACAO: TStringField
      FieldName = 'OPERACAO'
      Size = 60
    end
  end
  object CConferEnt: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DPConferEnt'
    Left = 272
    Top = 1523
    object CConferEntDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
    end
    object CConferEntSERIE: TIntegerField
      FieldName = 'SERIE'
    end
    object CConferEntXML: TStringField
      FieldName = 'XML'
      Size = 44
    end
    object CConferEntMOD: TStringField
      FieldName = 'MOD'
      Required = True
      FixedChar = True
      Size = 2
    end
    object CConferEntCASO: TStringField
      FieldName = 'CASO'
      Required = True
      FixedChar = True
      Size = 22
    end
    object CConferEntDATA_RECEBIM: TDateField
      FieldName = 'DATA_RECEBIM'
    end
    object CConferEntCOD_NOTAFORN: TIntegerField
      FieldName = 'COD_NOTAFORN'
    end
    object CConferEntOPERACAO: TStringField
      FieldName = 'OPERACAO'
      Size = 60
    end
  end
  object DPConferEnt: TDataSetProvider
    DataSet = SConferEnt
    Left = 272
    Top = 1579
  end
  object SConferNfeConsu: TSQLDataSet
    CommandText = 
      'SELECT NE.DATA_EMISSAO, NE.COD_NOTA, NE.SERIE, NE.CHAVE_NFE AS X' +
      'ML, '#39'55'#39' AS MOD, '#39'N'#227'o consta no sistema.'#39' AS CASO, NT.DESCRICAO ' +
      'AS OPERACAO  FROM NOTASEMITIDAS NE'#13#10'INNER JOIN NATUREZA_OPERACAO' +
      ' NT ON NE.COD_NATUREZA_OPERACAO = NT.CODIGO'#13#10'WHERE (NE.STATUS='#39'A' +
      'utorizada'#39')'#13#10'AND (NT.ESTOQUE='#39'E'#39')'#13#10'AND NE.DATA_EMISSAO BETWEEN :' +
      'DATA1 AND :DATA2'#13#10'ORDER BY NE.DATA_EMISSAO, NE.COD_NOTA'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'DATA1'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA2'
        ParamType = ptInput
      end>
    SQLConnection = Dados
    Left = 384
    Top = 1467
    object SConferNfeConsuDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
    end
    object SConferNfeConsuCOD_NOTA: TIntegerField
      FieldName = 'COD_NOTA'
    end
    object SConferNfeConsuSERIE: TIntegerField
      FieldName = 'SERIE'
    end
    object SConferNfeConsuXML: TStringField
      FieldName = 'XML'
      Size = 44
    end
    object SConferNfeConsuMOD: TStringField
      Alignment = taCenter
      FieldName = 'MOD'
      Required = True
      FixedChar = True
      Size = 2
    end
    object SConferNfeConsuCASO: TStringField
      FieldName = 'CASO'
      Required = True
      FixedChar = True
      Size = 22
    end
    object SConferNfeConsuOPERACAO: TStringField
      Alignment = taCenter
      FieldName = 'OPERACAO'
      Size = 50
    end
  end
  object CConferNfeConsu: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DPConferNfeConsu'
    Left = 384
    Top = 1523
    object CConferNfeConsuDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
    end
    object CConferNfeConsuCOD_NOTA: TIntegerField
      FieldName = 'COD_NOTA'
    end
    object CConferNfeConsuSERIE: TIntegerField
      FieldName = 'SERIE'
    end
    object CConferNfeConsuXML: TStringField
      FieldName = 'XML'
      Size = 44
    end
    object CConferNfeConsuMOD: TStringField
      FieldName = 'MOD'
      Required = True
      FixedChar = True
      Size = 2
    end
    object CConferNfeConsuCASO: TStringField
      FieldName = 'CASO'
      Required = True
      FixedChar = True
      Size = 22
    end
    object CConferNfeConsuOPERACAO: TStringField
      FieldName = 'OPERACAO'
      Size = 50
    end
  end
  object DPConferNfeConsu: TDataSetProvider
    DataSet = SConferNfeConsu
    Left = 384
    Top = 1579
  end
  object SItemVendaPC: TSQLDataSet
    CommandText = 
      'SELECT VE.DATA_EMISSAO, VE.COD_NOTA, IV.COD_PROD, IV.NOMEPROD, I' +
      'V.CST_PIS, IV.CST_COFINS, IV.PPIS, IV.PCOFINS, PI.TIPO_CALC_PIS ' +
      'AS TIPO_CALCULO_PIS, PI.TIPO_CALC_COFINS AS TIPO_CALCULO_COFINS,' +
      ' '#39'Venda de Mercadoria'#39' AS FINALIDADE, '#39'NFC-e'#39' AS ORIGEM, '#39'Diverg' +
      #234'ncia de CST Pis com CST Cofins'#39' AS ERRO  FROM ITEMVENDA IV'#13#10'INN' +
      'ER JOIN VENDAS VE ON IV.COD_NOTA=VE.COD_NOTA'#13#10'INNER JOIN PRODUTO' +
      'S_IMPOSTOS PI ON IV.COD_PROD=PI.COD_PROD'#13#10'WHERE (VE.DATA_EMISSAO' +
      ' BETWEEN :DATA1 AND :DATA2)'#13#10'AND( VE.NFC_FLAG ='#39'T'#39')'#13#10'AND (IV.CST' +
      '_PIS<>IV.CST_COFINS)'#13#10'ORDER BY VE.DATA_EMISSAO, VE.COD_NOTA, IV.' +
      'COD_PROD'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'DATA1'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA2'
        ParamType = ptInput
      end>
    SQLConnection = Dados
    Left = 40
    Top = 891
    object SItemVendaPCDATA_EMISSAO: TDateField
      Alignment = taCenter
      FieldName = 'DATA_EMISSAO'
    end
    object SItemVendaPCCOD_NOTA: TIntegerField
      Alignment = taCenter
      FieldName = 'COD_NOTA'
    end
    object SItemVendaPCCOD_PROD: TIntegerField
      Alignment = taCenter
      FieldName = 'COD_PROD'
    end
    object SItemVendaPCNOMEPROD: TStringField
      Alignment = taCenter
      FieldName = 'NOMEPROD'
      Size = 50
    end
    object SItemVendaPCCST_PIS: TStringField
      Alignment = taCenter
      FieldName = 'CST_PIS'
      Size = 2
    end
    object SItemVendaPCPPIS: TFMTBCDField
      Alignment = taCenter
      FieldName = 'PPIS'
      Precision = 18
      Size = 2
    end
    object SItemVendaPCTIPO_CALCULO_PIS: TStringField
      FieldName = 'TIPO_CALCULO_PIS'
      Size = 30
    end
    object SItemVendaPCCST_COFINS: TStringField
      Alignment = taCenter
      FieldName = 'CST_COFINS'
      Size = 2
    end
    object SItemVendaPCPCOFINS: TFMTBCDField
      Alignment = taCenter
      FieldName = 'PCOFINS'
      Precision = 18
      Size = 2
    end
    object SItemVendaPCTIPO_CALCULO_COFINS: TStringField
      FieldName = 'TIPO_CALCULO_COFINS'
      Size = 30
    end
    object SItemVendaPCFINALIDADE: TStringField
      Alignment = taCenter
      FieldName = 'FINALIDADE'
      Required = True
      FixedChar = True
      Size = 19
    end
    object SItemVendaPCERRO: TStringField
      Alignment = taCenter
      FieldName = 'ERRO'
      Required = True
      FixedChar = True
      Size = 37
    end
    object SItemVendaPCORIGEM: TStringField
      Alignment = taCenter
      FieldName = 'ORIGEM'
      Required = True
      FixedChar = True
      Size = 5
    end
  end
  object CItemVendaPC: TClientDataSet
    Aggregates = <>
    Filtered = True
    Params = <>
    ProviderName = 'DPItemVendaPC'
    Left = 40
    Top = 939
    object CItemVendaPCDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
    end
    object CItemVendaPCCOD_NOTA: TIntegerField
      FieldName = 'COD_NOTA'
    end
    object CItemVendaPCCOD_PROD: TIntegerField
      FieldName = 'COD_PROD'
    end
    object CItemVendaPCNOMEPROD: TStringField
      FieldName = 'NOMEPROD'
      Size = 50
    end
    object CItemVendaPCCST_PIS: TStringField
      FieldName = 'CST_PIS'
      Size = 2
    end
    object CItemVendaPCPPIS: TFMTBCDField
      FieldName = 'PPIS'
      Precision = 18
      Size = 2
    end
    object CItemVendaPCTIPO_CALCULO_PIS: TStringField
      FieldName = 'TIPO_CALCULO_PIS'
      Size = 30
    end
    object CItemVendaPCCST_COFINS: TStringField
      FieldName = 'CST_COFINS'
      Size = 2
    end
    object CItemVendaPCPCOFINS: TFMTBCDField
      FieldName = 'PCOFINS'
      Precision = 18
      Size = 2
    end
    object CItemVendaPCTIPO_CALCULO_COFINS: TStringField
      FieldName = 'TIPO_CALCULO_COFINS'
      Size = 30
    end
    object CItemVendaPCFINALIDADE: TStringField
      FieldName = 'FINALIDADE'
      Required = True
      FixedChar = True
      Size = 19
    end
    object CItemVendaPCERRO: TStringField
      FieldName = 'ERRO'
      Required = True
      FixedChar = True
      Size = 37
    end
    object CItemVendaPCORIGEM: TStringField
      FieldName = 'ORIGEM'
      Required = True
      FixedChar = True
      Size = 5
    end
  end
  object DPItemVendaPC: TDataSetProvider
    DataSet = SItemVendaPC
    Left = 40
    Top = 987
  end
  object SItemVendaAliqPC: TSQLDataSet
    CommandText = 
      'SELECT DATA_EMISSAO, COD_NOTA, COD_PROD, NOMEPROD, CST_PIS, PPIS' +
      ', CST_COFINS, PCOFINS, TIPO_CALCULO_PIS, TIPO_CALCULO_COFINS, FI' +
      'NALIDADE, ERRO, ORIGEM FROM'#13#10'('#13#10'SELECT VE.DATA_EMISSAO, VE.COD_N' +
      'OTA, IV.COD_PROD, IV.NOMEPROD, IV.CST_PIS, IV.CST_COFINS, IV.PPI' +
      'S, IV.PCOFINS, PI.TIPO_CALC_PIS AS TIPO_CALCULO_PIS, PI.TIPO_CAL' +
      'C_COFINS AS TIPO_CALCULO_COFINS,  '#39'Venda de Mercadoria'#39' AS FINAL' +
      'IDADE, '#39'NFC-e'#39' AS ORIGEM, '#39'CST Pis difere da Aliquota (%)'#39' AS ER' +
      'RO  FROM ITEMVENDA IV'#13#10'INNER JOIN VENDAS VE ON IV.COD_NOTA=VE.CO' +
      'D_NOTA'#13#10'INNER JOIN PRODUTOS_IMPOSTOS PI ON IV.COD_PROD=PI.COD_PR' +
      'OD'#13#10'WHERE (VE.NFC_FLAG ='#39'T'#39')'#13#10'AND (VE.NUM_NFC IS NOT NULL)'#13#10'AND ' +
      '( ((IV.CST_PIS ='#39'01'#39') AND ((IV.PPIS)<>(:ALIQPIS)))'#13#10'OR  ((IV.CST' +
      '_PIS IN ('#39'04'#39','#39'06'#39')) AND (IV.PPIS > 0)) )'#13#10#13#10'UNION'#13#10#13#10'SELECT VE.' +
      'DATA_EMISSAO, VE.COD_NOTA, IV.COD_PROD, IV.NOMEPROD, IV.CST_PIS,' +
      ' IV.CST_COFINS, IV.PPIS, IV.PCOFINS, PI.TIPO_CALC_PIS AS TIPO_CA' +
      'LCULO_PIS, PI.TIPO_CALC_COFINS AS TIPO_CALCULO_COFINS, '#39'Venda de' +
      ' Mercadoria'#39' AS FINALIDADE, '#39'NFC-e'#39' AS ORIGEM, '#39'CST Cofins difer' +
      'e da Aliquota (%)'#39'  AS ERRO  FROM ITEMVENDA IV'#13#10'INNER JOIN VENDA' +
      'S VE ON IV.COD_NOTA=VE.COD_NOTA'#13#10'INNER JOIN PRODUTOS_IMPOSTOS PI' +
      ' ON IV.COD_PROD=PI.COD_PROD'#13#10'WHERE (VE.NFC_FLAG ='#39'T'#39') '#13#10'AND (VE.' +
      'NUM_NFC IS NOT NULL)'#13#10'AND (  ((IV.CST_COFINS ='#39'01'#39') AND ((IV.PCO' +
      'FINS)<>(:ALIQCOFINS))) '#13#10'OR  ((IV.CST_COFINS IN ('#39'04'#39','#39'06'#39')) AND' +
      ' (IV.PCOFINS > 0))  )'#13#10')'#13#10'WHERE DATA_EMISSAO BETWEEN :DATA1 AND ' +
      ':DATA2'#13#10'ORDER BY DATA_EMISSAO, COD_NOTA, COD_PROD'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'ALIQPIS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ALIQCOFINS'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA1'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA2'
        ParamType = ptInput
      end>
    SQLConnection = Dados
    Left = 152
    Top = 891
    object SItemVendaAliqPCDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
    end
    object SItemVendaAliqPCCOD_NOTA: TIntegerField
      FieldName = 'COD_NOTA'
    end
    object SItemVendaAliqPCCOD_PROD: TIntegerField
      FieldName = 'COD_PROD'
    end
    object SItemVendaAliqPCNOMEPROD: TStringField
      FieldName = 'NOMEPROD'
      Size = 50
    end
    object SItemVendaAliqPCCST_PIS: TStringField
      FieldName = 'CST_PIS'
      Size = 2
    end
    object SItemVendaAliqPCPPIS: TFMTBCDField
      FieldName = 'PPIS'
      Precision = 18
      Size = 2
    end
    object SItemVendaAliqPCTIPO_CALCULO_PIS: TStringField
      Alignment = taCenter
      FieldName = 'TIPO_CALCULO_PIS'
      Size = 30
    end
    object SItemVendaAliqPCCST_COFINS: TStringField
      FieldName = 'CST_COFINS'
      Size = 2
    end
    object SItemVendaAliqPCPCOFINS: TFMTBCDField
      FieldName = 'PCOFINS'
      Precision = 18
      Size = 2
    end
    object SItemVendaAliqPCTIPO_CALCULO_COFINS: TStringField
      Alignment = taCenter
      FieldName = 'TIPO_CALCULO_COFINS'
      Size = 30
    end
    object SItemVendaAliqPCFINALIDADE: TStringField
      FieldName = 'FINALIDADE'
      Required = True
      FixedChar = True
      Size = 19
    end
    object SItemVendaAliqPCORIGEM: TStringField
      FieldName = 'ORIGEM'
      Required = True
      FixedChar = True
      Size = 5
    end
    object SItemVendaAliqPCERRO: TStringField
      FieldName = 'ERRO'
      Required = True
      FixedChar = True
      Size = 33
    end
  end
  object CItemVendaAliqPC: TClientDataSet
    Aggregates = <>
    Filtered = True
    Params = <>
    ProviderName = 'DPItemVendaAliqPC'
    Left = 152
    Top = 939
    object CItemVendaAliqPCDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
    end
    object CItemVendaAliqPCCOD_NOTA: TIntegerField
      FieldName = 'COD_NOTA'
    end
    object CItemVendaAliqPCCOD_PROD: TIntegerField
      FieldName = 'COD_PROD'
    end
    object CItemVendaAliqPCNOMEPROD: TStringField
      FieldName = 'NOMEPROD'
      Size = 50
    end
    object CItemVendaAliqPCCST_PIS: TStringField
      FieldName = 'CST_PIS'
      Size = 2
    end
    object CItemVendaAliqPCPPIS: TFMTBCDField
      FieldName = 'PPIS'
      Precision = 18
      Size = 2
    end
    object CItemVendaAliqPCTIPO_CALCULO_PIS: TStringField
      Alignment = taCenter
      FieldName = 'TIPO_CALCULO_PIS'
      Size = 30
    end
    object CItemVendaAliqPCCST_COFINS: TStringField
      FieldName = 'CST_COFINS'
      Size = 2
    end
    object CItemVendaAliqPCPCOFINS: TFMTBCDField
      FieldName = 'PCOFINS'
      Precision = 18
      Size = 2
    end
    object CItemVendaAliqPCTIPO_CALCULO_COFINS: TStringField
      Alignment = taCenter
      FieldName = 'TIPO_CALCULO_COFINS'
      Size = 30
    end
    object CItemVendaAliqPCFINALIDADE: TStringField
      FieldName = 'FINALIDADE'
      Required = True
      FixedChar = True
      Size = 19
    end
    object CItemVendaAliqPCORIGEM: TStringField
      FieldName = 'ORIGEM'
      Required = True
      FixedChar = True
      Size = 5
    end
    object CItemVendaAliqPCERRO: TStringField
      FieldName = 'ERRO'
      Required = True
      FixedChar = True
      Size = 37
    end
  end
  object DPItemVendaAliqPC: TDataSetProvider
    DataSet = SItemVendaAliqPC
    Left = 152
    Top = 987
  end
  object SItemVendaNatPC: TSQLDataSet
    CommandText = 
      'SELECT DATA_EMISSAO, COD_NOTA, COD_PROD, NOMEPROD, CST_PIS, CST_' +
      'COFINS, PPIS, PCOFINS, TIPO_CALCULO_PIS, TIPO_CALCULO_COFINS, FI' +
      'NALIDADE, ORIGEM, ERRO FROM'#13#10'('#13#10'SELECT VE.DATA_EMISSAO, VE.COD_N' +
      'OTA, IV.COD_PROD, IV.NOMEPROD, IV.CST_PIS, IV.CST_COFINS, IV.PPI' +
      'S, IV.PCOFINS, PI.TIPO_CALC_PIS AS TIPO_CALCULO_PIS, PI.TIPO_CAL' +
      'C_COFINS AS TIPO_CALCULO_COFINS, '#39'Venda de Mercadoria'#39' AS FINALI' +
      'DADE, '#39'NFC-e'#39' AS ORIGEM, '#39'N'#195'O informado Natureza de Receita'#39' AS ' +
      'ERRO  FROM ITEMVENDA IV'#13#10'LEFT JOIN VENDAS VE ON IV.COD_NOTA=VE.C' +
      'OD_NOTA'#13#10'LEFT JOIN PRODUTOS_IMPOSTOS PI ON IV.COD_PROD=PI.COD_PR' +
      'OD'#13#10'WHERE (VE.NFC_FLAG ='#39'T'#39')'#13#10'AND (VE.NUM_NFC IS NOT NULL)'#13#10'AND ' +
      '( ((IV.CST_PIS IN ('#39'04'#39','#39'06'#39')) AND (PI.NAT_REC_PIS IS NULL)) OR'#13 +
      #10'((IV.CST_COFINS IN ('#39'04'#39','#39'06'#39')) AND (PI.NAT_REC_COFINS IS NULL)' +
      ') )'#13#10#13#10'UNION'#13#10#13#10'SELECT VE.DATA_EMISSAO, VE.COD_NOTA, IV.COD_PROD' +
      ', IV.NOMEPROD, IV.CST_PIS, IV.CST_COFINS, IV.PPIS, IV.PCOFINS, P' +
      'I.TIPO_CALC_PIS AS TIPO_CALCULO_PIS, PI.TIPO_CALC_COFINS AS TIPO' +
      '_CALCULO_COFINS, '#39'Venda de Mercadoria'#39' AS FINALIDADE, '#39'NFC-e'#39' AS' +
      ' ORIGEM, '#39'Informado Natureza de Receita'#39' AS ERRO  FROM ITEMVENDA' +
      ' IV'#13#10'LEFT JOIN VENDAS VE ON IV.COD_NOTA=VE.COD_NOTA'#13#10'LEFT JOIN P' +
      'RODUTOS_IMPOSTOS PI ON IV.COD_PROD=PI.COD_PROD'#13#10'WHERE (VE.NFC_FL' +
      'AG ='#39'T'#39')'#13#10'AND (VE.NUM_NFC IS NOT NULL)'#13#10'AND ( ((IV.CST_PIS IN ('#39 +
      '01'#39')) AND (PI.NAT_REC_PIS IS NOT NULL)) OR'#13#10'((IV.CST_COFINS IN (' +
      #39'01'#39')) AND (PI.NAT_REC_COFINS IS NOT NULL)) )'#13#10')'#13#10'WHERE DATA_EMI' +
      'SSAO BETWEEN :DATA1 AND :DATA2'#13#10'ORDER BY DATA_EMISSAO, COD_NOTA,' +
      ' COD_PROD'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'DATA1'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA2'
        ParamType = ptInput
      end>
    SQLConnection = Dados
    Left = 272
    Top = 891
    object SItemVendaNatPCDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
    end
    object SItemVendaNatPCCOD_NOTA: TIntegerField
      FieldName = 'COD_NOTA'
    end
    object SItemVendaNatPCCOD_PROD: TIntegerField
      FieldName = 'COD_PROD'
    end
    object SItemVendaNatPCNOMEPROD: TStringField
      FieldName = 'NOMEPROD'
      Size = 50
    end
    object SItemVendaNatPCCST_PIS: TStringField
      FieldName = 'CST_PIS'
      Size = 2
    end
    object SItemVendaNatPCPPIS: TFMTBCDField
      FieldName = 'PPIS'
      Precision = 18
      Size = 2
    end
    object SItemVendaNatPCTIPO_CALCULO_PIS: TStringField
      Alignment = taCenter
      FieldName = 'TIPO_CALCULO_PIS'
      Size = 30
    end
    object SItemVendaNatPCCST_COFINS: TStringField
      FieldName = 'CST_COFINS'
      Size = 2
    end
    object SItemVendaNatPCPCOFINS: TFMTBCDField
      FieldName = 'PCOFINS'
      Precision = 18
      Size = 2
    end
    object SItemVendaNatPCTIPO_CALCULO_COFINS: TStringField
      Alignment = taCenter
      FieldName = 'TIPO_CALCULO_COFINS'
      Size = 30
    end
    object SItemVendaNatPCFINALIDADE: TStringField
      FieldName = 'FINALIDADE'
      Required = True
      FixedChar = True
      Size = 19
    end
    object SItemVendaNatPCERRO: TStringField
      FieldName = 'ERRO'
      Required = True
      FixedChar = True
      Size = 33
    end
    object SItemVendaNatPCORIGEM: TStringField
      FieldName = 'ORIGEM'
      Required = True
      FixedChar = True
      Size = 5
    end
  end
  object CItemVendaNatPC: TClientDataSet
    Aggregates = <>
    Filtered = True
    Params = <>
    ProviderName = 'DPItemVendaNatPC'
    Left = 272
    Top = 939
    object CItemVendaNatPCDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
    end
    object CItemVendaNatPCCOD_NOTA: TIntegerField
      FieldName = 'COD_NOTA'
    end
    object CItemVendaNatPCCOD_PROD: TIntegerField
      FieldName = 'COD_PROD'
    end
    object CItemVendaNatPCNOMEPROD: TStringField
      FieldName = 'NOMEPROD'
      Size = 50
    end
    object CItemVendaNatPCCST_PIS: TStringField
      FieldName = 'CST_PIS'
      Size = 2
    end
    object CItemVendaNatPCPPIS: TFMTBCDField
      FieldName = 'PPIS'
      Precision = 18
      Size = 2
    end
    object CItemVendaNatPCTIPO_CALCULO_PIS: TStringField
      Alignment = taCenter
      FieldName = 'TIPO_CALCULO_PIS'
      Size = 30
    end
    object CItemVendaNatPCCST_COFINS: TStringField
      FieldName = 'CST_COFINS'
      Size = 2
    end
    object CItemVendaNatPCPCOFINS: TFMTBCDField
      FieldName = 'PCOFINS'
      Precision = 18
      Size = 2
    end
    object CItemVendaNatPCTIPO_CALCULO_COFINS: TStringField
      Alignment = taCenter
      FieldName = 'TIPO_CALCULO_COFINS'
      Size = 30
    end
    object CItemVendaNatPCFINALIDADE: TStringField
      FieldName = 'FINALIDADE'
      Required = True
      FixedChar = True
      Size = 19
    end
    object CItemVendaNatPCERRO: TStringField
      FieldName = 'ERRO'
      Required = True
      FixedChar = True
      Size = 33
    end
    object CItemVendaNatPCORIGEM: TStringField
      FieldName = 'ORIGEM'
      Required = True
      FixedChar = True
      Size = 5
    end
  end
  object DPItemVendaNatPC: TDataSetProvider
    DataSet = SItemVendaNatPC
    Left = 272
    Top = 987
  end
  object SItemNotaEmitPC: TSQLDataSet
    CommandText = 
      'SELECT DATA_EMISSAO, COD_NOTA, COD_PROD, NOMEPROD, CST_PIS, CST_' +
      'COFINS, PPIS, PCOFINS, TIPO_CALCULO_PIS, TIPO_CALCULO_COFINS, FI' +
      'NALIDADE, ERRO, ORIGEM FROM'#13#10'('#13#10'SELECT NE.DATA_EMISSAO, NE.COD_N' +
      'OTA, IE.COD_PROD, IE.NOME_PROD AS NOMEPROD, IE.CST_PIS, IE.CST_C' +
      'OFINS, IE.ALIQUOTA_PIS AS PPIS, IE.ALIQUOTA_COFINS AS PCOFINS, I' +
      'E.TIPO_CALCULO_PIS, IE.TIPO_CALCULO_COFINS, NP.DESCRICAO AS FINA' +
      'LIDADE, '#39'NF-e '#209' Consum Final'#39' AS ORIGEM, '#39'Diverg'#234'ncia de CST Pis' +
      ' com CST Cofins'#39' AS ERRO FROM ITEMNOTAEMITIDA IE'#13#10'INNER JOIN NOT' +
      'ASEMITIDAS NE ON NE.COD_NOTA=IE.COD_NOTA'#13#10'INNER JOIN NATUREZA_OP' +
      'ERACAO NP ON NP.CODIGO=NE.COD_NATUREZA_OPERACAO'#13#10'WHERE (NE.INDFI' +
      'NAL=0)'#13#10'AND (NE.STATUS='#39'Autorizada'#39')'#13#10'AND (IE.CST_PIS<>IE.CST_CO' +
      'FINS)'#13#10#13#10'UNION'#13#10#13#10'SELECT NE.DATA_EMISSAO, NE.COD_NOTA, IE.COD_PR' +
      'OD, IE.NOME_PROD AS NOMEPROD, IE.CST_PIS, IE.CST_COFINS, IE.ALIQ' +
      'UOTA_PIS AS PPIS, IE.ALIQUOTA_COFINS AS PCOFINS, IE.TIPO_CALCULO' +
      '_PIS, IE.TIPO_CALCULO_COFINS, NP.DESCRICAO AS FINALIDADE, '#39'NF-e ' +
      'Consum Final'#39' AS ORIGEM, '#39'Diverg'#234'ncia de CST Pis com CST Cofins'#39 +
      ' AS ERRO FROM ITEMNOTAEMITIDA IE'#13#10'INNER JOIN NOTASEMITIDAS NE ON' +
      ' NE.COD_NOTA=IE.COD_NOTA'#13#10'INNER JOIN NATUREZA_OPERACAO NP ON NP.' +
      'CODIGO=NE.COD_NATUREZA_OPERACAO'#13#10'WHERE (NE.INDFINAL=1)'#13#10'AND (NE.' +
      'STATUS='#39'Autorizada'#39')'#13#10'AND (IE.CST_PIS<>IE.CST_COFINS)'#13#10#13#10')'#13#10'WHER' +
      'E DATA_EMISSAO BETWEEN :DATA1 AND :DATA2'#13#10'ORDER BY  DATA_EMISSAO' +
      ', COD_NOTA, COD_PROD'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'DATA1'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA2'
        ParamType = ptInput
      end>
    SQLConnection = Dados
    Left = 40
    Top = 1075
    object SItemNotaEmitPCDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
    end
    object SItemNotaEmitPCCOD_NOTA: TIntegerField
      FieldName = 'COD_NOTA'
      Required = True
    end
    object SItemNotaEmitPCCOD_PROD: TIntegerField
      FieldName = 'COD_PROD'
    end
    object SItemNotaEmitPCNOMEPROD: TStringField
      FieldName = 'NOMEPROD'
      Size = 50
    end
    object SItemNotaEmitPCCST_PIS: TStringField
      FieldName = 'CST_PIS'
      Size = 2
    end
    object SItemNotaEmitPCPPIS: TFMTBCDField
      FieldName = 'PPIS'
      Precision = 18
      Size = 2
    end
    object SItemNotaEmitPCTIPO_CALCULO_PIS: TStringField
      Alignment = taCenter
      FieldName = 'TIPO_CALCULO_PIS'
      Size = 30
    end
    object SItemNotaEmitPCCST_COFINS: TStringField
      FieldName = 'CST_COFINS'
      Size = 2
    end
    object SItemNotaEmitPCPCOFINS: TFMTBCDField
      FieldName = 'PCOFINS'
      Precision = 18
      Size = 2
    end
    object SItemNotaEmitPCTIPO_CALCULO_COFINS: TStringField
      Alignment = taCenter
      FieldName = 'TIPO_CALCULO_COFINS'
      Size = 30
    end
    object SItemNotaEmitPCFINALIDADE: TStringField
      FieldName = 'FINALIDADE'
      Size = 50
    end
    object SItemNotaEmitPCERRO: TStringField
      FieldName = 'ERRO'
      Required = True
      FixedChar = True
      Size = 37
    end
    object SItemNotaEmitPCORIGEM: TStringField
      FieldName = 'ORIGEM'
      Required = True
      FixedChar = True
      Size = 19
    end
  end
  object CItemNotaEmitPC: TClientDataSet
    Aggregates = <>
    Filtered = True
    Params = <>
    ProviderName = 'DPItemNotaEmitPC'
    Left = 40
    Top = 1123
    object CItemNotaEmitPCDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
    end
    object CItemNotaEmitPCCOD_NOTA: TIntegerField
      FieldName = 'COD_NOTA'
      Required = True
    end
    object CItemNotaEmitPCCOD_PROD: TIntegerField
      FieldName = 'COD_PROD'
    end
    object CItemNotaEmitPCNOMEPROD: TStringField
      FieldName = 'NOMEPROD'
      Size = 50
    end
    object CItemNotaEmitPCCST_PIS: TStringField
      FieldName = 'CST_PIS'
      Size = 2
    end
    object CItemNotaEmitPCPPIS: TFMTBCDField
      FieldName = 'PPIS'
      Precision = 18
      Size = 2
    end
    object CItemNotaEmitPCTIPO_CALCULO_PIS: TStringField
      Alignment = taCenter
      FieldName = 'TIPO_CALCULO_PIS'
      Size = 30
    end
    object CItemNotaEmitPCCST_COFINS: TStringField
      FieldName = 'CST_COFINS'
      Size = 2
    end
    object CItemNotaEmitPCPCOFINS: TFMTBCDField
      FieldName = 'PCOFINS'
      Precision = 18
      Size = 2
    end
    object CItemNotaEmitPCTIPO_CALCULO_COFINS: TStringField
      Alignment = taCenter
      FieldName = 'TIPO_CALCULO_COFINS'
      Size = 30
    end
    object CItemNotaEmitPCFINALIDADE: TStringField
      FieldName = 'FINALIDADE'
      Size = 50
    end
    object CItemNotaEmitPCERRO: TStringField
      FieldName = 'ERRO'
      Required = True
      FixedChar = True
      Size = 37
    end
    object CItemNotaEmitPCORIGEM: TStringField
      FieldName = 'ORIGEM'
      Required = True
      FixedChar = True
      Size = 19
    end
  end
  object DPItemNotaEmitPC: TDataSetProvider
    DataSet = SItemNotaEmitPC
    Left = 40
    Top = 1171
  end
  object SItemNotaEmitAliqPC: TSQLDataSet
    CommandText = 
      'SELECT DATA_EMISSAO, COD_NOTA, COD_PROD, NOMEPROD, CST_PIS, CST_' +
      'COFINS, PPIS, PCOFINS, TIPO_CALCULO_PIS, TIPO_CALCULO_COFINS, FI' +
      'NALIDADE, ERRO, ORIGEM FROM'#13#10'('#13#10'SELECT NE.DATA_EMISSAO, NE.COD_N' +
      'OTA, IE.COD_PROD, IE.NOME_PROD AS NOMEPROD, IE.CST_PIS, IE.CST_C' +
      'OFINS, IE.ALIQUOTA_PIS AS PPIS, IE.ALIQUOTA_COFINS AS PCOFINS, I' +
      'E.TIPO_CALCULO_PIS, IE.TIPO_CALCULO_COFINS, NP.DESCRICAO AS FINA' +
      'LIDADE, '#39'NF-e '#209' Consum Final'#39' AS ORIGEM, '#39'CST Pis difere da Aliq' +
      'uota (%)'#39' AS ERRO FROM ITEMNOTAEMITIDA IE'#13#10'INNER JOIN NOTASEMITI' +
      'DAS NE ON NE.COD_NOTA=IE.COD_NOTA'#13#10'INNER JOIN NATUREZA_OPERACAO ' +
      'NP ON NP.CODIGO=NE.COD_NATUREZA_OPERACAO'#13#10'WHERE (NE.INDFINAL=0)'#13 +
      #10'AND (NE.STATUS='#39'Autorizada'#39')'#13#10'AND ( ((IE.CST_PIS IN ('#39'01'#39')) AND' +
      ' ((IE.ALIQUOTA_PIS)<>(:ALIQPIS)))'#13#10'OR   ((IE.CST_PIS IN ('#39'04'#39','#39'0' +
      '6'#39')) AND (IE.ALIQUOTA_PIS > 0)) )'#13#10#13#10'UNION'#13#10#13#10'SELECT NE.DATA_EMI' +
      'SSAO, NE.COD_NOTA, IE.COD_PROD, IE.NOME_PROD AS NOMEPROD, IE.CST' +
      '_PIS, IE.CST_COFINS, IE.ALIQUOTA_PIS AS PPIS, IE.ALIQUOTA_COFINS' +
      ' AS PCOFINS, IE.TIPO_CALCULO_PIS, IE.TIPO_CALCULO_COFINS, NP.DES' +
      'CRICAO AS FINALIDADE, '#39'NF-e '#209' Consum Final'#39' AS ORIGEM, '#39'CST Cofi' +
      'ns difere da Aliquota (%)'#39' AS ERRO FROM ITEMNOTAEMITIDA IE'#13#10'INNE' +
      'R JOIN NOTASEMITIDAS NE ON NE.COD_NOTA=IE.COD_NOTA'#13#10'INNER JOIN N' +
      'ATUREZA_OPERACAO NP ON NP.CODIGO=NE.COD_NATUREZA_OPERACAO'#13#10'WHERE' +
      ' (NE.INDFINAL=0)'#13#10'AND (NE.STATUS='#39'Autorizada'#39')'#13#10'AND ( ((IE.CST_C' +
      'OFINS IN ('#39'01'#39')) AND ((IE.ALIQUOTA_COFINS)<>(:ALIQCOFINS)))'#13#10'OR ' +
      '  ((IE.CST_COFINS IN ('#39'04'#39','#39'06'#39')) AND (IE.ALIQUOTA_COFINS > 0)) ' +
      ')'#13#10#13#10'UNION'#13#10#13#10'SELECT NE.DATA_EMISSAO, NE.COD_NOTA, IE.COD_PROD, ' +
      'IE.NOME_PROD AS NOMEPROD, IE.CST_PIS, IE.CST_COFINS, IE.ALIQUOTA' +
      '_PIS AS PPIS, IE.ALIQUOTA_COFINS AS PCOFINS, IE.TIPO_CALCULO_PIS' +
      ', IE.TIPO_CALCULO_COFINS, NP.DESCRICAO AS FINALIDADE, '#39'NF-e Cons' +
      'um Final'#39' AS ORIGEM, '#39'CST Pis difere da Aliquota (%)'#39' AS ERRO FR' +
      'OM ITEMNOTAEMITIDA IE'#13#10'INNER JOIN NOTASEMITIDAS NE ON NE.COD_NOT' +
      'A=IE.COD_NOTA'#13#10'INNER JOIN NATUREZA_OPERACAO NP ON NP.CODIGO=NE.C' +
      'OD_NATUREZA_OPERACAO'#13#10'WHERE (NE.INDFINAL=1)'#13#10'AND (NE.STATUS='#39'Aut' +
      'orizada'#39')'#13#10'AND ( ((IE.CST_PIS IN ('#39'01'#39')) AND ((IE.ALIQUOTA_PIS)<' +
      '>(:ALIQPIS)))'#13#10'OR   ((IE.CST_PIS IN ('#39'04'#39','#39'06'#39')) AND (IE.ALIQUOT' +
      'A_PIS > 0)) )'#13#10#13#10'UNION'#13#10#13#10'SELECT NE.DATA_EMISSAO, NE.COD_NOTA, I' +
      'E.COD_PROD, IE.NOME_PROD AS NOMEPROD, IE.CST_PIS, IE.CST_COFINS,' +
      ' IE.ALIQUOTA_PIS AS PPIS, IE.ALIQUOTA_COFINS AS PCOFINS, IE.TIPO' +
      '_CALCULO_PIS, IE.TIPO_CALCULO_COFINS, NP.DESCRICAO AS FINALIDADE' +
      ', '#39'NF-e Consum Final'#39' AS ORIGEM, '#39'CST Cofins difere da Aliquota ' +
      '(%)'#39' AS ERRO FROM ITEMNOTAEMITIDA IE'#13#10'INNER JOIN NOTASEMITIDAS N' +
      'E ON NE.COD_NOTA=IE.COD_NOTA'#13#10'INNER JOIN NATUREZA_OPERACAO NP ON' +
      ' NP.CODIGO=NE.COD_NATUREZA_OPERACAO'#13#10'WHERE (NE.INDFINAL=1)'#13#10'AND ' +
      '(NE.STATUS='#39'Autorizada'#39')'#13#10'AND ( ((IE.CST_COFINS IN ('#39'01'#39')) AND (' +
      '(IE.ALIQUOTA_COFINS)<>(:ALIQCOFINS)))'#13#10'OR   ((IE.CST_COFINS IN (' +
      #39'04'#39','#39'06'#39')) AND (IE.ALIQUOTA_COFINS > 0)) )'#13#10')'#13#10'WHERE DATA_EMISS' +
      'AO BETWEEN :DATA1 AND :DATA2'#13#10'ORDER BY  DATA_EMISSAO, COD_NOTA, ' +
      'COD_PROD'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'ALIQPIS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ALIQCOFINS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ALIQPIS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ALIQCOFINS'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA1'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA2'
        ParamType = ptInput
      end>
    SQLConnection = Dados
    Left = 152
    Top = 1075
    object SItemNotaEmitAliqPCDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
    end
    object SItemNotaEmitAliqPCCOD_NOTA: TIntegerField
      FieldName = 'COD_NOTA'
      Required = True
    end
    object SItemNotaEmitAliqPCCOD_PROD: TIntegerField
      FieldName = 'COD_PROD'
    end
    object SItemNotaEmitAliqPCNOMEPROD: TStringField
      FieldName = 'NOMEPROD'
      Size = 50
    end
    object SItemNotaEmitAliqPCCST_PIS: TStringField
      FieldName = 'CST_PIS'
      Size = 2
    end
    object SItemNotaEmitAliqPCPPIS: TFMTBCDField
      FieldName = 'PPIS'
      Precision = 18
      Size = 2
    end
    object SItemNotaEmitAliqPCTIPO_CALCULO_PIS: TStringField
      Alignment = taCenter
      FieldName = 'TIPO_CALCULO_PIS'
      Size = 30
    end
    object SItemNotaEmitAliqPCCST_COFINS: TStringField
      Alignment = taCenter
      FieldName = 'CST_COFINS'
      Size = 2
    end
    object SItemNotaEmitAliqPCPCOFINS: TFMTBCDField
      FieldName = 'PCOFINS'
      Precision = 18
      Size = 2
    end
    object SItemNotaEmitAliqPCTIPO_CALCULO_COFINS: TStringField
      Alignment = taCenter
      FieldName = 'TIPO_CALCULO_COFINS'
      Size = 30
    end
    object SItemNotaEmitAliqPCFINALIDADE: TStringField
      FieldName = 'FINALIDADE'
      Size = 50
    end
    object SItemNotaEmitAliqPCERRO: TStringField
      FieldName = 'ERRO'
      Required = True
      FixedChar = True
      Size = 33
    end
    object SItemNotaEmitAliqPCORIGEM: TStringField
      FieldName = 'ORIGEM'
      Required = True
      FixedChar = True
      Size = 19
    end
  end
  object CItemNotaEmitAliqPC: TClientDataSet
    Aggregates = <>
    Filtered = True
    Params = <>
    ProviderName = 'DPItemNotaEmitAliqPC'
    Left = 152
    Top = 1123
    object CItemNotaEmitAliqPCDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
    end
    object CItemNotaEmitAliqPCCOD_NOTA: TIntegerField
      FieldName = 'COD_NOTA'
      Required = True
    end
    object CItemNotaEmitAliqPCCOD_PROD: TIntegerField
      FieldName = 'COD_PROD'
    end
    object CItemNotaEmitAliqPCNOMEPROD: TStringField
      FieldName = 'NOMEPROD'
      Size = 50
    end
    object CItemNotaEmitAliqPCCST_PIS: TStringField
      FieldName = 'CST_PIS'
      Size = 2
    end
    object CItemNotaEmitAliqPCPPIS: TFMTBCDField
      FieldName = 'PPIS'
      Precision = 18
      Size = 2
    end
    object CItemNotaEmitAliqPCTIPO_CALCULO_PIS: TStringField
      Alignment = taCenter
      FieldName = 'TIPO_CALCULO_PIS'
      Size = 30
    end
    object CItemNotaEmitAliqPCCST_COFINS: TStringField
      FieldName = 'CST_COFINS'
      Size = 2
    end
    object CItemNotaEmitAliqPCPCOFINS: TFMTBCDField
      FieldName = 'PCOFINS'
      Precision = 18
      Size = 2
    end
    object CItemNotaEmitAliqPCTIPO_CALCULO_COFINS: TStringField
      Alignment = taCenter
      FieldName = 'TIPO_CALCULO_COFINS'
      Size = 30
    end
    object CItemNotaEmitAliqPCFINALIDADE: TStringField
      FieldName = 'FINALIDADE'
      Size = 50
    end
    object CItemNotaEmitAliqPCERRO: TStringField
      FieldName = 'ERRO'
      Required = True
      FixedChar = True
      Size = 33
    end
    object CItemNotaEmitAliqPCORIGEM: TStringField
      FieldName = 'ORIGEM'
      Required = True
      FixedChar = True
      Size = 19
    end
  end
  object DPItemNotaEmitAliqPC: TDataSetProvider
    DataSet = SItemNotaEmitAliqPC
    Left = 152
    Top = 1171
  end
  object SItemNotaEmitNatPC: TSQLDataSet
    CommandText = 
      'SELECT DATA_EMISSAO, COD_NOTA, COD_PROD, NOMEPROD, CST_PIS, CST_' +
      'COFINS, PPIS, PCOFINS, TIPO_CALCULO_PIS, TIPO_CALCULO_COFINS, FI' +
      'NALIDADE, ERRO, ORIGEM FROM'#13#10'('#13#10'SELECT NE.DATA_EMISSAO, NE.COD_N' +
      'OTA, IE.COD_PROD, IE.NOME_PROD AS NOMEPROD, IE.CST_PIS, IE.CST_C' +
      'OFINS, IE.ALIQUOTA_PIS AS PPIS, IE.ALIQUOTA_COFINS AS PCOFINS, I' +
      'E.TIPO_CALCULO_PIS, IE.TIPO_CALCULO_COFINS, NP.DESCRICAO AS FINA' +
      'LIDADE, '#39'NF-e '#209' Consum Final'#39' AS ORIGEM, '#39'N'#195'O informado Natureza' +
      ' de Receita'#39' AS ERRO FROM ITEMNOTAEMITIDA IE'#13#10'INNER JOIN NOTASEM' +
      'ITIDAS NE ON NE.COD_NOTA=IE.COD_NOTA'#13#10'INNER JOIN NATUREZA_OPERAC' +
      'AO NP ON NP.CODIGO=NE.COD_NATUREZA_OPERACAO'#13#10'INNER JOIN PRODUTOS' +
      '_IMPOSTOS PI ON PI.COD_PROD=IE.COD_PROD'#13#10'WHERE (NE.INDFINAL=0)'#13#10 +
      'AND (NE.STATUS='#39'Autorizada'#39')'#13#10'AND ( ((IE.CST_PIS IN ('#39'04'#39','#39'06'#39'))' +
      ' AND (PI.NAT_REC_PIS IS NULL))'#13#10' OR    ((IE.CST_COFINS IN ('#39'04'#39',' +
      ' '#39'06'#39')) AND (PI.NAT_REC_COFINS IS  NULL)) )'#13#10#13#10'UNION'#13#10#13#10'SELECT N' +
      'E.DATA_EMISSAO, NE.COD_NOTA, IE.COD_PROD, IE.NOME_PROD AS NOMEPR' +
      'OD, IE.CST_PIS, IE.CST_COFINS, IE.ALIQUOTA_PIS AS PPIS, IE.ALIQU' +
      'OTA_COFINS AS PCOFINS, IE.TIPO_CALCULO_PIS, IE.TIPO_CALCULO_COFI' +
      'NS, NP.DESCRICAO AS FINALIDADE, '#39'NF-e '#209' Consum Final'#39' AS ORIGEM,' +
      ' '#39'Informado Natureza de Receita'#39' AS ERRO FROM ITEMNOTAEMITIDA IE' +
      #13#10'INNER JOIN NOTASEMITIDAS NE ON NE.COD_NOTA=IE.COD_NOTA'#13#10'INNER ' +
      'JOIN NATUREZA_OPERACAO NP ON NP.CODIGO=NE.COD_NATUREZA_OPERACAO'#13 +
      #10'INNER JOIN PRODUTOS_IMPOSTOS PI ON PI.COD_PROD=IE.COD_PROD'#13#10'WHE' +
      'RE (NE.INDFINAL=0)'#13#10'AND (NE.STATUS='#39'Autorizada'#39')'#13#10'AND ( ((IE.CST' +
      '_PIS IN ('#39'01'#39')) AND (PI.NAT_REC_PIS IS NOT NULL))'#13#10' OR    ((IE.C' +
      'ST_COFINS IN ('#39'01'#39')) AND (PI.NAT_REC_COFINS IS NOT NULL)) )'#13#10'UNI' +
      'ON'#13#10#13#10'SELECT NE.DATA_EMISSAO, NE.COD_NOTA, IE.COD_PROD, IE.NOME_' +
      'PROD AS NOMEPROD, IE.CST_PIS, IE.CST_COFINS, IE.ALIQUOTA_PIS AS ' +
      'PPIS, IE.ALIQUOTA_COFINS AS PCOFINS, IE.TIPO_CALCULO_PIS, IE.TIP' +
      'O_CALCULO_COFINS, NP.DESCRICAO AS FINALIDADE, '#39'NF-e Consum Final' +
      #39' AS ORIGEM, '#39'N'#195'O informado Natureza de Receita'#39' AS ERRO FROM IT' +
      'EMNOTAEMITIDA IE'#13#10'INNER JOIN NOTASEMITIDAS NE ON NE.COD_NOTA=IE.' +
      'COD_NOTA'#13#10'INNER JOIN NATUREZA_OPERACAO NP ON NP.CODIGO=NE.COD_NA' +
      'TUREZA_OPERACAO'#13#10'INNER JOIN PRODUTOS_IMPOSTOS PI ON PI.COD_PROD=' +
      'IE.COD_PROD'#13#10'WHERE (NE.INDFINAL=1)'#13#10'AND (NE.STATUS='#39'Autorizada'#39')' +
      #13#10'AND ( ((IE.CST_PIS IN ('#39'04'#39','#39'06'#39')) AND (PI.NAT_REC_PIS IS NULL' +
      '))'#13#10' OR    ((IE.CST_COFINS IN ('#39'04'#39', '#39'06'#39')) AND (PI.NAT_REC_COFI' +
      'NS IS  NULL)) )'#13#10#13#10'UNION'#13#10#13#10'SELECT NE.DATA_EMISSAO, NE.COD_NOTA,' +
      ' IE.COD_PROD, IE.NOME_PROD AS NOMEPROD, IE.CST_PIS, IE.CST_COFIN' +
      'S, IE.ALIQUOTA_PIS AS PPIS, IE.ALIQUOTA_COFINS AS PCOFINS, IE.TI' +
      'PO_CALCULO_PIS, IE.TIPO_CALCULO_COFINS, NP.DESCRICAO AS FINALIDA' +
      'DE, '#39'NF-e Consum Final'#39' AS ORIGEM, '#39'Informado Natureza de Receit' +
      'a'#39' AS ERRO FROM ITEMNOTAEMITIDA IE'#13#10'INNER JOIN NOTASEMITIDAS NE ' +
      'ON NE.COD_NOTA=IE.COD_NOTA'#13#10'INNER JOIN PRODUTOS_IMPOSTOS PI ON P' +
      'I.COD_PROD=IE.COD_PROD'#13#10'INNER JOIN NATUREZA_OPERACAO NP ON NP.CO' +
      'DIGO=NE.COD_NATUREZA_OPERACAO'#13#10'WHERE (NE.INDFINAL=1)'#13#10'AND (NE.ST' +
      'ATUS='#39'Autorizada'#39')'#13#10'AND ( ((IE.CST_PIS IN ('#39'01'#39')) AND (PI.NAT_RE' +
      'C_PIS IS NOT NULL))'#13#10' OR    ((IE.CST_COFINS IN ('#39'01'#39')) AND (PI.N' +
      'AT_REC_COFINS IS NOT NULL)) )'#13#10#13#10')'#13#10'WHERE DATA_EMISSAO BETWEEN :' +
      'DATA1 AND :DATA2'#13#10'ORDER BY  DATA_EMISSAO, COD_NOTA, COD_PROD'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'DATA1'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA2'
        ParamType = ptInput
      end>
    SQLConnection = Dados
    Left = 272
    Top = 1075
    object SItemNotaEmitNatPCDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
    end
    object SItemNotaEmitNatPCCOD_NOTA: TIntegerField
      FieldName = 'COD_NOTA'
      Required = True
    end
    object SItemNotaEmitNatPCCOD_PROD: TIntegerField
      FieldName = 'COD_PROD'
    end
    object SItemNotaEmitNatPCNOMEPROD: TStringField
      FieldName = 'NOMEPROD'
      Size = 50
    end
    object SItemNotaEmitNatPCCST_PIS: TStringField
      FieldName = 'CST_PIS'
      Size = 2
    end
    object SItemNotaEmitNatPCPPIS: TFMTBCDField
      FieldName = 'PPIS'
      Precision = 18
      Size = 2
    end
    object SItemNotaEmitNatPCTIPO_CALCULO_PIS: TStringField
      Alignment = taCenter
      FieldName = 'TIPO_CALCULO_PIS'
      Size = 30
    end
    object SItemNotaEmitNatPCCST_COFINS: TStringField
      FieldName = 'CST_COFINS'
      Size = 2
    end
    object SItemNotaEmitNatPCPCOFINS: TFMTBCDField
      FieldName = 'PCOFINS'
      Precision = 18
      Size = 2
    end
    object SItemNotaEmitNatPCTIPO_CALCULO_COFINS: TStringField
      Alignment = taCenter
      FieldName = 'TIPO_CALCULO_COFINS'
      Size = 30
    end
    object SItemNotaEmitNatPCFINALIDADE: TStringField
      FieldName = 'FINALIDADE'
      Size = 50
    end
    object SItemNotaEmitNatPCERRO: TStringField
      FieldName = 'ERRO'
      Required = True
      FixedChar = True
      Size = 33
    end
    object SItemNotaEmitNatPCORIGEM: TStringField
      FieldName = 'ORIGEM'
      Required = True
      FixedChar = True
      Size = 19
    end
  end
  object CItemNotaEmitNatPC: TClientDataSet
    Aggregates = <>
    Filtered = True
    Params = <>
    ProviderName = 'DPItemNotaEmitNatPC'
    Left = 272
    Top = 1123
    object CItemNotaEmitNatPCDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
    end
    object CItemNotaEmitNatPCCOD_NOTA: TIntegerField
      FieldName = 'COD_NOTA'
      Required = True
    end
    object CItemNotaEmitNatPCCOD_PROD: TIntegerField
      FieldName = 'COD_PROD'
    end
    object CItemNotaEmitNatPCNOMEPROD: TStringField
      FieldName = 'NOMEPROD'
      Size = 50
    end
    object CItemNotaEmitNatPCCST_PIS: TStringField
      FieldName = 'CST_PIS'
      Size = 2
    end
    object CItemNotaEmitNatPCPPIS: TFMTBCDField
      FieldName = 'PPIS'
      Precision = 18
      Size = 2
    end
    object CItemNotaEmitNatPCTIPO_CALCULO_PIS: TStringField
      Alignment = taCenter
      FieldName = 'TIPO_CALCULO_PIS'
      Size = 30
    end
    object CItemNotaEmitNatPCCST_COFINS: TStringField
      FieldName = 'CST_COFINS'
      Size = 2
    end
    object CItemNotaEmitNatPCPCOFINS: TFMTBCDField
      FieldName = 'PCOFINS'
      Precision = 18
      Size = 2
    end
    object CItemNotaEmitNatPCTIPO_CALCULO_COFINS: TStringField
      Alignment = taCenter
      FieldName = 'TIPO_CALCULO_COFINS'
      Size = 30
    end
    object CItemNotaEmitNatPCFINALIDADE: TStringField
      FieldName = 'FINALIDADE'
      Size = 50
    end
    object CItemNotaEmitNatPCERRO: TStringField
      FieldName = 'ERRO'
      Required = True
      FixedChar = True
      Size = 33
    end
    object CItemNotaEmitNatPCORIGEM: TStringField
      FieldName = 'ORIGEM'
      Required = True
      FixedChar = True
      Size = 19
    end
  end
  object DPItemNotaEmitNatPC: TDataSetProvider
    DataSet = SItemNotaEmitNatPC
    Left = 272
    Top = 1171
  end
  object SItemNotaEntCST: TSQLDataSet
    CommandText = 
      'SELECT DATA_EMISSAO, DATA_RECEBIM, COD_NOTA, XML,  COD_PROD, NOM' +
      'EPROD, CST_CSOSN_FORN, CFOP_FORN, CST_ENTRADA, CFOP_ENTRADA, FIN' +
      'ALIDADE, ERRO, TIPO_EMP, ITEM_NOTA, MAX_ITEM FROM'#13#10'('#13#10'SELECT  '#39'D' +
      'iverg'#234'ncia de CST com CST de Entrada'#39' AS ERRO, '#39'Simples Nacional' +
      #39' AS TIPO_EMP, NE.COD_NOTAFORN AS COD_NOTA, NE.CHAVE_NOTA AS XML' +
      ', IE.COD_PROD AS COD_PROD, IE.XPROD AS NOMEPROD, IE.CSON AS CST_' +
      'CSOSN_FORN, IE.CFOP AS CFOP_FORN, IE.CST_ENTRADA, IE.CFOP_OPOSTO' +
      ' AS CFOP_ENTRADA, NE.DATA_EMISSAO, NE.DATA_RECEBIM, NE.NAT_OPERA' +
      'CAO AS FINALIDADE, IE.ITEM_NOTA, (SELECT COUNT (N.COD_NOTA) FROM' +
      ' ITEMNOTAENT N WHERE N.COD_NOTA=IE.COD_NOTA) AS MAX_ITEM FROM IT' +
      'EMNOTAENT IE'#13#10'INNER JOIN NOTASENTRADA NE ON NE.COD_NOTA=IE.COD_N' +
      'OTA'#13#10'WHERE ((IE.CSON IS NOT NULL) AND (IE.CSON > 0))'#13#10'AND (  ((I' +
      'E.CST_ENTRADA NOT IN ('#39'00'#39', '#39'90'#39')) AND (IE.CST IN ('#39'101'#39', '#39'102'#39')' +
      ')) '#13#10'OR ((IE.CST_ENTRADA NOT IN ('#39'40'#39')) AND (IE.CST IN ('#39'103'#39')))' +
      #13#10'OR ((IE.CST_ENTRADA NOT IN ('#39'41'#39')) AND (IE.CST IN ('#39'300'#39')))'#13#10'O' +
      'R ((IE.CST_ENTRADA NOT IN ('#39'60'#39', '#39'90'#39')) AND (IE.CST IN ('#39'201'#39', '#39 +
      '202'#39', '#39'203'#39', '#39'500'#39')))  )'#13#10#13#10'UNION'#13#10#13#10'SELECT '#39'Diverg'#234'ncia de CST ' +
      'com CST de Entrada'#39' AS ERRO, '#39'Categoria Geral'#39' AS TIPO_EMP, NE.C' +
      'OD_NOTAFORN AS COD_NOTA, NE.CHAVE_NOTA AS XML, IE.COD_PROD AS CO' +
      'D_PROD, IE.XPROD AS NOMEPROD, IE.CST AS CST_CSOSN_FORN, IE.CFOP ' +
      'AS CFOP_FORN, IE.CST_ENTRADA, IE.CFOP_OPOSTO AS CFOP_ENTRADA, NE' +
      '.DATA_EMISSAO, NE.DATA_RECEBIM, NE.NAT_OPERACAO AS FINALIDADE, I' +
      'E.ITEM_NOTA, (SELECT COUNT (N.COD_NOTA) FROM ITEMNOTAENT N WHERE' +
      ' N.COD_NOTA=IE.COD_NOTA) AS MAX_ITEM FROM ITEMNOTAENT IE'#13#10'INNER ' +
      'JOIN NOTASENTRADA NE ON NE.COD_NOTA=IE.COD_NOTA'#13#10'WHERE ((IE.CSON' +
      ' IS  NULL) OR (IE.CSON = 0))'#13#10'AND (  ((IE.CST_ENTRADA NOT IN ('#39'0' +
      '0'#39', '#39'90'#39')) AND (IE.CST IN ('#39'00'#39'))) '#13#10'OR ((IE.CST_ENTRADA NOT IN ' +
      '('#39'40'#39', '#39'90'#39')) AND (IE.CST IN ('#39'40'#39')))'#13#10'OR ((IE.CST_ENTRADA NOT I' +
      'N ('#39'51'#39')) AND (IE.CST IN ('#39'51'#39')))'#13#10'OR ((IE.CST_ENTRADA NOT IN ('#39 +
      '20'#39', '#39'90'#39')) AND (IE.CST IN ('#39'20'#39')))'#13#10'OR ((IE.CST_ENTRADA NOT IN ' +
      '('#39'90'#39')) AND (IE.CST IN ('#39'90'#39')))  '#13#10'OR ((IE.CST_ENTRADA NOT IN ('#39 +
      '60'#39', '#39'90'#39')) AND (IE.CST IN ('#39'10'#39', '#39'60'#39', '#39'70'#39')))  )'#13#10#13#10')'#13#10'WHERE D' +
      'ATA_RECEBIM BETWEEN :DATA1 AND :DATA2'#13#10'ORDER BY DATA_EMISSAO, CO' +
      'D_NOTA, ITEM_NOTA'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'DATA1'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA2'
        ParamType = ptInput
      end>
    SQLConnection = Dados
    Left = 152
    Top = 535
    object SItemNotaEntCSTDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
    end
    object SItemNotaEntCSTDATA_RECEBIM: TDateField
      FieldName = 'DATA_RECEBIM'
    end
    object SItemNotaEntCSTCOD_NOTA: TIntegerField
      FieldName = 'COD_NOTA'
    end
    object SItemNotaEntCSTXML: TStringField
      FieldName = 'XML'
      Size = 44
    end
    object SItemNotaEntCSTCOD_PROD: TIntegerField
      FieldName = 'COD_PROD'
    end
    object SItemNotaEntCSTNOMEPROD: TStringField
      FieldName = 'NOMEPROD'
      Size = 120
    end
    object SItemNotaEntCSTCST_CSOSN_FORN: TStringField
      FieldName = 'CST_CSOSN_FORN'
      Size = 3
    end
    object SItemNotaEntCSTCFOP_FORN: TStringField
      FieldName = 'CFOP_FORN'
      Size = 4
    end
    object SItemNotaEntCSTCST_ENTRADA: TStringField
      FieldName = 'CST_ENTRADA'
      Size = 4
    end
    object SItemNotaEntCSTCFOP_ENTRADA: TStringField
      FieldName = 'CFOP_ENTRADA'
      Size = 4
    end
    object SItemNotaEntCSTFINALIDADE: TStringField
      FieldName = 'FINALIDADE'
      Size = 60
    end
    object SItemNotaEntCSTERRO: TStringField
      FieldName = 'ERRO'
      Required = True
      FixedChar = True
      Size = 37
    end
    object SItemNotaEntCSTTIPO_EMP: TStringField
      FieldName = 'TIPO_EMP'
      Required = True
      FixedChar = True
      Size = 16
    end
    object SItemNotaEntCSTITEM_NOTA: TIntegerField
      Alignment = taCenter
      FieldName = 'ITEM_NOTA'
      Required = True
    end
    object SItemNotaEntCSTMAX_ITEM: TIntegerField
      Alignment = taCenter
      FieldName = 'MAX_ITEM'
    end
  end
  object CItemNotaEntCST: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DPItemNotaEntCST'
    Left = 152
    Top = 583
    object CItemNotaEntCSTDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
    end
    object CItemNotaEntCSTDATA_RECEBIM: TDateField
      FieldName = 'DATA_RECEBIM'
    end
    object CItemNotaEntCSTCOD_NOTA: TIntegerField
      FieldName = 'COD_NOTA'
    end
    object CItemNotaEntCSTXML: TStringField
      FieldName = 'XML'
      Size = 44
    end
    object CItemNotaEntCSTCOD_PROD: TIntegerField
      FieldName = 'COD_PROD'
    end
    object CItemNotaEntCSTNOMEPROD: TStringField
      FieldName = 'NOMEPROD'
      Size = 120
    end
    object CItemNotaEntCSTCST_CSOSN_FORN: TStringField
      FieldName = 'CST_CSOSN_FORN'
      Size = 3
    end
    object CItemNotaEntCSTCFOP_FORN: TStringField
      FieldName = 'CFOP_FORN'
      Size = 4
    end
    object CItemNotaEntCSTCST_ENTRADA: TStringField
      FieldName = 'CST_ENTRADA'
      Size = 4
    end
    object CItemNotaEntCSTCFOP_ENTRADA: TStringField
      FieldName = 'CFOP_ENTRADA'
      Size = 4
    end
    object CItemNotaEntCSTFINALIDADE: TStringField
      FieldName = 'FINALIDADE'
      Size = 60
    end
    object CItemNotaEntCSTERRO: TStringField
      FieldName = 'ERRO'
      Required = True
      FixedChar = True
      Size = 37
    end
    object CItemNotaEntCSTTIPO_EMP: TStringField
      FieldName = 'TIPO_EMP'
      Required = True
      FixedChar = True
      Size = 16
    end
    object CItemNotaEntCSTITEM_NOTA: TIntegerField
      Alignment = taCenter
      FieldName = 'ITEM_NOTA'
      Required = True
    end
    object CItemNotaEntCSTMAX_ITEM: TIntegerField
      Alignment = taCenter
      FieldName = 'MAX_ITEM'
    end
  end
  object DPItemNotaEntCST: TDataSetProvider
    DataSet = SItemNotaEntCST
    Left = 152
    Top = 631
  end
  object SItemNotaEntCFOP: TSQLDataSet
    CommandText = 
      'SELECT DATA_EMISSAO, DATA_RECEBIM, COD_NOTA, XML,  COD_PROD, NOM' +
      'EPROD, CST_CSOSN_FORN, CFOP_FORN, CST_ENTRADA, CFOP_ENTRADA, FIN' +
      'ALIDADE, ERRO, TIPO_EMP, ITEM_NOTA, MAX_ITEM FROM'#13#10'( '#13#10'SELECT '#39'D' +
      'iverg'#234'ncia de CFOP com CFOP de Entrada'#39' AS ERRO, '#39'Simples Nacion' +
      'al'#39' AS TIPO_EMP, NE.COD_NOTAFORN AS COD_NOTA, NE.CHAVE_NOTA AS X' +
      'ML, IE.COD_PROD AS COD_PROD, IE.XPROD AS NOMEPROD, IE.CSON AS CS' +
      'T_CSOSN_FORN, IE.CFOP AS CFOP_FORN, IE.CST_ENTRADA, IE.CFOP_OPOS' +
      'TO AS CFOP_ENTRADA, NE.DATA_EMISSAO, NE.DATA_RECEBIM, NE.NAT_OPE' +
      'RACAO AS FINALIDADE, IE.ITEM_NOTA, (SELECT COUNT (N.COD_NOTA) FR' +
      'OM ITEMNOTAENT N WHERE N.COD_NOTA=IE.COD_NOTA) AS MAX_ITEM FROM ' +
      'ITEMNOTAENT IE'#13#10'INNER JOIN NOTASENTRADA NE ON NE.COD_NOTA=IE.COD' +
      '_NOTA'#13#10'WHERE ((IE.CSON IS NOT NULL) AND (IE.CSON > 0))'#13#10'AND  (  ' +
      ' (((IE.CFOP LIKE '#39'54%'#39') OR (IE.CFOP LIKE '#39'64%'#39')) AND (IE.CFOP_OP' +
      'OSTO NOT IN (1403, 2403, 1407, 2407, 1406, 2406, 1551, 2551, 255' +
      '2, 1552 ))) '#13#10'OR ((((IE.CFOP LIKE '#39'51%'#39') OR (IE.CFOP LIKE '#39'61%'#39')' +
      ') AND (IE.CFOP NOT IN (5103, 6103, 5104, 6104, 5105, 6105, 5106,' +
      ' 6106,5114))) AND (IE.CFOP_OPOSTO NOT IN (1102, 2102, 1556, 2556' +
      ', 1552, 2552, 1551, 2551 ))) '#13#10'OR ((IE.CFOP IN (5655, 6655)) AND' +
      ' (IE.CFOP_OPOSTO NOT IN (1652, 2652))) '#13#10'OR ((IE.CFOP IN (5910, ' +
      '6910)) AND (IE.CFOP_OPOSTO NOT IN (1910, 2910)))'#13#10'OR ((IE.CFOP I' +
      'N (5911, 6911)) AND (IE.CFOP_OPOSTO NOT IN (1911, 2911)))'#13#10'OR ((' +
      'IE.CFOP IN (5114, 6114)) AND (IE.CFOP_OPOSTO NOT IN (1113, 2113)' +
      '))'#13#10'OR ((IE.CFOP IN (5949, 6949)) AND (IE.CFOP_OPOSTO NOT IN (19' +
      '49, 2949)))  )'#13#10#13#10'UNION'#13#10#13#10'SELECT '#39'Diverg'#234'ncia de CFOP com CFOP ' +
      'de Entrada'#39' AS ERRO, '#39'Categoria Geral'#39' AS TIPO_EMP, NE.COD_NOTAF' +
      'ORN AS COD_NOTA, NE.CHAVE_NOTA AS XML, IE.COD_PROD AS COD_PROD, ' +
      'IE.XPROD AS NOMEPROD, IE.CST AS CST_CSOSN_FORN, IE.CFOP AS CFOP_' +
      'FORN, IE.CST_ENTRADA, IE.CFOP_OPOSTO AS CFOP_ENTRADA, NE.DATA_EM' +
      'ISSAO, NE.DATA_RECEBIM, NE.NAT_OPERACAO AS FINALIDADE, IE.ITEM_N' +
      'OTA, (SELECT COUNT (N.COD_NOTA) FROM ITEMNOTAENT N WHERE N.COD_N' +
      'OTA=IE.COD_NOTA) AS MAX_ITEM FROM ITEMNOTAENT IE'#13#10'INNER JOIN NOT' +
      'ASENTRADA NE ON NE.COD_NOTA=IE.COD_NOTA'#13#10'WHERE ((IE.CSON IS  NUL' +
      'L) OR (IE.CSON = 0))'#13#10'AND  (   (((IE.CFOP LIKE '#39'54%'#39') OR (IE.CFO' +
      'P LIKE '#39'64%'#39')) AND (IE.CFOP_OPOSTO NOT IN (1403, 2403, 1407, 240' +
      '7, 1406, 2406, 1551, 2551, 1552, 2552))) '#13#10'OR ((((IE.CFOP LIKE '#39 +
      '51%'#39') OR (IE.CFOP LIKE '#39'61%'#39')) AND (IE.CFOP NOT IN (5103, 5104, ' +
      '5105, 5106, 5114))) AND (IE.CFOP_OPOSTO NOT IN (1102, 2102, 1556' +
      ', 2556, 1551, 2551, 1552, 2552 ))) '#13#10'OR ((IE.CFOP IN (5655, 6655' +
      ')) AND (IE.CFOP_OPOSTO NOT IN (1652, 2652)))  '#13#10'OR ((IE.CFOP IN ' +
      '(5910, 6910)) AND (IE.CFOP_OPOSTO NOT IN (1910, 2910)))'#13#10'OR ((IE' +
      '.CFOP IN (5911, 6911)) AND (IE.CFOP_OPOSTO NOT IN (1911, 2911)))' +
      #13#10'OR ((IE.CFOP IN (5114, 6114)) AND (IE.CFOP_OPOSTO NOT IN (1113' +
      ', 2113)))'#13#10'OR ((IE.CFOP IN (5949, 6949)) AND (IE.CFOP_OPOSTO NOT' +
      ' IN (1949, 2949)))  )'#13#10#13#10'UNION'#13#10#13#10'SELECT '#39'CFOP de Entrada N'#195'O in' +
      'formado'#39' AS ERRO, '#39'Simples Nacional'#39' AS TIPO_EMP, NE.COD_NOTAFOR' +
      'N AS COD_NOTA, NE.CHAVE_NOTA AS XML, IE.COD_PROD AS COD_PROD, IE' +
      '.XPROD AS NOMEPROD, IE.CSON AS CST_CSOSN_FORN, IE.CFOP AS CFOP_F' +
      'ORN, IE.CST_ENTRADA, IE.CFOP_OPOSTO AS CFOP_ENTRADA, NE.DATA_EMI' +
      'SSAO, NE.DATA_RECEBIM, NE.NAT_OPERACAO AS FINALIDADE, IE.ITEM_NO' +
      'TA, (SELECT COUNT (N.COD_NOTA) FROM ITEMNOTAENT N WHERE N.COD_NO' +
      'TA=IE.COD_NOTA) AS MAX_ITEM FROM ITEMNOTAENT IE'#13#10'INNER JOIN NOTA' +
      'SENTRADA NE ON NE.COD_NOTA=IE.COD_NOTA'#13#10'WHERE ((IE.CSON IS NOT N' +
      'ULL) AND (IE.CSON > 0))'#13#10'AND  ( IE.CFOP_OPOSTO IS NULL  )'#13#10#13#10'UNI' +
      'ON'#13#10#13#10'SELECT '#39'CFOP de Entrada N'#195'O informado'#39' AS ERRO, '#39'Categoria' +
      ' Geral'#39' AS TIPO_EMP, NE.COD_NOTAFORN AS COD_NOTA, NE.CHAVE_NOTA ' +
      'AS XML, IE.COD_PROD AS COD_PROD, IE.XPROD AS NOMEPROD, IE.CST AS' +
      ' CST_CSOSN_FORN, IE.CFOP AS CFOP_FORN, IE.CST_ENTRADA, IE.CFOP_O' +
      'POSTO AS CFOP_ENTRADA, NE.DATA_EMISSAO, NE.DATA_RECEBIM, NE.NAT_' +
      'OPERACAO AS FINALIDADE, IE.ITEM_NOTA, (SELECT COUNT (N.COD_NOTA)' +
      ' FROM ITEMNOTAENT N WHERE N.COD_NOTA=IE.COD_NOTA) AS MAX_ITEM FR' +
      'OM ITEMNOTAENT IE'#13#10'INNER JOIN NOTASENTRADA NE ON NE.COD_NOTA=IE.' +
      'COD_NOTA'#13#10'WHERE ((IE.CSON IS  NULL) OR (IE.CSON = 0))'#13#10'AND  ( IE' +
      '.CFOP_OPOSTO IS NULL  )'#13#10#13#10')'#13#10'WHERE DATA_RECEBIM BETWEEN :DATA1 ' +
      'AND :DATA2'#13#10'ORDER BY DATA_EMISSAO, COD_NOTA, ITEM_NOTA'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'DATA1'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA2'
        ParamType = ptInput
      end>
    SQLConnection = Dados
    Left = 272
    Top = 535
    object SItemNotaEntCFOPDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
    end
    object SItemNotaEntCFOPDATA_RECEBIM: TDateField
      FieldName = 'DATA_RECEBIM'
    end
    object SItemNotaEntCFOPCOD_NOTA: TIntegerField
      FieldName = 'COD_NOTA'
    end
    object SItemNotaEntCFOPXML: TStringField
      FieldName = 'XML'
      Size = 44
    end
    object SItemNotaEntCFOPCOD_PROD: TIntegerField
      FieldName = 'COD_PROD'
    end
    object SItemNotaEntCFOPNOMEPROD: TStringField
      FieldName = 'NOMEPROD'
      Size = 120
    end
    object SItemNotaEntCFOPCST_CSOSN_FORN: TStringField
      FieldName = 'CST_CSOSN_FORN'
      Size = 3
    end
    object SItemNotaEntCFOPCFOP_FORN: TStringField
      FieldName = 'CFOP_FORN'
      Size = 4
    end
    object SItemNotaEntCFOPCST_ENTRADA: TStringField
      FieldName = 'CST_ENTRADA'
      Size = 4
    end
    object SItemNotaEntCFOPCFOP_ENTRADA: TStringField
      FieldName = 'CFOP_ENTRADA'
      Size = 4
    end
    object SItemNotaEntCFOPFINALIDADE: TStringField
      FieldName = 'FINALIDADE'
      Size = 60
    end
    object SItemNotaEntCFOPERRO: TStringField
      FieldName = 'ERRO'
      Required = True
      FixedChar = True
      Size = 39
    end
    object SItemNotaEntCFOPTIPO_EMP: TStringField
      FieldName = 'TIPO_EMP'
      Required = True
      FixedChar = True
      Size = 16
    end
    object SItemNotaEntCFOPITEM_NOTA: TIntegerField
      Alignment = taCenter
      FieldName = 'ITEM_NOTA'
      Required = True
    end
    object SItemNotaEntCFOPMAX_ITEM: TIntegerField
      Alignment = taCenter
      FieldName = 'MAX_ITEM'
    end
  end
  object CItemNotaEntCFOP: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DPItemNotaEntCFOP'
    Left = 272
    Top = 583
    object CItemNotaEntCFOPDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
    end
    object CItemNotaEntCFOPDATA_RECEBIM: TDateField
      FieldName = 'DATA_RECEBIM'
    end
    object CItemNotaEntCFOPCOD_NOTA: TIntegerField
      FieldName = 'COD_NOTA'
    end
    object CItemNotaEntCFOPXML: TStringField
      FieldName = 'XML'
      Size = 44
    end
    object CItemNotaEntCFOPCOD_PROD: TIntegerField
      FieldName = 'COD_PROD'
    end
    object CItemNotaEntCFOPNOMEPROD: TStringField
      FieldName = 'NOMEPROD'
      Size = 120
    end
    object CItemNotaEntCFOPCST_CSOSN_FORN: TStringField
      FieldName = 'CST_CSOSN_FORN'
      Size = 3
    end
    object CItemNotaEntCFOPCFOP_FORN: TStringField
      FieldName = 'CFOP_FORN'
      Size = 4
    end
    object CItemNotaEntCFOPCST_ENTRADA: TStringField
      FieldName = 'CST_ENTRADA'
      Size = 4
    end
    object CItemNotaEntCFOPCFOP_ENTRADA: TStringField
      FieldName = 'CFOP_ENTRADA'
      Size = 4
    end
    object CItemNotaEntCFOPFINALIDADE: TStringField
      FieldName = 'FINALIDADE'
      Size = 60
    end
    object CItemNotaEntCFOPERRO: TStringField
      FieldName = 'ERRO'
      Required = True
      FixedChar = True
      Size = 39
    end
    object CItemNotaEntCFOPTIPO_EMP: TStringField
      FieldName = 'TIPO_EMP'
      Required = True
      FixedChar = True
      Size = 16
    end
    object CItemNotaEntCFOPITEM_NOTA: TIntegerField
      Alignment = taCenter
      FieldName = 'ITEM_NOTA'
      Required = True
    end
    object CItemNotaEntCFOPMAX_ITEM: TIntegerField
      Alignment = taCenter
      FieldName = 'MAX_ITEM'
    end
  end
  object DPItemNotaEntCFOP: TDataSetProvider
    DataSet = SItemNotaEntCFOP
    Left = 272
    Top = 631
  end
  object SItemNotaEntPC: TSQLDataSet
    CommandText = 
      'SELECT DATA_EMISSAO, DATA_RECEBIM, COD_NOTA, XML,  COD_PROD, NOM' +
      'EPROD, PIS_CST_ENTRADA, COFINS_CST_ENTRADA,  CST_ENTRADA, CFOP_E' +
      'NTRADA, ERRO, TIPO_EMP, ITEM_NOTA, MAX_ITEM FROM'#13#10'('#13#10'SELECT '#39'CST' +
      ' Pis sem direito de Cr'#233'dito para este CFOP'#39' AS ERRO, '#39'Simples Na' +
      'cional'#39' AS TIPO_EMP, NE.COD_NOTAFORN AS COD_NOTA, NE.CHAVE_NOTA ' +
      'AS XML, IE.COD_PROD AS COD_PROD, IE.XPROD AS NOMEPROD, IE.PIS_CS' +
      'T_ENTRADA, IE.COFINS_CST_ENTRADA, IE.CST_ENTRADA, IE.CFOP_OPOSTO' +
      ' AS CFOP_ENTRADA, NE.DATA_EMISSAO, NE.DATA_RECEBIM, IE.ITEM_NOTA' +
      ', (SELECT COUNT (N.COD_NOTA) FROM ITEMNOTAENT N WHERE N.COD_NOTA' +
      '=IE.COD_NOTA) AS MAX_ITEM FROM ITEMNOTAENT IE'#13#10'INNER JOIN NOTASE' +
      'NTRADA NE ON NE.COD_NOTA=IE.COD_NOTA'#13#10'WHERE ((IE.CSON IS NOT NUL' +
      'L) AND (IE.CSON > 0))'#13#10'AND  ((IE.CFOP_OPOSTO IN (1910,2910)) AND' +
      ' (IE.PIS_CST_ENTRADA IN ('#39'50'#39', '#39'51'#39', '#39'52'#39', '#39'53'#39', '#39'54'#39', '#39'55'#39', '#39'56' +
      #39', '#39'60'#39', '#39'61'#39', '#39'62'#39', '#39'63'#39', '#39'64'#39', '#39'65'#39', '#39'66'#39')))'#13#10#13#10'UNION'#13#10#13#10'SELEC' +
      'T '#39'CST Cofins sem direito de Cr'#233'dito para este CFOP'#39' AS ERRO, '#39'S' +
      'imples Nacional'#39' AS TIPO_EMP, NE.COD_NOTAFORN AS COD_NOTA, NE.CH' +
      'AVE_NOTA AS XML, IE.COD_PROD AS COD_PROD, IE.XPROD AS NOMEPROD, ' +
      'IE.PIS_CST_ENTRADA, IE.COFINS_CST_ENTRADA, IE.CST_ENTRADA, IE.CF' +
      'OP_OPOSTO AS CFOP_ENTRADA, NE.DATA_EMISSAO, NE.DATA_RECEBIM, IE.' +
      'ITEM_NOTA, (SELECT COUNT (N.COD_NOTA) FROM ITEMNOTAENT N WHERE N' +
      '.COD_NOTA=IE.COD_NOTA) AS MAX_ITEM FROM ITEMNOTAENT IE'#13#10'INNER JO' +
      'IN NOTASENTRADA NE ON NE.COD_NOTA=IE.COD_NOTA'#13#10'WHERE ((IE.CSON I' +
      'S NOT NULL) AND (IE.CSON > 0))'#13#10'AND ((IE.CFOP_OPOSTO IN (1910,29' +
      '10)) AND (IE.COFINS_CST_ENTRADA IN ('#39'50'#39', '#39'51'#39', '#39'52'#39', '#39'53'#39', '#39'54'#39 +
      ', '#39'55'#39', '#39'56'#39', '#39'60'#39', '#39'61'#39', '#39'62'#39', '#39'63'#39', '#39'64'#39', '#39'65'#39', '#39'66'#39')))'#13#10#13#10'UNI' +
      'ON'#13#10#13#10'SELECT '#39'CST Pis sem direito de Cr'#233'dito para este CFOP'#39' AS ' +
      'ERRO, '#39'Categoria Geral'#39' AS TIPO_EMP, NE.COD_NOTAFORN AS COD_NOTA' +
      ', NE.CHAVE_NOTA AS XML, IE.COD_PROD AS COD_PROD, IE.XPROD AS NOM' +
      'EPROD, IE.PIS_CST_ENTRADA, IE.COFINS_CST_ENTRADA, IE.CST_ENTRADA' +
      ', IE.CFOP_OPOSTO AS CFOP_ENTRADA, NE.DATA_EMISSAO, NE.DATA_RECEB' +
      'IM, IE.ITEM_NOTA, (SELECT COUNT (N.COD_NOTA) FROM ITEMNOTAENT N ' +
      'WHERE N.COD_NOTA=IE.COD_NOTA) AS MAX_ITEM FROM ITEMNOTAENT IE'#13#10'I' +
      'NNER JOIN NOTASENTRADA NE ON NE.COD_NOTA=IE.COD_NOTA'#13#10'WHERE ((IE' +
      '.CSON IS NULL) OR (IE.CSON = 0))'#13#10'AND  ((IE.CFOP_OPOSTO IN (1910' +
      ',2910)) AND (IE.PIS_CST_ENTRADA IN ('#39'50'#39', '#39'51'#39', '#39'52'#39', '#39'53'#39', '#39'54'#39 +
      ', '#39'55'#39', '#39'56'#39', '#39'60'#39', '#39'61'#39', '#39'62'#39', '#39'63'#39', '#39'64'#39', '#39'65'#39', '#39'66'#39')))'#13#10#13#10'UNI' +
      'ON'#13#10#13#10'SELECT '#39'CST Cofins sem direito de Cr'#233'dito para este CFOP'#39' ' +
      'AS ERRO, '#39'Categoria Geral'#39' AS TIPO_EMP, NE.COD_NOTAFORN AS COD_N' +
      'OTA, NE.CHAVE_NOTA AS XML, IE.COD_PROD AS COD_PROD, IE.XPROD AS ' +
      'NOMEPROD, IE.PIS_CST_ENTRADA, IE.COFINS_CST_ENTRADA, IE.CST_ENTR' +
      'ADA, IE.CFOP_OPOSTO AS CFOP_ENTRADA, NE.DATA_EMISSAO, NE.DATA_RE' +
      'CEBIM, IE.ITEM_NOTA, (SELECT COUNT (N.COD_NOTA) FROM ITEMNOTAENT' +
      ' N WHERE N.COD_NOTA=IE.COD_NOTA) AS MAX_ITEM FROM ITEMNOTAENT IE' +
      #13#10'INNER JOIN NOTASENTRADA NE ON NE.COD_NOTA=IE.COD_NOTA'#13#10'WHERE (' +
      '(IE.CSON IS NULL) OR (IE.CSON = 0))'#13#10'AND ((IE.CFOP_OPOSTO IN (19' +
      '10,2910)) AND (IE.COFINS_CST_ENTRADA IN ('#39'50'#39', '#39'51'#39', '#39'52'#39', '#39'53'#39',' +
      ' '#39'54'#39', '#39'55'#39', '#39'56'#39', '#39'60'#39', '#39'61'#39', '#39'62'#39', '#39'63'#39', '#39'64'#39', '#39'65'#39', '#39'66'#39')))'#13#10 +
      #13#10'UNION'#13#10#13#10'SELECT '#39'Diverg'#234'ncia de CST Pis com CST Cofins'#39' AS ERR' +
      'O, '#39'Simples Nacional'#39' AS TIPO_EMP, NE.COD_NOTAFORN AS COD_NOTA, ' +
      'NE.CHAVE_NOTA AS XML, IE.COD_PROD AS COD_PROD, IE.XPROD AS NOMEP' +
      'ROD, IE.PIS_CST_ENTRADA, IE.COFINS_CST_ENTRADA, IE.CST_ENTRADA, ' +
      'IE.CFOP_OPOSTO AS CFOP_ENTRADA, NE.DATA_EMISSAO, NE.DATA_RECEBIM' +
      ', IE.ITEM_NOTA, (SELECT COUNT (N.COD_NOTA) FROM ITEMNOTAENT N WH' +
      'ERE N.COD_NOTA=IE.COD_NOTA) AS MAX_ITEM FROM ITEMNOTAENT IE'#13#10'INN' +
      'ER JOIN NOTASENTRADA NE ON NE.COD_NOTA=IE.COD_NOTA'#13#10'WHERE ((IE.C' +
      'SON IS NOT NULL) AND (IE.CSON > 0))'#13#10'AND ((IE.COFINS_CST_ENTRADA' +
      ')<>(IE.PIS_CST_ENTRADA))'#13#10#13#10'UNION'#13#10#13#10'SELECT '#39'Diverg'#234'ncia de CST ' +
      'Pis com CST Cofins'#39' AS ERRO, '#39'Categoria Geral'#39' AS TIPO_EMP, NE.C' +
      'OD_NOTAFORN AS COD_NOTA, NE.CHAVE_NOTA AS XML, IE.COD_PROD AS CO' +
      'D_PROD, IE.XPROD AS NOMEPROD, IE.PIS_CST_ENTRADA, IE.COFINS_CST_' +
      'ENTRADA, IE.CST_ENTRADA, IE.CFOP_OPOSTO AS CFOP_ENTRADA, NE.DATA' +
      '_EMISSAO, NE.DATA_RECEBIM, IE.ITEM_NOTA, (SELECT COUNT (N.COD_NO' +
      'TA) FROM ITEMNOTAENT N WHERE N.COD_NOTA=IE.COD_NOTA) AS MAX_ITEM' +
      ' FROM ITEMNOTAENT IE'#13#10'INNER JOIN NOTASENTRADA NE ON NE.COD_NOTA=' +
      'IE.COD_NOTA'#13#10'WHERE ((IE.CSON IS NULL) OR (IE.CSON = 0))'#13#10'AND ((I' +
      'E.COFINS_CST_ENTRADA)<>(IE.PIS_CST_ENTRADA))'#13#10#13#10')'#13#10'WHERE DATA_RE' +
      'CEBIM BETWEEN :DATA1 AND :DATA2'#13#10'ORDER BY  DATA_EMISSAO, COD_NOT' +
      'A, ITEM_NOTA'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'DATA1'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA2'
        ParamType = ptInput
      end>
    SQLConnection = Dados
    Left = 40
    Top = 1259
    object SItemNotaEntPCDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
    end
    object SItemNotaEntPCDATA_RECEBIM: TDateField
      FieldName = 'DATA_RECEBIM'
    end
    object SItemNotaEntPCCOD_NOTA: TIntegerField
      FieldName = 'COD_NOTA'
    end
    object SItemNotaEntPCXML: TStringField
      FieldName = 'XML'
      Size = 44
    end
    object SItemNotaEntPCCOD_PROD: TIntegerField
      FieldName = 'COD_PROD'
    end
    object SItemNotaEntPCNOMEPROD: TStringField
      FieldName = 'NOMEPROD'
      Size = 120
    end
    object SItemNotaEntPCPIS_CST_ENTRADA: TStringField
      FieldName = 'PIS_CST_ENTRADA'
      Size = 2
    end
    object SItemNotaEntPCCOFINS_CST_ENTRADA: TStringField
      FieldName = 'COFINS_CST_ENTRADA'
      Size = 2
    end
    object SItemNotaEntPCCST_ENTRADA: TStringField
      Alignment = taCenter
      FieldName = 'CST_ENTRADA'
      Size = 4
    end
    object SItemNotaEntPCCFOP_ENTRADA: TStringField
      FieldName = 'CFOP_ENTRADA'
      Size = 4
    end
    object SItemNotaEntPCERRO: TStringField
      FieldName = 'ERRO'
      Required = True
      FixedChar = True
      Size = 48
    end
    object SItemNotaEntPCTIPO_EMP: TStringField
      FieldName = 'TIPO_EMP'
      Required = True
      FixedChar = True
      Size = 16
    end
    object SItemNotaEntPCITEM_NOTA: TIntegerField
      Alignment = taCenter
      FieldName = 'ITEM_NOTA'
      Required = True
    end
    object SItemNotaEntPCMAX_ITEM: TIntegerField
      Alignment = taCenter
      FieldName = 'MAX_ITEM'
    end
  end
  object CItemNotaEntPC: TClientDataSet
    Aggregates = <>
    Filtered = True
    Params = <>
    ProviderName = 'DPItemNotaEntPC'
    Left = 40
    Top = 1307
    object CItemNotaEntPCDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
    end
    object CItemNotaEntPCDATA_RECEBIM: TDateField
      FieldName = 'DATA_RECEBIM'
    end
    object CItemNotaEntPCCOD_NOTA: TIntegerField
      FieldName = 'COD_NOTA'
    end
    object CItemNotaEntPCXML: TStringField
      FieldName = 'XML'
      Size = 44
    end
    object CItemNotaEntPCCOD_PROD: TIntegerField
      FieldName = 'COD_PROD'
    end
    object CItemNotaEntPCNOMEPROD: TStringField
      FieldName = 'NOMEPROD'
      Size = 120
    end
    object CItemNotaEntPCPIS_CST_ENTRADA: TStringField
      FieldName = 'PIS_CST_ENTRADA'
      Size = 2
    end
    object CItemNotaEntPCCOFINS_CST_ENTRADA: TStringField
      FieldName = 'COFINS_CST_ENTRADA'
      Size = 2
    end
    object CItemNotaEntPCCST_ENTRADA: TStringField
      Alignment = taCenter
      FieldName = 'CST_ENTRADA'
      Size = 4
    end
    object CItemNotaEntPCCFOP_ENTRADA: TStringField
      FieldName = 'CFOP_ENTRADA'
      Size = 4
    end
    object CItemNotaEntPCERRO: TStringField
      FieldName = 'ERRO'
      Required = True
      FixedChar = True
      Size = 48
    end
    object CItemNotaEntPCTIPO_EMP: TStringField
      FieldName = 'TIPO_EMP'
      Required = True
      FixedChar = True
      Size = 16
    end
    object CItemNotaEntPCITEM_NOTA: TIntegerField
      Alignment = taCenter
      FieldName = 'ITEM_NOTA'
      Required = True
    end
    object CItemNotaEntPCMAX_ITEM: TIntegerField
      Alignment = taCenter
      FieldName = 'MAX_ITEM'
    end
  end
  object DPItemNotaEntPC: TDataSetProvider
    DataSet = SItemNotaEntPC
    Left = 40
    Top = 1355
  end
  object SItemNotaEmitTipoCalcPC: TSQLDataSet
    CommandText = 
      'SELECT DATA_EMISSAO, COD_NOTA, COD_PROD, NOMEPROD, CST_PIS, CST_' +
      'COFINS, PPIS, PCOFINS, TIPO_CALCULO_PIS, TIPO_CALCULO_COFINS, FI' +
      'NALIDADE, ERRO, ORIGEM FROM'#13#10'('#13#10'SELECT NE.DATA_EMISSAO, NE.COD_N' +
      'OTA, IE.COD_PROD, IE.NOME_PROD AS NOMEPROD, IE.CST_PIS, IE.CST_C' +
      'OFINS, IE.ALIQUOTA_PIS AS PPIS, IE.ALIQUOTA_COFINS AS PCOFINS, I' +
      'E.TIPO_CALCULO_PIS, IE.TIPO_CALCULO_COFINS, NP.DESCRICAO AS FINA' +
      'LIDADE, '#39'NF-e '#209' Consum Final'#39' AS ORIGEM, '#39'Diverg'#234'ncia no Tipo de' +
      ' C'#225'lculo PIS'#39' AS ERRO FROM ITEMNOTAEMITIDA IE'#13#10'INNER JOIN NOTASE' +
      'MITIDAS NE ON NE.COD_NOTA=IE.COD_NOTA'#13#10'INNER JOIN NATUREZA_OPERA' +
      'CAO NP ON NP.CODIGO=NE.COD_NATUREZA_OPERACAO'#13#10'WHERE (NE.INDFINAL' +
      '=0)'#13#10'AND (NE.STATUS='#39'Autorizada'#39')'#13#10'AND  ((IE.CST_PIS IN ('#39'01'#39')) ' +
      'AND (IE.TIPO_CALCULO_PIS='#39'Em Valor'#39'))'#13#10#13#10'UNION'#13#10#13#10'SELECT NE.DATA' +
      '_EMISSAO, NE.COD_NOTA, IE.COD_PROD, IE.NOME_PROD AS NOMEPROD, IE' +
      '.CST_PIS, IE.CST_COFINS, IE.ALIQUOTA_PIS AS PPIS, IE.ALIQUOTA_CO' +
      'FINS AS PCOFINS, IE.TIPO_CALCULO_PIS, IE.TIPO_CALCULO_COFINS, NP' +
      '.DESCRICAO AS FINALIDADE, '#39'NF-e '#209' Consum Final'#39' AS ORIGEM, '#39'Dive' +
      'rg'#234'ncia no Tipo de C'#225'lculo COFINS'#39' AS ERRO FROM ITEMNOTAEMITIDA ' +
      'IE'#13#10'INNER JOIN NOTASEMITIDAS NE ON NE.COD_NOTA=IE.COD_NOTA'#13#10'INNE' +
      'R JOIN NATUREZA_OPERACAO NP ON NP.CODIGO=NE.COD_NATUREZA_OPERACA' +
      'O'#13#10'WHERE (NE.INDFINAL=0)'#13#10'AND (NE.STATUS='#39'Autorizada'#39')'#13#10'AND ((IE' +
      '.CST_COFINS IN ('#39'01'#39')) AND (IE.TIPO_CALCULO_COFINS='#39'Em Valor'#39'))'#13 +
      #10#13#10'UNION'#13#10#13#10'SELECT NE.DATA_EMISSAO, NE.COD_NOTA, IE.COD_PROD, IE' +
      '.NOME_PROD AS NOMEPROD, IE.CST_PIS, IE.CST_COFINS, IE.ALIQUOTA_P' +
      'IS AS PPIS, IE.ALIQUOTA_COFINS AS PCOFINS, IE.TIPO_CALCULO_PIS, ' +
      'IE.TIPO_CALCULO_COFINS, NP.DESCRICAO AS FINALIDADE, '#39'NF-e Consum' +
      ' Final'#39' AS ORIGEM, '#39'Diverg'#234'ncia no Tipo de C'#225'lculo PIS'#39' AS ERRO ' +
      'FROM ITEMNOTAEMITIDA IE'#13#10'INNER JOIN NOTASEMITIDAS NE ON NE.COD_N' +
      'OTA=IE.COD_NOTA'#13#10'INNER JOIN NATUREZA_OPERACAO NP ON NP.CODIGO=NE' +
      '.COD_NATUREZA_OPERACAO'#13#10'WHERE (NE.INDFINAL=1)'#13#10'AND (NE.STATUS='#39'A' +
      'utorizada'#39')'#13#10'AND  ((IE.CST_PIS IN ('#39'01'#39')) AND (IE.TIPO_CALCULO_P' +
      'IS='#39'Em Valor'#39'))'#13#10#13#10'UNION'#13#10#13#10'SELECT NE.DATA_EMISSAO, NE.COD_NOTA,' +
      ' IE.COD_PROD, IE.NOME_PROD AS NOMEPROD, IE.CST_PIS, IE.CST_COFIN' +
      'S, IE.ALIQUOTA_PIS AS PPIS, IE.ALIQUOTA_COFINS AS PCOFINS, IE.TI' +
      'PO_CALCULO_PIS, IE.TIPO_CALCULO_COFINS, NP.DESCRICAO AS FINALIDA' +
      'DE, '#39'NF-e Consum Final'#39' AS ORIGEM, '#39'Diverg'#234'ncia no Tipo de C'#225'lcu' +
      'lo COFINS'#39' AS ERRO FROM ITEMNOTAEMITIDA IE'#13#10'INNER JOIN NOTASEMIT' +
      'IDAS NE ON NE.COD_NOTA=IE.COD_NOTA'#13#10'INNER JOIN NATUREZA_OPERACAO' +
      ' NP ON NP.CODIGO=NE.COD_NATUREZA_OPERACAO'#13#10'WHERE (NE.INDFINAL=1)' +
      #13#10'AND (NE.STATUS='#39'Autorizada'#39')'#13#10'AND ((IE.CST_COFINS IN ('#39'01'#39')) A' +
      'ND (IE.TIPO_CALCULO_COFINS='#39'Em Valor'#39'))'#13#10')'#13#10'WHERE DATA_EMISSAO B' +
      'ETWEEN :DATA1 AND :DATA2'#13#10'ORDER BY  DATA_EMISSAO, COD_NOTA, COD_' +
      'PROD'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'DATA1'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA2'
        ParamType = ptInput
      end>
    SQLConnection = Dados
    Left = 392
    Top = 1075
    object SItemNotaEmitTipoCalcPCDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
    end
    object SItemNotaEmitTipoCalcPCCOD_NOTA: TIntegerField
      FieldName = 'COD_NOTA'
      Required = True
    end
    object SItemNotaEmitTipoCalcPCCOD_PROD: TIntegerField
      FieldName = 'COD_PROD'
    end
    object SItemNotaEmitTipoCalcPCNOMEPROD: TStringField
      FieldName = 'NOMEPROD'
      Size = 50
    end
    object SItemNotaEmitTipoCalcPCCST_PIS: TStringField
      FieldName = 'CST_PIS'
      Size = 2
    end
    object SItemNotaEmitTipoCalcPCPPIS: TFMTBCDField
      FieldName = 'PPIS'
      Precision = 18
      Size = 2
    end
    object SItemNotaEmitTipoCalcPCTIPO_CALCULO_PIS: TStringField
      Alignment = taCenter
      FieldName = 'TIPO_CALCULO_PIS'
      Size = 30
    end
    object SItemNotaEmitTipoCalcPCCST_COFINS: TStringField
      FieldName = 'CST_COFINS'
      Size = 2
    end
    object SItemNotaEmitTipoCalcPCPCOFINS: TFMTBCDField
      FieldName = 'PCOFINS'
      Precision = 18
      Size = 2
    end
    object SItemNotaEmitTipoCalcPCTIPO_CALCULO_COFINS: TStringField
      Alignment = taCenter
      FieldName = 'TIPO_CALCULO_COFINS'
      Size = 30
    end
    object SItemNotaEmitTipoCalcPCFINALIDADE: TStringField
      FieldName = 'FINALIDADE'
      Size = 50
    end
    object SItemNotaEmitTipoCalcPCERRO: TStringField
      FieldName = 'ERRO'
      Required = True
      FixedChar = True
      Size = 37
    end
    object SItemNotaEmitTipoCalcPCORIGEM: TStringField
      FieldName = 'ORIGEM'
      Required = True
      FixedChar = True
      Size = 19
    end
  end
  object CItemNotaEmitTipoCalcPC: TClientDataSet
    Aggregates = <>
    Filtered = True
    Params = <>
    ProviderName = 'DPItemNotaEmitTipoCalcPC'
    Left = 392
    Top = 1123
    object CItemNotaEmitTipoCalcPCDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
    end
    object CItemNotaEmitTipoCalcPCCOD_NOTA: TIntegerField
      FieldName = 'COD_NOTA'
      Required = True
    end
    object CItemNotaEmitTipoCalcPCCOD_PROD: TIntegerField
      FieldName = 'COD_PROD'
    end
    object CItemNotaEmitTipoCalcPCNOMEPROD: TStringField
      FieldName = 'NOMEPROD'
      Size = 50
    end
    object CItemNotaEmitTipoCalcPCCST_PIS: TStringField
      FieldName = 'CST_PIS'
      Size = 2
    end
    object CItemNotaEmitTipoCalcPCPPIS: TFMTBCDField
      FieldName = 'PPIS'
      Precision = 18
      Size = 2
    end
    object CItemNotaEmitTipoCalcPCTIPO_CALCULO_PIS: TStringField
      Alignment = taCenter
      FieldName = 'TIPO_CALCULO_PIS'
      Size = 30
    end
    object CItemNotaEmitTipoCalcPCCST_COFINS: TStringField
      FieldName = 'CST_COFINS'
      Size = 2
    end
    object CItemNotaEmitTipoCalcPCPCOFINS: TFMTBCDField
      FieldName = 'PCOFINS'
      Precision = 18
      Size = 2
    end
    object CItemNotaEmitTipoCalcPCTIPO_CALCULO_COFINS: TStringField
      Alignment = taCenter
      FieldName = 'TIPO_CALCULO_COFINS'
      Size = 30
    end
    object CItemNotaEmitTipoCalcPCFINALIDADE: TStringField
      FieldName = 'FINALIDADE'
      Size = 50
    end
    object CItemNotaEmitTipoCalcPCERRO: TStringField
      FieldName = 'ERRO'
      Required = True
      FixedChar = True
      Size = 37
    end
    object CItemNotaEmitTipoCalcPCORIGEM: TStringField
      FieldName = 'ORIGEM'
      Required = True
      FixedChar = True
      Size = 19
    end
  end
  object DPItemNotaEmitTipoCalcPC: TDataSetProvider
    DataSet = SItemNotaEmitTipoCalcPC
    Left = 392
    Top = 1171
  end
  object SUsuario: TSQLDataSet
    CommandText = 
      'SELECT NOME_USUARIO, SENHA FROM USUARIOS'#13#10'WHERE COD_USUARIO = :C' +
      'OD_USU'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_USU'
        ParamType = ptInput
        Value = 1
      end>
    SQLConnection = Dados
    Left = 632
    Top = 1103
    object SUsuarioNOME_USUARIO: TStringField
      FieldName = 'NOME_USUARIO'
      Size = 50
    end
    object SUsuarioSENHA: TStringField
      FieldName = 'SENHA'
      Size = 6
    end
  end
  object CUsuario: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DPUsuario'
    Left = 632
    Top = 1159
    object CUsuarioNOME_USUARIO: TStringField
      FieldName = 'NOME_USUARIO'
      Size = 50
    end
    object CUsuarioSENHA: TStringField
      FieldName = 'SENHA'
      Size = 6
    end
  end
  object DPUsuario: TDataSetProvider
    DataSet = SUsuario
    Left = 632
    Top = 1215
  end
  object SItemNotaEmitNat: TSQLDataSet
    CommandText = 
      'SELECT DATA_EMISSAO, COD_NOTA, COD_PROD, NOMEPROD, ALIQUOTA, CST' +
      ', CFOP, FINALIDADE, ORIGEM, ERRO, ICMS FROM'#13#10'('#13#10'SELECT NE.COD_NO' +
      'TA AS COD_NOTA, IE.COD_PROD AS COD_PROD, IE.NOME_PROD AS NOMEPRO' +
      'D ,IE.ALIQUOTA_ICMS AS ALIQUOTA, IE.CST AS CST, IE.CFOP AS CFOP,' +
      ' NE.DATA_EMISSAO AS DATA_EMISSAO, NP.DESCRICAO AS FINALIDADE, '#39'N' +
      'F-e '#209' Consum Final'#39' AS ORIGEM, '#39'CFOP diverge da Finalidade'#39' AS E' +
      'RRO, IC.MENSAGEM_ICMS AS ICMS FROM ITEMNOTAEMITIDA IE'#13#10'INNER JOI' +
      'N NOTASEMITIDAS NE ON NE.COD_NOTA=IE.COD_NOTA'#13#10'INNER JOIN NATURE' +
      'ZA_OPERACAO NP ON NP.CODIGO=NE.COD_NATUREZA_OPERACAO'#13#10'INNER JOIN' +
      ' ICMS IC ON IC.COD_ICMS=IE.COD_ICMS'#13#10'WHERE (NE.INDFINAL=0)'#13#10'AND ' +
      '(NE.STATUS='#39'Autorizada'#39')'#13#10'AND (  ((NE.COD_NATUREZA_OPERACAO IN (' +
      '1006)) AND (IE.CFOP NOT IN (5929)))'#13#10'OR  ((NE.COD_NATUREZA_OPERA' +
      'CAO IN (1022)) AND (IE.CFOP NOT IN (5915)))'#13#10'OR  ((NE.COD_NATURE' +
      'ZA_OPERACAO IN (1023)) AND (IE.CFOP NOT IN (6915)))  )'#13#10#13#10'UNION'#13 +
      #10#13#10'SELECT NE.COD_NOTA AS COD_NOTA, IE.COD_PROD AS COD_PROD, IE.N' +
      'OME_PROD AS NOMEPROD ,IE.ALIQUOTA_ICMS AS ALIQUOTA, IE.CST_CONSU' +
      'M_FINAL AS CST, IE.CFOP_CONSUM_FINAL AS CFOP, NE.DATA_EMISSAO AS' +
      ' DATA_EMISSAO, NP.DESCRICAO AS FINALIDADE, '#39'NF-e Consum Final'#39' A' +
      'S ORIGEM, '#39'CFOP diverge da Finalidade'#39' AS ERRO, IC.MENSAGEM_ICMS' +
      ' AS ICMS FROM ITEMNOTAEMITIDA IE'#13#10'INNER JOIN NOTASEMITIDAS NE ON' +
      ' NE.COD_NOTA=IE.COD_NOTA'#13#10'INNER JOIN NATUREZA_OPERACAO NP ON NP.' +
      'CODIGO=NE.COD_NATUREZA_OPERACAO'#13#10'INNER JOIN ICMS IC ON IC.COD_IC' +
      'MS=IE.COD_ICMS'#13#10'WHERE (NE.INDFINAL=1)'#13#10'AND (NE.STATUS='#39'Autorizad' +
      'a'#39') '#13#10'AND ((NE.COD_NATUREZA_OPERACAO IN (1028,1030)) AND (IE.CFO' +
      'P NOT IN (5910)) ) '#13#10')'#13#10'WHERE DATA_EMISSAO BETWEEN :DATA1 AND :D' +
      'ATA2'#13#10'ORDER BY DATA_EMISSAO, COD_NOTA, COD_PROD'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'DATA1'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA2'
        ParamType = ptInput
      end>
    SQLConnection = Dados
    Left = 592
    Top = 359
    object SItemNotaEmitNatDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
    end
    object SItemNotaEmitNatCOD_NOTA: TIntegerField
      FieldName = 'COD_NOTA'
      Required = True
    end
    object SItemNotaEmitNatCOD_PROD: TIntegerField
      FieldName = 'COD_PROD'
    end
    object SItemNotaEmitNatNOMEPROD: TStringField
      FieldName = 'NOMEPROD'
      Size = 50
    end
    object SItemNotaEmitNatALIQUOTA: TFMTBCDField
      FieldName = 'ALIQUOTA'
      Precision = 18
      Size = 2
    end
    object SItemNotaEmitNatCST: TStringField
      FieldName = 'CST'
      Size = 4
    end
    object SItemNotaEmitNatCFOP: TIntegerField
      FieldName = 'CFOP'
    end
    object SItemNotaEmitNatFINALIDADE: TStringField
      FieldName = 'FINALIDADE'
      Size = 50
    end
    object SItemNotaEmitNatORIGEM: TStringField
      FieldName = 'ORIGEM'
      Required = True
      FixedChar = True
      Size = 19
    end
    object SItemNotaEmitNatERRO: TStringField
      FieldName = 'ERRO'
      Required = True
      FixedChar = True
      Size = 26
    end
    object SItemNotaEmitNatICMS: TStringField
      FieldName = 'ICMS'
      Size = 30
    end
  end
  object CItemNotaEmitNat: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DPItemNotaEmitNat'
    Left = 592
    Top = 407
    object CItemNotaEmitNatDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
    end
    object CItemNotaEmitNatCOD_NOTA: TIntegerField
      FieldName = 'COD_NOTA'
      Required = True
    end
    object CItemNotaEmitNatCOD_PROD: TIntegerField
      FieldName = 'COD_PROD'
    end
    object CItemNotaEmitNatNOMEPROD: TStringField
      FieldName = 'NOMEPROD'
      Size = 50
    end
    object CItemNotaEmitNatALIQUOTA: TFMTBCDField
      FieldName = 'ALIQUOTA'
      Precision = 18
      Size = 2
    end
    object CItemNotaEmitNatCST: TStringField
      FieldName = 'CST'
      Size = 4
    end
    object CItemNotaEmitNatCFOP: TIntegerField
      FieldName = 'CFOP'
    end
    object CItemNotaEmitNatFINALIDADE: TStringField
      FieldName = 'FINALIDADE'
      Size = 50
    end
    object CItemNotaEmitNatORIGEM: TStringField
      FieldName = 'ORIGEM'
      Required = True
      FixedChar = True
      Size = 19
    end
    object CItemNotaEmitNatERRO: TStringField
      FieldName = 'ERRO'
      Required = True
      FixedChar = True
      Size = 26
    end
    object CItemNotaEmitNatICMS: TStringField
      FieldName = 'ICMS'
      Size = 30
    end
  end
  object DPItemNotaEmitNat: TDataSetProvider
    DataSet = SItemNotaEmitNat
    Left = 592
    Top = 455
  end
  object SProdutos: TSQLDataSet
    CommandText = 
      'SELECT COD_PROD, NOME_PROD, ICMS, ALIQUOTA, CST_CF, CFOP_CF, CST' +
      '_NCF, CFOP_NCF, COD_BENEF, ERRO FROM'#13#10'('#13#10'SELECT PR.COD_PROD, PR.' +
      'NOME_PROD, IC.MENSAGEM_ICMS AS ICMS, IC.ALIQUOTA_ICMS AS ALIQUOT' +
      'A, PI.CST2_CONSUM_FINAL AS CST_CF, PI.CFOP_CONSUM_FINAL AS CFOP_' +
      'CF, PI.CST2 AS CST_NCF,  PI.CFOP AS CFOP_NCF, MI.CODIGO_GIA AS C' +
      'OD_BENEF, '#39'Diverg'#234'ncia de CST com CFOP'#39' AS ERRO FROM PRODUTOS PR' +
      #13#10'INNER JOIN PRODUTOS_IMPOSTOS PI ON PR.COD_PROD=PI.COD_PROD'#13#10'IN' +
      'NER JOIN ICMS IC ON PR.COD_ICMS=IC.COD_ICMS'#13#10'INNER JOIN MENSAGEN' +
      'S_ICMS MI ON PI.COD_MENSAGEM=MI.CODIGO'#13#10'WHERE ( '#13#10'(  ((PI.CST2 I' +
      'N ('#39'00'#39', '#39'40'#39', '#39'20'#39')) AND (PI.CFOP NOT IN (5102)))'#13#10'OR ((PI.CST2' +
      ' IN ('#39'60'#39')) AND (PI.CFOP NOT IN (5405, 5656))) '#13#10') OR ( '#13#10'   ((P' +
      'I.CST2_CONSUM_FINAL IN ('#39'00'#39', '#39'40'#39', '#39'20'#39')) AND (PI.CFOP_CONSUM_F' +
      'INAL NOT IN (5102)))'#13#10'OR ((PI.CST2_CONSUM_FINAL IN ('#39'60'#39')) AND (' +
      'PI.CFOP_CONSUM_FINAL NOT IN (5405, 5656)))  )'#13#10') '#13#10')'#13#10'ORDER BY C' +
      'OD_PROD'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Dados
    Left = 40
    Top = 15
    object SProdutosCOD_PROD: TIntegerField
      FieldName = 'COD_PROD'
      Required = True
    end
    object SProdutosNOME_PROD: TStringField
      FieldName = 'NOME_PROD'
      Size = 50
    end
    object SProdutosICMS: TStringField
      FieldName = 'ICMS'
      Size = 30
    end
    object SProdutosALIQUOTA: TFMTBCDField
      FieldName = 'ALIQUOTA'
      Precision = 18
      Size = 2
    end
    object SProdutosCST_CF: TStringField
      FieldName = 'CST_CF'
      Size = 3
    end
    object SProdutosCFOP_CF: TIntegerField
      FieldName = 'CFOP_CF'
    end
    object SProdutosCST_NCF: TStringField
      FieldName = 'CST_NCF'
      Size = 3
    end
    object SProdutosCFOP_NCF: TIntegerField
      FieldName = 'CFOP_NCF'
    end
    object SProdutosERRO: TStringField
      FieldName = 'ERRO'
      Required = True
      FixedChar = True
      Size = 25
    end
    object SProdutosCOD_BENEF: TStringField
      FieldName = 'COD_BENEF'
      Size = 10
    end
  end
  object CProdutos: TClientDataSet
    Aggregates = <>
    Filtered = True
    Params = <>
    ProviderName = 'DPProdutos'
    Left = 40
    Top = 63
    object CProdutosCOD_PROD: TIntegerField
      FieldName = 'COD_PROD'
      Required = True
    end
    object CProdutosNOME_PROD: TStringField
      FieldName = 'NOME_PROD'
      Size = 50
    end
    object CProdutosICMS: TStringField
      FieldName = 'ICMS'
      Size = 30
    end
    object CProdutosALIQUOTA: TFMTBCDField
      FieldName = 'ALIQUOTA'
      Precision = 18
      Size = 2
    end
    object CProdutosCST_CF: TStringField
      FieldName = 'CST_CF'
      Size = 3
    end
    object CProdutosCFOP_CF: TIntegerField
      FieldName = 'CFOP_CF'
    end
    object CProdutosCST_NCF: TStringField
      FieldName = 'CST_NCF'
      Size = 3
    end
    object CProdutosCFOP_NCF: TIntegerField
      FieldName = 'CFOP_NCF'
    end
    object CProdutosERRO: TStringField
      FieldName = 'ERRO'
      Required = True
      FixedChar = True
      Size = 25
    end
    object CProdutosCOD_BENEF: TStringField
      FieldName = 'COD_BENEF'
      Size = 10
    end
  end
  object DPProdutos: TDataSetProvider
    DataSet = SProdutos
    Left = 40
    Top = 111
  end
  object SProdutosCBenef: TSQLDataSet
    CommandText = 
      'SELECT COD_PROD, NOME_PROD, ICMS, ALIQUOTA, CST_CF, CFOP_CF, CST' +
      '_NCF, CFOP_NCF, COD_BENEF, ERRO FROM'#13#10'('#13#10'SELECT PR.COD_PROD, PR.' +
      'NOME_PROD, IC.MENSAGEM_ICMS AS ICMS, IC.ALIQUOTA_ICMS AS ALIQUOT' +
      'A, PI.CST2_CONSUM_FINAL AS CST_CF, PI.CFOP_CONSUM_FINAL AS CFOP_' +
      'CF, PI.CST2 AS CST_NCF,  PI.CFOP AS CFOP_NCF, MI.CODIGO_GIA AS C' +
      'OD_BENEF, '#39'Informado Base Legal'#39' AS ERRO FROM PRODUTOS PR'#13#10'INNER' +
      ' JOIN PRODUTOS_IMPOSTOS PI ON PR.COD_PROD=PI.COD_PROD'#13#10'INNER JOI' +
      'N ICMS IC ON PR.COD_ICMS=IC.COD_ICMS'#13#10'INNER JOIN MENSAGENS_ICMS ' +
      'MI ON PI.COD_MENSAGEM=MI.CODIGO'#13#10'WHERE (PI.CST2 IN ('#39'00'#39')) AND (' +
      'PI.COD_MENSAGEM IS NOT NULL)'#13#10#13#10'UNION'#13#10#13#10'SELECT PR.COD_PROD, PR.' +
      'NOME_PROD, IC.MENSAGEM_ICMS AS ICMS, IC.ALIQUOTA_ICMS AS ALIQUOT' +
      'A, PI.CST2_CONSUM_FINAL AS CST_CF, PI.CFOP_CONSUM_FINAL AS CFOP_' +
      'CF, PI.CST2 AS CST_NCF,  PI.CFOP AS CFOP_NCF, MI.CODIGO_GIA AS C' +
      'OD_BENEF, '#39'N'#195'O informado Base Legal'#39' AS ERRO FROM PRODUTOS PR'#13#10'I' +
      'NNER JOIN PRODUTOS_IMPOSTOS PI ON PR.COD_PROD=PI.COD_PROD'#13#10'INNER' +
      ' JOIN ICMS IC ON PR.COD_ICMS=IC.COD_ICMS'#13#10'INNER JOIN MENSAGENS_I' +
      'CMS MI ON PI.COD_MENSAGEM=MI.CODIGO'#13#10'WHERE (PI.CST2 IN ('#39'10'#39','#39'20' +
      #39','#39'40'#39','#39'41'#39','#39'50'#39','#39'51'#39','#39'60'#39','#39'70'#39')) AND (PI.COD_MENSAGEM IS NULL)'#13 +
      #10#13#10'UNION'#13#10#13#10'SELECT PR.COD_PROD, PR.NOME_PROD, IC.MENSAGEM_ICMS A' +
      'S ICMS, IC.ALIQUOTA_ICMS AS ALIQUOTA, PI.CST2_CONSUM_FINAL AS CS' +
      'T, PI.CFOP_CONSUM_FINAL AS CFOP_CF, PI.CST2 AS CST_NCF, PI.CFOP ' +
      'AS CFOP_NCF, MI.CODIGO_GIA AS COD_BENEF, '#39'Base Legal difere do C' +
      'FOP'#39' AS ERRO FROM PRODUTOS PR'#13#10'INNER JOIN PRODUTOS_IMPOSTOS PI O' +
      'N PR.COD_PROD=PI.COD_PROD'#13#10'INNER JOIN ICMS IC ON PR.COD_ICMS=IC.' +
      'COD_ICMS'#13#10'INNER JOIN MENSAGENS_ICMS MI ON PI.COD_MENSAGEM=MI.COD' +
      'IGO'#13#10'WHERE (  (((PI.CFOP LIKE '#39'54%'#39') OR (PI.CFOP_CONSUM_FINAL LI' +
      'KE '#39'54%'#39')) AND (MI.CODIGO_GIA NOT LIKE '#39'RS052%'#39'))'#13#10'OR (((PI.CFOP' +
      ' LIKE '#39'56%'#39') OR (PI.CFOP_CONSUM_FINAL LIKE '#39'56%'#39')) AND (MI.CODIG' +
      'O_GIA NOT LIKE '#39'RS052%'#39'))'#13#10'OR (((PI.CFOP LIKE '#39'51%'#39') OR (PI.CFOP' +
      '_CONSUM_FINAL LIKE '#39'51%'#39')) AND (MI.CODIGO_GIA NOT LIKE '#39'RS051%'#39')' +
      ')  )'#13#10')'#13#10'ORDER BY COD_PROD'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Dados
    Left = 149
    Top = 15
    object SProdutosCBenefCOD_PROD: TIntegerField
      FieldName = 'COD_PROD'
      Required = True
    end
    object SProdutosCBenefNOME_PROD: TStringField
      FieldName = 'NOME_PROD'
      Size = 50
    end
    object SProdutosCBenefICMS: TStringField
      FieldName = 'ICMS'
      Size = 30
    end
    object SProdutosCBenefALIQUOTA: TFMTBCDField
      FieldName = 'ALIQUOTA'
      Precision = 18
      Size = 2
    end
    object SProdutosCBenefCST_CF: TStringField
      FieldName = 'CST_CF'
      Size = 3
    end
    object SProdutosCBenefCFOP_CF: TIntegerField
      FieldName = 'CFOP_CF'
    end
    object SProdutosCBenefCST_NCF: TStringField
      FieldName = 'CST_NCF'
      Size = 3
    end
    object SProdutosCBenefCFOP_NCF: TIntegerField
      FieldName = 'CFOP_NCF'
    end
    object SProdutosCBenefCOD_BENEF: TStringField
      FieldName = 'COD_BENEF'
      Size = 10
    end
    object SProdutosCBenefERRO: TStringField
      FieldName = 'ERRO'
      Required = True
      FixedChar = True
      Size = 25
    end
  end
  object CProdutosCBenef: TClientDataSet
    Aggregates = <>
    Filtered = True
    Params = <>
    ProviderName = 'DPProdutosCBenef'
    Left = 149
    Top = 63
    object CProdutosCBenefCOD_PROD: TIntegerField
      FieldName = 'COD_PROD'
      Required = True
    end
    object CProdutosCBenefNOME_PROD: TStringField
      FieldName = 'NOME_PROD'
      Size = 50
    end
    object CProdutosCBenefICMS: TStringField
      FieldName = 'ICMS'
      Size = 30
    end
    object CProdutosCBenefALIQUOTA: TFMTBCDField
      FieldName = 'ALIQUOTA'
      Precision = 18
      Size = 2
    end
    object CProdutosCBenefCST_CF: TStringField
      FieldName = 'CST_CF'
      Size = 3
    end
    object CProdutosCBenefCFOP_CF: TIntegerField
      FieldName = 'CFOP_CF'
    end
    object CProdutosCBenefCST_NCF: TStringField
      FieldName = 'CST_NCF'
      Size = 3
    end
    object CProdutosCBenefCFOP_NCF: TIntegerField
      FieldName = 'CFOP_NCF'
    end
    object CProdutosCBenefERRO: TStringField
      FieldName = 'ERRO'
      Required = True
      FixedChar = True
      Size = 25
    end
    object CProdutosCBenefCOD_BENEF: TStringField
      FieldName = 'COD_BENEF'
      Size = 10
    end
  end
  object DPProdutosCBenef: TDataSetProvider
    DataSet = SProdutosCBenef
    Left = 149
    Top = 111
  end
  object SProdutosAliqPC: TSQLDataSet
    CommandText = 
      'SELECT COD_PROD, NOME_PROD, CST_PIS, CST_COFINS, ALIQ_PIS, ALIQ_' +
      'COFINS, NAT_REC_COFINS, NAT_REC_PIS, ERRO, TIPO_CALC_PIS, TIPO_C' +
      'ALC_COFINS FROM'#13#10'('#13#10'SELECT PR.COD_PROD, PR.NOME_PROD, IC.MENSAGE' +
      'M_ICMS AS ICMS, IC.ALIQUOTA_ICMS AS ALIQUOTA, PI.CST_PIS, PI.CST' +
      '_COFINS, PI.ALIQ_PIS, PI.ALIQ_COFINS, PI.NAT_REC_COFINS, PI.NAT_' +
      'REC_PIS, '#39'CST Pis difere da Aliquota (%)'#39' AS ERRO, PI.TIPO_CALC_' +
      'PIS, PI.TIPO_CALC_COFINS FROM PRODUTOS PR'#13#10'INNER JOIN PRODUTOS_I' +
      'MPOSTOS PI ON PR.COD_PROD=PI.COD_PROD'#13#10'INNER JOIN ICMS IC ON PR.' +
      'COD_ICMS=IC.COD_ICMS'#13#10'WHERE (  ((PI.CST_PIS IN ('#39'04'#39', '#39'06'#39')) AND' +
      ' (PI.ALIQ_PIS > 0))'#13#10'OR ((PI.CST_PIS IN ('#39'01'#39')) AND ((PI.ALIQ_PI' +
      'S)<>(:ALIQPIS)))  )'#13#10#13#10'UNION'#13#10#13#10'SELECT PR.COD_PROD, PR.NOME_PROD' +
      ', IC.MENSAGEM_ICMS AS ICMS, IC.ALIQUOTA_ICMS AS ALIQUOTA, PI.CST' +
      '_PIS, PI.CST_COFINS, PI.ALIQ_PIS, PI.ALIQ_COFINS, PI.NAT_REC_COF' +
      'INS, PI.NAT_REC_PIS, '#39'CST Cofins difere da Aliquota (%)'#39' AS ERRO' +
      ', PI.TIPO_CALC_PIS, PI.TIPO_CALC_COFINS FROM PRODUTOS PR'#13#10'INNER ' +
      'JOIN PRODUTOS_IMPOSTOS PI ON PR.COD_PROD=PI.COD_PROD'#13#10'INNER JOIN' +
      ' ICMS IC ON PR.COD_ICMS=IC.COD_ICMS'#13#10'WHERE (  ((PI.CST_COFINS IN' +
      ' ('#39'04'#39', '#39'06'#39')) AND (PI.ALIQ_COFINS > 0))'#13#10'OR ((PI.CST_COFINS IN ' +
      '('#39'01'#39')) AND ((PI.ALIQ_COFINS)<>(:ALIQCOFINS)))  )'#13#10')'#13#10'ORDER BY C' +
      'OD_PROD'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'ALIQPIS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ALIQCOFINS'
        ParamType = ptInput
      end>
    SQLConnection = Dados
    Left = 152
    Top = 709
    object SProdutosAliqPCCOD_PROD: TIntegerField
      Alignment = taCenter
      FieldName = 'COD_PROD'
      Required = True
    end
    object SProdutosAliqPCNOME_PROD: TStringField
      Alignment = taCenter
      FieldName = 'NOME_PROD'
      Size = 50
    end
    object SProdutosAliqPCCST_PIS: TStringField
      Alignment = taCenter
      FieldName = 'CST_PIS'
      Size = 2
    end
    object SProdutosAliqPCCST_COFINS: TStringField
      Alignment = taCenter
      FieldName = 'CST_COFINS'
      Size = 2
    end
    object SProdutosAliqPCALIQ_PIS: TFMTBCDField
      FieldName = 'ALIQ_PIS'
      Precision = 18
      Size = 2
    end
    object SProdutosAliqPCALIQ_COFINS: TFMTBCDField
      Alignment = taCenter
      FieldName = 'ALIQ_COFINS'
      Precision = 18
      Size = 2
    end
    object SProdutosAliqPCNAT_REC_COFINS: TStringField
      FieldName = 'NAT_REC_COFINS'
      Size = 3
    end
    object SProdutosAliqPCNAT_REC_PIS: TStringField
      Alignment = taCenter
      FieldName = 'NAT_REC_PIS'
      Size = 3
    end
    object SProdutosAliqPCERRO: TStringField
      FieldName = 'ERRO'
      Required = True
      FixedChar = True
      Size = 33
    end
    object SProdutosAliqPCTIPO_CALC_PIS: TStringField
      Alignment = taCenter
      FieldName = 'TIPO_CALC_PIS'
      Size = 30
    end
    object SProdutosAliqPCTIPO_CALC_COFINS: TStringField
      Alignment = taCenter
      FieldName = 'TIPO_CALC_COFINS'
      Size = 30
    end
  end
  object CProdutosAliqPC: TClientDataSet
    Aggregates = <>
    Filtered = True
    Params = <>
    ProviderName = 'DPProdutosAliqPC'
    Left = 152
    Top = 757
    object CProdutosAliqPCCOD_PROD: TIntegerField
      FieldName = 'COD_PROD'
      Required = True
    end
    object CProdutosAliqPCNOME_PROD: TStringField
      FieldName = 'NOME_PROD'
      Size = 50
    end
    object CProdutosAliqPCCST_PIS: TStringField
      FieldName = 'CST_PIS'
      Size = 2
    end
    object CProdutosAliqPCCST_COFINS: TStringField
      FieldName = 'CST_COFINS'
      Size = 2
    end
    object CProdutosAliqPCALIQ_PIS: TFMTBCDField
      FieldName = 'ALIQ_PIS'
      Precision = 18
      Size = 2
    end
    object CProdutosAliqPCALIQ_COFINS: TFMTBCDField
      FieldName = 'ALIQ_COFINS'
      Precision = 18
      Size = 2
    end
    object CProdutosAliqPCNAT_REC_COFINS: TStringField
      FieldName = 'NAT_REC_COFINS'
      Size = 3
    end
    object CProdutosAliqPCNAT_REC_PIS: TStringField
      FieldName = 'NAT_REC_PIS'
      Size = 3
    end
    object CProdutosAliqPCERRO: TStringField
      FieldName = 'ERRO'
      Required = True
      FixedChar = True
      Size = 33
    end
    object CProdutosAliqPCTIPO_CALC_PIS: TStringField
      FieldName = 'TIPO_CALC_PIS'
      Size = 30
    end
    object CProdutosAliqPCTIPO_CALC_COFINS: TStringField
      FieldName = 'TIPO_CALC_COFINS'
      Size = 30
    end
  end
  object DPProdutosAliqPC: TDataSetProvider
    DataSet = SProdutosAliqPC
    Left = 152
    Top = 805
  end
  object SProdutosPC: TSQLDataSet
    CommandText = 
      'SELECT COD_PROD, NOME_PROD, CST_PIS, CST_COFINS, ALIQ_PIS, ALIQ_' +
      'COFINS, NAT_REC_COFINS, NAT_REC_PIS, ERRO, TIPO_CALC_PIS, TIPO_C' +
      'ALC_COFINS FROM'#13#10'('#13#10'SELECT PR.COD_PROD, PR.NOME_PROD, IC.MENSAGE' +
      'M_ICMS AS ICMS, IC.ALIQUOTA_ICMS AS ALIQUOTA, PI.CST_PIS, PI.CST' +
      '_COFINS, PI.ALIQ_PIS, PI.ALIQ_COFINS, PI.NAT_REC_COFINS, PI.NAT_' +
      'REC_PIS, '#39'Diverg'#234'ncia de CST Pis com CST Cofins'#39' AS ERRO, PI.TIP' +
      'O_CALC_PIS, PI.TIPO_CALC_COFINS FROM PRODUTOS PR'#13#10'INNER JOIN PRO' +
      'DUTOS_IMPOSTOS PI ON PR.COD_PROD=PI.COD_PROD'#13#10'INNER JOIN ICMS IC' +
      ' ON PR.COD_ICMS=IC.COD_ICMS'#13#10'WHERE ( (PI.CST_PIS) <> (PI.CST_COF' +
      'INS) )'#13#10')'#13#10'ORDER BY COD_PROD'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Dados
    Left = 40
    Top = 709
    object SProdutosPCCOD_PROD: TIntegerField
      Alignment = taCenter
      FieldName = 'COD_PROD'
      Required = True
    end
    object SProdutosPCNOME_PROD: TStringField
      Alignment = taCenter
      FieldName = 'NOME_PROD'
      Size = 50
    end
    object SProdutosPCCST_PIS: TStringField
      Alignment = taCenter
      FieldName = 'CST_PIS'
      Size = 2
    end
    object SProdutosPCCST_COFINS: TStringField
      Alignment = taCenter
      FieldName = 'CST_COFINS'
      Size = 2
    end
    object SProdutosPCALIQ_PIS: TFMTBCDField
      Alignment = taCenter
      FieldName = 'ALIQ_PIS'
      Precision = 18
      Size = 2
    end
    object SProdutosPCALIQ_COFINS: TFMTBCDField
      Alignment = taCenter
      FieldName = 'ALIQ_COFINS'
      Precision = 18
      Size = 2
    end
    object SProdutosPCNAT_REC_COFINS: TStringField
      FieldName = 'NAT_REC_COFINS'
      Size = 3
    end
    object SProdutosPCNAT_REC_PIS: TStringField
      Alignment = taCenter
      FieldName = 'NAT_REC_PIS'
      Size = 3
    end
    object SProdutosPCERRO: TStringField
      FieldName = 'ERRO'
      Required = True
      FixedChar = True
      Size = 37
    end
    object SProdutosPCTIPO_CALC_PIS: TStringField
      Alignment = taCenter
      FieldName = 'TIPO_CALC_PIS'
      Size = 30
    end
    object SProdutosPCTIPO_CALC_COFINS: TStringField
      Alignment = taCenter
      FieldName = 'TIPO_CALC_COFINS'
      Size = 30
    end
  end
  object CProdutosPC: TClientDataSet
    Aggregates = <>
    Filtered = True
    Params = <>
    ProviderName = 'DPProdutosPC'
    Left = 40
    Top = 757
    object CProdutosPCCOD_PROD: TIntegerField
      FieldName = 'COD_PROD'
      Required = True
    end
    object CProdutosPCNOME_PROD: TStringField
      FieldName = 'NOME_PROD'
      Size = 50
    end
    object CProdutosPCCST_PIS: TStringField
      FieldName = 'CST_PIS'
      Size = 2
    end
    object CProdutosPCCST_COFINS: TStringField
      FieldName = 'CST_COFINS'
      Size = 2
    end
    object CProdutosPCALIQ_PIS: TFMTBCDField
      FieldName = 'ALIQ_PIS'
      Precision = 18
      Size = 2
    end
    object CProdutosPCALIQ_COFINS: TFMTBCDField
      FieldName = 'ALIQ_COFINS'
      Precision = 18
      Size = 2
    end
    object CProdutosPCNAT_REC_COFINS: TStringField
      FieldName = 'NAT_REC_COFINS'
      Size = 3
    end
    object CProdutosPCNAT_REC_PIS: TStringField
      FieldName = 'NAT_REC_PIS'
      Size = 3
    end
    object CProdutosPCERRO: TStringField
      FieldName = 'ERRO'
      Required = True
      FixedChar = True
      Size = 37
    end
    object CProdutosPCTIPO_CALC_PIS: TStringField
      FieldName = 'TIPO_CALC_PIS'
      Size = 30
    end
    object CProdutosPCTIPO_CALC_COFINS: TStringField
      FieldName = 'TIPO_CALC_COFINS'
      Size = 30
    end
  end
  object DPProdutosPC: TDataSetProvider
    DataSet = SProdutosPC
    Left = 40
    Top = 805
  end
  object SProdutosNatPC: TSQLDataSet
    CommandText = 
      'SELECT COD_PROD, NOME_PROD, CST_PIS, CST_COFINS, ALIQ_PIS, ALIQ_' +
      'COFINS, NAT_REC_COFINS, NAT_REC_PIS, ERRO, TIPO_CALC_PIS, TIPO_C' +
      'ALC_COFINS FROM'#13#10'('#13#10'SELECT PR.COD_PROD, PR.NOME_PROD, IC.MENSAGE' +
      'M_ICMS AS ICMS, IC.ALIQUOTA_ICMS AS ALIQUOTA, PI.CST_PIS, PI.CST' +
      '_COFINS, PI.ALIQ_PIS, PI.ALIQ_COFINS, PI.NAT_REC_COFINS, PI.NAT_' +
      'REC_PIS, '#39'N'#195'O informado Natureza de Receita'#39' AS ERRO, PI.TIPO_CA' +
      'LC_PIS, PI.TIPO_CALC_COFINS FROM PRODUTOS PR'#13#10'INNER JOIN PRODUTO' +
      'S_IMPOSTOS PI ON PR.COD_PROD=PI.COD_PROD'#13#10'INNER JOIN ICMS IC ON ' +
      'PR.COD_ICMS=IC.COD_ICMS'#13#10'WHERE (  ((PI.CST_PIS IN ('#39'04'#39', '#39'06'#39')) ' +
      'AND (PI.NAT_REC_PIS IS NULL))'#13#10'OR ((PI.CST_COFINS IN ('#39'04'#39', '#39'06'#39 +
      ')) AND (PI.NAT_REC_COFINS IS NULL))  )'#13#10#13#10'UNION'#13#10#13#10'SELECT PR.COD' +
      '_PROD, PR.NOME_PROD, IC.MENSAGEM_ICMS AS ICMS, IC.ALIQUOTA_ICMS ' +
      'AS ALIQUOTA, PI.CST_PIS, PI.CST_COFINS, PI.ALIQ_PIS, PI.ALIQ_COF' +
      'INS, PI.NAT_REC_COFINS, PI.NAT_REC_PIS, '#39'Informado Natureza de R' +
      'eceita'#39' AS ERRO, PI.TIPO_CALC_PIS, PI.TIPO_CALC_COFINS FROM PROD' +
      'UTOS PR'#13#10'INNER JOIN PRODUTOS_IMPOSTOS PI ON PR.COD_PROD=PI.COD_P' +
      'ROD'#13#10'INNER JOIN ICMS IC ON PR.COD_ICMS=IC.COD_ICMS'#13#10'WHERE (  ((P' +
      'I.CST_PIS IN ('#39'01'#39')) AND (PI.NAT_REC_PIS IS NOT NULL))'#13#10'OR ((PI.' +
      'CST_COFINS IN ('#39'01'#39')) AND (PI.NAT_REC_COFINS IS NOT NULL))  )'#13#10')' +
      #13#10'ORDER BY COD_PROD'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Dados
    Left = 272
    Top = 709
    object SProdutosNatPCCOD_PROD: TIntegerField
      FieldName = 'COD_PROD'
      Required = True
    end
    object SProdutosNatPCNOME_PROD: TStringField
      FieldName = 'NOME_PROD'
      Size = 50
    end
    object SProdutosNatPCCST_PIS: TStringField
      FieldName = 'CST_PIS'
      Size = 2
    end
    object SProdutosNatPCCST_COFINS: TStringField
      FieldName = 'CST_COFINS'
      Size = 2
    end
    object SProdutosNatPCALIQ_PIS: TFMTBCDField
      FieldName = 'ALIQ_PIS'
      Precision = 18
      Size = 2
    end
    object SProdutosNatPCALIQ_COFINS: TFMTBCDField
      FieldName = 'ALIQ_COFINS'
      Precision = 18
      Size = 2
    end
    object SProdutosNatPCNAT_REC_COFINS: TStringField
      FieldName = 'NAT_REC_COFINS'
      Size = 3
    end
    object SProdutosNatPCNAT_REC_PIS: TStringField
      FieldName = 'NAT_REC_PIS'
      Size = 3
    end
    object SProdutosNatPCERRO: TStringField
      FieldName = 'ERRO'
      Required = True
      FixedChar = True
      Size = 33
    end
    object SProdutosNatPCTIPO_CALC_PIS: TStringField
      FieldName = 'TIPO_CALC_PIS'
      Size = 30
    end
    object SProdutosNatPCTIPO_CALC_COFINS: TStringField
      FieldName = 'TIPO_CALC_COFINS'
      Size = 30
    end
  end
  object CProdutosNatPC: TClientDataSet
    Aggregates = <>
    Filtered = True
    Params = <>
    ProviderName = 'DPProdutosNatPC'
    Left = 272
    Top = 757
    object CProdutosNatPCCOD_PROD: TIntegerField
      FieldName = 'COD_PROD'
      Required = True
    end
    object CProdutosNatPCNOME_PROD: TStringField
      FieldName = 'NOME_PROD'
      Size = 50
    end
    object CProdutosNatPCCST_PIS: TStringField
      FieldName = 'CST_PIS'
      Size = 2
    end
    object CProdutosNatPCCST_COFINS: TStringField
      FieldName = 'CST_COFINS'
      Size = 2
    end
    object CProdutosNatPCALIQ_PIS: TFMTBCDField
      FieldName = 'ALIQ_PIS'
      Precision = 18
      Size = 2
    end
    object CProdutosNatPCALIQ_COFINS: TFMTBCDField
      FieldName = 'ALIQ_COFINS'
      Precision = 18
      Size = 2
    end
    object CProdutosNatPCNAT_REC_COFINS: TStringField
      FieldName = 'NAT_REC_COFINS'
      Size = 3
    end
    object CProdutosNatPCNAT_REC_PIS: TStringField
      FieldName = 'NAT_REC_PIS'
      Size = 3
    end
    object CProdutosNatPCERRO: TStringField
      FieldName = 'ERRO'
      Required = True
      FixedChar = True
      Size = 33
    end
    object CProdutosNatPCTIPO_CALC_PIS: TStringField
      FieldName = 'TIPO_CALC_PIS'
      Size = 30
    end
    object CProdutosNatPCTIPO_CALC_COFINS: TStringField
      FieldName = 'TIPO_CALC_COFINS'
      Size = 30
    end
  end
  object DPProdutosNatPC: TDataSetProvider
    DataSet = SProdutosNatPC
    Left = 272
    Top = 805
  end
  object SProdutosRedBC: TSQLDataSet
    CommandText = 
      'SELECT COD_PROD, NOME_PROD, ICMS, ALIQUOTA, CST_CF, CFOP_CF, CST' +
      '_NCF, CFOP_NCF, COD_BENEF, ERRO FROM'#13#10'('#13#10'SELECT PR.COD_PROD, PR.' +
      'NOME_PROD, IC.MENSAGEM_ICMS AS ICMS, IC.ALIQUOTA_ICMS AS ALIQUOT' +
      'A, PI.CST2_CONSUM_FINAL AS CST_CF, PI.CFOP_CONSUM_FINAL AS CFOP_' +
      'CF, PI.CST2 AS CST_NCF,  PI.CFOP AS CFOP_NCF, MI.CODIGO_GIA AS C' +
      'OD_BENEF, '#39'CST Difere da Red de BC'#39' AS ERRO FROM PRODUTOS PR'#13#10'IN' +
      'NER JOIN PRODUTOS_IMPOSTOS PI ON PR.COD_PROD=PI.COD_PROD'#13#10'INNER ' +
      'JOIN ICMS IC ON PR.COD_ICMS=IC.COD_ICMS'#13#10'INNER JOIN MENSAGENS_IC' +
      'MS MI ON PI.COD_MENSAGEM=MI.CODIGO'#13#10'WHERE (  (  ((PI.CST2 IN ('#39'2' +
      '0'#39')) AND (IC.BASE_ICMS = 100))'#13#10'OR ((PI.CST2 IN ('#39'00'#39', '#39'40'#39')) AN' +
      'D (IC.BASE_ICMS < 100))  '#13#10') OR ('#13#10'   ((PI.CST2_CONSUM_FINAL IN ' +
      '('#39'20'#39')) AND (IC.BASE_ICMS = 100))'#13#10'OR ((PI.CST2_CONSUM_FINAL IN ' +
      '('#39'00'#39', '#39'40'#39')) AND (IC.BASE_ICMS < 100))  )  )'#13#10')'#13#10'ORDER BY COD_P' +
      'ROD'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Dados
    Left = 269
    Top = 15
    object SProdutosRedBCCOD_PROD: TIntegerField
      FieldName = 'COD_PROD'
      Required = True
    end
    object SProdutosRedBCNOME_PROD: TStringField
      FieldName = 'NOME_PROD'
      Size = 50
    end
    object SProdutosRedBCICMS: TStringField
      FieldName = 'ICMS'
      Size = 30
    end
    object SProdutosRedBCALIQUOTA: TFMTBCDField
      FieldName = 'ALIQUOTA'
      Precision = 18
      Size = 2
    end
    object SProdutosRedBCCST_CF: TStringField
      FieldName = 'CST_CF'
      Size = 3
    end
    object SProdutosRedBCCFOP_CF: TIntegerField
      FieldName = 'CFOP_CF'
    end
    object SProdutosRedBCCST_NCF: TStringField
      FieldName = 'CST_NCF'
      Size = 3
    end
    object SProdutosRedBCCFOP_NCF: TIntegerField
      FieldName = 'CFOP_NCF'
    end
    object SProdutosRedBCCOD_BENEF: TStringField
      FieldName = 'COD_BENEF'
      Size = 10
    end
    object SProdutosRedBCERRO: TStringField
      FieldName = 'ERRO'
      Required = True
      FixedChar = True
      Size = 23
    end
  end
  object CProdutosRedBC: TClientDataSet
    Aggregates = <>
    Filtered = True
    Params = <>
    ProviderName = 'DPProdutosRedBC'
    Left = 269
    Top = 63
    object CProdutosRedBCCOD_PROD: TIntegerField
      FieldName = 'COD_PROD'
      Required = True
    end
    object CProdutosRedBCNOME_PROD: TStringField
      FieldName = 'NOME_PROD'
      Size = 50
    end
    object CProdutosRedBCICMS: TStringField
      FieldName = 'ICMS'
      Size = 30
    end
    object CProdutosRedBCALIQUOTA: TFMTBCDField
      FieldName = 'ALIQUOTA'
      Precision = 18
      Size = 2
    end
    object CProdutosRedBCCST_CF: TStringField
      FieldName = 'CST_CF'
      Size = 3
    end
    object CProdutosRedBCCFOP_CF: TIntegerField
      FieldName = 'CFOP_CF'
    end
    object CProdutosRedBCCST_NCF: TStringField
      FieldName = 'CST_NCF'
      Size = 3
    end
    object CProdutosRedBCCFOP_NCF: TIntegerField
      FieldName = 'CFOP_NCF'
    end
    object CProdutosRedBCCOD_BENEF: TStringField
      FieldName = 'COD_BENEF'
      Size = 10
    end
    object CProdutosRedBCERRO: TStringField
      FieldName = 'ERRO'
      Required = True
      FixedChar = True
      Size = 23
    end
  end
  object DPProdutosRedBC: TDataSetProvider
    DataSet = SProdutosRedBC
    Left = 269
    Top = 111
  end
  object SProdutosAliq: TSQLDataSet
    CommandText = 
      'SELECT COD_PROD, NOME_PROD, ICMS, ALIQUOTA, CST_CF, CFOP_CF, CST' +
      '_NCF, CFOP_NCF, COD_BENEF, ERRO FROM'#13#10'('#13#10'SELECT PR.COD_PROD, PR.' +
      'NOME_PROD, IC.MENSAGEM_ICMS AS ICMS, IC.ALIQUOTA_ICMS AS ALIQUOT' +
      'A, PI.CST2_CONSUM_FINAL AS CST_CF, PI.CFOP_CONSUM_FINAL AS CFOP_' +
      'CF, PI.CST2 AS CST_NCF,  PI.CFOP AS CFOP_NCF, MI.CODIGO_GIA AS C' +
      'OD_BENEF, '#39'CST difere da Aliq. (%)'#39' AS ERRO FROM PRODUTOS PR'#13#10'IN' +
      'NER JOIN PRODUTOS_IMPOSTOS PI ON PR.COD_PROD=PI.COD_PROD'#13#10'INNER ' +
      'JOIN ICMS IC ON PR.COD_ICMS=IC.COD_ICMS'#13#10'INNER JOIN MENSAGENS_IC' +
      'MS MI ON PI.COD_MENSAGEM=MI.CODIGO'#13#10'WHERE ( ((PI.CST2 IN ('#39'00'#39','#39 +
      '20'#39') ) AND (IC.ALIQUOTA_ICMS=0) )'#13#10'OR ((PI.CST2 IN ('#39'40'#39') ) AND ' +
      '(IC.ALIQUOTA_ICMS>0)) )'#13#10#13#10'UNION'#13#10#13#10'SELECT PR.COD_PROD, PR.NOME_' +
      'PROD, IC.MENSAGEM_ICMS AS ICMS, IC.ALIQUOTA_ICMS AS ALIQUOTA, PI' +
      '.CST2_CONSUM_FINAL AS CST_CF, PI.CFOP_CONSUM_FINAL AS CFOP_CF, P' +
      'I.CST2 AS CST_NCF,  PI.CFOP AS CFOP_NCF, MI.CODIGO_GIA AS COD_BE' +
      'NEF, '#39'CST difere da Aliq. ST (%)'#39' AS ERRO FROM PRODUTOS PR'#13#10'INNE' +
      'R JOIN PRODUTOS_IMPOSTOS PI ON PR.COD_PROD=PI.COD_PROD'#13#10'INNER JO' +
      'IN ICMS IC ON PR.COD_ICMS=IC.COD_ICMS'#13#10'INNER JOIN MENSAGENS_ICMS' +
      ' MI ON PI.COD_MENSAGEM=MI.CODIGO'#13#10'WHERE ((PI.CST2 IN ('#39'60'#39') ) AN' +
      'D (IC.ALIQUOTA_ICMS=0))'#13#10')'#13#10'ORDER BY COD_PROD'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Dados
    Left = 384
    Top = 15
    object SProdutosAliqCOD_PROD: TIntegerField
      FieldName = 'COD_PROD'
      Required = True
    end
    object SProdutosAliqNOME_PROD: TStringField
      FieldName = 'NOME_PROD'
      Size = 50
    end
    object SProdutosAliqICMS: TStringField
      FieldName = 'ICMS'
      Size = 30
    end
    object SProdutosAliqALIQUOTA: TFMTBCDField
      FieldName = 'ALIQUOTA'
      Precision = 18
      Size = 2
    end
    object SProdutosAliqCST_CF: TStringField
      FieldName = 'CST_CF'
      Size = 3
    end
    object SProdutosAliqCFOP_CF: TIntegerField
      FieldName = 'CFOP_CF'
    end
    object SProdutosAliqCST_NCF: TStringField
      FieldName = 'CST_NCF'
      Size = 3
    end
    object SProdutosAliqCFOP_NCF: TIntegerField
      FieldName = 'CFOP_NCF'
    end
    object SProdutosAliqCOD_BENEF: TStringField
      FieldName = 'COD_BENEF'
      Size = 10
    end
    object SProdutosAliqERRO: TStringField
      FieldName = 'ERRO'
      Required = True
      FixedChar = True
      Size = 26
    end
  end
  object CProdutosAliq: TClientDataSet
    Aggregates = <>
    Filtered = True
    Params = <>
    ProviderName = 'DPProdutosAliq'
    Left = 384
    Top = 63
    object CProdutosAliqCOD_PROD: TIntegerField
      FieldName = 'COD_PROD'
      Required = True
    end
    object CProdutosAliqNOME_PROD: TStringField
      FieldName = 'NOME_PROD'
      Size = 50
    end
    object CProdutosAliqICMS: TStringField
      FieldName = 'ICMS'
      Size = 30
    end
    object CProdutosAliqALIQUOTA: TFMTBCDField
      FieldName = 'ALIQUOTA'
      Precision = 18
      Size = 2
    end
    object CProdutosAliqCST_CF: TStringField
      FieldName = 'CST_CF'
      Size = 3
    end
    object CProdutosAliqCFOP_CF: TIntegerField
      FieldName = 'CFOP_CF'
    end
    object CProdutosAliqCST_NCF: TStringField
      FieldName = 'CST_NCF'
      Size = 3
    end
    object CProdutosAliqCFOP_NCF: TIntegerField
      FieldName = 'CFOP_NCF'
    end
    object CProdutosAliqCOD_BENEF: TStringField
      FieldName = 'COD_BENEF'
      Size = 10
    end
    object CProdutosAliqERRO: TStringField
      FieldName = 'ERRO'
      Required = True
      FixedChar = True
      Size = 26
    end
  end
  object DPProdutosAliq: TDataSetProvider
    DataSet = SProdutosAliq
    Left = 384
    Top = 111
  end
  object Dados: TSQLConnection
    DriverName = 'Firebird'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXFirebird'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver260.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=24.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXFirebirdMetaDataCommandFactory,DbxFire' +
        'birdDriver260.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXFirebirdMetaDataCommandF' +
        'actory,Borland.Data.DbxFirebirdDriver,Version=24.0.0.0,Culture=n' +
        'eutral,PublicKeyToken=91d62ebb5b0d1b1b'
      'GetDriverFunc=getSQLDriverINTERBASE'
      'LibraryName=dbxfb.dll'
      'LibraryNameOsx=libsqlfb.dylib'
      'VendorLib=fbclient.dll'
      'VendorLibWin64=fbclient.dll'
      'VendorLibOsx=/Library/Frameworks/Firebird.framework/Firebird'
      'Database=database.fdb'
      'User_Name=sysdba'
      'Password=masterkey'
      'Role=RoleName'
      'MaxBlobSize=-1'
      'LocaleCode=0000'
      'IsolationLevel=ReadCommitted'
      'SQLDialect=3'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'TrimChar=False')
    Left = 632
    Top = 1288
  end
end
