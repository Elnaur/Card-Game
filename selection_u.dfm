object frmSelection: TfrmSelection
  Left = 0
  Top = 0
  Caption = 'frmSelection'
  ClientHeight = 649
  ClientWidth = 890
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblSelection: TLabel
    Left = 648
    Top = 112
    Width = 116
    Height = 18
    Caption = 'Your selection'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object lblAvailable: TLabel
    Left = 112
    Top = 112
    Width = 161
    Height = 18
    Caption = 'Available Pokemon '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object dbgAvailable: TDBGrid
    Left = 8
    Top = 136
    Width = 380
    Height = 446
    DataSource = dataM.dsPokemonList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object dbgSelection: TDBGrid
    Left = 504
    Top = 136
    Width = 380
    Height = 446
    DataSource = dataM.dsUserToPokemon
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object bbRemove: TBitBtn
    Left = 453
    Top = 240
    Width = 45
    Height = 169
    Caption = '<-'
    DoubleBuffered = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentDoubleBuffered = False
    ParentFont = False
    TabOrder = 2
    OnClick = bbRemoveClick
  end
  object bbAdd: TBitBtn
    Left = 394
    Top = 240
    Width = 45
    Height = 169
    Caption = '->'
    DoubleBuffered = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentDoubleBuffered = False
    ParentFont = False
    TabOrder = 3
    OnClick = bbAddClick
  end
  object btnPlay: TButton
    Left = 736
    Top = 588
    Width = 137
    Height = 53
    Caption = 'PLAY'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = btnPlayClick
  end
  object rdgSort: TRadioGroup
    Left = 8
    Top = 16
    Width = 625
    Height = 79
    Caption = 'Sort Pokemon'
    Columns = 7
    Ctl3D = True
    DoubleBuffered = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ItemIndex = 18
    Items.Strings = (
      'Bug'
      'Electric'
      'Fire'
      'Grass'
      'Normal'
      'Rock'
      'Dark'
      'Fairy'
      'Flying'
      'Ground'
      'Poison'
      'Steel'
      'Dragon'
      'Fighting'
      'Ghost'
      'Ice'
      'Psychic'
      'Water'
      'All'
      'Alphabetical')
    ParentCtl3D = False
    ParentDoubleBuffered = False
    ParentFont = False
    TabOrder = 5
    OnClick = rdgSortClick
  end
  object btnClear: TButton
    Left = 608
    Top = 588
    Width = 99
    Height = 25
    Caption = 'Clear selection'
    TabOrder = 6
  end
end
