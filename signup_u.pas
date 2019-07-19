unit signup_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, JPEG, cardGameDB, DB, ADODB;

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
    lblCode: TLabel;
    edtCode: TEdit;
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
  CodeValid: boolean;
  fDefaultPokemonSelection : Textfile;
begin
  if edtPassword.Text = edtRePassword.Text then
  begin
    with dataM do
    begin
      tblPremiumCodes.Open;
      tblPremiumCodes.First;

      CodeValid := False;
      if edtCode.Text <> '' then // Verify premium code  if there is one
      begin
        while not(tblPremiumCodes.EoF) do
        begin
          if (tblPremiumCodes['Code'] = edtCode.Text) and
            (tblPremiumCodes['Used'] = False) then
          begin
            CodeValid := True;
            tblPremiumCodes['Used'] := True;
          end;
        end;

        if CodeValid = False then
        begin
          ShowMessage('Invalid or used premium code.');
          exit;
        end;

      end;

      tblUsers.Open;
      tblUsers.First;
      while not tblUsers.EoF do // Checks if username is taken
      begin
        if tblUsers['Username'] = edtUsername.Text then
        begin
          ShowMessage('Username already taken.');
          tblUsers.Close;
          exit;
        end;
        tblUsers.Next;
      end;

      tblUsers.Append;
      tblUsers['Username'] := edtUsername.Text;
      tblUsers['Password'] := EncryptStr(edtPassword.Text, key);

      if CodeValid = True then
      begin
        tblUsers['Premium user'] := True;
      end;

      UserInfo.Username := tblUsers['Username'];
      UserInfo.Password := (DecryptStr(tblUsers['Password'], key));
      UserInfo.Admin := tblUsers['Admin'];
      UserInfo.PremiumUser := tblUsers['PremiumUser'];

      Assignfile(fDefaultPokemonSelection, GetCurrentDir + '/lib/text/DefaultPokemonSelection.txt');
      readln(fDefaultPokemonSelection, UserInfo.Selected);
      CloseFile(fDefaultPokemonSelection);

      tblUsers['Selected'] := UserInfo.Selected;

      tblUsers.Post;
      tblUsers.Close;

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

      frmSignUp.Hide;
      frmMainMenu.Show;

    end;
  end
  else
  begin
    ShowMessage('Passwords do not match.');
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
  left := (Screen.WorkAreaWidth div 2) - (frmSignUp.Width div 2);
  top := (Screen.WorkAreaHeight div 2) - (frmSignUp.Height div 2);
end;

procedure TfrmSignUp.FormShow(Sender: TObject);
begin
  edtUsername.Text := frmLogin.edtUsername.Text;
  edtPassword.Text := frmLogin.edtPassword.Text;

  left := frmLogin.left;
  top := frmLogin.top;
end;

end.
