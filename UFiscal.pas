unit UFiscal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient, Vcl.FileCtrl,
  Datasnap.DSCommonServer, Datasnap.DSServer, Data.FMTBcd, Data.SqlExpr,
  FireDAC.Stan.Intf, FireDAC.Comp.Client, Xml.xmldom, Xml.XmlTransform, COMOBJ, SHELLAPI,
  Vcl.ExtCtrls, Vcl.Menus;

type
  TFFiscal = class(TForm)
    DBGridSaidas: TDBGrid;
    Data1: TDateTimePicker;
    Data2: TDateTimePicker;
    ButICMSNFCe: TButton;
    ButICMSNFe: TButton;
    ButICMSEnt: TButton;
    DSItemVenda: TDataSource;
    DSItemNotaEmit: TDataSource;
    DSItemNotaEnt: TDataSource;
    DSImportTxt: TDataSource;
    ProgressBar1: TProgressBar;
    ButImp: TButton;
    DBGridExtrato: TDBGrid;
    ButCompNfce: TButton;
    DBGridComparacao: TDBGrid;
    DSResultConfer: TDataSource;
    LabelStatus: TLabel;
    LabelStatusNotas: TLabel;
    ButCompNfe: TButton;
    StaticText2: TStaticText;
    StaticText4: TStaticText;
    StaticText5: TStaticText;
    StaticText6: TStaticText;
    ButCompEnt: TButton;
    StatusCompVendas: TLabel;
    StatusCompExt: TLabel;
    NomeEmp: TLabel;
    StaticText7: TStaticText;
    StatSistemaSefaz: TStaticText;
    StatSefazSistema: TStaticText;
    StatusGeral: TStaticText;
    StaticText10: TStaticText;
    ButContrNFCe: TButton;
    StaticText11: TStaticText;
    ButContrNFe: TButton;
    ButContrEnt: TButton;
    StaticText12: TStaticText;
    StaticText13: TStaticText;
    ButCompNfeConsu: TButton;
    StaticText14: TStaticText;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    DSItemVendaPC: TDataSource;
    CheckNCum: TCheckBox;
    CheckCum: TCheckBox;
    DSItemNotaEmitPC: TDataSource;
    DSItemNotaEntPC: TDataSource;
    DBGridEntradas: TDBGrid;
    PopupMenu1: TPopupMenu;
    ExportarXLS1: TMenuItem;
    PopupMenu2: TPopupMenu;
    Entrar: TMenuItem;
    Edit1: TEdit;
    Shape5: TShape;
    StaticText15: TStaticText;
    Shape7: TShape;
    StaticText17: TStaticText;
    Button1: TButton;
    StaticText18: TStaticText;
    Button2: TButton;
    Button3: TButton;
    Shape8: TShape;
    Shape9: TShape;
    Shape10: TShape;
    Shape11: TShape;
    StaticText16: TStaticText;
    Shape12: TShape;
    Shape13: TShape;
    DBGridProdutos: TDBGrid;
    DSProdutos: TDataSource;
    StatocText1: TStaticText;
    StaticText1: TStaticText;
    Shape6: TShape;
    StaticText9: TStaticText;
    LabCaminhoBanco: TLabel;
    Memo1: TMemo;
    DSProdutosPC: TDataSource;

    //Datas
    procedure Data1Change(Sender: TObject);
    procedure Data2Change(Sender: TObject);
    //Buttons ICMS
    procedure ButICMSProdClick(Sender: TObject);
    procedure ButICMSNFCeClick(Sender: TObject);
    procedure ButICMSNFeClick(Sender: TObject);
    procedure ButICMSEntClick(Sender: TObject);
    //Check Pis/Cofins
    procedure CheckNCumClick(Sender: TObject);
    procedure CheckCumClick(Sender: TObject);
    //Buttons Pis/Cofins
    procedure ButContrProdClick(Sender: TObject);
    procedure ButContrNFCeClick(Sender: TObject);
    procedure ButContrNFeClick(Sender: TObject);
    procedure ButContrEntClick(Sender: TObject);
    //Button Importacao
    procedure ButImpClick(Sender: TObject);
    //Buttons Comparacao
    procedure ButCompNfceClick(Sender: TObject);
    procedure ButCompNfeClick(Sender: TObject);
    procedure ButCompEntClick(Sender: TObject);
    procedure ButCompNfeConsuClick(Sender: TObject);
    //Buttons Funcionalidades
    procedure DBGridSaidasTitleClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure Exportar1Click (Sender: TObject);
    procedure EntrarClick(Sender: TObject);
    procedure LocalizarClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FFiscal: TFFiscal;

implementation

{$R *.dfm}

uses UDados, ULogin, ULocalizar;


