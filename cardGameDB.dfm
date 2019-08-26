object dataM: TdataM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 443
  Width = 553
  object tblUsers: TADOTable
    Connection = connCardGameDB
    CursorType = ctStatic
    TableName = 'Users'
    Left = 176
    Top = 16
  end
  object connCardGameDB: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Users\lounic16\D' +
      'ocuments\Programming\PAT\Gr 11 Card Game\lib\databases\CardGameD' +
      'B.mdb;Persist Security Info=False;'
    LoginPrompt = False
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 48
    Top = 120
  end
  object tblPremiumCodes: TADOTable
    Connection = connCardGameDB
    CursorType = ctStatic
    TableName = 'PremiumUserCodes'
    Left = 176
    Top = 88
  end
  object tblSelectedPokemon: TADOTable
    Connection = connCardGameDB
    TableName = 'SelectedPokemon'
    Left = 176
    Top = 232
  end
  object tblPokemonList: TADOTable
    Connection = connCardGameDB
    TableName = 'PokemonList'
    Left = 176
    Top = 160
  end
  object dsAvailablePokemon: TDataSource
    DataSet = tblPokemonList
    Left = 320
    Top = 304
  end
  object dsSelectedPokemon: TDataSource
    DataSet = tblSelectedPokemon
    Left = 320
    Top = 232
  end
  object tblAvailablePokemon: TADOTable
    Connection = connCardGameDB
    TableName = 'AvailablePokemon'
    Left = 176
    Top = 304
  end
end
