unit selection_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, CheckLst, DB, ADODB, ExtCtrls;

type
  TfrmSelection = class(TForm)
    dbgAvailable: TDBGrid;
    dbgSelection: TDBGrid;
    bbRemove: TBitBtn;
    bbAdd: TBitBtn;
    btnPlay: TButton;
    lblSelection: TLabel;
    lblAvailable: TLabel;
    rdgSort: TRadioGroup;
    btnClear: TButton;
    procedure rdgSortClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbAddClick(Sender: TObject);
    procedure bbRemoveClick(Sender: TObject);
    procedure btnPlayClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelection: TfrmSelection;
  qryTypeFilter: TADOQuery;
  qryAlphabeticalSort: TADOQuery;
  qryAll: TADOQuery;
  qryAddSelection: TADOQuery;
  qryRemoveSelection: TADOQuery;
  qryShowAvailable: TADOQuery;
  qryMoveAvailable: TADOQuery;
  qryMoveSelectedToAvailable: TADOQuery;
  qryClearAvailablePokemon: TADOQuery;

implementation

{$R *.dfm}

uses cardGameDB, gamescreen_u, login_u, signup_u;

procedure TfrmSelection.bbAddClick(Sender: TObject);
begin
  with dataM do
  begin
    tblSelectedPokemon.Append;
    tblSelectedPokemon['Name'] := tblAvailablePokemon['Name'];
    tblSelectedPokemon['Atk'] := tblAvailablePokemon['Atk'];
    tblSelectedPokemon['HP'] := tblAvailablePokemon['HP'];
    tblSelectedPokemon['FirstType'] := tblAvailablePokemon['FirstType'];
    tblSelectedPokemon['SecondType'] := tblAvailablePokemon['SecondType'];
    tblSelectedPokemon['Premium'] := tblAvailablePokemon['Premium'];
    tblSelectedPokemon.Post;
    tblAvailablePokemon.Delete;
  end;
end;

procedure TfrmSelection.bbRemoveClick(Sender: TObject);
begin
  with dataM do
  begin
    tblAvailablePokemon.Append;
    tblAvailablePokemon['Name'] := tblSelectedPokemon['Name'];
    tblAvailablePokemon['Atk'] := tblSelectedPokemon['Atk'];
    tblAvailablePokemon['HP'] := tblSelectedPokemon['HP'];
    tblAvailablePokemon['FirstType'] := tblSelectedPokemon['FirstType'];
    tblAvailablePokemon['SecondType'] := tblSelectedPokemon['SecondType'];
    tblAvailablePokemon['Premium'] := tblSelectedPokemon['Premium'];
    tblAvailablePokemon.Post;
    tblSelectedPokemon.Delete;
  end;
end;

procedure TfrmSelection.btnPlayClick(Sender: TObject);
begin
  frmSelection.Hide;
  frmGameScreen.Show;
end;

procedure TfrmSelection.FormCreate(Sender: TObject);
begin
  with dataM do
  begin
    // QUERY SET UP
    qryClearAvailablePokemon := TADOQuery.Create(nil);
    qryClearAvailablePokemon.Close;
    qryClearAvailablePokemon.SQL.Clear;
    qryClearAvailablePokemon.Connection := connCardGameDB;
    qryClearAvailablePokemon.SQL.Add('DELETE * FROM AvailablePokemon');

    // Move available pokemon to AvailablePokemon
    qryMoveAvailable := TADOQuery.Create(nil);
    qryMoveAvailable.Close;
    qryMoveAvailable.SQL.Clear;
    qryMoveAvailable.Connection := connCardGameDB;
    qryMoveAvailable.SQL.Add('INSERT INTO AvailablePokemon SELECT * FROM PokemonList');
    {
    if UserInfo.PremiumUser = True then
      qryMoveAvailable.SQL.Add('INSERT INTO AvailablePokemon SELECT * FROM PokemonList')
    else
      qryMoveAvailable.SQL.Add('INSERT INTO AvailablePokemon SELECT * FROM PokemonList WHERE NOT Premium = True');
     }
    // Type filter query
    qryTypeFilter := TADOQuery.Create(nil);
    qryTypeFilter.Close;
    qryTypeFilter.SQL.Clear;
    qryTypeFilter.Connection := connCardGameDB;
    qryTypeFilter.SQL.Text :=
      'SELECT * FROM AvailablePokemon WHERE FirstType = ''' + rdgSort.Items
      [rdgSort.ItemIndex] + ''' OR  SecondType = ''' + rdgSort.Items
      [rdgSort.ItemIndex] + '''';

    // Sort alphabetically query
    qryAlphabeticalSort := TADOQuery.Create(nil);
    qryAlphabeticalSort.Close;
    qryAlphabeticalSort.SQL.Clear;
    qryAlphabeticalSort.Connection := connCardGameDB;
    qryAlphabeticalSort.SQL.Text :=
      'SELECT * FROM AvailablePokemon ORDER BY Name ASC';

    // Show available pokemon
    qryShowAvailable := TADOQuery.Create(nil);
    qryShowAvailable.Close;
    qryShowAvailable.SQL.Clear;
    qryShowAvailable.Connection := connCardGameDB;
    qryShowAvailable.SQL.Text := 'SELECT * FROM AvailablePokemon';
  end;
end;

procedure TfrmSelection.FormShow(Sender: TObject);
begin
  with dataM do
  begin
    qryClearAvailablePokemon.ExecSQL;
    qryMoveAvailable.ExecSQL;
    qryShowAvailable.Open;
    dsAvailablePokemon.DataSet := qryShowAvailable;

    dbgSelection.Columns[0].Visible := False;
    dbgAvailable.Columns[0].Visible := False;
    tblAvailablePokemon.Refresh;
  end;
end;

procedure TfrmSelection.rdgSortClick(Sender: TObject);
begin
  try
    begin
      with dataM do
      begin
        if rdgSort.ItemIndex <= 17 then
        // Type sort
        begin
          qryTypeFilter.Open;
          dsAvailablePokemon.DataSet := qryTypeFilter;
          tblAvailablePokemon.Refresh;
        end

        else if rdgSort.ItemIndex = 19 then // Order alphabetically
        begin
          qryAlphabeticalSort.Open;
          dsAvailablePokemon.DataSet := qryAlphabeticalSort;
          tblAvailablePokemon.Refresh;
        end

        else if rdgSort.ItemIndex = 18 then // Show all
        begin
          qryShowAvailable.Open;
          dsAvailablePokemon.DataSet := qryShowAvailable;
          tblAvailablePokemon.Refresh;
        end;
      end;
    end
  finally
    // Whatever
  end;
end;

end.
