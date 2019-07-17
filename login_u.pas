unit login_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, JPEG, pngimage, DB, ADODB;

type
  TfrmLogin = class(TForm)
    edtUsername: TEdit;
    edtPassword: TEdit;
    lblUsername: TLabel;
    lblPassword: TLabel;
    btnLogin: TButton;
    btnSignUp: TButton;
    cbSavePass: TCheckBox;
    procedure btnSignUpClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

type
  TUserInfo = record{class}
    Username: string;
    Admin: boolean;
    PremiumUser: boolean;
    Password: string;
    GamesWon: integer;
    GamesLost: integer;
    CardNum: integer;
    Selected : string;
    //Cards: TADOtable;

    constructor Create(tblName: string);
  end;

var
  frmLogin: TfrmLogin;
  UserInfo: TUserInfo;

const
  key = 42;

implementation

{$R *.dfm}

uses signup_u, mainmenu_u, cardGameDB, encryption_u;

{
constructor TUserInfo.Create(Username: String);
begin
  dataM.connCardGameDB.Connected := False;
  Cards := TADOtable.Create(dataM);
  Cards.TableName := 'tbl' + Username + 'Cards';
  Cards.Connection := dataM.connCardGameDB;
  Cards.ConnectionString :=
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
end;
}

procedure TfrmLogin.btnLoginClick(Sender: TObject);
var
  fSavedUser: Textfile;

begin
  with dataM do
  begin
    tblUsers.Open;
    tblUsers.First;
    while not tblUsers.EoF do
    begin
      if tblUsers['Username'] = edtUsername.Text and
        (DecryptStr(tblUsers['Password'], key) = edtPassword.Text) then
      begin
        Showmessage('Valid username and password.');
        if cbSavePass.Checked = True then
        begin
          if FileExists(GetCurrentDir + '/lib/text/savedUser.txt') then
          begin
            Assignfile(fSavedUser, GetCurrentDir + '/lib/text/savedUser.txt');
            Rewrite(fSavedUser);
            writeln(fSavedUser, edtUsername.Text);
            writeln(fSavedUser, EncryptStr(edtPassword.Text, key));
            CloseFile(fSavedUser);
          end;
        end;

        UserInfo.Username := tblUsers['Username'];
        UserInfo.Password := (DecryptStr(tblUsers['Password'], key));
        UserInfo.Admin := tblUsers['Admin'];
        UserInfo.PremiumUser := tblUsers['PremiumUser'];
        UserInfo.GamesWon := tblUsers['Won'];
        UserInfo.GamesLost := tblUsers['Lost'];
        UserInfo.CardNum := tblUsers['CardNum'];

        tblUsers.Close;

        frmMainMenu.Show;
        frmLogin.Hide;

        exit;
      end;
      tblUsers.Next;
    end;
    Showmessage('Invalid username or password.');
    tblUsers.Close;
  end;
end;

procedure TfrmLogin.btnSignUpClick(Sender: TObject);
begin
  frmSignUp.Show;
  frmLogin.Hide;
end;

procedure TfrmLogin.FormCreate(Sender: TObject);
var
  fSavedUser: Textfile;
  u, p: string;
begin
  if FileExists(GetCurrentDir + '/lib/text/savedUser.txt') then
  begin
    Assignfile(fSavedUser, GetCurrentDir + '/lib/text/savedUser.txt');
    Reset(fSavedUser);
    readln(fSavedUser, u);
    readln(fSavedUser, p);
    edtUsername.Text := u;
    edtPassword.Text := DecryptStr(p, key);
    CloseFile(fSavedUser);
  end
  else
  begin
    edtUsername.Text := '';
    edtPassword.Text := '';
  end;
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
  left := frmSignUp.left;
  top := frmSignUp.top;
end;

end.
