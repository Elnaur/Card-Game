unit signup_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, JPEG, cardGameDB;

type
  TfrmSignUp = class(TForm)
    lblUsername: TLabel;
    lblPassword: TLabel;
    lblRePassword: TLabel;
    edtUsername: TEdit;
    edtPassword: TEdit;
    edtRePassword: TEdit;
    btnSignUp: TButton;
    btnBackToLogin: TButton;
    cbSavePass: TCheckBox;
    procedure btnBackToLoginClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSignUpClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSignUp: TfrmSignUp;

implementation

{$R *.dfm}

uses login_u, mainmenu_u, encryption_u;

procedure TfrmSignUp.btnSignUpClick(Sender: TObject);
var
  fSavedUser: Textfile;
begin
  if edtPassword.Text = edtRePassword.Text then
  begin
    with dataM do
    begin
      tblUsers.Open;
      tblUsers.First;
      while not tblUsers.EoF do // Checks if username is taken
      begin
        if DecryptStr(tblUsers['Username'], key) = edtUsername.Text then
        begin
          Showmessage('Username already taken.');
          tblUsers.Close;
          exit;
        end;
        tblUsers.Next;
      end;
      tblUsers.Append;
      tblUsers['Username'] := EncryptStr(edtUsername.Text, key);
      tblUsers['Password'] := EncryptStr(edtPassword.Text, key);
      tblUsers.Post;
      tblUsers.Close;
      if cbSavePass.Checked = True then
      begin
        if FileExists(GetCurrentDir + '/text/savedUser.txt') then
        begin
          Assignfile(fSavedUser, GetCurrentDir + '/text/savedUser.txt');
          Rewrite(fSavedUser);
          writeln(fSavedUser, EncryptStr(edtUsername.Text, key));
          writeln(fSavedUser, EncryptStr(edtPassword.Text, key));
          CloseFile(fSavedUser);
        end;
      end;

      frmSignup.Hide;
      frmMainMenu.Show;

    end;
  end
  else
  begin
    Showmessage('Passwords do not match.');
    edtPassword.Text := '';
    edtRePassword.Text := '';
  end;

end;

procedure TfrmSignUp.btnBackToLoginClick(Sender: TObject);
begin
  frmLogin.Show;
  frmSignUp.Hide;
end;

procedure TfrmSignUp.FormCreate(Sender: TObject);
begin
  left := (Screen.Width div 2) - (frmSignUp.Width div 2);
  top := (Screen.WorkAreaHeight div 2) - (frmSignUp.Height div 2);
end;

procedure TfrmSignUp.FormShow(Sender: TObject);
begin
  left := frmLogin.left;
  top := frmLogin.top;
end;

end.
