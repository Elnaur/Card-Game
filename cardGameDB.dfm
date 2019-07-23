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
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source=C:\Us' +
      'ers\Nicole\Documents\High School PHA\Gr 11 WK 2019\IT - Mr W The' +
      'ron\PAT\lib\databases\CardGameDB.mdb;Mode=Share Deny None;Persis' +
      't Security Info=False;Jet OLEDB:System database="";Jet OLEDB:Reg' +
      'istry Path="";Jet OLEDB:Database Password="";Jet OLEDB:Engine Ty' +
      'pe=5;Jet OLEDB:Database Locking Mode=1;Jet OLEDB:Global Partial ' +
      'Bulk Ops=2;Jet OLEDB:Global Bulk Transactions=1;Jet OLEDB:New Da' +
      'tabase Password="";Jet OLEDB:Create System Database=False;Jet OL' +
      'EDB:Encrypt Database=False;Jet OLEDB:Don'#39't Copy Locale on Compac' +
      't=False;Jet OLEDB:Compact Without Replica Repair=False;Jet OLEDB' +
      ':SFP=False;'
    LoginPrompt = False
    Mode = cmShareDenyNone
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
