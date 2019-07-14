program cardGame_p;

uses
  Forms,
  login_u in 'login_u.pas' {frmLogin},
  signup_u in 'signup_u.pas' {frmSignUp},
  cardGameDB in 'cardGameDB.pas' {dataM: TDataModule},
  mainmenu_u in 'mainmenu_u.pas' {frmMainMenu},
  encryption_u in 'encryption_u.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmSignUp, frmSignUp);
  Application.CreateForm(TdataM, dataM);
  Application.CreateForm(TfrmMainMenu, frmMainMenu);
  Application.Run;
end.
