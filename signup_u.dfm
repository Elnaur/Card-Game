object frmSignUp: TfrmSignUp
  Left = 0
  Top = 0
  Caption = 'frmSignUp'
  ClientHeight = 372
  ClientWidth = 306
  Color = clBtnFace
  Constraints.MaxHeight = 411
  Constraints.MaxWidth = 322
  Constraints.MinHeight = 411
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
    Top = 136
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
    Top = 192
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
  object edtUsername: TEdit
    Left = 147
    Top = 133
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
    Top = 184
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
    Left = 96
    Top = 293
    Width = 113
    Height = 40
    Caption = 'Sign up'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = btnSignUpClick
  end
  object btnBackToLogin: TButton
    Left = 104
    Top = 339
    Width = 97
    Height = 25
    Caption = 'Back to login'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = btnBackToLoginClick
  end
  object cbSavePass: TCheckBox
    Left = 20
    Top = 259
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
    TabOrder = 3
  end
end
