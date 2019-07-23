program cardGame_p;

uses
  Forms,
  login_u in 'login_u.pas' {frmLogin},
  signup_u in 'signup_u.pas' {frmSignUp},
  cardGameDB in 'cardGameDB.pas' {dataM: TDataModule},
  mainmenu_u in 'mainmenu_u.pas' {frmMainMenu},
  encryption_u in 'encryption_u.pas',
  selection_u in 'selection_u.pas' {frmSelection},
  options_u in 'options_u.pas' {frmOptions},
  rules_u in 'rules_u.pas' {frmRules},
  viewstats_u in 'viewstats_u.pas' {frmViewStats},
  gamescreen_u in 'gamescreen_u.pas' {frmGameScreen},
  admin_u in 'admin_u.pas' {frmAdmin};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmSignUp, frmSignUp);
  Application.CreateForm(TdataM, dataM);
  Application.CreateForm(TfrmMainMenu, frmMainMenu);
  Application.CreateForm(TfrmSelection, frmSelection);
  Application.CreateForm(TfrmOptions, frmOptions);
  Application.CreateForm(TfrmRules, frmRules);
  Application.CreateForm(TfrmViewStats, frmViewStats);
  Application.CreateForm(TfrmGameScreen, frmGameScreen);
  Application.CreateForm(TfrmAdmin, frmAdmin);
  Application.Run;
end.
