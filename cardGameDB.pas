unit cardGameDB;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TdataM = class(TDataModule)
    tblUsers: TADOTable;
    connCardGameDB: TADOConnection;
    tblPremiumCodes: TADOTable;
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
begin
  connCardGameDB.Connected := False;
  connCardGameDB.connectionString :=
    'Provider=Microsoft.Jet.OLEDB.4.0;' + 'User ID=Admin;' + 'Data Source=' +
    GetCurrentDir + '\lib\databases\CardGameDB.mdb;' +
    'Mode=Share Deny None;' + 'Persist Security Info=False;' +
    'Jet OLEDB:System database="";' + 'Jet OLEDB:Registry Path="";' +
    'Jet OLEDB:Database Password="";' + 'Jet OLEDB:Engine Type=5;' +
    'Jet OLEDB:Database Locking Mode=1;' +
    'Jet OLEDB:Global Partial Bulk Ops=2;' +
    'Jet OLEDB:Global Bulk Transactions=1;' +
    'Jet OLEDB:New Database Password="";' +
    'Jet OLEDB:Create System Database=False;' +
    'Jet OLEDB:Encrypt Database=False;' +
    'Jet OLEDB:Don''t Copy Locale on Compact=False;' +
    'Jet OLEDB:Compact Without Replica Repair=False;' + 'Jet OLEDB:SFP=False';
  connCardGameDB.Connected := True;
  tblUsers.Active := True;
  tblPremiumCodes.Active := True;
end;

end.
