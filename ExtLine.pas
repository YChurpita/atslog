unit ExtLine;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.Buttons,
  Vcl.ExtCtrls,
  MainDm,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.DBCtrls ;

type
  TExtLineForm = class(TForm)
    pnl1: TPanel;
    btn1: TBitBtn;
    dbgrd1: TDBGrid;
    pnl2: TPanel;
    dbnvgr1: TDBNavigator;

    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ExtLineForm: TExtLineForm;

implementation

{$R *.dfm}

procedure TExtLineForm.btn1Click(Sender: TObject);
begin
 Close;
end;

end.
