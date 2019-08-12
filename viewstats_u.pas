unit viewstats_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmViewStats = class(TForm)
    lblStatsHeading: TLabel;
    lblUsername: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmViewStats: TfrmViewStats;

implementation

{$R *.dfm}

uses login_u;

procedure TfrmViewStats.FormCreate(Sender: TObject);
begin
  lblUsername.Caption := UserInfo.Username;
end;

end.
