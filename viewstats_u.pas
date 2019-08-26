unit viewstats_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DateUtils;

type
  TfrmViewStats = class(TForm)
    lblStatsHeading: TLabel;
    lblUsername: TLabel;
    lblWon: TLabel;
    lblLost: TLabel;
    lblPlayed: TLabel;
    lblAge: TLabel;
    lblPremium: TLabel;
    lblUWon: TLabel;
    lblULost: TLabel;
    lblUPlayed: TLabel;
    lblUAge: TLabel;
    lblUPremium: TLabel;
    lblCreated: TLabel;
    lblUCreated: TLabel;
    procedure FormShow(Sender: TObject);
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
  ShortDateFormat := 'yyyy/mm/dd';
end;

procedure TfrmViewStats.FormShow(Sender: TObject);
begin
  lblStatsHeading.left := (width div 2) - (lblStatsHeading.width div 2);

  lblUsername.Caption := UserInfo.Username;
  lblUsername.left := (width div 2) - (lblUsername.width div 2);

  lblUWon.Caption := IntToStr(UserInfo.Won);
  lblULost.Caption := IntToStr(UserInfo.Lost);
  lblUPlayed.Caption := IntToStr(UserInfo.Lost + UserInfo.Won);
  lblUAge.Caption := IntToStr(DaysBetween(UserInfo.Created, Date)) + ' days';
  lblUCreated.Caption := DateToStr(UserInfo.Created);

  if UserInfo.PremiumUser = True then
    lblUPremium.Caption := 'Premium'
  else if UserInfo.Admin = True then
    lblUPremium.Caption := 'Admin'
  else
    lblUPremium.Caption := 'Standard';

end;

end.
