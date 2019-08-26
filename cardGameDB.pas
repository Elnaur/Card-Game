unit cardGameDB;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TdataM = class(TDataModule)
    tblUsers: TADOTable;
    connCardGameDB: TADOConnection;
    tblPremiumCodes: TADOTable;
    tblSelectedPokemon: TADOTable;
    tblPokemonList: TADOTable;
    dsAvailablePokemon: TDataSource;
    dsSelectedPokemon: TDataSource;
    tblAvailablePokemon: TADOTable;
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
  tblSelectedPokemon.Active := True;
  tblPokemonList.Active := True;
  tblAvailablePokemon.Active := True;
end;

end.
