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

implementation

{$R *.dfm}

uses cardGameDB, gamescreen_u, login_u, signup_u;

procedure TfrmSelection.bbAddClick(Sender: TObject);
begin
  with dataM do
  begin
    tblUserToPokemon.Append;
    tblUserToPokemon['Name'] := tblPokemonList['Name'];
    tblUserToPokemon['Atk'] := tblPokemonList['Atk'];
    tblUserToPokemon['HP'] := tblPokemonList['HP'];
    tblUserToPokemon['FirstType'] := tblPokemonList['FirstType'];
    tblUserToPokemon['SecondType'] := tblPokemonList['SecondType'];
    tblUserToPokemon['Premium'] := tblPokemonList['Premium'];
    tblUserToPokemon.Post;
    tblPokemonList.Delete;
  end;
end;

procedure TfrmSelection.bbRemoveClick(Sender: TObject);
begin
  with dataM do
  begin
    tblPokemonList.Append;
    tblPokemonList['Name'] := tblUserToPokemon['Name'];
    tblPokemonList['Atk'] := tblUserToPokemon['Atk'];
    tblPokemonList['HP'] := tblUserToPokemon['HP'];
    tblPokemonList['FirstType'] := tblUserToPokemon['FirstType'];
    tblPokemonList['SecondType'] := tblUserToPokemon['SecondType'];
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
    qryTypeFilter := TADOQuery.Create(Self);
    qryTypeFilter.Close;
    qryTypeFilter.SQL.Clear;
    qryTypeFilter.Connection := connCardGameDB;
    qryTypeFilter.SQL.Add('SELECT * ');
    qryTypeFilter.SQL.Add('FROM PokemonList');
    qryTypeFilter.SQL.Add('WHERE FirstType = ''' + rdgSort.Items
        [rdgSort.ItemIndex]);
    qryTypeFilter.SQL.Add(''' OR  SecondType = ''' + rdgSort.Items
        [rdgSort.ItemIndex] + '''');
    qryTypeFilter.Close;

    // Sort alphabetically query
    qryAlphabeticalSort := TADOQuery.Create(Self);
    qryAlphabeticalSort.Close;
    qryAlphabeticalSort.SQL.Clear;
    qryAlphabeticalSort.Connection := connCardGameDB;
    qryAlphabeticalSort.SQL.Text :=
      'SELECT * FROM PokemonList ORDER BY Name ASC';
    qryAlphabeticalSort.Close;

    {
      // Add selected pokemon to tblUserToPokemon
      qryAddSelection := TADOQuery.Create(Self);
      qryAddSelection.Close;
      qryAddSelection.SQL.Clear;
      qryAddSelection.Connection := connCardGameDB;
      qryAddSelection.SQL.Text :=
      'SELECT * FROM PokemonList WHERE Selected = True';
      qryAddSelection.Close;

      // Remove selected pokemon from tblUserToPokemon
      qryRemoveSelection := TADOQuery.Create(Self);
      qryRemoveSelection.Close;
      qryRemoveSelection.SQL.Clear;
      qryRemoveSelection.Connection := connCardGameDB;
      qryRemoveSelection.SQL.Text :=
      'SELECT * FROM UserToPokemon WHERE NOT Selected = True';
      qryRemoveSelection.Close;
      }

    // Show available pokemon
    qryShowAvailable := TADOQuery.Create(Self);
    qryShowAvailable.Close;
    qryShowAvailable.SQL.Clear;
    qryShowAvailable.Connection := connCardGameDB;

    if UserInfo.PremiumUser = True then
      qryShowAvailable.SQL.Text := 'SELECT * FROM PokemonList'
    else
      qryShowAvailable.SQL.Text :=
        'SELECT * FROM PokemonList WHERE NOT Premium = True';

    qryShowAvailable.Close;
  end;
end;

procedure TfrmSelection.FormShow(Sender: TObject);
begin
  with dataM do
  begin
    qryShowAvailable.Open;
    dsPokemonList.DataSet := qryShowAvailable;

    dbgSelection.Columns[0].Visible := False;
    dbgAvailable.Columns[0].Visible := False;
    tblPokemonList.Refresh;
  end;
end;

procedure TfrmSelection.rdgSortClick(Sender: TObject);
begin
  try
    begin
      with dataM do
      begin
        if rdgSort.ItemIndex <= 17 then // Type sort
        begin
          qryTypeFilter.Open;
          dsPokemonList.DataSet := qryTypeFilter;
          tblPokemonList.Refresh;
        end

        else if rdgSort.ItemIndex = 19 then // Order alphabetically
        begin
          qryAlphabeticalSort.Open;
          dsPokemonList.DataSet := qryAlphabeticalSort;
          tblPokemonList.Refresh;
        end

        else if rdgSort.ItemIndex = 18 then // Show all
        begin
          qryShowAvailable.Open;
          dsPokemonList.DataSet := qryShowAvailable;
          tblPokemonList.Refresh;
        end;
      end;
    end
  finally

  end;
end;

end.
