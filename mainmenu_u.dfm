object frmMainMenu: TfrmMainMenu
  Left = 0
  Top = 0
  Caption = 'frmMainMenu'
  ClientHeight = 554
  ClientWidth = 891
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object btnPlay: TButton
    Left = 632
    Top = 456
    Width = 177
    Height = 57
    Caption = 'btnPlay'
    TabOrder = 0
    OnClick = btnPlayClick
  end
  object btnViewStats: TButton
    Left = 112
    Top = 256
    Width = 113
    Height = 33
    Caption = 'btnViewStats'
    TabOrder = 1
    OnClick = btnViewStatsClick
  end
  object btnOptions: TButton
    Left = 112
    Top = 368
    Width = 113
    Height = 33
    Caption = 'btnOptions'
    TabOrder = 2
    OnClick = btnOptionsClick
  end
  object btnRules: TButton
    Left = 112
    Top = 312
    Width = 113
    Height = 33
    Caption = 'btnRules'
    TabOrder = 3
    OnClick = btnRulesClick
  end
  object btnAdminOptions: TButton
    Left = 112
    Top = 472
    Width = 113
    Height = 41
    Caption = 'btnAdminOptions'
    TabOrder = 4
    OnClick = btnAdminOptionsClick
  end
end
