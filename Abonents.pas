unit Abonents;

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
  MainDm  ;

type
  TAbonentsForm = class(TForm)
    pnl1: TPanel;
    BitBtn1: TBitBtn;

    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AbonentsForm: TAbonentsForm;

implementation

{$R *.dfm}

procedure TAbonentsForm.BitBtn1Click(Sender: TObject);
begin
 Close ;
end;

end.
