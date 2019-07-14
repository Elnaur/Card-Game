unit login_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, JPEG, pngimage, cardGameDB;

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

var
  frmLogin: TfrmLogin;

const
  key = 42;

implementation

{$R *.dfm}

uses signup_u, mainmenu_u, encryption_u;

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
      if (DecryptStr(tblUsers['Username'], key) = edtUsername.Text) and
        (DecryptStr(tblUsers['Password'], key) = edtPassword.Text) then
      begin
        Showmessage('Valid username and password.');
        if cbSavePass.Checked = True then
        begin
          if FileExists(GetCurrentDir + '/media/text/savedUser.txt') then
          begin
            Assignfile(fSavedUser, GetCurrentDir + '/media/text/savedUser.txt');
            Rewrite(fSavedUser);
            writeln(fSavedUser, EncryptStr(edtUsername.Text, key));
            writeln(fSavedUser, EncryptStr(edtPassword.Text, key));
            CloseFile(fSavedUser);
          end;
        end;
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
  u, p : string;
begin

  if FileExists(GetCurrentDir + '/media/text/savedUser.txt') then
  begin
    Assignfile(fSavedUser, GetCurrentDir + '/media/text/savedUser.txt');
    Reset(fSavedUser);
    readln(fSavedUser, u);
    readln(fSavedUser, p);
    edtUsername.Text := DecryptStr(u, key);
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
