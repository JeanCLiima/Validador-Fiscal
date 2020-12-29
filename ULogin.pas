unit ULogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFLogin = class(TForm)
    EditId: TEdit;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    EditNome: TEdit;
    StaticText3: TStaticText;
    EditSenha: TEdit;
    ButEnt: TButton;
    procedure Edit1Enter(Sender: TObject);
    procedure ButEntClick(Sender: TObject);
    procedure KeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLogin: TFLogin;

implementation

{$R *.dfm}

uses UDados, UFiscal;

procedure TFLogin.Edit1Enter(Sender: TObject);
begin
//Se não tiver em branco
 If not (EditId.text = '') then
  Begin
    //Busca os dados do Cod. Usuario preenchido
    FDados.CUsuario.Close;
    FDados.SUsuario.ParamByName('COD_USU').Value := strtoint(EditId.Text);
    FDados.CUsuario.Open;

    //Joga o nome no EditNome
    EditNome.Text := FDados.CUsuarioNOME_USUARIO.value;
  End
 Else

//Se nada estiver preenchido não deixa ir para próximo passo;
  showmessage('Preencha o Código de Usuário');
end;

procedure TFLogin.ButEntClick(Sender: TObject);
begin
//Se localizar nome de usuário prossegue
   if not (EditNome.Text = '') then
    begin
      //Se senha correta devolve as informações
      IF (FDados.CUsuarioSENHA.Value)=(EditSenha.Text) Then
        Begin
           If not (FDados.CUsuarioNOME_USUARIO.Value='MASTER') then
              begin
                Showmessage('Usuário sem Permissão');
              end
            Else
              begin
                //Ativa Campos de Comparação com Sefaz
                FFiscal.LabelStatus.Visible := True;
                FFiscal.LabelStatusNotas.Visible := True;
                FFiscal.StatusCompVendas.Visible := True;
                FFiscal.StatusCompExt.Visible := True;
                FFiscal.Shape4.Visible := True;
                FFiscal.Shape6.Visible := True;
                FFiscal.Shape10.Visible := True;
                FFiscal.Shape11.Visible := True;
                FFiscal.Shape13.Visible := True;
                FFiscal.ProgressBar1.Visible := True;
                FFiscal.ButImp.Visible := True;
                FFiscal.ButCompNfce.Visible := True;
                FFiscal.ButCompNfe.Visible := True;
                FFiscal.StaticText4.Visible := True;
                FFiscal.StaticText5.Visible := True;
                FFiscal.StaticText6.Visible := True;
                FFiscal.ButCompEnt.Visible := True;
                FFiscal.StatSistemaSefaz.Visible := True;
                FFiscal.StatSefazSistema.Visible := True;
                FFiscal.StaticText10.Visible := True;
                FFiscal.ButCompNfeConsu.Visible := True;
                FFiscal.StaticText14.Visible := True;
                FFiscal.Edit1.Visible := True;
                FFiscal.StaticText15.Visible := True;
                FFiscal.Button3.Visible := True;
                //FFiscal.StaticText3.Visible := True;
                //FFiscal.Button4.Visible := True;
                //FFiscal.StaticText8.Visible := True;
                //FFiscal.Button5.Visible := True;
              end;

            FLogin.Close;       //Fecha Form
        End

       //Se senha retorta erro.
       Else
        Begin
          Showmessage('Usuário ou Senha Incorreta');
        End;
    end

//Se não localizar devolve erro.
   Else
    begin
      Showmessage('Código de Usuário inválido');
    end;
end;

procedure TFLogin.KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    begin
      key := #0;
      perform(wm_nextdlgctl,0,0);
    end;
end;

end.
