unit Country;

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
  MainDm,
  Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls
   ;

type
  TCountryForm = class(TForm)


    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CountryForm: TCountryForm;

implementation

{$R *.dfm}

procedure TCountryForm.BitBtn1Click(Sender: TObject);
begin
 close ;
end;

end.
