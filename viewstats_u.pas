unit viewstats_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmViewStats = class(TForm)
    lblStatsHeading: TLabel;
    lblUsername: TLabel;
    lblWon: TLabel;
    lblLost: TLabel;
    lblPlayed: TLabel;
    lblAge: TLabel;
    lblPremium: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure FormShow(Sender: TObject);
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

procedure TfrmViewStats.FormShow(Sender: TObject);
begin
  lblStatsHeading.left := (width div 2) - (lblStatsHeading.Width div 2);

  lblUsername.Caption := UserInfo.Username;
  lblUsername.left := (width div 2) - (lblUsername.Width div 2);

end;

end.
