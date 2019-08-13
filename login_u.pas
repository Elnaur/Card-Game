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
  TUserInfo = record { class }
    Username: string;
    Admin: boolean;
    PremiumUser: boolean;
    Password: string;
    SelectionString: string;
    Won : integer;
    Lost : integer;
    Created : TDateTime
  end;

var
  frmLogin: TfrmLogin;
  UserInfo: TUserInfo;

const
  key = 2321;

implementation

{$R *.dfm}

uses signup_u, mainmenu_u, cardGameDB, encryption_u;

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
      if (tblUsers['Username'] = edtUsername.Text) and
        (DecryptStr(tblUsers['Password'], key) = edtPassword.Text) then
      begin
        //Showmessage('Valid username and password.');
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

        // Adds current user data to a record for easy access

        UserInfo.Username := tblUsers['Username'];
        UserInfo.Password := (DecryptStr(tblUsers['Password'], key));
        UserInfo.Admin := tblUsers['Admin'];
        UserInfo.PremiumUser := tblUsers['Premium user'];
        UserInfo.Won := tblUsers['Won'];
        UserInfo.Lost := tblUsers['Lost'];
        UserInfo.Created := tblUsers['Account creation date'];

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
