object dataM: TdataM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 321
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
      'B.mdb;Persist Security Info=False'
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
  object tblUserToPokemon: TADOTable
    Connection = connCardGameDB
    TableName = 'UserToPokemon'
    Left = 176
    Top = 160
  end
  object tblPokemonList: TADOTable
    Connection = connCardGameDB
    TableName = 'PokemonList'
    Left = 176
    Top = 232
  end
  object dsPokemonList: TDataSource
    DataSet = tblPokemonList
    Left = 280
    Top = 232
  end
  object dsUserToPokemon: TDataSource
    DataSet = tblUserToPokemon
    Left = 280
    Top = 160
  end
end
