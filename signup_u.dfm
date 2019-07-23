object frmSignUp: TfrmSignUp
  Left = 0
  Top = 0
  Caption = 'frmSignUp'
  ClientHeight = 396
  ClientWidth = 306
  Color = clBtnFace
  Constraints.MaxHeight = 435
  Constraints.MaxWidth = 322
  Constraints.MinHeight = 435
  Constraints.MinWidth = 322
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
  object lblUsername: TLabel
    Left = 20
    Top = 141
    Width = 63
    Height = 13
    Caption = 'Username:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object lblPassword: TLabel
    Left = 20
    Top = 197
    Width = 59
    Height = 13
    Caption = 'Password:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object lblRePassword: TLabel
    Left = 20
    Top = 224
    Width = 113
    Height = 13
    Caption = 'Re-enter password:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object lblCode: TLabel
    Left = 20
    Top = 251
    Width = 87
    Height = 13
    Caption = 'Premium code:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object edtUsername: TEdit
    Left = 147
    Top = 138
    Width = 121
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object edtPassword: TEdit
    Left = 147
    Top = 194
    Width = 121
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 1
  end
  object edtRePassword: TEdit
    Left = 147
    Top = 221
    Width = 121
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 2
  end
  object btnSignUp: TButton
    Left = 88
    Top = 315
    Width = 113
    Height = 40
    Caption = 'Sign up'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = btnSignUpClick
    OnEnter = btnSignUpClick
  end
  object btnBackToLogin: TButton
    Left = 104
    Top = 361
    Width = 81
    Height = 25
    Caption = 'Back to login'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = btnBackToLoginClick
  end
  object cbSavePass: TCheckBox
    Left = 20
    Top = 283
    Width = 113
    Height = 17
    Caption = 'Save password'
    Checked = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    State = cbChecked
    TabOrder = 4
  end
  object edtCode: TEdit
    Left = 147
    Top = 248
    Width = 121
    Height = 21
    TabOrder = 3
  end
end
