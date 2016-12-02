unit FormSearchCall;

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
  Vcl.Mask,
  MainType;

type
  TSerchCallForm = class(TForm)
    pnl1: TPanel;
    btn1: TBitBtn;
    btn2: TBitBtn;
    GroupBox1: TGroupBox;
    medt1: TMaskEdit;
    txt1: TStaticText;
    txt2: TStaticText;
    txt3: TStaticText;
    txt4: TStaticText;
    txt5: TStaticText;
    txt6: TStaticText;
    grp1: TGroupBox;
    medt2: TMaskEdit;
    txt7: TStaticText;
    txt8: TStaticText;
    txt9: TStaticText;
    txt10: TStaticText;
    txt11: TStaticText;
    txt12: TStaticText;
    lbl1: TLabel;
    lbl2: TLabel;
    procedure btn2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private

  FonGetCall:TOnGetUserCallDate  ;
    { Private declarations }
  public
    property OnFonGetCall:TOnGetUserCallDate  read FonGetCall write FonGetCall ;
    { Public declarations }
  end;

var
  SerchCallForm: TSerchCallForm;

implementation

{$R *.dfm}

procedure TSerchCallForm.btn1Click(Sender: TObject);
begin
 if Assigned(FonGetCall) then FonGetCall( medt1.Text,  medt2.Text) ;
 Close;
end;

procedure TSerchCallForm.btn2Click(Sender: TObject);
begin
 Close ;
end;

end.
