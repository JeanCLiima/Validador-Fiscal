object FLocalizar: TFLocalizar
  Left = 0
  Top = 0
  Caption = 'Localizar'
  ClientHeight = 350
  ClientWidth = 347
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DriveComboBox1: TDriveComboBox
    Left = 8
    Top = 22
    Width = 331
    Height = 19
    DirList = DirectoryListBox1
    TabOrder = 0
  end
  object DirectoryListBox1: TDirectoryListBox
    Left = 8
    Top = 47
    Width = 331
    Height = 106
    FileList = FileListBox1
    TabOrder = 1
  end
  object FileListBox1: TFileListBox
    Left = 8
    Top = 159
    Width = 331
    Height = 106
    FileEdit = Edit1
    ItemHeight = 13
    TabOrder = 2
  end
  object Edit1: TEdit
    Left = 8
    Top = 294
    Width = 331
    Height = 21
    TabOrder = 3
    Text = '*.*'
  end
  object Repostorio: TStaticText
    Left = 8
    Top = 5
    Width = 62
    Height = 17
    Caption = 'Reposit'#243'rio:'
    TabOrder = 4
  end
  object Caminho: TStaticText
    Left = 8
    Top = 274
    Width = 49
    Height = 17
    Caption = 'Caminho:'
    TabOrder = 5
  end
  object ButLocalizar: TButton
    Left = 128
    Top = 321
    Width = 89
    Height = 25
    Caption = 'Localizar'
    TabOrder = 6
    OnClick = ButLocalizarClick
  end
end