{$region 'Conferências: Produtos'}

    {$region 'Consulta: ICMS''}
procedure TFFiscal.ButICMSProdClick(Sender: TObject);
var
  MsgErro1, MsgErro2, MsgErro3, MsgErro4: String;       // Utilizada para mensagem de erro
  countErro1, countErro2, countErro3, countErro4: Integer;   //Utilizada no contador de linhas

begin
  //Abrir o Grid para Produtos
  DBGridProdutos.DataSource := DSProdutos;
  DBGridProdutos.visible := True;
  Memo1.visible := True;

  DBGridSaidas.visible := False;
  DBGridComparacao.visible := False;
  DBGridEntradas.visible := False;
  DBGridExtrato.Visible := False;

  MsgErro1 := '';
  MsgErro2 := '';
  MsgErro3 := '';
  MsgErro4 := '';

  countErro1:=0;
  countErro2:=0;
  countErro3:=0;
  countErro4:=0;
  //----------------------------------------------------------

  //Incluo as colunas: ICMS, ALIQUOTA, CST_CF, CFOP_CF, CST_NCF, CFOP_NCF, COD_BENEF (Na ordem).
  DBGridProdutos.Columns[2].Visible := True;
  DBGridProdutos.Columns[3].Visible := True;
  DBGridProdutos.Columns[4].Visible := True;
  DBGridProdutos.Columns[5].Visible := True;
  DBGridProdutos.Columns[6].Visible := True;
  DBGridProdutos.Columns[7].Visible := True;
  DBGridProdutos.Columns[8].Visible := True;
  //----------------------------------------------------------

  //Removo as colunas: CST_PIS, ALIQ_PIS, TIPO_CALC_PIS, NAT_REC_PIS, CST_COFINS, ALIQ_COFINS, TIPO_CALC_COFINS, NAT_REC_COFINS (Na ordem).
  DBGridProdutos.Columns[9].Visible := False;
  DBGridProdutos.Columns[10].Visible := False;
  DBGridProdutos.Columns[11].Visible := False;
  DBGridProdutos.Columns[12].Visible := False;
  DBGridProdutos.Columns[13].Visible := False;
  DBGridProdutos.Columns[14].Visible := False;
  DBGridProdutos.Columns[15].Visible := False;
  DBGridProdutos.Columns[16].Visible := False;
  //----------------------------------------------------------

      {$region 'CST X CFOP'}
  //Mensagens
  TButton(Sender).Caption := 'Aguarde...';
  Application.ProcessMessages;
  StatusGeral.Caption := 'Consultando CST x CFOP...';
  StatusGeral.Update;
  Application.ProcessMessages;
  //----------------------------------------------------------

  //Abrindo DataSet
  begin
    FDados.CProdutos.Open;

    countErro1 := FDados.CProdutos.RecordCount;
    MsgErro1 := FDados.CProdutosERRO.AsString;
  end;
  //----------------------------------------------------------
  {$endregion}

      {$region 'CBenef'}
  //Mensagens
  StatusGeral.Caption := 'Consultando Códigos de Benefícios...';
  StatusGeral.Update;
  //----------------------------------------------------------
  Begin
  //Abrindo DataSet
  FDados.CProdutosCBenef.Open;
  //----------------------------------------------------------

    begin
    //Inclusão dos registros - cBenef
    while not (FDados.CProdutosCBenef.eof) do
      Begin
        FDados.CProdutos.Append;
        FDados.CProdutosCOD_PROD.AsString := FDados.CProdutosCBenefCOD_PROD.AsString;
        FDados.CProdutosNOME_PROD.AsString := FDados.CProdutosCBenefNOME_PROD.AsString;
        FDados.CProdutosCST_CF.AsString := FDados.CProdutosCBenefCST_CF.AsString;
        FDados.CProdutosCFOP_CF.AsString := FDados.CProdutosCBenefCFOP_CF.AsString;
        FDados.CProdutosCST_NCF.AsString := FDados.CProdutosCBenefCST_NCF.AsString;
        FDados.CProdutosCFOP_NCF.AsString := FDados.CProdutosCBenefCFOP_NCF.AsString;
        FDados.CProdutosERRO.AsString := FDados.CProdutosCBenefERRO.AsString;
        FDados.CProdutosALIQUOTA.AsString :=  FDados.CProdutosCBenefALIQUOTA.AsString;
        FDados.CProdutosICMS.AsString :=  FDados.CProdutosCBenefICMS.AsString;
        FDados.CProdutosCOD_BENEF.AsString :=  FDados.CProdutosCBenefCOD_BENEF.AsString;
        FDados.CProdutos.Post;
        FDados.CProdutosCBenef.Next;

        countErro2:= (countErro2)+1;
        MsgErro2:= FDados.CProdutosCBenefERRO.AsString;
      End;
    end;
  End;
  //----------------------------------------------------------
 {$endregion}

      {$region 'Redução da BC'}
  //Mensagens
  StatusGeral.Caption := 'Consultando Reduções na Base de Cálculo...';
  StatusGeral.Update;
  //----------------------------------------------------------
  Begin
  //Abrindo DataSet
  FDados.CProdutosRedBC.Open;
  //----------------------------------------------------------

    begin
    //Inclusão dos registros - cBenef
    while not (FDados.CProdutosRedBC.eof) do
      Begin
        FDados.CProdutos.Append;
        FDados.CProdutosCOD_PROD.AsString := FDados.CProdutosRedBCCOD_PROD.AsString;
        FDados.CProdutosNOME_PROD.AsString := FDados.CProdutosRedBCNOME_PROD.AsString;
        FDados.CProdutosCST_CF.AsString := FDados.CProdutosRedBCCST_CF.AsString;
        FDados.CProdutosCFOP_CF.AsString := FDados.CProdutosRedBCCFOP_CF.AsString;
        FDados.CProdutosCST_NCF.AsString := FDados.CProdutosRedBCCST_NCF.AsString;
        FDados.CProdutosCFOP_NCF.AsString := FDados.CProdutosRedBCCFOP_NCF.AsString;
        FDados.CProdutosERRO.AsString := FDados.CProdutosRedBCERRO.AsString;
        FDados.CProdutosALIQUOTA.AsString :=  FDados.CProdutosRedBCALIQUOTA.AsString;
        FDados.CProdutosICMS.AsString :=  FDados.CProdutosRedBCICMS.AsString;
        FDados.CProdutosCOD_BENEF.AsString :=  FDados.CProdutosRedBCCOD_BENEF.AsString;
        FDados.CProdutos.Post;
        FDados.CProdutosRedBC.Next;

        countErro3:= (countErro3)+1;
        MsgErro3:= FDados.CProdutosRedBCERRO.AsString;
      End;
    End;
  End;
  //----------------------------------------------------------
 {$endregion}

      {$region 'Aliquota'}
  //Mensagens
  StatusGeral.Caption := 'Verificando Aliquotas...';
  StatusGeral.Update;
  //----------------------------------------------------------
  Begin
  //Abrindo DataSet
  FDados.CProdutosAliq.Open;
  //----------------------------------------------------------

    begin
    //Inclusão dos registros - cBenef
    while not (FDados.CProdutosAliq.eof) do
      Begin
        FDados.CProdutos.Append;
        FDados.CProdutosCOD_PROD.AsString := FDados.CProdutosAliqCOD_PROD.AsString;
        FDados.CProdutosNOME_PROD.AsString := FDados.CProdutosAliqNOME_PROD.AsString;
        FDados.CProdutosCST_CF.AsString := FDados.CProdutosAliqCST_CF.AsString;
        FDados.CProdutosCFOP_CF.AsString := FDados.CProdutosAliqCFOP_CF.AsString;
        FDados.CProdutosCST_NCF.AsString := FDados.CProdutosAliqCST_NCF.AsString;
        FDados.CProdutosCFOP_NCF.AsString := FDados.CProdutosAliqCFOP_NCF.AsString;
        FDados.CProdutosERRO.AsString := FDados.CProdutosAliqERRO.AsString;
        FDados.CProdutosALIQUOTA.AsString :=  FDados.CProdutosAliqALIQUOTA.AsString;
        FDados.CProdutosICMS.AsString :=  FDados.CProdutosAliqICMS.AsString;
        FDados.CProdutosCOD_BENEF.AsString :=  FDados.CProdutosAliqCOD_BENEF.AsString;
        FDados.CProdutos.Post;
        FDados.CProdutosAliq.Next;

        countErro4:=(countErro4)+1;
        MsgErro4:= FDados.CProdutosAliqERRO.AsString;
      End;
    End;
  End;
  //----------------------------------------------------------
 {$endregion}

  //Mensagens
  FFiscal.StaticText1.Visible := True;   //Show Erros Identificados

  if ( (countErro1 = 0) and (countErro2 = 0) and (countErro3 = 0) and (countErro4 = 0) ) then
    begin
      Memo1.Lines.Add('Nenhum erro identificado.');
    end;

  if (countErro1 > 0) then
    Begin
      Memo1.Lines.Add((IntToStr(Round(countErro1))) + ' ' + MsgErro1);
    End;

  if (countErro2 > 0) then
    begin
      Memo1.Lines.Add((IntToStr(Round(countErro2))) + ' ' + MsgErro2);
    end;

  if (countErro3 > 0) then
    begin
      Memo1.Lines.Add((IntToStr(Round(countErro3))) + ' ' + MsgErro3);
    end;

  if (countErro4 > 0) then
    begin
      Memo1.Lines.Add((IntToStr(Round(countErro4))) + ' ' + MsgErro4);
    end;

  TButton(Sender).Caption := 'ICMS';
  Application.ProcessMessages;
  ShowMessage('Operação Finalizada!');
  StatusGeral.Caption := 'Busca ICMS em Produtos Finalizada.';
  StatusGeral.Update;
  //----------------------------------------------------------
end;
  {$endregion}

    {$region 'Consulta: Pis/Cofins''}

procedure TFFiscal.ButContrProdClick(Sender: TObject);
var
  MsgErro1, MsgErro2, MsgErro3: String;       // Utilizada para mensagem de erro
  countErro1, countErro2, countErro3: Integer;   //Utilizada no contador de linhas

begin
  //Abrir o Grid para Produtos
  DBGridProdutos.DataSource := DSProdutosPC;
  DBGridProdutos.visible := True;
  Memo1.visible := True;

  DBGridSaidas.visible := False;
  DBGridComparacao.visible := False;
  DBGridEntradas.visible := False;
  DBGridExtrato.Visible := False;

  MsgErro1 := '';
  MsgErro2 := '';
  MsgErro3 := '';

  countErro1:=0;
  countErro2:=0;
  countErro3:=0;
  //----------------------------------------------------------

  //Incluo as colunas: CST_PIS, ALIQ_PIS, TIPO_CALC_PIS, NAT_REC_PIS, CST_COFINS, ALIQ_COFINS, TIPO_CALC_COFINS, NAT_REC_COFINS (Na ordem).
  DBGridProdutos.Columns[9].Visible := True;
  DBGridProdutos.Columns[10].Visible := True;
  DBGridProdutos.Columns[11].Visible := True;
  DBGridProdutos.Columns[12].Visible := True;
  DBGridProdutos.Columns[13].Visible := True;
  DBGridProdutos.Columns[14].Visible := True;
  DBGridProdutos.Columns[15].Visible := True;
  DBGridProdutos.Columns[16].Visible := True;
  //----------------------------------------------------------

  //Removo as colunas: ICMS, ALIQUOTA, CST_CF, CFOP_CF, CST_NCF, CFOP_NCF, COD_BENEF (Na ordem).
  DBGridProdutos.Columns[2].Visible := False;
  DBGridProdutos.Columns[3].Visible := False;
  DBGridProdutos.Columns[4].Visible := False;
  DBGridProdutos.Columns[5].Visible := False;
  DBGridProdutos.Columns[6].Visible := False;
  DBGridProdutos.Columns[7].Visible := False;
  DBGridProdutos.Columns[8].Visible := False;
  //----------------------------------------------------------

      {$region 'CST X Aliq'}
  //Mensagens
  TButton(Sender).Caption := 'Aguarde...';
  Application.ProcessMessages;
  StatusGeral.Caption := 'Consultando CST x CFOP...';
  StatusGeral.Update;
  Application.ProcessMessages;
  //----------------------------------------------------------

  //Abrindo DataSet
  begin
    FDados.CProdutosPC.Open;

  //Troca os dados de Tipo de cálculo
    Begin
      while not FDados.CProdutosPC.Eof do
        Begin
        FDados.CProdutosPC.edit;

        //Trocando nome EM PERCENTUAL do PIS para %
          If (FDados.CProdutosPCTIPO_CALC_PIS.Value = 'Em Valor') then
            Begin
              FDados.CProdutosPCTIPO_CALC_PIS.AsString := '$';
            End

        //Trocando nome EM VALOR do PIS para $
          Else If (FDados.CProdutosPCTIPO_CALC_PIS.Value = 'Em Percentual') then
            Begin
              FDados.CProdutosPCTIPO_CALC_PIS.AsString := '%';
            End

        //Se não tiver nada mostra X
          Else
            Begin
              FDados.CProdutosPCTIPO_CALC_PIS.AsString := '-';
            End;
        //----------------------------------------------------------

        //Trocando nome EM PERCENTUAL do COFINS para %
          If (FDados.CProdutosPCTIPO_CALC_COFINS.Value = 'Em Valor') then
            Begin
              FDados.CProdutosPCTIPO_CALC_COFINS.AsString := '$';
            End

        //Trocando nome EM VALOR do COFINS para $
          Else If (FDados.CProdutosPCTIPO_CALC_COFINS.Value = 'Em Percentual') then
            Begin
              FDados.CProdutosPCTIPO_CALC_COFINS.AsString := '%';
            End

        //Se não tiver nada mostra X
          Else
            Begin
              FDados.CProdutosPCTIPO_CALC_COFINS.AsString := '-';
            End;
        //----------------------------------------------------------
          FDados.CProdutosPC.Post;
          FDados.CProdutosPC.Next;

          countErro1:= (countErro1)+1;
          MsgErro1:= FDados.CProdutosPCERRO.AsString;
        End;
    End;
  end;
  //----------------------------------------------------------
  {$endregion}

      {$region 'Aliquotas'}
  //Mensagens
  StatusGeral.Caption := 'Consultando Aliquotas de Pis e Cofins...';
  StatusGeral.Update;
  //----------------------------------------------------------
  Begin
  FDados.CProdutosAliqPC.close;
  //Identificando a Aliquota trabalhada
  If (CheckCum.Checked = True) then
     Begin
      FDados.SProdutosAliqPC.ParamByName('ALIQPIS').Value := 0.65;
      FDados.SProdutosAliqPC.ParamByName('ALIQCOFINS').Value := 3;
     End
  Else If (CheckNCum.Checked = True) then
     Begin
      FDados.SProdutosAliqPC.ParamByName('ALIQPIS').Value := 1.65;
      FDados.SProdutosAliqPC.ParamByName('ALIQCOFINS').Value := 7.6;
     End;
  //Abrindo DataSet
  FDados.CProdutosAliqPC.Open;
  //----------------------------------------------------------

    If (CheckNCum.Checked= True) or (CheckCum.Checked = True) then
      Begin
        //Inclusão dos registros - Aliquotas
        while not (FDados.CProdutosAliqPC.eof) do
         Begin
          FDados.CProdutosPC.Append;
          FDados.CProdutosPCCOD_PROD.AsString := FDados.CProdutosAliqPCCOD_PROD.AsString;
          FDados.CProdutosPCNOME_PROD.AsString := FDados.CProdutosAliqPCNOME_PROD.AsString;
          FDados.CProdutosPCCST_PIS.AsString := FDados.CProdutosAliqPCCST_PIS.AsString;
          FDados.CProdutosPCCST_COFINS.AsString := FDados.CProdutosAliqPCCST_COFINS.AsString;
          FDados.CProdutosPCALIQ_PIS.AsString := FDados.CProdutosAliqPCALIQ_PIS.AsString;
          FDados.CProdutosPCALIQ_COFINS.AsString := FDados.CProdutosAliqPCALIQ_COFINS.AsString;
          FDados.CProdutosPCERRO.AsString := FDados.CProdutosAliqPCERRO.AsString;
          FDados.CProdutosPCNAT_REC_PIS.AsString :=  FDados.CProdutosAliqPCNAT_REC_PIS.AsString;
          FDados.CProdutosPCNAT_REC_COFINS.AsString :=  FDados.CProdutosAliqPCNAT_REC_COFINS.AsString;

          //Trocando nome EM PERCENTUAL do PIS para %
          If (FDados.CProdutosAliqPCTIPO_CALC_PIS.value='Em Percentual') then
            Begin
              FDados.CProdutosPCTIPO_CALC_PIS.AsString := '%';
            End
          //Trocando nome EM VALOR do PIS para $
          Else If (FDados.CProdutosAliqPCTIPO_CALC_PIS.value='Em Valor') then
            Begin
              FDados.CProdutosPCTIPO_CALC_PIS.AsString := '$';
            End
          //Se não tiver nada mostra X
          Else
            Begin
              FDados.CProdutosPCTIPO_CALC_PIS.AsString := '-';
            End;
          //----------------------------------------------------------

          //Trocando nome EM PERCENTUAL do COFINS para %
          If (FDados.CProdutosAliqPCTIPO_CALC_COFINS.value='Em Percentual') then
            Begin
              FDados.CProdutosPCTIPO_CALC_COFINS.AsString := '%';
            End
          //Trocando nome EM VALOR do COFINS para $
          Else If (FDados.CProdutosAliqPCTIPO_CALC_COFINS.value='Em Valor') then
            Begin
              FDados.CProdutosPCTIPO_CALC_COFINS.AsString := '$';
            End
          //Se não tiver nada mostra X
          Else
            Begin
              FDados.CProdutosPCTIPO_CALC_COFINS.AsString := '-';
            End;
          //----------------------------------------------------------

          FDados.CProdutosPC.Post;
          FDados.CProdutosAliqPC.Next;

          countErro2:= (countErro2)+1;
          MsgErro2:= FDados.CProdutosAliqPCERRO.AsString;

         End;
      end
    Else
      Begin
        ShowMessage('Selecione opção de Aliquota: Não Cumulativa, ou, Cumulativa!');
      End;
  End;
  //----------------------------------------------------------
 {$endregion}

      {$region 'Naturezas Pis/Cofins'}
  //Mensagens
  StatusGeral.Caption := 'Consultando Naturezas de Receita de Pis e Cofins...';
  StatusGeral.Update;
  //----------------------------------------------------------
  Begin
  //Abrindo DataSet
  FDados.CProdutosNatPC.Open;
  //----------------------------------------------------------

    while not (FDados.CProdutosNatPC.eof) do
      Begin
          FDados.CProdutosPC.Append;
          FDados.CProdutosPCCOD_PROD.AsString := FDados.CProdutosNatPCCOD_PROD.AsString;
          FDados.CProdutosPCNOME_PROD.AsString := FDados.CProdutosNatPCNOME_PROD.AsString;
          FDados.CProdutosPCCST_PIS.AsString := FDados.CProdutosNatPCCST_PIS.AsString;
          FDados.CProdutosPCCST_COFINS.AsString := FDados.CProdutosNatPCCST_COFINS.AsString;
          FDados.CProdutosPCALIQ_PIS.AsString := FDados.CProdutosNatPCALIQ_PIS.AsString;
          FDados.CProdutosPCALIQ_COFINS.AsString := FDados.CProdutosNatPCALIQ_COFINS.AsString;
          FDados.CProdutosPCERRO.AsString := FDados.CProdutosNatPCERRO.AsString;
          FDados.CProdutosPCNAT_REC_PIS.AsString :=  FDados.CProdutosNatPCNAT_REC_PIS.AsString;
          FDados.CProdutosPCNAT_REC_COFINS.AsString :=  FDados.CProdutosNatPCNAT_REC_COFINS.AsString;

          //Trocando nome EM PERCENTUAL do PIS para %
        If (FDados.CProdutosNatPCTIPO_CALC_PIS.value='Em Percentual') then
          Begin
            FDados.CProdutosPCTIPO_CALC_PIS.AsString := '%';
          End
        //Trocando nome EM VALOR do PIS para $
        Else If (FDados.CProdutosNatPCTIPO_CALC_PIS.value='Em Valor') then
          Begin
            FDados.CProdutosPCTIPO_CALC_PIS.AsString := '$';
          End
        //Se não tiver nada mostra X
        Else
          Begin
            FDados.CProdutosPCTIPO_CALC_PIS.AsString := '-';
          End;
        //----------------------------------------------------------

        //Trocando nome EM PERCENTUAL do COFINS para %
        If (FDados.CProdutosNatPCTIPO_CALC_COFINS.value='Em Percentual') then
          Begin
            FDados.CProdutosPCTIPO_CALC_COFINS.AsString := '%';
          End
        //Trocando nome EM VALOR do COFINS para $
        Else If (FDados.CProdutosNatPCTIPO_CALC_COFINS.value='Em Valor') then
          Begin
            FDados.CProdutosPCTIPO_CALC_COFINS.AsString := '$';
          End
        //Se não tiver nada mostra X
        Else
          Begin
            FDados.CProdutosPCTIPO_CALC_COFINS.AsString := '-';
          End;
        //----------------------------------------------------------

          FDados.CProdutosPC.Post;
          FDados.CProdutosNatPC.Next;

          countErro3:= (countErro3)+1;
          MsgErro3:=FDados.CProdutosNatPCERRO.AsString;
      End;

  End;
  //----------------------------------------------------------
 {$endregion}

  //Mensagens
  FFiscal.StaticText1.Visible := True;   //Show Erros Identificados

  if ( (countErro1 = 0) and (countErro2 = 0) and (countErro3 = 0) ) then
    begin
      Memo1.Lines.Add('Nenhum erro identificado.');
    end;

  if (countErro1 > 0) then
    Begin
      Memo1.Lines.Add((IntToStr(Round(countErro1))) + ' ' + MsgErro1);
    End;

  if (countErro2 > 0) then
    begin
      Memo1.Lines.Add((IntToStr(Round(countErro2))) + ' ' + MsgErro2);
    end;

  if (countErro3 > 0) then
    begin
      Memo1.Lines.Add((IntToStr(Round(countErro3))) + ' ' + MsgErro3);
    end;

  TButton(Sender).Caption := 'Pis/Cofins';
  Application.ProcessMessages;
  ShowMessage('Operação Finalizada!');
  StatusGeral.Caption := 'Busca Pis/Cofins em Produtos Finalizada';
  StatusGeral.Update;
  //----------------------------------------------------------
end;

{$endregion}

 {$endregion}

{$region 'Conferências: ICMS'}

    {$region 'Consulta: NFC-e''}
procedure TFFiscal.ButICMSNFCeClick(Sender: TObject);
var
MsgErro1, MsgErro2, MsgErro3, MsgErro4 : String;       // Utilizada para mensagem de erro
countErro1, countErro2, countErro3, countErro4: Integer;   //Utilizada no contador de linhas

begin
  //Abrir o Grid para NFC-e
  DBGridSaidas.DataSource := DSItemVenda;
  DBGridSaidas.visible := True;
  Memo1.visible := True;

  DBGridProdutos.visible := False;
  DBGridComparacao.visible := False;
  DBGridEntradas.visible := False;
  DBGridExtrato.Visible := False;

  MsgErro1 := '';
  MsgErro2 := '';
  MsgErro3 := '';
  MsgErro4 := '';

  countErro1:=0;
  countErro2:=0;
  countErro3:=0;
  countErro4:=0;
  //----------------------------------------------------------

  //Incluo as colunas: ICMS, ALIQUOTA, CST, CFOP (Na ordem).
  DBGridSaidas.Columns[10].Visible := True;
  DBGridSaidas.Columns[11].Visible := True;
  DBGridSaidas.Columns[12].Visible := True;
  DBGridSaidas.Columns[13].Visible := True;
  //----------------------------------------------------------

  //Removo as colunas: CST_PIS, PPIS, CST_COFINS, PCOFINS (Na ordem).
  DBGridSaidas.Columns[4].Visible := False;
  DBGridSaidas.Columns[5].Visible := False;
  DBGridSaidas.Columns[6].Visible := False;
  DBGridSaidas.Columns[7].Visible := False;
  DBGridSaidas.Columns[8].Visible := False;
  DBGridSaidas.Columns[9].Visible := False;
  //----------------------------------------------------------

      {$region 'CST X CFOP'}
  //Mensagens
  TButton(Sender).Caption := 'Aguarde...';
  Application.ProcessMessages;
  StatusGeral.Caption := 'Consultando CST x CFOP...';
  StatusGeral.Update;
  Application.ProcessMessages;
  //----------------------------------------------------------

  //Seleção do Período - CST x CFOP
  begin
  FDados.CItemVenda.Close;
  FDados.SItemVenda.ParamByName('DATA1').Value := data1.Date;
  FDados.SItemVenda.ParamByName('DATA2').Value := data2.Date;
  FDados.CItemVenda.Open;

  countErro1 := FDados.CItemVenda.RecordCount;
  MsgErro1 := FDados.CItemVendaERRO.AsString;

  end;
  //----------------------------------------------------------
  {$endregion}

      {$region 'CBenef''}
  //Mensagens
  StatusGeral.Caption := 'Consultando Códigos de Benefícios...';
  StatusGeral.Update;
  //----------------------------------------------------------

  //Seleção do Período - cBenef
  Begin
  FDados.CItemVendaCBenef.Close;
  FDados.SItemVendaCBenef.ParamByName('DATA1').Value := data1.Date;
  FDados.SItemVendaCBenef.ParamByName('DATA2').Value := data2.Date;
  FDados.CItemVendaCBenef.Open;
  //----------------------------------------------------------

  //Inclusão dos registros - cBenef
  while not (FDados.CItemVendaCBenef.eof) do
    Begin
      FDados.CItemVenda.Append;
      FDados.CItemVendaCOD_NOTA.AsString := FDados.CItemVendaCBenefCOD_NOTA.AsString;
      FDados.CItemVendaCOD_PROD.AsString := FDados.CItemVendaCBenefCOD_PROD.AsString;
      FDados.CItemVendaNOMEPROD.AsString := FDados.CItemVendaCBenefNOMEPROD.AsString;
      FDados.CItemVendaCST.AsString := FDados.CItemVendaCBenefCST.AsString;
      FDados.CItemVendaCFOP.AsString := FDados.CItemVendaCBenefCFOP.AsString;
      FDados.CItemVendaFINALIDADE.AsString := FDados.CItemVendaCBenefFINALIDADE.AsString;
      FDados.CItemVendaERRO.AsString := FDados.CItemVendaCBenefERRO.AsString;
      FDados.CItemVendaDATA_EMISSAO.AsString :=  FDados.CItemVendaCBenefDATA_EMISSAO.AsString;
      FDados.CItemVendaORIGEM.AsString :=  FDados.CItemVendaCBenefORIGEM.AsString;
      FDados.CItemVendaALIQUOTA.AsString :=  FDados.CItemVendaCBenefALIQUOTA.AsString;
      FDados.CItemVendaICMS.AsString :=  FDados.CItemVendaCBenefICMS.AsString;
      FDados.CItemVenda.Post;
      FDados.CItemVendaCBenef.Next;

      countErro2:= (countErro2)+1;
      MsgErro2 := FDados.CItemVendaCBenefERRO.AsString;

    End;
  End;
  //----------------------------------------------------------
 {$endregion}

      {$region 'Red BC''}
  //Mensagens
  StatusGeral.Caption := 'Consultando Reduções na Base de Cálculo...';
  StatusGeral.Update;
  //----------------------------------------------------------

  //Seleção do Período - Red BC
  Begin
  FDados.CItemVendaRedBC.Close;
  FDados.SItemVendaRedBC.ParamByName('DATA1').Value := data1.Date;
  FDados.SItemVendaRedBC.ParamByName('DATA2').Value := data2.Date;
  FDados.CItemVendaRedBC.Open;
  //----------------------------------------------------------

  //Inclusão dos registros - Red BC
  while not (FDados.CItemVendaRedBC.eof) do
    Begin
      FDados.CItemVenda.Append;
      FDados.CItemVendaCOD_NOTA.AsString := FDados.CItemVendaRedBCCOD_NOTA.AsString;
      FDados.CItemVendaCOD_PROD.AsString := FDados.CItemVendaRedBCCOD_PROD.AsString;
      FDados.CItemVendaNOMEPROD.AsString := FDados.CItemVendaRedBCNOMEPROD.AsString;
      FDados.CItemVendaCST.AsString := FDados.CItemVendaRedBCCST.AsString;
      FDados.CItemVendaCFOP.AsString := FDados.CItemVendaRedBCCFOP.AsString;
      FDados.CItemVendaFINALIDADE.AsString := FDados.CItemVendaRedBCFINALIDADE.AsString;
      FDados.CItemVendaERRO.AsString := FDados.CItemVendaRedBCERRO.AsString;
      FDados.CItemVendaDATA_EMISSAO.AsString :=  FDados.CItemVendaRedBCDATA_EMISSAO.AsString;
      FDados.CItemVendaORIGEM.AsString :=  FDados.CItemVendaRedBCORIGEM.AsString;
      FDados.CItemVendaALIQUOTA.AsString :=  FDados.CItemVendaRedBCALIQUOTA.AsString;
      FDados.CItemVendaICMS.AsString :=  FDados.CItemVendaRedBCICMS.AsString;
      FDados.CItemVenda.Post;
      FDados.CItemVendaRedBC.Next;

      countErro3:= (countErro3)+1;
      MsgErro3 := FDados.CItemVendaRedBCERRO.AsString;
    End;
  End;
  //----------------------------------------------------------
 {$endregion}

      {$region 'Aliquota''}
  //Mensagens
  StatusGeral.Caption := 'Verificando Aliquotas...';
  StatusGeral.Update;
  //----------------------------------------------------------

  //Seleção do Período - Aliquota
  Begin
  FDados.CItemVendaAliq.Close;
  FDados.SItemVendaAliq.ParamByName('DATA1').Value := data1.Date;
  FDados.SItemVendaAliq.ParamByName('DATA2').Value := data2.Date;
  FDados.CItemVendaAliq.Open;
  //----------------------------------------------------------

  //Inclusão dos registros - Aliquota
  while not (FDados.CItemVendaAliq.eof) do
    Begin
      FDados.CItemVenda.Append;
      FDados.CItemVendaCOD_NOTA.AsString := FDados.CItemVendaAliqCOD_NOTA.AsString;
      FDados.CItemVendaCOD_PROD.AsString := FDados.CItemVendaAliqCOD_PROD.AsString;
      FDados.CItemVendaNOMEPROD.AsString := FDados.CItemVendaAliqNOMEPROD.AsString;
      FDados.CItemVendaCST.AsString := FDados.CItemVendaAliqCST.AsString;
      FDados.CItemVendaCFOP.AsString := FDados.CItemVendaAliqCFOP.AsString;
      FDados.CItemVendaFINALIDADE.AsString := FDados.CItemVendaAliqFINALIDADE.AsString;
      FDados.CItemVendaERRO.AsString := FDados.CItemVendaAliqERRO.AsString;
      FDados.CItemVendaDATA_EMISSAO.AsString :=  FDados.CItemVendaAliqDATA_EMISSAO.AsString;
      FDados.CItemVendaORIGEM.AsString :=  FDados.CItemVendaAliqORIGEM.AsString;
      FDados.CItemVendaALIQUOTA.AsString :=  FDados.CItemVendaAliqALIQUOTA.AsString;
      FDados.CItemVendaICMS.AsString :=  FDados.CItemVendaAliqICMS.AsString;
      FDados.CItemVenda.Post;
      FDados.CItemVendaAliq.Next;

      countErro4:= (countErro4)+1;
      MsgErro4 := FDados.CItemVendaAliqERRO.AsString;
    End;
  End;
  //----------------------------------------------------------
  {$endregion}

  //Mensagens
  FFiscal.StaticText1.Visible := True;   //Show Erros Identificados

  if ( (countErro1 = 0) and (countErro2 = 0) and (countErro3 = 0) and (countErro4 = 0) ) then
    begin
      Memo1.Lines.Add('Nenhum erro identificado.');
    end;

  if (countErro1 > 0) then
    Begin
      Memo1.Lines.Add((IntToStr(Round(countErro1))) + ' ' + MsgErro1);
    End;

  if (countErro2 > 0) then
    begin
      Memo1.Lines.Add((IntToStr(Round(countErro2))) + ' ' + MsgErro2);
    end;

  if (countErro3 > 0) then
    begin
      Memo1.Lines.Add((IntToStr(Round(countErro3))) + ' ' + MsgErro3);
    end;

  if (countErro4 > 0) then
    begin
      Memo1.Lines.Add((IntToStr(Round(countErro4))) + ' ' + MsgErro4);
    end;

  TButton(Sender).Caption := 'NFC-e';
  Application.ProcessMessages;
  ShowMessage('Operação Finalizada! Lembrando, NÃO será possível nenhum ajustes em NFC-e, apenas no cadastro do produto que apresentou erro.');
  StatusGeral.Caption := 'Busca ICMS NFC-e Finalizada';
  StatusGeral.Update;
  //----------------------------------------------------------
end;
  {$endregion}

    {$region 'Consulta: NF-e''}
procedure TFFiscal.ButICMSNFeClick(Sender: TObject);
var
  MsgErro1, MsgErro2, MsgErro3, MsgErro4, MsgErro5, MsgErro6 : String;       // Utilizada para mensagem de erro
  countErro1, countErro2, countErro3, countErro4, countErro5, countErro6: Integer;   //Utilizada no contador de linhas

begin
  //Abrir o Grid para NFC-e
  DBGridSaidas.DataSource:=DSItemNotaEmit;
  DBGridSaidas.visible := True;
  Memo1.visible := True;

  DBGridComparacao.visible := False;
  DBGridExtrato.visible := False;
  DBGridEntradas.visible := False;
  DBGridProdutos.visible := False;

  MsgErro1 := '';
  MsgErro2 := '';
  MsgErro3 := '';
  MsgErro4 := '';
  MsgErro5 := '';
  MsgErro6 := '';

  countErro1:=0;
  countErro2:=0;
  countErro3:=0;
  countErro4:=0;
  countErro5:=0;
  countErro6:=0;
  //----------------------------------------------------------

  //Incluo as colunas: ICMS, ALIQUOTA, CST, CFOP (Na ordem).
  DBGridSaidas.Columns[10].Visible := True;
  DBGridSaidas.Columns[11].Visible := True;
  DBGridSaidas.Columns[12].Visible := True;
  DBGridSaidas.Columns[13].Visible := True;
  //----------------------------------------------------------

  //Removo as colunas: CST_PIS, PPIS, CST_COFINS, PCOFINS (Na ordem).
  DBGridSaidas.Columns[4].Visible := False;
  DBGridSaidas.Columns[5].Visible := False;
  DBGridSaidas.Columns[6].Visible := False;
  DBGridSaidas.Columns[7].Visible := False;
  DBGridSaidas.Columns[8].Visible := False;
  DBGridSaidas.Columns[9].Visible := False;
  //----------------------------------------------------------

      {$region 'CST X CFOP'}
  //Mensagens
  TButton(Sender).Caption := 'Aguarde...';
  Application.ProcessMessages;
  StatusGeral.Caption := 'Consultando CST x CFOP...';
  StatusGeral.Update;
  Application.ProcessMessages;
  //----------------------------------------------------------

  //Seleção do Período - CST x CFOP
  begin
  FDados.CItemNotaEmit.Close;
  FDados.SItemNotaEmit.ParamByName('DATA1').Value := data1.Date;
  FDados.SItemNotaEmit.ParamByName('DATA2').Value := data2.Date;
  FDados.CItemNotaEmit.Open;
  //----------------------------------------------------------

    Begin
      while not FDados.CItemNotaEmit.Eof do
        Begin
          If ((FDados.CItemNotaEmitCST.Value = '10') or (FDados.CItemNotaEmitCST.Value = '60') or (FDados.CItemNotaEmitCST.Value = '70')) then
            Begin
              FDados.CItemNotaEmit.edit;
              FDados.CItemNotaEmitALIQUOTA := FDados.CItemNotaEmitALIQUOTA_ST;
              FDados.CItemNotaEmit.Post;
            End;
          FDados.CItemNotaEmit.Next;

          countErro1:= (countErro1)+1;
          MsgErro1 := FDados.CItemNotaEmitERRO.AsString;
        End;
    end;
  end;
  //----------------------------------------------------------
  {$endregion}

      {$region 'CBenef''}
  //Mensagens
  StatusGeral.Caption := 'Consultando Códigos de Benefícios...';
  StatusGeral.Update;
  //----------------------------------------------------------

  //Seleção do Período - cBenef
  Begin
  FDados.CItemNotaEmitCBenef.Close;
  FDados.SItemNotaEmitCBenef.ParamByName('DATA1').Value := data1.Date;
  FDados.SItemNotaEmitCBenef.ParamByName('DATA2').Value := data2.Date;
  FDados.CItemNotaEmitCBenef.Open;
  //----------------------------------------------------------

  //Inclusão dos registros - cBenef
  while not (FDados.CItemNotaEmitCBenef.eof) do
    Begin
      FDados.CItemNotaEmit.Append;
      FDados.CItemNotaEmitCOD_NOTA.AsString :=  FDados.CItemNotaEmitCBenefCOD_NOTA.AsString;
      FDados.CItemNotaEmitCOD_PROD.AsString := FDados.CItemNotaEmitCBenefCOD_PROD.AsString;
      FDados.CItemNotaEmitNOMEPROD.AsString := FDados.CItemNotaEmitCBenefNOMEPROD.AsString;
      FDados.CItemNotaEmitCST.AsString := FDados.CItemNotaEmitCBenefCST.AsString;
      FDados.CItemNotaEmitCFOP.AsString := FDados.CItemNotaEmitCBenefCFOP.AsString;
      FDados.CItemNotaEmitFINALIDADE.AsString := FDados.CItemNotaEmitCBenefFINALIDADE.AsString;
      FDados.CItemNotaEmitERRO.AsString := FDados.CItemNotaEmitCBenefERRO.AsString;
      FDados.CItemNotaEmitDATA_EMISSAO.AsString :=  FDados.CItemNotaEmitCBenefDATA_EMISSAO.AsString;
      FDados.CItemNotaEmitORIGEM.AsString :=  FDados.CItemNotaEmitCBenefORIGEM.AsString;
      FDados.CItemNotaEmitALIQUOTA.AsString :=  FDados.CItemNotaEmitCBenefALIQUOTA.AsString;
      FDados.CItemNotaEmitICMS.AsString := FDados.CItemNotaEmitCBenefICMS.AsString;
      FDados.CItemNotaEmit.Post;
      FDados.CItemNotaEmitCBenef.Next;

      countErro2 := (countErro2)+1;
      MsgErro2 := FDados.CItemNotaEmitCBenefERRO.AsString;
    End;
  End;
  //----------------------------------------------------------
 {$endregion}

      {$region 'Red BC'}
  //Mensagens
  StatusGeral.Caption := 'Consultando Reduções na Base de Cálculo...';
  StatusGeral.Update;
  //----------------------------------------------------------

  //Seleção do Período - Red BC
  Begin
  FDados.CItemNotaEmitRedBC.Close;
  FDados.SItemNotaEmitRedBC.ParamByName('DATA1').Value := data1.Date;
  FDados.SItemNotaEmitRedBC.ParamByName('DATA2').Value := data2.Date;
  FDados.CItemNotaEmitRedBC.Open;
  //----------------------------------------------------------

  //Inclusão dos registros - Red BC
  while not (FDados.CItemNotaEmitRedBC.eof) do
    Begin
      FDados.CItemNotaEmit.Append;
      FDados.CItemNotaEmitCOD_NOTA.AsString :=  FDados.CItemNotaEmitRedBCCOD_NOTA.AsString;
      FDados.CItemNotaEmitCOD_PROD.AsString := FDados.CItemNotaEmitRedBCCOD_PROD.AsString;
      FDados.CItemNotaEmitNOMEPROD.AsString := FDados.CItemNotaEmitRedBCNOMEPROD.AsString;
      FDados.CItemNotaEmitCST.AsString := FDados.CItemNotaEmitRedBCCST.AsString;
      FDados.CItemNotaEmitCFOP.AsString := FDados.CItemNotaEmitRedBCCFOP.AsString;
      FDados.CItemNotaEmitFINALIDADE.AsString := FDados.CItemNotaEmitRedBCFINALIDADE.AsString;
      FDados.CItemNotaEmitERRO.AsString := FDados.CItemNotaEmitRedBCERRO.AsString;
      FDados.CItemNotaEmitDATA_EMISSAO.AsString :=  FDados.CItemNotaEmitRedBCDATA_EMISSAO.AsString;
      FDados.CItemNotaEmitORIGEM.AsString :=  FDados.CItemNotaEmitRedBCORIGEM.AsString;
      FDados.CItemNotaEmitALIQUOTA.AsString :=  FDados.CItemNotaEmitRedBCALIQUOTA.AsString;
      FDados.CItemNotaEmitICMS.AsString := FDados.CItemNotaEmitRedBCICMS.AsString;
      FDados.CItemNotaEmit.Post;
      FDados.CItemNotaEmitRedBC.Next;

      countErro3 := (countErro3)+1;
      MsgErro3 := FDados.CItemNotaEmitRedBCERRO.AsString;
    End;
  End;
  //----------------------------------------------------------
 {$endregion}

      {$region 'MVA'}
  //Mensagens
  StatusGeral.Caption := 'Analisando as Operações sujeitas a MVA...';
  StatusGeral.Update;
  //----------------------------------------------------------

  //Seleção do Período - MVA
  Begin
  FDados.CItemNotaEmitMVA.Close;
  FDados.SItemNotaEmitMVA.ParamByName('DATA1').Value := data1.Date;
  FDados.SItemNotaEmitMVA.ParamByName('DATA2').Value := data2.Date;
  FDados.CItemNotaEmitMVA.Open;
  //----------------------------------------------------------

  //Inclusão dos registros - MVA
  while not (FDados.CItemNotaEmitMVA.eof) do
    Begin
      FDados.CItemNotaEmit.Append;
      FDados.CItemNotaEmitCOD_NOTA.AsString :=  FDados.CItemNotaEmitMVACOD_NOTA.AsString;
      FDados.CItemNotaEmitCOD_PROD.AsString := FDados.CItemNotaEmitMVACOD_PROD.AsString;
      FDados.CItemNotaEmitNOMEPROD.AsString := FDados.CItemNotaEmitMVANOMEPROD.AsString;
      FDados.CItemNotaEmitCST.AsString := FDados.CItemNotaEmitMVACST.AsString;
      FDados.CItemNotaEmitCFOP.AsString := FDados.CItemNotaEmitMVACFOP.AsString;
      FDados.CItemNotaEmitFINALIDADE.AsString := FDados.CItemNotaEmitMVAFINALIDADE.AsString;
      FDados.CItemNotaEmitERRO.AsString := FDados.CItemNotaEmitMVAERRO.AsString;
      FDados.CItemNotaEmitDATA_EMISSAO.AsString :=  FDados.CItemNotaEmitMVADATA_EMISSAO.AsString;
      FDados.CItemNotaEmitORIGEM.AsString :=  FDados.CItemNotaEmitMVAORIGEM.AsString;
      FDados.CItemNotaEmitALIQUOTA.AsString :=  FDados.CItemNotaEmitMVAALIQUOTA.AsString;
      FDados.CItemNotaEmitICMS.AsString := FDados.CItemNotaEmitMVAICMS.AsString;
      FDados.CItemNotaEmit.Post;
      FDados.CItemNotaEmitMVA.Next;

      countErro4 := (countErro4)+1;
      MsgErro4 := FDados.CItemNotaEmitMVAERRO.AsString;
    End;
  End;
  //----------------------------------------------------------
 {$endregion}

      {$region 'Aliquota'}
  //Mensagens
  StatusGeral.Caption := 'Verificando Aliquotas...';
  StatusGeral.Update;
  //----------------------------------------------------------

  //Seleção do Período - Aliquota
  Begin
  FDados.CItemNotaEmitAliq.Close;
  FDados.SItemNotaEmitAliq.ParamByName('DATA1').Value := data1.Date;
  FDados.SItemNotaEmitAliq.ParamByName('DATA2').Value := data2.Date;
  FDados.CItemNotaEmitAliq.Open;
  //----------------------------------------------------------

  //Inclusão dos registros - Aliquota
  while not (FDados.CItemNotaEmitAliq.eof) do
    Begin
      FDados.CItemNotaEmit.Append;
      FDados.CItemNotaEmitCOD_NOTA.AsString :=  FDados.CItemNotaEmitAliqCOD_NOTA.AsString;
      FDados.CItemNotaEmitCOD_PROD.AsString := FDados.CItemNotaEmitAliqCOD_PROD.AsString;
      FDados.CItemNotaEmitNOMEPROD.AsString := FDados.CItemNotaEmitAliqNOMEPROD.AsString;
      FDados.CItemNotaEmitCST.AsString := FDados.CItemNotaEmitAliqCST.AsString;
      FDados.CItemNotaEmitCFOP.AsString := FDados.CItemNotaEmitAliqCFOP.AsString;
      FDados.CItemNotaEmitFINALIDADE.AsString := FDados.CItemNotaEmitAliqFINALIDADE.AsString;
      FDados.CItemNotaEmitERRO.AsString := FDados.CItemNotaEmitAliqERRO.AsString;
      FDados.CItemNotaEmitDATA_EMISSAO.AsString :=  FDados.CItemNotaEmitAliqDATA_EMISSAO.AsString;
      FDados.CItemNotaEmitORIGEM.AsString :=  FDados.CItemNotaEmitAliqORIGEM.AsString;
      FDados.CItemNotaEmitALIQUOTA.AsString :=  FDados.CItemNotaEmitAliqALIQUOTA.AsString;
      FDados.CItemNotaEmitICMS.AsString := FDados.CItemNotaEmitAliqICMS.AsString;
      FDados.CItemNotaEmit.Post;
      FDados.CItemNotaEmitAliq.Next;

      countErro5:= (countErro5)+1;
      MsgErro5:=FDados.CItemNotaEmitAliqERRO.AsString;
    End;
  End;
  //----------------------------------------------------------
 {$endregion}

      {$region 'Natureza de Operação'}
  //Mensagens
  StatusGeral.Caption := 'Verificando as Naturezas de Operação x CFOP...';
  StatusGeral.Update;
  //----------------------------------------------------------

  //Seleção do Período - Natureza de Operação
  Begin
  FDados.CItemNotaEmitNat.Close;
  FDados.SItemNotaEmitNat.ParamByName('DATA1').Value := data1.Date;
  FDados.SItemNotaEmitNat.ParamByName('DATA2').Value := data2.Date;
  FDados.CItemNotaEmitNat.Open;
  //----------------------------------------------------------

  //Inclusão dos registros - Natureza de Operação
  while not (FDados.CItemNotaEmitNat.eof) do
    Begin
      FDados.CItemNotaEmit.Append;
      FDados.CItemNotaEmitCOD_NOTA.AsString :=  FDados.CItemNotaEmitNatCOD_NOTA.AsString;
      FDados.CItemNotaEmitCOD_PROD.AsString := FDados.CItemNotaEmitNatCOD_PROD.AsString;
      FDados.CItemNotaEmitNOMEPROD.AsString := FDados.CItemNotaEmitNatNOMEPROD.AsString;
      FDados.CItemNotaEmitCST.AsString := FDados.CItemNotaEmitNatCST.AsString;
      FDados.CItemNotaEmitCFOP.AsString := FDados.CItemNotaEmitNatCFOP.AsString;
      FDados.CItemNotaEmitFINALIDADE.AsString := FDados.CItemNotaEmitNatFINALIDADE.AsString;
      FDados.CItemNotaEmitERRO.AsString := FDados.CItemNotaEmitNatERRO.AsString;
      FDados.CItemNotaEmitDATA_EMISSAO.AsString :=  FDados.CItemNotaEmitNatDATA_EMISSAO.AsString;
      FDados.CItemNotaEmitORIGEM.AsString :=  FDados.CItemNotaEmitNatORIGEM.AsString;
      FDados.CItemNotaEmitALIQUOTA.AsString :=  FDados.CItemNotaEmitNatALIQUOTA.AsString;
      FDados.CItemNotaEmitICMS.AsString := FDados.CItemNotaEmitNatICMS.AsString;
      FDados.CItemNotaEmit.Post;
      FDados.CItemNotaEmitNat.Next;

      countErro6:= (countErro6)+1;
      MsgErro6:= FDados.CItemNotaEmitNatERRO.AsString;
    End;
  End;
  //----------------------------------------------------------
 {$endregion}

  //Mensagens
  FFiscal.StaticText1.Visible := True;   //Show Erros Identificados

  if ( (countErro1 = 0) and (countErro2 = 0) and (countErro3 = 0) and (countErro4 = 0) and (countErro5 = 0) and (countErro6 = 0) ) then
    begin
      Memo1.Lines.Add('Nenhum erro identificado.');
    end;

  if (countErro1 > 0) then
    Begin
      Memo1.Lines.Add((IntToStr(Round(countErro1))) + ' ' + MsgErro1);
    End;

  if (countErro2 > 0) then
    begin
      Memo1.Lines.Add((IntToStr(Round(countErro2))) + ' ' + MsgErro2);
    end;

  if (countErro3 > 0) then
    begin
      Memo1.Lines.Add((IntToStr(Round(countErro3))) + ' ' + MsgErro3);
    end;

  if (countErro4 > 0) then
    begin
      Memo1.Lines.Add((IntToStr(Round(countErro4))) + ' ' + MsgErro4);
    end;

  if (countErro5 > 0) then
    begin
      Memo1.Lines.Add((IntToStr(Round(countErro5))) + ' ' + MsgErro5);
    end;

  if (countErro6 > 0) then
    begin
      Memo1.Lines.Add((IntToStr(Round(countErro6))) + ' ' + MsgErro6);
    end;

  TButton(Sender).Caption := 'NF-e';
  Application.ProcessMessages;
  ShowMessage('Operação Finalizada! Lembrando, NÃO será possível nenhum ajustes em NF-e, apenas no cadastro do produto que apresentou erro.');
  StatusGeral.Caption := 'Busca ICMS NF-e Finalizada.';
  StatusGeral.Update;
  //----------------------------------------------------------

end;


{$endregion}

    {$region 'Consulta: Entradas''}
procedure TFFiscal.ButICMSEntClick(Sender: TObject);
var
  MsgErro1, MsgErro2, MsgErro3: String;       // Utilizada para mensagem de erro
  countErro1, countErro2, countErro3: Integer;   //Utilizada no contador de linhas

begin
  //Abrir o Grid para NFC-e
  DBGridEntradas.DataSource:=DSItemNotaEnt;
  DBGridEntradas.visible := True;
  Memo1.visible := True;

  DBGridProdutos.visible := False;
  DBGridComparacao.visible := False;
  DBGridExtrato.visible := False;
  DBGridSaidas.visible := False;

  MsgErro1 := '';
  MsgErro2 := '';
  MsgErro3 := '';

  countErro1:=0;
  countErro2:=0;
  countErro3:=0;
  //----------------------------------------------------------

  //Incluo as colunas: CST_CSOSN_FORN, CFOP_FORN, FINALIDADE (Na ordem).
  DBGridEntradas.Columns[8].Visible := True;
  DBGridEntradas.Columns[9].Visible := True;
  DBGridEntradas.Columns[13].Visible := True;
  //----------------------------------------------------------

  //Removo as colunas: PIS_CST_ENTRADA, COFINS_CST_ENTRADA (Na ordem).
  DBGridEntradas.Columns[6].Visible := False;
  DBGridEntradas.Columns[7].Visible := False;
  //----------------------------------------------------------

      {$region 'CFOP x CST Entrada x CFOP Entrada'}
  //Mensagens
  TButton(Sender).Caption := 'Aguarde...';
  Application.ProcessMessages;
  StatusGeral.Caption := 'Consultando CFOP x CST Entrada x CFOP Entrada...';
  StatusGeral.Update;
  Application.ProcessMessages;
  //----------------------------------------------------------

  //Seleção do Período - CST x CFOP
  begin
    FDados.CItemNotaEnt.Close;
    FDados.SItemNotaEnt.ParamByName('DATA1').Value := data1.Date;
    FDados.SItemNotaEnt.ParamByName('DATA2').Value := data2.Date;
    FDados.CItemNotaEnt.Open;

    countErro1 := FDados.CItemNotaEnt.RecordCount;
    MsgErro1 := FDados.CItemNotaEntERRO.AsString;

  end;
  //----------------------------------------------------------
  {$endregion}

      {$region 'CST x CST Entrada''}
  //Mensagens
  StatusGeral.Caption := 'Verificando CST x CST Entrada...';
  StatusGeral.Update;
  //----------------------------------------------------------

  //Seleção do Período - CST x CST Entrada
  Begin
  FDados.CItemNotaEntCST.Close;
  FDados.SItemNotaEntCST.ParamByName('DATA1').Value := data1.Date;
  FDados.SItemNotaEntCST.ParamByName('DATA2').Value := data2.Date;
  FDados.CItemNotaEntCST.Open;
  //----------------------------------------------------------

  //Inclusão dos registros - CST x CST Entrada
  while not (FDados.CItemNotaEntCST.eof) do
    Begin
      FDados.CItemNotaEnt.Append;
      FDados.CItemNotaEntDATA_RECEBIM.AsString :=  FDados.CItemNotaEntCSTDATA_RECEBIM.AsString;
      FDados.CItemNotaEntDATA_EMISSAO.AsString :=  FDados.CItemNotaEntCSTDATA_EMISSAO.AsString;
      FDados.CItemNotaEntCOD_NOTA.AsString :=  FDados.CItemNotaEntCSTCOD_NOTA.AsString;
      FDados.CItemNotaEntXML.AsString :=  FDados.CItemNotaEntCSTXML.AsString;
      FDados.CItemNotaEntCOD_PROD.AsString := FDados.CItemNotaEntCSTCOD_PROD.AsString;
      FDados.CItemNotaEntNOMEPROD.AsString := FDados.CItemNotaEntCSTNOMEPROD.AsString;
      FDados.CItemNotaEntCST_CSOSN_FORN.AsString :=  FDados.CItemNotaEntCSTCST_CSOSN_FORN.AsString;
      FDados.CItemNotaEntCFOP_FORN.AsString :=  FDados.CItemNotaEntCSTCFOP_FORN.AsString;
      FDados.CItemNotaEntCST_ENTRADA.AsString := FDados.CItemNotaEntCSTCST_ENTRADA.AsString;
      FDados.CItemNotaEntCFOP_ENTRADA.AsString := FDados.CItemNotaEntCSTCFOP_ENTRADA.AsString;
      FDados.CItemNotaEntERRO.AsString := FDados.CItemNotaEntCSTERRO.AsString;
      FDados.CItemNotaEntFINALIDADE.AsString := FDados.CItemNotaEntCSTFINALIDADE.AsString;
      FDados.CItemNotaEntTIPO_EMP.AsString := FDados.CItemNotaEntCSTTIPO_EMP.AsString;
      FDados.CItemNotaEntITEM_NOTA.AsInteger := FDados.CItemNotaEntCSTITEM_NOTA.AsInteger;
      FDados.CItemNotaEntMAX_ITEM.AsInteger := FDados.CItemNotaEntCSTMAX_ITEM.AsInteger;
      FDados.CItemNotaEnt.Post;
      FDados.CItemNotaEntCST.Next;

      countErro2:= (countErro2)+1;
      MsgErro2:= FDados.CItemNotaEntCSTERRO.AsString;
    End;
  End;
  //----------------------------------------------------------
 {$endregion}

      {$region 'CFOP x CFOP Entrada'}
  //Mensagens
  StatusGeral.Caption := 'Verificando CFOP x CFOP Entrada...';
  StatusGeral.Update;
  //----------------------------------------------------------

  //Seleção do Período - CFOP x CFOP Entrada
  Begin
  FDados.CItemNotaEntCFOP.Close;
  FDados.SItemNotaEntCFOP.ParamByName('DATA1').Value := data1.Date;
  FDados.SItemNotaEntCFOP.ParamByName('DATA2').Value := data2.Date;
  FDados.CItemNotaEntCFOP.Open;
  //----------------------------------------------------------

  //Inclusão dos registros - CFOP x CFOP Entrada

    while not (FDados.CItemNotaEntCFOP.eof) do
    Begin
      FDados.CItemNotaEnt.Append;
      FDados.CItemNotaEntDATA_RECEBIM.AsString :=  FDados.CItemNotaEntCFOPDATA_RECEBIM.AsString;
      FDados.CItemNotaEntDATA_EMISSAO.AsString :=  FDados.CItemNotaEntCFOPDATA_EMISSAO.AsString;
      FDados.CItemNotaEntCOD_NOTA.AsString :=  FDados.CItemNotaEntCFOPCOD_NOTA.AsString;
      FDados.CItemNotaEntXML.AsString :=  FDados.CItemNotaEntCFOPXML.AsString;
      FDados.CItemNotaEntCOD_PROD.AsString := FDados.CItemNotaEntCFOPCOD_PROD.AsString;
      FDados.CItemNotaEntNOMEPROD.AsString := FDados.CItemNotaEntCFOPNOMEPROD.AsString;
      FDados.CItemNotaEntCST_CSOSN_FORN.AsString :=  FDados.CItemNotaEntCFOPCST_CSOSN_FORN.AsString;
      FDados.CItemNotaEntCFOP_FORN.AsString :=  FDados.CItemNotaEntCFOPCFOP_FORN.AsString;
      FDados.CItemNotaEntCST_ENTRADA.AsString := FDados.CItemNotaEntCFOPCST_ENTRADA.AsString;
      FDados.CItemNotaEntCFOP_ENTRADA.AsString := FDados.CItemNotaEntCFOPCFOP_ENTRADA.AsString;
      FDados.CItemNotaEntERRO.AsString := FDados.CItemNotaEntCFOPERRO.AsString;
      FDados.CItemNotaEntFINALIDADE.AsString := FDados.CItemNotaEntCFOPFINALIDADE.AsString;
      FDados.CItemNotaEntTIPO_EMP.AsString := FDados.CItemNotaEntCFOPTIPO_EMP.AsString;
      FDados.CItemNotaEntITEM_NOTA.AsInteger := FDados.CItemNotaEntCFOPITEM_NOTA.AsInteger;
      FDados.CItemNotaEntMAX_ITEM.AsInteger := FDados.CItemNotaEntCFOPMAX_ITEM.AsInteger;
      FDados.CItemNotaEnt.Post;
      FDados.CItemNotaEntCFOP.Next;

      countErro3:= (countErro3)+1;
      MsgErro3:= FDados.CItemNotaEntCFOPERRO.AsString;
    End;
  End;
  //----------------------------------------------------------
 {$endregion}

  //Mensagens
  FFiscal.StaticText1.Visible := True;   //Show Erros Identificados

  if ( (countErro1 = 0) and (countErro2 = 0) and (countErro3 = 0) ) then
    begin
      Memo1.Lines.Add( 'Nenhum erro identificado.');
    end;

  if (countErro1 > 0) then
    Begin
      Memo1.Lines.Add((IntToStr(Round(countErro1))) + ' ' + MsgErro1);
    End;

  if (countErro2 > 0) then
    begin
      Memo1.Lines.Add((IntToStr(Round(countErro2))) + ' ' + MsgErro2);
    end;

  if (countErro3 > 0) then
    begin
      Memo1.Lines.Add((IntToStr(Round(countErro3))) + ' ' + MsgErro3);
    end;

  TButton(Sender).Caption := 'Entradas';
  Application.ProcessMessages;
  ShowMessage('Operação Finalizada!');
  StatusGeral.Caption := 'Busca ICMS Entradas Finalizada';
  StatusGeral.Update;
  //----------------------------------------------------------

end;
{$endregion}

{$endregion}

{$region 'Conferências: Pis/Cofins'}

    {$region 'Consulta: NFC-e''}
procedure TFFiscal.ButContrNFCeClick(Sender: TObject);
var
  MsgErro1, MsgErro2, MsgErro3: String;       // Utilizada para mensagem de erro
  countErro1, countErro2, countErro3: Integer;   //Utilizada no contador de linhas

begin
  //Abrir o Grid para NFC-e
  DBGridSaidas.DataSource := DSItemVendaPC;
  DBGridSaidas.visible := True;
  Memo1.visible := True;

  DBGridProdutos.visible := False;
  DBGridComparacao.visible := False;
  DBGridExtrato.visible := False;
  DBGridEntradas.visible := False;

  MsgErro1 := '';
  MsgErro2 := '';
  MsgErro3 := '';

  countErro1:=0;
  countErro2:=0;
  countErro3:=0;
  //----------------------------------------------------------

  //Incluo as colunas: CST_PIS, PPIS, CST_COFINS, PCOFINS (Na ordem).
  DBGridSaidas.Columns[4].Visible := True;
  DBGridSaidas.Columns[5].Visible := True;
  DBGridSaidas.Columns[6].Visible := True;
  DBGridSaidas.Columns[7].Visible := True;
  DBGridSaidas.Columns[8].Visible := True;
  DBGridSaidas.Columns[9].Visible := True;
  //----------------------------------------------------------

  //Removo as colunas: ICMS, ALIQUOTA, CST, CFOP   (Na ordem).
  DBGridSaidas.Columns[10].Visible := False;
  DBGridSaidas.Columns[11].Visible := False;
  DBGridSaidas.Columns[12].Visible := False;
  DBGridSaidas.Columns[13].Visible := False;
  //----------------------------------------------------------

        {$region 'CST Pis X CST Cofins'}
  //Mensagens
  TButton(Sender).Caption := 'Aguarde...';
  Application.ProcessMessages;
  StatusGeral.Caption := 'Consultando CST Pis x CST Cofins...';
  StatusGeral.Update;
  Application.ProcessMessages;
  //----------------------------------------------------------

  //Seleção do Período - CST Pis x CST Cofins
  begin
  FDados.CItemVendaPC.Close;
  FDados.SItemVendaPC.ParamByName('DATA1').Value := data1.Date;
  FDados.SItemVendaPC.ParamByName('DATA2').Value := data2.Date;
  FDados.CItemVendaPC.Open;
  //----------------------------------------------------------

  //Troca os dados de Tipo de cálculo
    Begin
      while not FDados.CItemVendaPC.Eof do
       Begin
        FDados.CItemVendaPC.edit;
        //Trocando nome EM PERCENTUAL do PIS para %
          If (FDados.CItemVendaPCTIPO_CALCULO_PIS.Value = 'Em Valor') then
            Begin
              FDados.CItemVendaPCTIPO_CALCULO_PIS.AsString := '$';
            End
        //Trocando nome EM VALOR do PIS para $
          Else If (FDados.CItemVendaPCTIPO_CALCULO_PIS.Value = 'Em Percentual') then
            Begin
              FDados.CItemVendaPCTIPO_CALCULO_PIS.AsString := '%';
            End

        //Se não tiver nada mostra X
          Else
            Begin
              FDados.CItemVendaPCTIPO_CALCULO_PIS.AsString := '-';
            End;
       //----------------------------------------------------------

        //Trocando nome EM PERCENTUAL do COFINS para %
          If (FDados.CItemVendaPCTIPO_CALCULO_COFINS.Value = 'Em Valor') then
            Begin
              FDados.CItemVendaPCTIPO_CALCULO_COFINS.AsString := '$';
            End

        //Trocando nome EM VALOR do COFINS para $
          Else If (FDados.CItemVendaPCTIPO_CALCULO_COFINS.Value = 'Em Percentual') then
            Begin
              FDados.CItemVendaPCTIPO_CALCULO_COFINS.AsString := '%';
            End

        //Se não tiver nada mostra X
          Else
            Begin
              FDados.CItemVendaPCTIPO_CALCULO_COFINS.AsString := '-';
            End;
       //----------------------------------------------------------
        FDados.CItemVendaPC.Post;
        FDados.CItemVendaPC.Next;

        countErro1:=(countErro1)+1;
        MsgErro1:=FDados.CItemVendaPCERRO.AsString;

       End;
    End;
  End;
  //----------------------------------------------------------
  {$endregion}

        {$region 'Aliquota'}
  //Mensagens
  StatusGeral.Caption := 'Consultando Alíquotas Pis/Cofins...';
  StatusGeral.Update;
  //----------------------------------------------------------

  //Seleção do Período - Aliquota
  Begin
  FDados.CItemVendaAliqPC.Close;
  FDados.SItemVendaAliqPC.ParamByName('DATA1').Value := data1.Date;
  FDados.SItemVendaAliqPC.ParamByName('DATA2').Value := data2.Date;
  //----------------------------------------------------------

  //Identificando a Aliquota trabalhada
  If (CheckCum.Checked = True) then
     Begin
      FDados.SItemVendaAliqPC.ParamByName('ALIQPIS').Value := 0.65;
      FDados.SItemVendaAliqPC.ParamByName('ALIQCOFINS').Value := 3;
     End
  Else If (CheckNCum.Checked = True) then
     Begin
      FDados.SItemVendaAliqPC.ParamByName('ALIQPIS').Value := 1.65;
      FDados.SItemVendaAliqPC.ParamByName('ALIQCOFINS').Value := 7.6;
     End;
  FDados.CItemVendaAliqPC.Open;
  //----------------------------------------------------------

  //Inclusão dos registros - Aliquota
  If (CheckNCum.Checked= True) or (CheckCum.Checked = True) then
    Begin
      while not (FDados.CItemVendaAliqPC.eof) do
        Begin
         FDados.CItemVendaPC.Append;
         FDados.CItemVendaPCCOD_NOTA.AsString := FDados.CItemVendaAliqPCCOD_NOTA.AsString;
         FDados.CItemVendaPCCOD_PROD.AsString := FDados.CItemVendaAliqPCCOD_PROD.AsString;
         FDados.CItemVendaPCNOMEPROD.AsString := FDados.CItemVendaAliqPCNOMEPROD.AsString;
         FDados.CItemVendaPCCST_PIS.AsString := FDados.CItemVendaAliqPCCST_PIS.AsString;
         FDados.CItemVendaPCPPIS.AsString:= FDados.CItemVendaAliqPCPPIS.AsString;
         FDados.CItemVendaPCCST_COFINS.AsString := FDados.CItemVendaAliqPCCST_COFINS.AsString;
         FDados.CItemVendaPCPCOFINS.AsString := FDados.CItemVendaAliqPCPCOFINS.AsString;
         FDados.CItemVendaPCFINALIDADE.AsString := FDados.CItemVendaAliqPCFINALIDADE.AsString;
         FDados.CItemVendaPCERRO.AsString := FDados.CItemVendaAliqPCERRO.AsString;
         FDados.CItemVendaPCDATA_EMISSAO.AsString :=  FDados.CItemVendaAliqPCDATA_EMISSAO.AsString;
         FDados.CItemVendaPCORIGEM.AsString :=  FDados.CItemVendaAliqPCORIGEM.AsString;

          //Trocando nome EM PERCENTUAL do PIS para %
          If (FDados.CItemVendaAliqPCTIPO_CALCULO_PIS.value='Em Percentual') then
            Begin
              FDados.CItemVendaPCTIPO_CALCULO_PIS.AsString := '%';
            End
          //Trocando nome EM VALOR do PIS para $
          Else If (FDados.CItemVendaAliqPCTIPO_CALCULO_PIS.value='Em Valor') then
            Begin
              FDados.CItemVendaPCTIPO_CALCULO_PIS.AsString := '$';
            End
          //Se não tiver nada mostra X
          Else
            Begin
              FDados.CItemVendaPCTIPO_CALCULO_PIS.AsString := '-';
            End;
        //----------------------------------------------------------

          //Trocando nome EM PERCENTUAL do COFINS para %
          If (FDados.CItemVendaAliqPCTIPO_CALCULO_COFINS.value='Em Percentual') then
            Begin
              FDados.CItemVendaPCTIPO_CALCULO_COFINS.AsString := '%';
            End
          //Trocando nome EM VALOR do COFINS para $
          Else If (FDados.CItemVendaAliqPCTIPO_CALCULO_COFINS.value='Em Valor') then
            Begin
              FDados.CItemVendaPCTIPO_CALCULO_COFINS.AsString := '$';
            End
          //Se não tiver nada mostra X
          Else
            Begin
              FDados.CItemVendaPCTIPO_CALCULO_COFINS.AsString := '-';
            End;
        //----------------------------------------------------------
          FDados.CItemVendaPC.Post;
          FDados.CItemVendaAliqPC.Next;

          countErro2:=(countErro2)+1;
          MsgErro2:= FDados.CItemVendaAliqPCERRO.AsString;
        End;
    End
  Else
    Begin
      ShowMessage('Selecione opção de Aliquota: Não Cumulativa, ou, Cumulativa!');
    End;
  End;
  //----------------------------------------------------------
        {$endregion}

        {$region 'Natureza Pis / Cofins''}
  //Mensagens
  StatusGeral.Caption := 'Consultando Naturezas de Receitas...';
  StatusGeral.Update;
  //----------------------------------------------------------

  //Seleção do Período - cBenef
  Begin
  FDados.CItemVendaNatPC.Close;
  FDados.SItemVendaNatPC.ParamByName('DATA1').Value := data1.Date;
  FDados.SItemVendaNatPC.ParamByName('DATA2').Value := data2.Date;
  FDados.CItemVendaNatPC.Open;
  //----------------------------------------------------------

  //Inclusão dos registros - cBenef
  while not (FDados.CItemVendaNatPC.eof) do
    Begin
      FDados.CItemVendaPC.Append;
      FDados.CItemVendaPCCOD_NOTA.AsString := FDados.CItemVendaNatPCCOD_NOTA.AsString;
      FDados.CItemVendaPCCOD_PROD.AsString := FDados.CItemVendaNatPCCOD_PROD.AsString;
      FDados.CItemVendaPCNOMEPROD.AsString := FDados.CItemVendaNatPCNOMEPROD.AsString;
      FDados.CItemVendaPCCST_PIS.AsString := FDados.CItemVendaNatPCCST_PIS.AsString;
      FDados.CItemVendaPCCST_COFINS.AsString := FDados.CItemVendaNatPCCST_COFINS.AsString;
      FDados.CItemVendaPCPPIS.AsString:= FDados.CItemVendaNatPCPPIS.AsString;
      FDados.CItemVendaPCPCOFINS.AsString := FDados.CItemVendaNatPCPCOFINS.AsString;
      FDados.CItemVendaPCFINALIDADE.AsString := FDados.CItemVendaNatPCFINALIDADE.AsString;
      FDados.CItemVendaPCERRO.AsString := FDados.CItemVendaNatPCERRO.AsString;
      FDados.CItemVendaPCDATA_EMISSAO.AsString :=  FDados.CItemVendaNatPCDATA_EMISSAO.AsString;
      FDados.CItemVendaPCORIGEM.AsString :=  FDados.CItemVendaNatPCORIGEM.AsString;

      //Trocando nome EM PERCENTUAL do PIS para %
      If (FDados.CItemVendaNatPCTIPO_CALCULO_PIS.value='Em Percentual') then
          Begin
            FDados.CItemVendaPCTIPO_CALCULO_PIS.AsString := '%';
          End
    //Trocando nome EM VALOR do PIS para $
    Else If (FDados.CItemVendaNatPCTIPO_CALCULO_PIS.value='Em Valor') then
          Begin
            FDados.CItemVendaPCTIPO_CALCULO_PIS.AsString := '$';
          End
    //Se não tiver nada mostra X
    Else
          Begin
            FDados.CItemVendaPCTIPO_CALCULO_PIS.AsString := '-';
          End;
    //----------------------------------------------------------

      //Trocando nome EM PERCENTUAL do COFINS para %
      If (FDados.CItemVendaNatPCTIPO_CALCULO_COFINS.value='Em Percentual') then
          Begin
            FDados.CItemVendaPCTIPO_CALCULO_COFINS.AsString := '%';
          End
      //Trocando nome EM VALOR do COFINS para $
      Else If (FDados.CItemVendaNatPCTIPO_CALCULO_COFINS.value='Em Valor') then
          Begin
            FDados.CItemVendaPCTIPO_CALCULO_COFINS.AsString := '$';
          End
      //Se não tiver nada mostra X
      Else
          Begin
            FDados.CItemVendaPCTIPO_CALCULO_COFINS.AsString := '-';
          End;
    //----------------------------------------------------------
      FDados.CItemVendaPC.Post;
      FDados.CItemVendaNatPC.Next;

      countErro3:=(countErro3)+1;
      MsgErro3:= FDados.CItemVendaNatPCERRO.AsString;

    End;
  End;
  //----------------------------------------------------------
 {$endregion}

  //Mensagens
  FFiscal.StaticText1.Visible := True;   //Show Erros Identificados

  if ( (countErro1 = 0) and (countErro2 = 0) and (countErro3 = 0) ) then
    begin
      Memo1.Lines.Add('Nenhum erro identificado.');
    end;

  if (countErro1 > 0) then
    Begin
      Memo1.Lines.Add((IntToStr(Round(countErro1))) + ' ' + MsgErro1);
    End;

  if (countErro2 > 0) then
    begin
      Memo1.Lines.Add((IntToStr(Round(countErro2))) + ' ' + MsgErro2);
    end;

  if (countErro3 > 0) then
    begin
      Memo1.Lines.Add((IntToStr(Round(countErro3))) + ' ' + MsgErro3);
    end;

  TButton(Sender).Caption := 'NFC-e';
  Application.ProcessMessages;
  ShowMessage('Operação Finalizada!');
  StatusGeral.Caption := 'Busca Pis/Cofins NFC-e Finalizada. Lembrando, NÃO será possível nenhum ajustes em NFC-e, apenas no cadastro do produto que apresentou erro.';
  StatusGeral.Update;
  //----------------------------------------------------------
end;
  {$endregion}

    {$region 'Consulta: NF-e''}
procedure TFFiscal.ButContrNFeClick(Sender: TObject);
var
  MsgErro1, MsgErro2, MsgErro3, MsgErro4: String;       // Utilizada para mensagem de erro
  countErro1, countErro2, countErro3, countErro4: Integer;   //Utilizada no contador de linhas

begin
  //Abrir o Grid para NF-e
  DBGridSaidas.DataSource := DSItemNotaEmitPC;
  DBGridSaidas.visible := True;
  Memo1.visible := True;

  DBGridProdutos.visible := False;
  DBGridComparacao.visible := False;
  DBGridExtrato.visible := False;
  DBGridEntradas.visible := False;

  MsgErro1 := '';
  MsgErro2 := '';
  MsgErro3 := '';
  MsgErro4 := '';

  countErro1:=0;
  countErro2:=0;
  countErro3:=0;
  countErro4:=0;
  //----------------------------------------------------------

  //Incluo as colunas: CST_PIS, PPIS, CST_COFINS, PCOFINS (Na ordem).
  DBGridSaidas.Columns[4].Visible := True;
  DBGridSaidas.Columns[5].Visible := True;
  DBGridSaidas.Columns[6].Visible := True;
  DBGridSaidas.Columns[7].Visible := True;
  DBGridSaidas.Columns[8].Visible := True;
  DBGridSaidas.Columns[9].Visible := True;
  //----------------------------------------------------------

  //Removo as colunas: ICMS, ALIQUOTA, CST, CFOP (Na ordem).
  DBGridSaidas.Columns[10].Visible := False;
  DBGridSaidas.Columns[11].Visible := False;
  DBGridSaidas.Columns[12].Visible := False;
  DBGridSaidas.Columns[13].Visible := False;
  //----------------------------------------------------------

        {$region 'CST Pis X CST Cofins'}
  //Mensagens
  TButton(Sender).Caption := 'Aguarde...';
  Application.ProcessMessages;
  StatusGeral.Caption := 'Consultando CST Pis x CST Cofins...';
  StatusGeral.Update;
  Application.ProcessMessages;
  //----------------------------------------------------------

  //Seleção do Período - CST Pis x CST Cofins
  begin
  FDados.CItemNotaEmitPC.Close;
  FDados.SItemNotaEmitPC.ParamByName('DATA1').Value := data1.Date;
  FDados.SItemNotaEmitPC.ParamByName('DATA2').Value := data2.Date;
  FDados.CItemNotaEmitPC.Open;

    //Troca os dados de Tipo de cálculo
    Begin
      while not FDados.CItemNotaEmitPC.Eof do
      Begin
      FDados.CItemNotaEmitPC.edit;
      //Trocando nome EM PERCENTUAL do PIS para %
        If (FDados.CItemNotaEmitPCTIPO_CALCULO_PIS.Value = 'Em Valor') then
          Begin
            FDados.CItemNotaEmitPCTIPO_CALCULO_PIS.AsString := '$';
          End
      //Trocando nome EM VALOR do PIS para $
        Else If (FDados.CItemNotaEmitPCTIPO_CALCULO_PIS.Value = 'Em Percentual') then
          Begin
            FDados.CItemNotaEmitPCTIPO_CALCULO_PIS.AsString := '%';
          End

      //Se não tiver nada mostra X
        Else
          Begin
            FDados.CItemNotaEmitPCTIPO_CALCULO_PIS.AsString := '-';
          End;
      //----------------------------------------------------------

      //Trocando nome EM PERCENTUAL do COFINS para %
        If (FDados.CItemNotaEmitPCTIPO_CALCULO_COFINS.Value = 'Em Valor') then
          Begin
            FDados.CItemNotaEmitPCTIPO_CALCULO_COFINS.AsString := '$';
          End

      //Trocando nome EM VALOR do COFINS para $
        Else If (FDados.CItemNotaEmitPCTIPO_CALCULO_COFINS.Value = 'Em Percentual') then
          Begin
            FDados.CItemNotaEmitPCTIPO_CALCULO_COFINS.AsString := '%';
          End

      //Se não tiver nada mostra X
        Else
          Begin
            FDados.CItemNotaEmitPCTIPO_CALCULO_COFINS.AsString := '-';
          End;
      //----------------------------------------------------------
      FDados.CItemNotaEmitPC.Post;
      FDados.CItemNotaEmitPC.Next;

      countErro1:=(countErro1)+1;
      MsgErro1:= FDados.CItemNotaEmitPCERRO.AsString;

      End;
    End;
  End;
  //----------------------------------------------------------
  {$endregion}

        {$region 'Aliquota'}
  //Mensagens
  StatusGeral.Caption := 'Consultando Alíquotas Pis/Cofins...';
  StatusGeral.Update;
  //----------------------------------------------------------

  //Seleção do Período - Aliquota
  Begin
  FDados.CItemNotaEmitAliqPC.Close;
  FDados.SItemNotaEmitAliqPC.ParamByName('DATA1').Value := data1.Date;
  FDados.SItemNotaEmitAliqPC.ParamByName('DATA2').Value := data2.Date;
  //----------------------------------------------------------

  //Identificando a Aliquota trabalhada
  If (CheckCum.Checked = True) then
     Begin
      FDados.SItemNotaEmitAliqPC.ParamByName('ALIQPIS').Value := 0.65;
      FDados.SItemNotaEmitAliqPC.ParamByName('ALIQCOFINS').Value := 3;
     End
  Else If (CheckNCum.Checked = True) then
     Begin
      FDados.SItemNotaEmitAliqPC.ParamByName('ALIQPIS').Value := 1.65;
      FDados.SItemNotaEmitAliqPC.ParamByName('ALIQCOFINS').Value := 7.6;
     End;
  FDados.CItemNotaEmitAliqPC.Open;
  //----------------------------------------------------------

  //Inclusão dos registros - Aliquota
  If (CheckNCum.Checked= True) or (CheckCum.Checked = True) then
    Begin
      while not (FDados.CItemNotaEmitAliqPC.eof) do
        Begin
         FDados.CItemNotaEmitPC.Append;
         FDados.CItemNotaEmitPCCOD_NOTA.AsString := FDados.CItemNotaEmitAliqPCCOD_NOTA.AsString;
         FDados.CItemNotaEmitPCCOD_PROD.AsString := FDados.CItemNotaEmitAliqPCCOD_PROD.AsString;
         FDados.CItemNotaEmitPCNOMEPROD.AsString := FDados.CItemNotaEmitAliqPCNOMEPROD.AsString;
         FDados.CItemNotaEmitPCCST_PIS.AsString := FDados.CItemNotaEmitAliqPCCST_PIS.AsString;
         FDados.CItemNotaEmitPCCST_COFINS.AsString := FDados.CItemNotaEmitAliqPCCST_COFINS.AsString;
         FDados.CItemNotaEmitPCPPIS.AsString:= FDados.CItemNotaEmitAliqPCPPIS.AsString;
         FDados.CItemNotaEmitPCPCOFINS.AsString := FDados.CItemNotaEmitAliqPCPCOFINS.AsString;
         FDados.CItemNotaEmitPCFINALIDADE.AsString := FDados.CItemNotaEmitAliqPCFINALIDADE.AsString;
         FDados.CItemNotaEmitPCERRO.AsString := FDados.CItemNotaEmitAliqPCERRO.AsString;
         FDados.CItemNotaEmitPCDATA_EMISSAO.AsString :=  FDados.CItemNotaEmitAliqPCDATA_EMISSAO.AsString;
         FDados.CItemNotaEmitPCORIGEM.AsString :=  FDados.CItemNotaEmitAliqPCORIGEM.AsString;

        //Trocando nome EM PERCENTUAL do PIS para %
        If (FDados.CItemNotaEmitAliqPCTIPO_CALCULO_PIS.value='Em Percentual') then
          Begin
            FDados.CItemNotaEmitPCTIPO_CALCULO_PIS.AsString := '%';
          End
        //Trocando nome EM VALOR do PIS para $
        Else If (FDados.CItemNotaEmitAliqPCTIPO_CALCULO_PIS.value='Em Valor') then
          Begin
            FDados.CItemNotaEmitPCTIPO_CALCULO_PIS.AsString := '$';
          End
        //Se não tiver nada mostra X
        Else
          Begin
            FDados.CItemNotaEmitPCTIPO_CALCULO_PIS.AsString := '-';
          End;
        //----------------------------------------------------------

        //Trocando nome EM PERCENTUAL do COFINS para %
        If (FDados.CItemNotaEmitAliqPCTIPO_CALCULO_COFINS.value='Em Percentual') then
          Begin
            FDados.CItemNotaEmitPCTIPO_CALCULO_COFINS.AsString := '%';
          End
        //Trocando nome EM VALOR do COFINS para $
        Else If (FDados.CItemNotaEmitAliqPCTIPO_CALCULO_COFINS.value='Em Valor') then
          Begin
            FDados.CItemNotaEmitPCTIPO_CALCULO_COFINS.AsString := '$';
          End
        //Se não tiver nada mostra X
        Else
          Begin
            FDados.CItemNotaEmitPCTIPO_CALCULO_COFINS.AsString := '-';
          End;
        //----------------------------------------------------------
        FDados.CItemNotaEmitPC.Post;
        FDados.CItemNotaEmitAliqPC.Next;

        countErro2:= (countErro2)+1;
        MsgErro2:= FDados.CItemNotaEmitAliqPCERRO.AsString;

        End;
    End
  Else
    Begin
      ShowMessage('Selecione opção de Aliquota: Não Cumulativa, ou, Cumulativa!');
    End;
  End;
  //----------------------------------------------------------
        {$endregion}

        {$region 'Natureza Pis / Cofins''}
  //Mensagens
  StatusGeral.Caption := 'Consultando Naturezas de Receitas...';
  StatusGeral.Update;
  //----------------------------------------------------------

  //Seleção do Período - cBenef
  Begin
  FDados.CItemNotaEmitNatPC.Close;
  FDados.SItemNotaEmitNatPC.ParamByName('DATA1').Value := data1.Date;
  FDados.SItemNotaEmitNatPC.ParamByName('DATA2').Value := data2.Date;
  FDados.CItemNotaEmitNatPC.Open;
  //----------------------------------------------------------

  //Inclusão dos registros - cBenef
  while not (FDados.CItemNotaEmitNatPC.eof) do
    Begin
      FDados.CItemNotaEmitPC.Append;
      FDados.CItemNotaEmitPCCOD_NOTA.AsString := FDados.CItemNotaEmitNatPCCOD_NOTA.AsString;
      FDados.CItemNotaEmitPCCOD_PROD.AsString := FDados.CItemNotaEmitNatPCCOD_PROD.AsString;
      FDados.CItemNotaEmitPCNOMEPROD.AsString := FDados.CItemNotaEmitNatPCNOMEPROD.AsString;
      FDados.CItemNotaEmitPCCST_PIS.AsString := FDados.CItemNotaEmitNatPCCST_PIS.AsString;
      FDados.CItemNotaEmitPCCST_COFINS.AsString := FDados.CItemNotaEmitNatPCCST_COFINS.AsString;
      FDados.CItemNotaEmitPCPPIS.AsString:= FDados.CItemNotaEmitNatPCPPIS.AsString;
      FDados.CItemNotaEmitPCPCOFINS.AsString := FDados.CItemNotaEmitNatPCPCOFINS.AsString;
      FDados.CItemNotaEmitPCFINALIDADE.AsString := FDados.CItemNotaEmitNatPCFINALIDADE.AsString;
      FDados.CItemNotaEmitPCERRO.AsString := FDados.CItemNotaEmitNatPCERRO.AsString;
      FDados.CItemNotaEmitPCDATA_EMISSAO.AsString :=  FDados.CItemNotaEmitNatPCDATA_EMISSAO.AsString;
      FDados.CItemNotaEmitPCORIGEM.AsString :=  FDados.CItemNotaEmitNatPCORIGEM.AsString;

      //Trocando nome EM PERCENTUAL do PIS para %
      If (FDados.CItemNotaEmitNatPCTIPO_CALCULO_PIS.value='Em Percentual') then
          Begin
            FDados.CItemNotaEmitPCTIPO_CALCULO_PIS.AsString := '%';
          End
      //Trocando nome EM VALOR do PIS para $
      Else If (FDados.CItemNotaEmitNatPCTIPO_CALCULO_PIS.value='Em Valor') then
          Begin
            FDados.CItemNotaEmitPCTIPO_CALCULO_PIS.AsString := '$';
          End
      //Se não tiver nada mostra X
      Else
          Begin
            FDados.CItemNotaEmitPCTIPO_CALCULO_PIS.AsString := '-';
          End;
      //----------------------------------------------------------

      //Trocando nome EM PERCENTUAL do COFINS para %
      If (FDados.CItemNotaEmitNatPCTIPO_CALCULO_COFINS.value='Em Percentual') then
          Begin
            FDados.CItemNotaEmitPCTIPO_CALCULO_COFINS.AsString := '%';
          End
      //Trocando nome EM VALOR do COFINS para $
      Else If (FDados.CItemNotaEmitNatPCTIPO_CALCULO_COFINS.value='Em Valor') then
          Begin
            FDados.CItemNotaEmitPCTIPO_CALCULO_COFINS.AsString := '$';
          End
      //Se não tiver nada mostra X
      Else
          Begin
            FDados.CItemNotaEmitPCTIPO_CALCULO_COFINS.AsString := '-';
          End;
      //----------------------------------------------------------
        FDados.CItemNotaEmitPC.Post;
        FDados.CItemNotaEmitNatPC.Next;

        countErro3:=(countErro3)+1;
        MsgErro3:= FDados.CItemNotaEmitNatPCERRO.AsString;

    End;
  End;
  //----------------------------------------------------------
 {$endregion}

        {$region 'Tipo de Cálculo Pis / Cofins''}
  //Mensagens
  StatusGeral.Caption := 'Consultando os Tipos de Cálculos...';
  StatusGeral.Update;
  //----------------------------------------------------------

  //Seleção do Período - cBenef
  Begin
  FDados.CItemNotaEmitTipoCalcPC.Close;
  FDados.SItemNotaEmitTipoCalcPC.ParamByName('DATA1').Value := data1.Date;
  FDados.SItemNotaEmitTipoCalcPC.ParamByName('DATA2').Value := data2.Date;
  FDados.CItemNotaEmitTipoCalcPC.Open;
  //----------------------------------------------------------

  //Inclusão dos registros - cBenef
  while not (FDados.CItemNotaEmitTipoCalcPC.eof) do
    Begin
      FDados.CItemNotaEmitPC.Append;
      FDados.CItemNotaEmitPCCOD_NOTA.AsString := FDados.CItemNotaEmitTipoCalcPCCOD_NOTA.AsString;
      FDados.CItemNotaEmitPCCOD_PROD.AsString := FDados.CItemNotaEmitTipoCalcPCCOD_PROD.AsString;
      FDados.CItemNotaEmitPCNOMEPROD.AsString := FDados.CItemNotaEmitTipoCalcPCNOMEPROD.AsString;
      FDados.CItemNotaEmitPCCST_PIS.AsString := FDados.CItemNotaEmitTipoCalcPCCST_PIS.AsString;
      FDados.CItemNotaEmitPCCST_COFINS.AsString := FDados.CItemNotaEmitTipoCalcPCCST_COFINS.AsString;
      FDados.CItemNotaEmitPCPPIS.AsString:= FDados.CItemNotaEmitTipoCalcPCPPIS.AsString;
      FDados.CItemNotaEmitPCPCOFINS.AsString := FDados.CItemNotaEmitTipoCalcPCPCOFINS.AsString;
      FDados.CItemNotaEmitPCFINALIDADE.AsString := FDados.CItemNotaEmitTipoCalcPCFINALIDADE.AsString;
      FDados.CItemNotaEmitPCERRO.AsString := FDados.CItemNotaEmitTipoCalcPCERRO.AsString;
      FDados.CItemNotaEmitPCDATA_EMISSAO.AsString :=  FDados.CItemNotaEmitTipoCalcPCDATA_EMISSAO.AsString;
      FDados.CItemNotaEmitPCORIGEM.AsString :=  FDados.CItemNotaEmitTipoCalcPCORIGEM.AsString;

      //Trocando nome EM PERCENTUAL do PIS para %
      If (FDados.CItemNotaEmitTipoCalcPCTIPO_CALCULO_PIS.value='Em Percentual') then
          Begin
            FDados.CItemNotaEmitPCTIPO_CALCULO_PIS.AsString := '%';
          End
      //Trocando nome EM VALOR do PIS para $
      Else If (FDados.CItemNotaEmitTipoCalcPCTIPO_CALCULO_PIS.value='Em Valor') then
          Begin
            FDados.CItemNotaEmitPCTIPO_CALCULO_PIS.AsString := '$';
          End
      //Se não tiver nada mostra X
      Else
          Begin
            FDados.CItemNotaEmitPCTIPO_CALCULO_PIS.AsString := '-';
          End;
      //----------------------------------------------------------

      //Trocando nome EM PERCENTUAL do COFINS para %
      If (FDados.CItemNotaEmitTipoCalcPCTIPO_CALCULO_COFINS.value='Em Percentual') then
          Begin
            FDados.CItemNotaEmitPCTIPO_CALCULO_COFINS.AsString := '%';
          End
      //Trocando nome EM VALOR do COFINS para $
      Else If (FDados.CItemNotaEmitTipoCalcPCTIPO_CALCULO_COFINS.value='Em Valor') then
          Begin
            FDados.CItemNotaEmitPCTIPO_CALCULO_COFINS.AsString := '$';
          End
      //Se não tiver nada mostra X
      Else
          Begin
            FDados.CItemNotaEmitPCTIPO_CALCULO_COFINS.AsString := '-';
          End;
      //----------------------------------------------------------
        FDados.CItemNotaEmitPC.Post;
        FDados.CItemNotaEmitTipoCalcPC.Next;

        countErro4:=(countErro4)+1;
        MsgErro4:= FDados.CItemNotaEmitTipoCalcPCERRO.AsString;
    End;
  End;
  //----------------------------------------------------------
 {$endregion}

  //Mensagens
    FFiscal.StaticText1.Visible := True;   //Show Erros Identificados

  if ( (countErro1 = 0) and (countErro2 = 0) and (countErro3 = 0) and (countErro4 =0) ) then
    begin
      Memo1.Lines.Add('Nenhum erro identificado.');
    end;

  if (countErro1 > 0) then
    Begin
      Memo1.Lines.Add((IntToStr(Round(countErro1))) + ' ' + MsgErro1);
    End;

  if (countErro2 > 0) then
    begin
      Memo1.Lines.Add((IntToStr(Round(countErro2))) + ' ' + MsgErro2);
    end;

  if (countErro3 > 0) then
    begin
      Memo1.Lines.Add((IntToStr(Round(countErro3))) + ' ' + MsgErro3);
    end;

  if (countErro4 > 0) then
    begin
      Memo1.Lines.Add((IntToStr(Round(countErro4))) + ' ' + MsgErro4);
    end;

  TButton(Sender).Caption := 'NF-e';
  Application.ProcessMessages;
  ShowMessage('Operação Finalizada!');
  StatusGeral.Caption := 'Busca Pis/Cofins NF-e Finalizada. Lembrando, NÃO será possível nenhum ajustes em NF-e, apenas no cadastro do produto que apresentou erro.';
  StatusGeral.Update;
  //----------------------------------------------------------
end;
  {$endregion}

    {$region 'Consulta: Entradas''}
procedure TFFiscal.ButContrEntClick(Sender: TObject);
var
  MsgErro1: String;       // Utilizada para mensagem de erro
  countErro1: Integer;   //Utilizada no contador de linhas

begin
  //Abrir o Grid para Entradas
  DBGridEntradas.DataSource := DSItemNotaEntPC;
  DBGridEntradas.visible := True;
  Memo1.visible := True;

  DBGridProdutos.visible := False;
  DBGridComparacao.visible := False;
  DBGridExtrato.visible := False;
  DBGridSaidas.visible := False;

  MsgErro1 := '';
  countErro1 := 0;
  //----------------------------------------------------------

  //Incluo as colunas: PIS_CST_ENTRADA, COFINS_CST_ENTRADA (Na ordem).
  DBGridEntradas.Columns[6].Visible := True;
  DBGridEntradas.Columns[7].Visible := True;
  //----------------------------------------------------------

  //Removo as colunas: CST_CSOSN_FORN, CFOP_FORN, FINALIDADE (Na ordem).
  DBGridEntradas.Columns[8].Visible := False;
  DBGridEntradas.Columns[9].Visible := False;
  DBGridEntradas.Columns[13].Visible := False;
  //----------------------------------------------------------

        {$region 'CST Entrada Pis X CST Entrada Cofins'}
  //Mensagens
  TButton(Sender).Caption := 'Aguarde...';
  Application.ProcessMessages;
  StatusGeral.Caption := 'Verificando CST de Entrada Pis e Cofins...';
  StatusGeral.Update;
  Application.ProcessMessages;
  //----------------------------------------------------------

  //Seleção do Período - CST Pis x CST Cofins
  begin
    FDados.CItemNotaEntPC.Close;
    FDados.SItemNotaEntPC.ParamByName('DATA1').Value := data1.Date;
    FDados.SItemNotaEntPC.ParamByName('DATA2').Value := data2.Date;
    FDados.CItemNotaEntPC.Open;

    countErro1 := FDados.CItemNotaEntPC.RecordCount;
    MsgErro1 := FDados.CItemNotaEntPCERRO.AsString;
  end;
  //----------------------------------------------------------
  {$endregion}

  //Mensagens
  FFiscal.StaticText1.Visible := True;   //Show Erros Identificados

  if (countErro1 = 0) then
    begin
      Memo1.Lines.Add('Nenhum erro identificado.');
    end;

  if (countErro1 > 0) then
    Begin
      Memo1.Lines.Add((IntToStr(Round(countErro1))) + ' ' + MsgErro1);
    End;

  TButton(Sender).Caption := 'Entradas';
  Application.ProcessMessages;
  ShowMessage('Operação Finalizada!');
  StatusGeral.Caption := 'Busca Pis/Cofins Entradas Finalizada';
  StatusGeral.Update;
  //----------------------------------------------------------
end;

  {$endregion}

  {$endregion}


{$region 'Comparações'}

    {$region 'Importando Txt'}
procedure TFFiscal.ButImpClick(Sender: TObject);

var
Txt : TextFile;       // Tipo texto
Caminho, A : String;  // Armazena o caminho
Linha : String;       // Lê a linha do tipo texto
Arquivos : TStringList;
i, count, total, countNfce, countNfe : Integer;   //Utilizada no contador de linhas
porcentagem:Double;   //Utilizada no contador de linhas

begin
  //Abrir o Grid para NFC-e
  DBGridExtrato.DataSource:= DSImportTxt;
  DBGridExtrato.visible := True;

  DBGridProdutos.visible := False;
  DBGridEntradas.visible := False;
  DBGridSaidas.visible := False;
  DBGridComparacao.visible := False;
  //----------------------------------------------------------

  //Mensagens
  StatusGeral.caption := 'Importando Extrato...';
  StatusGeral.Update;
  TButton(Sender).Caption := 'Importando...';
  //----------------------------------------------------------

  //Verifica Edit com caminho
  Caminho := Edit1.text; // variavel recebe os dados do edit
  //----------------------------------------------------------

  //Busca o Txt no caminho posto
  AssignFile(Txt,Caminho);
  Reset(Txt);
  Arquivos := TStringList.Create;
  Arquivos.LoadFromFile(Caminho);
  //----------------------------------------------------------

  //Barra de Processo
  ProgressBar1.Max :=Arquivos.Count - 1;
  i := 0;
  //----------------------------------------------------------

  //Criando DataSet
  if FDados.CImportTxt.Active then
    begin
      FDados.CImportTxt.EmptyDataSet;
      FDados.CImportTxt.Close;
    end;
  FDados.CImportTxt.CreateDataSet;
  FDados.CImportTxt.Open;
  Arquivos.Clear;
  //----------------------------------------------------------

  count:=0;
  countNfe:=0;
  countNfce:=0;

  //Debulha o Txt linha por linha, parando nos ';'
  While not eof(txt) do
  begin
   Readln(Txt,linha);
   Arquivos.LineBreak := ';';
   Arquivos.Text := linha;
  //----------------------------------------------------------

  //Inclusão dos dados nos campos
    if count>0 then
      begin
        with FDados.CImportTxt do
            begin
             if arquivos.Count=21 then //Identifica 21 colunas do txt.
              begin
                FDados.CImportTxt.Append;
                for I := 0 to ARQUIVOS.COUNT-1 do //I = É as colunas descritas de 0 à 20
                  begin
                    FDados.CImportTxt.Fields[I].AsString := Arquivos[I]; //Joga os dados para os campos das colunas na ordem que vem o Txt.
                  end;
                FDados.CImportTxt.Post;
              end;
            end;
      end;

  //Se Mod for 65 conta +1 NFC-e
  if (FDados.CImportTxtMOD.value =('65')) then
     begin
       countNfce:= (countNfce)+1;
     end;
  //----------------------------------------------------------

  //Se Mod for 55 conta +1 NF-e
  if (FDados.CImportTxtMOD.value = ('55')) then
     begin
       countNfe:= (countNfe)+1;
     end;
  //----------------------------------------------------------

  //Barra de Processo
   porcentagem := (count);
   LabelStatus.Caption := IntToStr(Round(porcentagem)) + ' Registros.';
   LabelStatus.Update;
   LabelStatusNotas.Caption := (IntToStr(Round(countNfce))) + ' NFC-e / ' + (IntToStr(Round(countNfe))) + ' NF-e';
   LabelStatusNotas.Update;
   Application.ProcessMessages;
   ProgressBar1.Position := ProgressBar1.Position + 1;
   count:=count+1;
  //----------------------------------------------------------

  end;

  //Mensagens
   StatusGeral.caption := 'Impotação do Extrato Finalizada...';
   StatusGeral.Update;
   LabelStatus.Caption := 'Total de ' + (IntToStr(Round(porcentagem))) + ' Registros importados!';
   LabelStatus.Update;
   LabelStatusNotas.Caption := (IntToStr(Round(countNfce))) + ' NFC-e / ' + (IntToStr(Round(countNfe))) + ' NF-e';
   LabelStatusNotas.Update;
   TButton(Sender).Caption := 'Importar Extrato';
   ShowMessage('Processo concluído com êxito');
   ProgressBar1.Position := ProgressBar1.Max;
  //----------------------------------------------------------
End;

{$endregion}

//Saídas:

    {$region 'Comparação: Sefaz x Sistema / NFC-e'}
procedure TFFiscal.ButCompNfceClick(Sender: TObject);
  var
    CountExtXML, CountExtNota, CountNFCXML, CountNFCNota: Integer;

begin
  //Abrir o Grid para Comparação
  DBGridComparacao.DataSource:= nil;
  DBGridComparacao.DataSource:= DSResultConfer;
  DBGridComparacao.visible := True;

  DBGridProdutos.visible := False;
  DBGridExtrato.visible := False;
  DBGridSaidas.visible := False;
  DBGridEntradas.Visible := False;

  DBGridComparacao.Columns[7].Visible := False;
  //----------------------------------------------------------

  //Mensagens
  StatSefazSistema.Caption := 'Status Sefaz > Sistema:';
  StatSistemaSefaz.Caption := 'Status Sistema > Sefaz:';
  StatusGeral.caption := 'Comparando NFC-e com Extrato...';
  StatusGeral.Update;
  TButton(Sender).Caption := 'Aguarde...';
  //----------------------------------------------------------

  //Criando DataSet
  if FDados.CResultConfe.Active then
    begin
      FDados.CResultConfe.EmptyDataSet;
      FDados.CResultConfe.Close;
    end;
  FDados.CResultConfe.CreateDataSet;
  FDados.CResultConfe.Open;
  //----------------------------------------------------------

  //Período de busca no Sistema para comparação
  begin
  FDados.CConferNfce.Close;
  FDados.SConferNfce.ParamByName('DATA1').Value := data1.Date;
  FDados.SConferNfce.ParamByName('DATA2').Value := data2.Date;
  FDados.CConferNfce.Open;
  end;
  //----------------------------------------------------------

  //Se extrato vaziu, retorna mensagem
  if FDados.CImportTxt.IsEmpty then
        begin
         Showmessage ('Importe o extrato antes.');
         StatusGeral.caption := 'Importe o extrato...';
         StatusGeral.Update;
         end;
  //----------------------------------------------------------

  //Se extrato importado, começa conferencia pelo primeiro registro
  if Not FDados.CImportTxt.IsEmpty then
    begin
      FDados.CImportTxt.Open;
      FDados.CConferNfce.first;
      CountNFCNota:= 0;
      CountNFCXML:=0;
      CountExtNota:=0;
      CountExtXML:=0;
  //----------------------------------------------------------

  //Busca se falta COD NOTA do Sistema no relatório de extrato. Obs: COD NOTA com mesma Série!
      while not FDados.CConferNfce.Eof do
        begin
          If not ((FDados.CImportTxt.Locate ('COD_NOTA',FDados.CConferNfceCOD_NOTA.AsString,[loCaseInsensitive])) and ((FDados.CImportTxtSERIE.AsInteger) = (FDados.CConferNfceSERIE.AsInteger))) then
            Begin
              If not ((FDados.CImportTxtMOD.AsString) = ('55')) then   //Se MOD = 65 ele informa no GRID. Caso Extrato seja conjunto ao 55.
                  begin
                   FDados.CResultConfe.Append;
                   FDados.CResultConfeDATA_EMISSAO.AsString := FDados.CConferNfceDATA_EMISSAO.AsString;
                   FDados.CResultConfeCOD_NOTA.AsInteger := FDados.CConferNfceCOD_NOTA.AsInteger;
                   FDados.CResultConfeSERIE.AsInteger := FDados.CConferNfceSERIE.AsInteger;
                   FDados.CResultConfeXML.AsString := FDados.CConferNfceXML.AsString;
                   FDados.CResultConfeMOD.AsString := 'NFC-e (' + (FDados.CConferNfceMOD.AsString) + ')';
                   FDados.CResultConfeOPERACAO.AsString := FDados.CConferNfceOPERACAO.AsString;
                   FDados.CResultConfeCASO.AsString := 'Não Encontrado no Extrato, Nº Nota do Sistema.';
                   FDados.CResultConfe.Post;
                   CountNFCNota := (CountNFCNota)+1;
                  end;
            end
  //----------------------------------------------------------

  //Busca divergencia de XML e COD NOTA nos demais encontrados Sistema x Sefaz. Obs: COD NOTA com mesma Série!
          Else if ((((FDados.CImportTxtCHAVE.AsString) = (FDados.CConferNfceXML.AsString)) and ((FDados.CImportTxtCOD_NOTA.AsString) <> (FDados.CConferNfceCOD_NOTA.AsString)) and ((FDados.CImportTxtSERIE.AsInteger) = (FDados.CConferNfceSERIE.AsInteger))) or (((FDados.CImportTxtCHAVE.AsString) <> (FDados.CConferNfceXML.AsString)) and ((FDados.CImportTxtCOD_NOTA.AsString) = (FDados.CConferNfceCOD_NOTA.AsString)) and ((FDados.CImportTxtSERIE.AsInteger) = (FDados.CConferNfceSERIE.AsInteger)))) then
            Begin
              If not ((FDados.CImportTxtMOD.AsString) = ('55')) then  //Se MOD = 65 ele informa no GRID. Caso Extrato seja conjunto ao 55.
                  begin
                   FDados.CResultConfe.Append;
                   FDados.CResultConfeDATA_EMISSAO.AsString := FDados.CConferNfceDATA_EMISSAO.AsString;
                   FDados.CResultConfeCOD_NOTA.AsInteger := FDados.CConferNfceCOD_NOTA.AsInteger;
                   FDados.CResultConfeSERIE.AsInteger := FDados.CConferNfceSERIE.AsInteger;
                   FDados.CResultConfeXML.AsString := FDados.CConferNfceXML.AsString;
                   FDados.CResultConfeMOD.AsString := 'NFC-e (' + (FDados.CConferNfceMOD.AsString) + ')';
                   FDados.CResultConfeOPERACAO.AsString := FDados.CConferNfceOPERACAO.AsString;
                   FDados.CResultConfeCASO.AsString := 'XML diverge com Codígo da Nota.';
                   FDados.CResultConfe.Post;
                   CountNFCXML := (CountNFCXML)+1;
                  End;
            end;
  //----------------------------------------------------------
           FDados.CConferNfce.next;
        end;
  //----------------------------------------------------------

  //Mensagens
   StatusGeral.caption := 'Comparando Extrato com NFC-e...';
   StatusGeral.Update;
  //----------------------------------------------------------

  //Busca os COD NOTA do extrato no Sistema. Obs: COD NOTA com mesma Série!
      FDados.CImportTxt.first;
     while not FDados.CImportTxt.Eof do
        begin
          If not ((FDados.CConferNfce.Locate ('COD_NOTA',FDados.CImportTxtCOD_NOTA.AsInteger,[loCaseInsensitive])) and ((FDados.CImportTxtSERIE.AsInteger) = (FDados.CConferNfceSERIE.AsInteger)))  then
            Begin
              If not ((FDados.CImportTxtMOD.AsString) = ('55')) then   //Se MOD = 65 ele informa no GRID. Caso Extrato seja conjunto ao 55.
                  begin
                   FDados.CResultConfe.Append;
                   FDados.CResultConfeDATA_EMISSAO.AsString := FDados.CImportTxtDATA_EMISSAO.AsString;
                   FDados.CResultConfeCOD_NOTA.AsInteger := FDados.CImportTxtCOD_NOTA.AsInteger;
                   FDados.CResultConfeSERIE.AsInteger := FDados.CImportTxtSERIE.AsInteger;
                   FDados.CResultConfeXML.AsString := FDados.CImportTxtCHAVE.AsString;
                   FDados.CResultConfeMOD.AsString := 'NFC-e (' + (FDados.CImportTxtMOD.AsString) + ')';
                   FDados.CResultConfeOPERACAO.AsString := 'Não informado pelo Extrato.';
                   FDados.CResultConfeCASO.AsString := 'Não Encontrado no Sistema, Nº Nota do Extrato.';
                   FDados.CResultConfe.Post;
                   CountExtNota := (CountExtNota)+1;
                  end;
            end
  //----------------------------------------------------------

  //Busca divergencia de XML e COD NOTA nos demais encontrados  Sefaz x Sistema. Obs: COD NOTA com mesma Série!
          Else if ((((FDados.CImportTxtCHAVE.AsString) = (FDados.CConferNfceXML.AsString)) and ((FDados.CImportTxtCOD_NOTA.AsString) <> (FDados.CConferNfceCOD_NOTA.AsString)) and ((FDados.CImportTxtSERIE.AsInteger) = (FDados.CConferNfceSERIE.AsInteger))) or (((FDados.CImportTxtCHAVE.AsString) <> (FDados.CConferNfceXML.AsString)) and ((FDados.CImportTxtCOD_NOTA.AsString) = (FDados.CConferNfceCOD_NOTA.AsString)) and ((FDados.CImportTxtSERIE.AsInteger) = (FDados.CConferNfceSERIE.AsInteger)))) then
            Begin
              If not ((FDados.CImportTxtMOD.AsString) = ('55')) then  //Se MOD = 65 ele informa no GRID. Caso Extrato seja conjunto ao 55.
                  begin
                   FDados.CResultConfe.Append;
                   FDados.CResultConfeDATA_EMISSAO.AsString := FDados.CImportTxtDATA_EMISSAO.AsString;
                   FDados.CResultConfeCOD_NOTA.AsInteger := FDados.CImportTxtCOD_NOTA.AsInteger;
                   FDados.CResultConfeSERIE.AsInteger := FDados.CImportTxtSERIE.AsInteger;
                   FDados.CResultConfeXML.AsString := FDados.CImportTxtCHAVE.AsString;
                   FDados.CResultConfeMOD.AsString := 'NFC-e (' + (FDados.CImportTxtMOD.AsString) + ')';
                   FDados.CResultConfeOPERACAO.AsString := 'Não informado pelo Extrato.';
                   FDados.CResultConfeCASO.AsString := 'XML diverge com Codígo da Nota.';
                   CountExtXML :=(CountExtXML)+1;
                  end;
            end;

          FDados.CImportTxt.next;
        end;
    end;
  //----------------------------------------------------------

  //Mensagens
  If ((CountExtXML>0) or (CountExtNOTA>0)) then
    Begin
      StatusCompExt.Caption := (IntToStr(Round(CountExtXML))) + ' XML x NOTA / ' + (IntToStr(Round(CountExtNOTA))) + ' NOTAS Não Localizadas.';
      StatusCompExt.Update;
    End
  Else
    Begin
      StatusCompExt.Caption := 'Nenhuma divergência encontrada.';;
      StatusCompExt.Update;
    End;

  If ((CountNFCXML>0) or (CountNFCNOTA>0)) then
    Begin
      StatusCompVendas.Caption := (IntToStr(Round(CountNFCXML))) + ' XML x NOTA / ' + (IntToStr(Round(CountNFCNOTA))) + ' NOTAS Não Localizadas.';
      StatusCompVendas.Update;
    End
  Else
    Begin
      StatusCompVendas.Caption := 'Nenhuma divergência encontrada.';
      StatusCompVendas.Update;
    End;

  StatusGeral.caption := 'Comparação NFC-e Finalizada.';
  StatusGeral.Update;
  TButton(Sender).Caption := 'NFC-e';
  Showmessage ('Comparação concluída!');
  //----------------------------------------------------------

end;
{$endregion}

    {$region 'Comparação: Sefaz x Sistema / NF-e'}
procedure TFFiscal.ButCompNfeClick(Sender: TObject);
  var
    CountExtXML, CountExtNota, CountNFXML, CountNFNota: Integer;

begin
  //Abrir o Grid para Comparação
  DBGridComparacao.DataSource:= nil;
  DBGridComparacao.DataSource:= DSResultConfer;
  DBGridComparacao.visible := True;

  DBGridProdutos.visible := False;
  DBGridExtrato.visible := False;
  DBGridSaidas.visible := False;
  DBGridEntradas.visible := False;

  DBGridComparacao.Columns[7].Visible := False;
  //----------------------------------------------------------

  //Mensagens
  StatSefazSistema.Caption := 'Status Sefaz => Sistema:';
  StatSistemaSefaz.Caption := 'Status Sistema => Sefaz:';
  StatusGeral.caption := 'Comparando NF-e com Extrato...';
  StatusGeral.Update;
  TButton(Sender).Caption := 'Aguarde...';
  //----------------------------------------------------------

  //Criando DataSet
  if FDados.CResultConfe.Active then
    begin
      FDados.CResultConfe.EmptyDataSet;
      FDados.CResultConfe.Close;
    end;
  FDados.CResultConfe.CreateDataSet;
  FDados.CResultConfe.Open;
  //----------------------------------------------------------

  //Período de busca no Sistema para comparação
  begin
  FDados.CConferNfe.Close;
  FDados.SConferNfe.ParamByName('DATA1').Value := data1.Date;
  FDados.SConferNfe.ParamByName('DATA2').Value := data2.Date;
  FDados.CConferNfe.Open;
  end;
  //----------------------------------------------------------

  //Se extrato vaziu, retorna mensagem
  if FDados.CImportTxt.IsEmpty then
        begin
         Showmessage ('Importe o extrato antes.');
         StatusGeral.caption := 'Importe o extrato...';
         StatusGeral.Update;
         end;
  //----------------------------------------------------------

  //Se extrato importado, começa conferencia
  if Not FDados.CImportTxt.IsEmpty then
    begin
      FDados.CImportTxt.Open;
      FDados.CConferNfe.first;
      CountNFNota:= 0;
      CountNFXML:=0;
      CountExtNota:=0;
      CountExtXML:=0;
  //----------------------------------------------------------

  //Busca se falta COD NOTA do Sistema no relatório de extrato. Obs: COD NOTA com mesma Série!
      while not FDados.CConferNfe.Eof do
        begin
          If not ((FDados.CImportTxt.Locate ('COD_NOTA',FDados.CConferNfeCOD_NOTA.AsString,[loCaseInsensitive])) and ((FDados.CImportTxtSERIE.AsInteger) = (FDados.CConferNfeSERIE.AsInteger))) then
            Begin
              If not ((FDados.CImportTxtMOD.AsString) = ('65')) then
                  begin
                   FDados.CResultConfe.Append;
                   FDados.CResultConfeDATA_EMISSAO.AsString := FDados.CConferNfeDATA_EMISSAO.AsString;
                   FDados.CResultConfeCOD_NOTA.AsInteger := FDados.CConferNfeCOD_NOTA.AsInteger;
                   FDados.CResultConfeSERIE.AsInteger := FDados.CConferNfeSERIE.AsInteger;
                   FDados.CResultConfeXML.AsString := FDados.CConferNfeXML.AsString;
                   FDados.CResultConfeMOD.AsString := 'NF-e (' + (FDados.CConferNfeMOD.AsString) + ')';
                   FDados.CResultConfeOPERACAO.AsString := FDados.CConferNfeOPERACAO.AsString;
                   FDados.CResultConfeCASO.AsString := 'Não Encontrado no Extrato, Nº Nota do Sistema.';
                   FDados.CResultConfe.Post;
                   CountNFNota := (CountNFNota)+1;
                  end;
            end
  //----------------------------------------------------------

  //Busca divergencia de XML e COD NOTA nos demais encontrados Sistema x Sefaz. Obs: COD NOTA com mesma Série!
          Else if ((((FDados.CImportTxtCHAVE.AsString) = (FDados.CConferNfeXML.AsString)) AND ((FDados.CImportTxtCOD_NOTA.AsString) <> (FDados.CConferNfeCOD_NOTA.AsString))) or (((FDados.CImportTxtCHAVE.AsString) <> (FDados.CConferNfeXML.AsString)) AND ((FDados.CImportTxtCOD_NOTA.AsString) = (FDados.CConferNfeCOD_NOTA.AsString)))) then
            Begin
              If not ((FDados.CImportTxtMOD.AsString) = ('65')) then
                  begin
                   FDados.CResultConfe.Append;
                   FDados.CResultConfeDATA_EMISSAO.AsString := FDados.CConferNfeDATA_EMISSAO.AsString;
                   FDados.CResultConfeCOD_NOTA.AsInteger := FDados.CConferNfeCOD_NOTA.AsInteger;
                   FDados.CResultConfeSERIE.AsInteger := FDados.CConferNfeSERIE.AsInteger;
                   FDados.CResultConfeXML.AsString := FDados.CConferNfeXML.AsString;
                   FDados.CResultConfeMOD.AsString := 'NF-e (' + (FDados.CConferNfeMOD.AsString) + ')';
                   FDados.CResultConfeOPERACAO.AsString := FDados.CConferNfeOPERACAO.AsString;
                   FDados.CResultConfeCASO.AsString := 'XML diverge com Codígo da Nota.';
                   FDados.CResultConfe.Post;
                  end;
              CountNFXML := (CountNFXML)+1;
            end;

          FDados.CConferNfe.next;
        end;
    end;
  //----------------------------------------------------------

  //Mensagens
  StatusGeral.caption := 'Comparando Extrato com NF-e...';
  StatusGeral.Update;
  //----------------------------------------------------------

  //Busca os COD NOTA do extrato no Sistema. Obs: COD NOTA com mesma Série!
        FDados.CImportTxt.first;
             while not FDados.CImportTxt.Eof do
        begin
          If not ((FDados.CConferNfe.Locate ('COD_NOTA',FDados.CImportTxtCOD_NOTA.AsInteger,[loCaseInsensitive])) and ((FDados.CImportTxtSERIE.AsInteger) = (FDados.CConferNfeSERIE.AsInteger))) then
            Begin
              If not ((FDados.CImportTxtMOD.AsString) = ('65')) then
                  begin
                   FDados.CResultConfe.Append;
                   FDados.CResultConfeDATA_EMISSAO.AsString := FDados.CImportTxtDATA_EMISSAO.AsString;
                   FDados.CResultConfeCOD_NOTA.AsInteger := FDados.CImportTxtCOD_NOTA.AsInteger;
                   FDados.CResultConfeSERIE.AsInteger := FDados.CImportTxtSERIE.AsInteger;
                   FDados.CResultConfeXML.AsString := FDados.CImportTxtCHAVE.AsString;
                   FDados.CResultConfeMOD.AsString := 'NF-e (' + (FDados.CImportTxtMOD.AsString) + ')';
                   FDados.CResultConfeCASO.AsString := 'Não Encontrado no Sistema, Nº Nota do Extrato.';
                   FDados.CResultConfeOPERACAO.AsString := 'Não informado pelo Extrato.';
                   FDados.CResultConfe.Post;
                   CountExtNota := (CountExtNota)+1;
                  End;
            End
  //----------------------------------------------------------

  //Busca divergencia de XML e COD NOTA nos demais encontrados  Sefaz x Sistema. Obs: COD NOTA com mesma Série!
          Else if ((((FDados.CImportTxtCHAVE.AsString) = (FDados.CConferNfeXML.AsString)) AND ((FDados.CImportTxtCOD_NOTA.AsString) <> (FDados.CConferNfeCOD_NOTA.AsString))) or (((FDados.CImportTxtCHAVE.AsString) <> (FDados.CConferNfeXML.AsString)) AND ((FDados.CImportTxtCOD_NOTA.AsString) = (FDados.CConferNfeCOD_NOTA.AsString)))) then
            Begin
              If not ((FDados.CImportTxtMOD.AsString) = ('65')) then
                  begin
                   FDados.CResultConfe.Append;
                   FDados.CResultConfeDATA_EMISSAO.AsString := FDados.CImportTxtDATA_EMISSAO.AsString;
                   FDados.CResultConfeCOD_NOTA.AsInteger := FDados.CImportTxtCOD_NOTA.AsInteger;
                   FDados.CResultConfeSERIE.AsInteger := FDados.CImportTxtSERIE.AsInteger;
                   FDados.CResultConfeXML.AsString := FDados.CImportTxtCHAVE.AsString;
                   FDados.CResultConfeMOD.AsString := 'NF-e (' + (FDados.CImportTxtMOD.AsString) + ')';
                   FDados.CResultConfeCASO.AsString := 'XML diverge com Codígo da Nota.';
                   FDados.CResultConfeOPERACAO.AsString := 'Não informado pelo Extrato.';
                   FDados.CResultConfe.Post;
                   CountExtXML :=(CountExtXML)+1;
                  end;
            end;

          FDados.CImportTxt.next;
        end;
  //----------------------------------------------------------

  //Mensagens
      If ((CountExtXML>0) or (CountExtNOTA>0)) then
    Begin
      StatusCompExt.Caption := (IntToStr(Round(CountExtXML))) + ' XML x NOTA / ' + (IntToStr(Round(CountExtNOTA))) + ' NOTAS Não Localizadas.';
      StatusCompExt.Update;
    End
  Else
    Begin
      StatusCompExt.Caption := 'Nenhuma divergência encontrada.';;
      StatusCompExt.Update;
    End;

  If ((CountNFXML>0) or (CountNFNOTA>0)) then
    Begin
      StatusCompVendas.Caption := (IntToStr(Round(CountNFXML))) + ' XML x NOTA / ' + (IntToStr(Round(CountNFNOTA))) + ' NOTAS Não Localizadas.';
      StatusCompVendas.Update;
    End
  Else
    Begin
      StatusCompVendas.Caption := 'Nenhuma divergência encontrada.';
      StatusCompVendas.Update;
    End;
  StatusGeral.caption := 'Comparação NF-e Finalizada.';
  StatusGeral.Update;
  TButton(Sender).Caption := 'NF-e';
  Showmessage ('Comparação concluída!');
  //----------------------------------------------------------

end;
{$endregion}

//Entradas:

    {$region 'Comparação: Sefaz x Sistema / Entradas'}
procedure TFFiscal.ButCompEntClick(Sender: TObject);
   var
    CountExtXML, CountExtNota, CountEntXML, CountEntNota: Integer;

begin
  //Abrir o Grid para Comparação
  DBGridComparacao.DataSource:= nil;
  DBGridComparacao.DataSource:= DSResultConfer;
  DBGridComparacao.visible := True;

  DBGridProdutos.visible := False;
  DBGridExtrato.visible := False;
  DBGridEntradas.visible := False;
  DBGridSaidas.visible := False;

  DBGridComparacao.Columns[7].Visible := True;
  //----------------------------------------------------------

  //Mensagens
  StatSefazSistema.Caption := 'Status Sefaz => Sistema:';
  StatSistemaSefaz.Caption := 'Status Sistema => Sefaz:';
  StatusGeral.caption := 'Comparando Entradas com Extrato...';
  StatusGeral.Update;
  TButton(Sender).Caption := 'Aguarde...';
  //----------------------------------------------------------

  //Criando DataSet
  if FDados.CResultConfe.Active then
    begin
      FDados.CResultConfe.EmptyDataSet;
      FDados.CResultConfe.Close;
    end;
  FDados.CResultConfe.CreateDataSet;
  FDados.CResultConfe.Open;
  //----------------------------------------------------------

  //Período de busca no sistema para comparação
  begin
  FDados.CConferEnt.Close;
  FDados.SConferEnt.ParamByName('DATA1').Value := data1.Date;
  FDados.SConferEnt.ParamByName('DATA2').Value := data2.Date;
  FDados.CConferEnt.Open;
  end;
  //----------------------------------------------------------

  //Se extrato vaziu, retorna mensagem
  if FDados.CImportTxt.IsEmpty then
        begin
         Showmessage ('Importe o extrato antes.');
         StatusGeral.caption := 'Importe o extrato...';
         StatusGeral.Update;
         end;
  //----------------------------------------------------------

  //Se extrato importado, começa conferencia
  if Not FDados.CImportTxt.IsEmpty then
    begin
      FDados.CImportTxt.Open;
      FDados.CConferEnt.first;
      CountEntNota:= 0;
      CountEntXML:=0;
      CountExtNota:=0;
      CountExtXML:=0;
  //----------------------------------------------------------

  //Busca se falta COD NOTA do Sistema no relatório de extrato. Obs: COD NOTA com mesma Série!
      while not FDados.CConferEnt.Eof do
        begin
          If not (FDados.CImportTxt.Locate ('COD_NOTA',FDados.CConferEntCOD_NOTAFORN.AsString,[loCaseInsensitive])) then
            Begin
              If not ((FDados.CImportTxtMOD.AsString) = ('65')) then
                  begin
                   FDados.CResultConfe.Append;
                   FDados.CResultConfeDATA_EMISSAO.AsString := FDados.CConferEntDATA_EMISSAO.AsString;
                   FDados.CResultConfeCOD_NOTA.AsInteger := FDados.CConferEntCOD_NOTAFORN.AsInteger;
                   FDados.CResultConfeSERIE.AsInteger := FDados.CConferEntSERIE.AsInteger;
                   FDados.CResultConfeXML.AsString := FDados.CConferEntXML.AsString;
                   FDados.CResultConfeMOD.AsString := 'NF-e (' + (FDados.CConferEntMOD.AsString) + ')';
                   FDados.CResultConfeOPERACAO.AsString := FDados.CConferEntOPERACAO.AsString;
                   FDados.CResultConfeCASO.AsString := 'Não Encontrado no Extrato, Nº Nota do Sistema.';
                   FDados.CResultConfeDATA_RECEBIM.AsString := FDados.CConferEntDATA_RECEBIM.AsString;
                   FDados.CResultConfe.Post;
                   CountEntNota := (CountEntNota)+1;
                  end;
            end
  //----------------------------------------------------------

  //Busca divergencia de XML e COD NOTA nos demais encontrados Sistema x Sefaz. Obs: COD NOTA com mesma Série!
          Else if ((((FDados.CImportTxtCHAVE.AsString) = (FDados.CConferEntXML.AsString)) AND ((FDados.CImportTxtCOD_NOTA.AsString) <> (FDados.CConferEntCOD_NOTAFORN.AsString))) or (((FDados.CImportTxtCHAVE.AsString) <> (FDados.CConferEntXML.AsString)) AND ((FDados.CImportTxtCOD_NOTA.AsString) = (FDados.CConferEntCOD_NOTAFORN.AsString)))) then
            Begin
              If not ((FDados.CImportTxtMOD.AsString) = ('65')) then
                  begin
                   FDados.CResultConfe.Append;
                   FDados.CResultConfeDATA_EMISSAO.AsString := FDados.CConferEntDATA_EMISSAO.AsString;
                   FDados.CResultConfeCOD_NOTA.AsInteger := FDados.CConferEntCOD_NOTAFORN.AsInteger;
                   FDados.CResultConfeSERIE.AsInteger := FDados.CConferEntSERIE.AsInteger;
                   FDados.CResultConfeXML.AsString := FDados.CConferEntXML.AsString;
                   FDados.CResultConfeMOD.AsString := 'NF-e (' + (FDados.CConferEntMOD.AsString) + ')';
                   FDados.CResultConfeOPERACAO.AsString := FDados.CConferEntOPERACAO.AsString;
                   FDados.CResultConfeCASO.AsString := 'XML diverge com Codígo da Nota.';
                   FDados.CResultConfeDATA_RECEBIM.AsString := FDados.CConferEntDATA_RECEBIM.AsString;
                   FDados.CResultConfe.Post;
                  end;
              CountEntXML := (CountEntXML)+1;
            end;

          FDados.CConferEnt.next;
        end;
    end;
  //----------------------------------------------------------

  //Mensagens
  StatusGeral.caption := 'Comparando Extrato com NF-e...';
  StatusGeral.Update;
  //----------------------------------------------------------

  //Busca os COD NOTA do extrato no Sistema. Obs: COD NOTA com mesma Série!
        FDados.CImportTxt.first;
             while not FDados.CImportTxt.Eof do
        begin
          If not (FDados.CConferEnt.Locate ('COD_NOTAFORN',FDados.CImportTxtCOD_NOTA.AsInteger,[loCaseInsensitive])) then
            Begin
              If not ((FDados.CImportTxtMOD.AsString) = ('65')) then
                  begin
                   FDados.CResultConfe.Append;
                   FDados.CResultConfeDATA_EMISSAO.AsString := FDados.CImportTxtDATA_EMISSAO.AsString;
                   FDados.CResultConfeCOD_NOTA.AsInteger := FDados.CImportTxtCOD_NOTA.AsInteger;
                   FDados.CResultConfeSERIE.AsInteger := FDados.CImportTxtSERIE.AsInteger;
                   FDados.CResultConfeXML.AsString := FDados.CImportTxtCHAVE.AsString;
                   FDados.CResultConfeMOD.AsString := 'NF-e (' + (FDados.CImportTxtMOD.AsString) + ')';
                   FDados.CResultConfeCASO.AsString := 'Não Encontrado no Sistema, Nº Nota do Extrato.';
                   FDados.CResultConfeOPERACAO.AsString := 'Não informado pelo Extrato.';
                   FDados.CResultConfe.Post;
                   CountExtNota := (CountExtNota)+1;
                  End;
            End
  //----------------------------------------------------------

  //Busca divergencia de XML e COD NOTA nos demais encontrados  Sefaz x Sistema. Obs: COD NOTA com mesma Série!
          Else if ((((FDados.CImportTxtCHAVE.AsString) = (FDados.CConferEntXML.AsString)) AND ((FDados.CImportTxtCOD_NOTA.AsString) <> (FDados.CConferEntCOD_NOTAFORN.AsString))) or (((FDados.CImportTxtCHAVE.AsString) <> (FDados.CConferEntXML.AsString)) AND ((FDados.CImportTxtCOD_NOTA.AsString) = (FDados.CConferEntCOD_NOTAFORN.AsString)))) then
            Begin
              If not ((FDados.CImportTxtMOD.AsString) = ('65')) then
                  begin
                   FDados.CResultConfe.Append;
                   FDados.CResultConfeDATA_EMISSAO.AsString := FDados.CImportTxtDATA_EMISSAO.AsString;
                   FDados.CResultConfeCOD_NOTA.AsInteger := FDados.CImportTxtCOD_NOTA.AsInteger;
                   FDados.CResultConfeSERIE.AsInteger := FDados.CImportTxtSERIE.AsInteger;
                   FDados.CResultConfeXML.AsString := FDados.CImportTxtCHAVE.AsString;
                   FDados.CResultConfeMOD.AsString := 'NF-e (' + (FDados.CImportTxtMOD.AsString) + ')';
                   FDados.CResultConfeCASO.AsString := 'XML diverge com Codígo da Nota.';
                   FDados.CResultConfeOPERACAO.AsString := 'Não informado pelo Extrato.';
                   FDados.CResultConfe.Post;
                   CountExtXML :=(CountExtXML)+1;
                  end;
            end;

          FDados.CImportTxt.next;
        end;
  //----------------------------------------------------------

  //Mensagens
      If ((CountExtXML>0) or (CountExtNOTA>0)) then
    Begin
      StatusCompExt.Caption := (IntToStr(Round(CountExtXML))) + ' XML x NOTA / ' + (IntToStr(Round(CountExtNOTA))) + ' NOTAS Não Localizadas.';
      StatusCompExt.Update;
    End
  Else
    Begin
      StatusCompExt.Caption := 'Nenhuma divergência encontrada.';;
      StatusCompExt.Update;
    End;

  If ((CountEntXML>0) or (CountEntNOTA>0)) then
    Begin
      StatusCompVendas.Caption := (IntToStr(Round(CountEntXML))) + ' XML x NOTA / ' + (IntToStr(Round(CountEntNOTA))) + ' NOTAS Não Localizadas.';
      StatusCompVendas.Update;
    End
  Else
    Begin
      StatusCompVendas.Caption := 'Nenhuma divergência encontrada.';
      StatusCompVendas.Update;
    End;
  StatusGeral.caption := 'Comparação NF-e Finalizada.';
  StatusGeral.Update;
  TButton(Sender).Caption := 'Comparação NF-e';
  Showmessage ('Comparação concluída!');
  //----------------------------------------------------------

end;
{$endregion}

    {$region 'Comparação: Sefaz x Sistema / NF-e Emit pelo Consulente'}
procedure TFFiscal.ButCompNfeConsuClick(Sender: TObject);
var
    CountExtXML, CountExtNota, CountNFConsuXML, CountNFConsuNota: Integer;

begin
  //Abrir o Grid para Comparação
  DBGridComparacao.DataSource:= nil;
  DBGridComparacao.DataSource:= DSResultConfer;
  DBGridComparacao.visible := True;

  DBGridProdutos.visible := False;
  DBGridExtrato.visible := False;
  DBGridEntradas.Visible := False;
  DBGridSaidas.visible := False;

  DBGridComparacao.Columns[7].Visible := False;
  //----------------------------------------------------------

  //Mensagens
  StatSefazSistema.Caption := 'Status Sefaz => Sistema:';
  StatSistemaSefaz.Caption := 'Status Sistema => Sefaz:';
  StatusGeral.caption := 'Comparando NF-e com Extrato...';
  StatusGeral.Update;
  TButton(Sender).Caption := 'Aguarde...';
  //----------------------------------------------------------

  //Criando DataSet
  if FDados.CResultConfe.Active then
    begin
      FDados.CResultConfe.EmptyDataSet;
      FDados.CResultConfe.Close;
    end;
  FDados.CResultConfe.CreateDataSet;
  FDados.CResultConfe.Open;
  //----------------------------------------------------------

  //Período de busca no Sistema para comparação
  begin
  FDados.CConferNfeConsu.Close;
  FDados.SConferNfeConsu.ParamByName('DATA1').Value := data1.Date;
  FDados.SConferNfeConsu.ParamByName('DATA2').Value := data2.Date;
  FDados.CConferNfeConsu.Open;
  end;
  //----------------------------------------------------------

  //Se extrato vaziu, retorna mensagem
  if FDados.CImportTxt.IsEmpty then
        begin
         Showmessage ('Importe o extrato antes.');
         StatusGeral.caption := 'Importe o extrato...';
         StatusGeral.Update;
         end;
  //----------------------------------------------------------

  //Se extrato importado, começa conferencia
  if Not FDados.CImportTxt.IsEmpty then
    begin
      FDados.CImportTxt.Open;
      FDados.CConferNfe.first;
      CountNFConsuNota:= 0;
      CountNFConsuXML:=0;
      CountExtNota:=0;
      CountExtXML:=0;
  //----------------------------------------------------------

  //Busca se falta COD NOTA do Sistema no relatório de extrato. Obs: COD NOTA com mesma Série!
      while not FDados.CConferNfeConsu.Eof do
        begin
          If not ((FDados.CImportTxt.Locate ('COD_NOTA',FDados.CConferNfeConsuCOD_NOTA.AsString,[loCaseInsensitive])) and ((FDados.CImportTxtSERIE.AsInteger) = (FDados.CConferNfeConsuSERIE.AsInteger))) then
            Begin
              If not ((FDados.CImportTxtMOD.AsString) = ('65')) then
                  begin
                   FDados.CResultConfe.Append;
                   FDados.CResultConfeDATA_EMISSAO.AsString := FDados.CConferNfeConsuDATA_EMISSAO.AsString;
                   FDados.CResultConfeCOD_NOTA.AsInteger := FDados.CConferNfeConsuCOD_NOTA.AsInteger;
                   FDados.CResultConfeSERIE.AsInteger := FDados.CConferNfeConsuSERIE.AsInteger;
                   FDados.CResultConfeXML.AsString := FDados.CConferNfeConsuXML.AsString;
                   FDados.CResultConfeMOD.AsString := 'NF-e (' + (FDados.CConferNfeConsuMOD.AsString) + ')';
                   FDados.CResultConfeOPERACAO.AsString := FDados.CConferNfeConsuOPERACAO.AsString;
                   FDados.CResultConfeCASO.AsString := 'Não Encontrado no Extrato, Nº Nota do Sistema.';
                   FDados.CResultConfe.Post;
                   CountNFConsuNota := (CountNFConsuNota)+1;
                  end;
            end
  //----------------------------------------------------------

  //Busca divergencia de XML e COD NOTA nos demais encontrados Sistema x Sefaz. Obs: COD NOTA com mesma Série!
          Else if ((((FDados.CImportTxtCHAVE.AsString) = (FDados.CConferNfeConsuXML.AsString)) AND ((FDados.CImportTxtCOD_NOTA.AsString) <> (FDados.CConferNfeConsuCOD_NOTA.AsString))) or (((FDados.CImportTxtCHAVE.AsString) <> (FDados.CConferNfeConsuXML.AsString)) AND ((FDados.CImportTxtCOD_NOTA.AsString) = (FDados.CConferNfeConsuCOD_NOTA.AsString)))) then
            Begin
              If not ((FDados.CImportTxtMOD.AsString) = ('65')) then
                  begin
                   FDados.CResultConfe.Append;
                   FDados.CResultConfeDATA_EMISSAO.AsString := FDados.CConferNfeConsuDATA_EMISSAO.AsString;
                   FDados.CResultConfeCOD_NOTA.AsInteger := FDados.CConferNfeConsuCOD_NOTA.AsInteger;
                   FDados.CResultConfeSERIE.AsInteger := FDados.CConferNfeConsuSERIE.AsInteger;
                   FDados.CResultConfeXML.AsString := FDados.CConferNfeConsuXML.AsString;
                   FDados.CResultConfeMOD.AsString := 'NF-e (' + (FDados.CConferNfeConsuMOD.AsString) + ')';
                   FDados.CResultConfeOPERACAO.AsString := FDados.CConferNfeConsuOPERACAO.AsString;
                   FDados.CResultConfeCASO.AsString := 'XML diverge com Codígo da Nota.';
                   FDados.CResultConfe.Post;
                  end;
              CountNFConsuXML := (CountNFConsuXML)+1;
            end;

          FDados.CConferNfeConsu.next;
        end;
    end;
  //----------------------------------------------------------

  //Mensagens
  StatusGeral.caption := 'Comparando Extrato com NF-e...';
  StatusGeral.Update;
  //----------------------------------------------------------

  //Busca os COD NOTA do extrato no Sistema. Obs: COD NOTA com mesma Série!
        FDados.CImportTxt.first;
             while not FDados.CImportTxt.Eof do
        begin
          If not ((FDados.CConferNfeConsu.Locate ('COD_NOTA',FDados.CImportTxtCOD_NOTA.AsInteger,[loCaseInsensitive])) and ((FDados.CImportTxtSERIE.AsInteger) = (FDados.CConferNfeConsuSERIE.AsInteger))) then
            Begin
              If not ((FDados.CImportTxtMOD.AsString) = ('65')) then
                  begin
                   FDados.CResultConfe.Append;
                   FDados.CResultConfeDATA_EMISSAO.AsString := FDados.CImportTxtDATA_EMISSAO.AsString;
                   FDados.CResultConfeCOD_NOTA.AsInteger := FDados.CImportTxtCOD_NOTA.AsInteger;
                   FDados.CResultConfeSERIE.AsInteger := FDados.CImportTxtSERIE.AsInteger;
                   FDados.CResultConfeXML.AsString := FDados.CImportTxtCHAVE.AsString;
                   FDados.CResultConfeMOD.AsString := 'NF-e (' + (FDados.CImportTxtMOD.AsString) + ')';
                   FDados.CResultConfeCASO.AsString := 'Não Encontrado no Sistema, Nº Nota do Extrato.';
                   FDados.CResultConfeOPERACAO.AsString := 'Não informado pelo Extrato.';
                   FDados.CResultConfe.Post;
                   CountExtNota := (CountExtNota)+1;
                  End;
            End
  //----------------------------------------------------------

  //Busca divergencia de XML e COD NOTA nos demais encontrados  Sefaz x Sistema. Obs: COD NOTA com mesma Série!
          Else if ((((FDados.CImportTxtCHAVE.AsString) = (FDados.CConferNfeConsuXML.AsString)) AND ((FDados.CImportTxtCOD_NOTA.AsString) <> (FDados.CConferNfeConsuCOD_NOTA.AsString))) or (((FDados.CImportTxtCHAVE.AsString) <> (FDados.CConferNfeConsuXML.AsString)) AND ((FDados.CImportTxtCOD_NOTA.AsString) = (FDados.CConferNfeConsuCOD_NOTA.AsString)))) then
            Begin
              If not ((FDados.CImportTxtMOD.AsString) = ('65')) then
                  begin
                   FDados.CResultConfe.Append;
                   FDados.CResultConfeDATA_EMISSAO.AsString := FDados.CImportTxtDATA_EMISSAO.AsString;
                   FDados.CResultConfeCOD_NOTA.AsInteger := FDados.CImportTxtCOD_NOTA.AsInteger;
                   FDados.CResultConfeSERIE.AsInteger := FDados.CImportTxtSERIE.AsInteger;
                   FDados.CResultConfeXML.AsString := FDados.CImportTxtCHAVE.AsString;
                   FDados.CResultConfeMOD.AsString := 'NF-e (' + (FDados.CImportTxtMOD.AsString) + ')';
                   FDados.CResultConfeCASO.AsString := 'XML diverge com Codígo da Nota.';
                   FDados.CResultConfeOPERACAO.AsString := 'Não informado pelo Extrato.';
                   FDados.CResultConfe.Post;
                   CountExtXML :=(CountExtXML)+1;
                  end;
            end;

          FDados.CImportTxt.next;
        end;
  //----------------------------------------------------------

  //Mensagens
      If ((CountExtXML>0) or (CountExtNOTA>0)) then
    Begin
      StatusCompExt.Caption := (IntToStr(Round(CountExtXML))) + ' XML x NOTA / ' + (IntToStr(Round(CountExtNOTA))) + ' NOTAS Não Localizadas.';
      StatusCompExt.Update;
    End
  Else
    Begin
      StatusCompExt.Caption := 'Nenhuma divergência encontrada.';;
      StatusCompExt.Update;
    End;

  If ((CountNFConsuXML>0) or (CountNFConsuNOTA>0)) then
    Begin
      StatusCompVendas.Caption := (IntToStr(Round(CountNFConsuXML))) + ' XML x NOTA / ' + (IntToStr(Round(CountNFConsuNOTA))) + ' NOTAS Não Localizadas.';
      StatusCompVendas.Update;
    End
  Else
    Begin
      StatusCompVendas.Caption := 'Nenhuma divergência encontrada.';
      StatusCompVendas.Update;
    End;
  StatusGeral.caption := 'Comparação NF-e Finalizada.';
  StatusGeral.Update;
  TButton(Sender).Caption := 'Comparação NF-e';
  Showmessage ('Comparação concluída!');
  //----------------------------------------------------------

end;
{$endregion}

//Etc:

{$region 'Funcionalidades'}

      {$region 'Check Pis/Cofins'}
procedure TFFiscal.CheckCumClick(Sender: TObject);
begin
    CheckNCum.Checked := False;
end;

procedure TFFiscal.CheckNCumClick(Sender: TObject);
begin
    CheckCum.Checked := False;
end;
       {$endregion}

      {$region 'Mensagens quando mexem na data'}
 //Funcinalidades quando mexem na data.
procedure TFFiscal.Data1Change(Sender: TObject);
begin
  StatusGeral.Caption := 'Selecione o período final...';
  StatusGeral.Update;
end;
procedure TFFiscal.Data2Change(Sender: TObject);
begin
  StatusGeral.Caption := 'Aguardando Conferência \ Comparação...';
  StatusGeral.Update;
end;

//----------------------------------------------------------
       {$endregion}

      {$region 'Ações quando inicia o Form'}
 //Funcionalidades quando inicia.
procedure TFFiscal.FormShow(Sender: TObject);
begin
  //ShowWindow(Handle, SW_MAXIMIZE);    //Iniciar Maximizado
  DBGridComparacao.visible := False;  //Esconde o grid
  DBGridEntradas.Visible := False;    //Esconde o grid
  DBGridExtrato.visible := False;     //Esconde o grid
  DBGridSaidas.visible := False;      //Esconde o grid
  DBGridProdutos.visible := False;    //Esconde o grid

  //Esconde Campos de comparação com Sefaz
  FFiscal.LabelStatus.Visible := False;
  FFiscal.LabelStatusNotas.Visible := False;
  FFiscal.StatusCompVendas.Visible := False;
  FFiscal.StatusCompExt.Visible := False;
  FFiscal.Shape4.Visible := False;
  FFiscal.Shape6.Visible := False;
  FFiscal.Shape10.Visible := False;
  FFiscal.Shape11.Visible := False;
  FFiscal.Shape13.Visible := False;
  FFiscal.ProgressBar1.Visible := False;
  FFiscal.ButImp.Visible := False;
  FFiscal.ButCompNfce.Visible := False;
  FFiscal.ButCompNfe.Visible := False;
  FFiscal.Memo1.Visible := False;
  FFiscal.StaticText1.Visible := False;
  FFiscal.StaticText4.Visible := False;
  FFiscal.StaticText5.Visible := False;
  FFiscal.StaticText6.Visible := False;
  FFiscal.ButCompEnt.Visible := False;
  FFiscal.StatSistemaSefaz.Visible := False;
  FFiscal.StatSefazSistema.Visible := False;
  FFiscal.StaticText10.Visible := False;
  FFiscal.ButCompNfeConsu.Visible := False;
  FFiscal.StaticText14.Visible := False;
  FFiscal.Edit1.Visible := False;
  FFiscal.StaticText15.Visible := False;
  FFiscal.Button3.Visible := False;

  //Se Banco Conectado aponta nome da empresa
  if (FDados.Dados.Connected = True) then
    Begin
    FDados.CInfoEmp.Active := True;
    End;

  StatusGeral.Caption := 'Comece selecionando período...';         // Instrução para o Usuário
  StatusGeral.Update;
  NomeEmp.Caption := FDados.CInfoEmpNOME_FANTASIA.value;    //Nome da empresa buscando direto do BD
  NomeEmp.Update;
  Data1.Date := StrtoDate(FormatDateTime('01/MM/yyyy',date));  // Inicia com o primeiro dia do mês
  Data2.Date := incmonth(Data1.Date,1)-1; //Busca primeiro dia do proximo mês -1

  LabCaminhoBanco.Caption := 'Conectado em : '+FDados.Dados.Params.Values['Database'];
end;
//----------------------------------------------------------
      {$endregion}

      {$region 'Ordena quando clicado no Titulo'}
procedure TFFiscal.DBGridSaidasTitleClick(Column: TColumn);
var
  idxName: string;
  ordenacao: TIndexOptions;
  I: Integer;
  DataSet: TClientDataset;
Begin

  DataSet := TClientDataset(Column.Grid.DataSource.DataSet);

// Configura a ordenação ascendente ou descendente
  if DataSet.IndexName = Column.FieldName + '_ASC' then
  begin
    idxName := Column.FieldName + '_DESC';
    ordenacao := [ixDescending];
  end
  else
  begin
    idxName := Column.FieldName + '_ASC';
    ordenacao := [];
  end;
//----------------------------------------------------------

// Adiciona a ordenação no DataSet, caso não exista
  if DataSet.IndexDefs.IndexOf(idxName) < 0 then
    Begin
    DataSet.AddIndex(idxName, Column.FieldName, ordenacao);
    End;
  DataSet.IndexDefs.Update;
//----------------------------------------------------------

// Atribui a ordenação selecionada
  DataSet.IndexName := idxName;
//----------------------------------------------------------

// Move o cursor para o primeiro registro
  DataSet.First;
//----------------------------------------------------------
end;
       {$endregion}

      {$region 'Exportar XLS'}

procedure TFFiscal.Exportar1Click(Sender: TObject);
  var
linha, coluna: integer;
planilha: variant;
valorCampo: string;
DataSet2: TClientDataset;
DBGRID2: TDBGrid;

begin

   //Usa DBGrid Ativo
   if DBGridExtrato.visible = True then
   Begin
     DBGRID2:=  DBGridExtrato;
   End;

   if DBGridEntradas.visible = true then
   Begin
     DBGRID2:=  DBGridEntradas;
   End;

   if DBGridSaidas.visible = true then
   Begin
     DBGRID2:=  DBGridSaidas;
   End;

   if DBGridComparacao.visible = true then
   Begin
     DBGRID2:=  DBGridComparacao;
   End;
  //----------------------------------------------------------

   //Busca o DataSet do DBGrid
   DataSet2 := TClientDataset(DBGrid2.DataSource.DataSet);
   //----------------------------------------------------------

   //Cria a planilha
   planilha:= CreateOleObject('Excel.Application');
   planilha.Workbooks.add(1);
   planilha.Cells.Select;
   planilha.Selection.NumberFormat := '@';
   planilha.caption:= 'Exportação de dados para o excel';
   planilha.visible:= true;
   DataSet2.First;
   //----------------------------------------------------------

   //Inclui linha
   for linha:= 0 to  DataSet2.RecordCount-1 do
   begin
      for coluna:= 1 to  DataSet2.FieldCount do
      begin
         valorCampo:= DataSet2.Fields[coluna-1].AsString;
         planilha.cells[linha+2,coluna]:= valorCampo;
      end;
     DataSet2.Next;
   end;
   //----------------------------------------------------------

   //Inclui a coluna
   for coluna:=1 to  DataSet2.FieldCount do
   begin
      valorCampo:=  DataSet2.Fields[coluna-1].DisplayLabel;
      planilha.cells[1,coluna]:= valorCampo;
   end;
   planilha.columns.AutoFit;
   //----------------------------------------------------------
end;
        {$endregion}

      {$region 'Entrar'}
procedure TFFiscal.EntrarClick(Sender: TObject);
begin
  if  (FLogin = nil) then
    begin
      FLogin := TFLogin.Create(Application);
    end;

  FLogin.ShowModal;
end;
        {$endregion}

      {$region 'Localizar'}
procedure TFFiscal.LocalizarClick(Sender: TObject);
begin
  if  (FLocalizar = nil) then
    begin
      FLocalizar := TFLocalizar.Create(Application);
    end;

  FLocalizar.ShowModal;
end;


{$endregion}

{$endregion}

End.
