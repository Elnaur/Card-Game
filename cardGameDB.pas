unit cardGameDB;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TdataM = class(TDataModule)
    tblUsers: TADOTable;
    connCardGameDB: TADOConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dataM: TdataM;

implementation

{$R *.dfm}

end.
