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
    rdbAll: TRadioButton;
    rdbAlphaSort: TRadioButton;
    btnClear: TButton;
    procedure rdbAllClick(Sender: TObject);
    procedure rdgSortClick(Sender: TObject);
    procedure rdbAlphaSortClick(Sender: TObject);
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

implementation

{$R *.dfm}

uses cardGameDB, gamescreen_u, login_u, signup_u;

procedure TfrmSelection.bbAddClick(Sender: TObject);
begin
  with dataM do
  begin
    { qryAddSelection.Open;
      dsUserToPokemon.DataSet := qryAddSelection;
      tblUserToPokemon.Refresh; }
    tblUserToPokemon.Append;
    tblUserToPokemon['Name'] := tblPokemonList['Name'];
    tblUserToPokemon['Atk'] := tblPokemonList['Atk'];
    tblUserToPokemon['HP'] := tblPokemonList['HP'];
    tblUserToPokemon['First type'] := tblPokemonList['First type'];
    tblUserToPokemon['Second type'] := tblPokemonList['Second type'];
    tblUserToPokemon['Premium'] := tblPokemonList['Premium'];
    tblUserToPokemon.Post;
    tblPokemonList.Delete;
  end;
end;

procedure TfrmSelection.bbRemoveClick(Sender: TObject);
begin
  with dataM do
  begin
    {
      qryRemoveSelection.Open;
      dsUserToPokemon.DataSet := qryRemoveSelection;
      tblUserToPokemon.Refresh;
      }
    tblPokemonList.Append;
    tblPokemonList['Name'] := tblUserToPokemon['Name'];
    tblPokemonList['Atk'] := tblUserToPokemon['Atk'];
    tblPokemonList['HP'] := tblUserToPokemon['HP'];
    tblPokemonList['First type'] := tblUserToPokemon['First type'];
    tblPokemonList['Second type'] := tblUserToPokemon['Second type'];
    tblPokemonList['Premium'] := tblUserToPokemon['Premium'];
    tblPokemonList.Post;
    tblUserToPokemon.Delete;

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

    // Type filter query
    qryTypeFilter.Close;
    qryTypeFilter.SQL.Clear;
    qryTypeFilter := TADOQuery.Create(nil);
    qryTypeFilter.Connection := connCardGameDB;
    qryTypeFilter.SQL.Text := 'SELECT * ' + 'FROM tblPokemonList' + 'WHERE ' +
      'First type = ''' + rdgSort.Items[rdgSort.ItemIndex] +
      ''' OR  Second Type = ''' + rdgSort.Items[rdgSort.ItemIndex] + '''';
    qryTypeFilter.Close;

    // Sort alphabetically query
    qryAlphabeticalSort := TADOQuery.Create(nil);
    qryAlphabeticalSort.Close;
    qryAlphabeticalSort.SQL.Clear;
    qryAlphabeticalSort.Connection := connCardGameDB;
    qryAlphabeticalSort.SQL.Text :=
      'SELECT * FROM tblPokemonList ORDER BY Name ASC';
    qryAlphabeticalSort.Close;

    // Add selected pokemon to tblUserToPokemon
    qryAddSelection := TADOQuery.Create(nil);
    qryAddSelection.Close;
    qryAddSelection.SQL.Clear;
    qryAddSelection.Connection := connCardGameDB;
    qryAddSelection.SQL.Text :=
      'SELECT * FROM tblPokemonList WHERE Selected = True';
    qryAddSelection.Close;

    // Remove selected pokemon from tblUserToPokemon
    qryRemoveSelection := TADOQuery.Create(nil);
    qryRemoveSelection.Close;
    qryRemoveSelection.SQL.Clear;
    qryRemoveSelection.Connection := connCardGameDB;
    qryRemoveSelection.SQL.Text :=
      'SELECT * FROM tblUserToPokemon WHERE NOT Selected = True';
    qryRemoveSelection.Close;

    // Show available pokemon
    qryShowAvailable := TADOQuery.Create(nil);
    qryShowAvailable.Close;
    qryShowAvailable.SQL.Clear;
    qryShowAvailable.Connection := connCardGameDB;

    if UserInfo.PremiumUser = True then
      qryShowAvailable.SQL.Text := 'SELECT * FROM tblPokemonList'
    else
      qryShowAvailable.SQL.Text :=
        'SELECT * FROM tblPokemonList WHERE NOT Premium = True';

    qryShowAvailable.Close;
  end;
end;

procedure TfrmSelection.FormShow(Sender: TObject);
begin
  with dataM do
  begin
    qryShowAvailable.Open;
    dsPokemonList.DataSet := qryShowAvailable;

    dbgAvailable.Columns[0].Visible := False;
    tblPokemonList.Refresh;
  end;
end;

procedure TfrmSelection.rdbAllClick(Sender: TObject);
begin
  with dataM do
  begin
    qryShowAvailable.Open;
    dsPokemonList.DataSet := qryShowAvailable;
    tblPokemonList.Refresh;
  end;
end;

procedure TfrmSelection.rdbAlphaSortClick(Sender: TObject);
begin
  with dataM do
  begin
    qryAlphabeticalSort.Open;
    dsPokemonList.DataSet := qryAlphabeticalSort;
    tblPokemonList.Refresh;
  end;
end;

procedure TfrmSelection.rdgSortClick(Sender: TObject);
begin
  with dataM do
  begin
    qryTypeFilter.Open;
    dsPokemonList.DataSet := qryTypeFilter;
    tblPokemonList.Refresh;
  end;
end;

end.
