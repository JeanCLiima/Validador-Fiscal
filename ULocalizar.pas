unit ULocalizar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.FileCtrl;

type
  TFLocalizar = class(TForm)
    DriveComboBox1: TDriveComboBox;
    DirectoryListBox1: TDirectoryListBox;
    FileListBox1: TFileListBox;
    Edit1: TEdit;
    Repostorio: TStaticText;
    Caminho: TStaticText;
    ButLocalizar: TButton;
    procedure ButLocalizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLocalizar: TFLocalizar;

implementation

{$R *.dfm}

uses UFiscal;

procedure TFLocalizar.ButLocalizarClick(Sender: TObject);
begin
  If (Edit1.Text= 'ExtratoNFe.txt') then
    begin
      FFiscal.Edit1.Text := FLocalizar.Edit1.Text;
      FLocalizar.Close;
    end
  Else
    begin
      Showmessage('Arquivo incompatível, por favor utilizar o arquivo ExtratoNFe.txt.' )
    end;
end;

end.
