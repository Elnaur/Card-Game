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

implementation

{$R *.dfm}

uses cardGameDB, gamescreen_u;

procedure TfrmSelection.bbAddClick(Sender: TObject);
begin
  with dataM do
  begin
    qryRemoveSelection.Open;
    dsUserToPokemon.DataSet := qryAddSelection;
    tblUserToPokemon.Refresh;
  end;
end;

procedure TfrmSelection.bbRemoveClick(Sender: TObject);
begin
  with dataM do
  begin
    qryAddSelection.Open;
    dsUserToPokemon.DataSet := qryAddSelection;
    tblUserToPokemon.Refresh;
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
    qryAlphabeticalSort.Close;
    qryAlphabeticalSort.SQL.Clear;
    qryAlphabeticalSort := TADOQuery.Create(nil);
    qryAlphabeticalSort.Connection := connCardGameDB;
    qryAlphabeticalSort.SQL.Text :=
      'SELECT * FROM tblPokemonList ORDER BY Name ASC';
    qryAlphabeticalSort.Close;

    // Add selected pokemon to tblUserToPokemon
    qryAddSelection.Close;
    qryAddSelection.SQL.Clear;
    qryAddSelection := TADOQuery.Create(nil);
    qryAddSelection.Connection := connCardGameDB;
    qryAddSelection.SQL.Text :=
      'SELECT * FROM tblPokemonList WHERE Selected = True';
    qryAddSelection.Close;

    // Remove selected pokemon from tblUserToPokemon
    qryRemoveSelection.Close;
    qryRemoveSelection.SQL.Clear;
    qryRemoveSelection := TADOQuery.Create(nil);
    qryRemoveSelection.Connection := connCardGameDB;
    qryRemoveSelection.SQL.Text :=
      'SELECT * FROM tblUserToPokemon WHERE NOT Selected = True';
    qryRemoveSelection.Close;

  end;
end;

procedure TfrmSelection.rdbAllClick(Sender: TObject);
begin
  with dataM do
  begin
    dsPokemonList.DataSet := tblPokemonList;
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
