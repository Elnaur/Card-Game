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
  quTypeFilter: TADOQuery;
  quAlphabeticalSort: TADOQuery;
  quAll: TADOQuery;

implementation

{$R *.dfm}

uses cardGameDB, gamescreen_u;

procedure TfrmSelection.bbAddClick(Sender: TObject);
begin
  with dataM do
  begin

  end;
end;


procedure TfrmSelection.bbRemoveClick(Sender: TObject);
begin
  //
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
    // Type filter query
    quTypeFilter.Close;
    quTypeFilter.SQL.Clear;
    quTypeFilter := TADOQuery.Create(nil);
    quTypeFilter.Connection := connCardGameDB;
    quTypeFilter.SQL.Text :=
      'SELECT * FROM tblPokemonList WHERE ' + rdgSort.Items[rdgSort.ItemIndex]
      + ' = True';

    // Sort alphabetically query
    quAlphabeticalSort.Close;
    quAlphabeticalSort.SQL.Clear;
    quAlphabeticalSort := TADOQuery.Create(nil);
    quAlphabeticalSort.Connection := connCardGameDB;
    quAlphabeticalSort.SQL.Text :=
      'SELECT * FROM tblPokemonList ORDER BY Name ASC';

    // Add selected pokemon to tblUserToPokemon

    // Remove selected pokemon from tblUserToPokemon


  end;
end;

procedure TfrmSelection.rdbAllClick(Sender: TObject);
begin
  with dataM do
  begin
    quAlphabeticalSort.Close;
    quTypeFilter.Close;

    dsPokemonList.DataSet := tblPokemonList;
  end;
end;

procedure TfrmSelection.rdbAlphaSortClick(Sender: TObject);
begin
  with dataM do
  begin
    quAlphabeticalSort.Open;
    dsPokemonList.DataSet := quAlphabeticalSort;
  end;
end;

procedure TfrmSelection.rdgSortClick(Sender: TObject);
begin
  with dataM do
  begin
    quTypeFilter.Open;
    dsPokemonList.DataSet := quTypeFilter;
  end;
end;

end.
