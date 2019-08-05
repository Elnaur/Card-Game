unit cardGameDB;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TdataM = class(TDataModule)
    tblUsers: TADOTable;
    connCardGameDB: TADOConnection;
    tblPremiumCodes: TADOTable;
    tblUserToPokemon: TADOTable;
    tblPokemonList: TADOTable;
    dsPokemonList: TDataSource;
    dsUserToPokemon: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dataM: TdataM;

implementation

{$R *.dfm}

procedure TdataM.DataModuleCreate(Sender: TObject);
var
  path: string;
begin
  connCardGameDB.Close;
  path := GetCurrentDir + '/lib/databases/CardGameDB.mdb';
  connCardGameDB.connectionString :=
    'Provider=Microsoft.Jet.OLEDB.4.0; Data Source= ' + path +
    '; Persist Security info=false';
  connCardGameDB.Open;
  connCardGameDB.Connected := True;
  tblUsers.Active := True;
  tblPremiumCodes.Active := True;
  tblUserToPokemon.Active := True;
  tblPokemonList.Active := True;
end;

end.
