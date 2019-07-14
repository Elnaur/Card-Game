unit mainmenu_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

type
  TfrmMainMenu = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMainMenu: TfrmMainMenu;

implementation

{$R *.dfm}

procedure TfrmMainMenu.FormCreate(Sender: TObject);
begin
  left := (Screen.WorkAreaWidth div 2) - (frmMainMenu.Width div 2);
  top := (Screen.WorkAreaHeight div 2) - (frmMainMenu.Height div 2);
end;

end.
