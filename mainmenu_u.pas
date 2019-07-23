unit mainmenu_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmMainMenu = class(TForm)
    btnPlay: TButton;
    btnViewStats: TButton;
    btnOptions: TButton;
    btnRules: TButton;
    bnAdminOptions: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnViewStatsClick(Sender: TObject);
    procedure btnRulesClick(Sender: TObject);
    procedure btnOptionsClick(Sender: TObject);
    procedure bnAdminOptionsClick(Sender: TObject);
    procedure btnPlayClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMainMenu: TfrmMainMenu;

implementation

{$R *.dfm}

uses selection_u, rules_u, options_u, viewstats_u, admin_u;

procedure TfrmMainMenu.btnRulesClick(Sender: TObject);
begin
  frmMainMenu.Hide;
  frmRules.Show;
end;

procedure TfrmMainMenu.bnAdminOptionsClick(Sender: TObject);
begin
  frmMainMenu.Hide;
  frmAdmin.Show;
end;

procedure TfrmMainMenu.btnOptionsClick(Sender: TObject);
begin
  frmMainMenu.Hide;
  frmOptions.Show;
end;

procedure TfrmMainMenu.btnPlayClick(Sender: TObject);
begin
  frmMainMenu.Hide;
  frmSelection.Show;
end;

procedure TfrmMainMenu.btnViewStatsClick(Sender: TObject);
begin
  frmMainMenu.Hide;
  frmViewStats.Show;
end;

procedure TfrmMainMenu.FormCreate(Sender: TObject);
begin
  left := (Screen.WorkAreaWidth div 2) - (frmMainMenu.Width div 2);
  top := (Screen.WorkAreaHeight div 2) - (frmMainMenu.Height div 2);
end;

end.
