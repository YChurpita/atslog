unit UserFrame;

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
  UsrObj, Vcl.Grids, Vcl.StdCtrls, MainType, Vcl.ExtCtrls;

type
  TFrameUsr = class(TFrame)
    grp1: TGroupBox;
    strngrd1: TStringGrid;
    grp2: TGroupBox;
    lbl1: TLabel;
    spl1: TSplitter;
  private
  FusrObj:TUsrObj ;

  procedure SetFusrObj(aval:TUsrObj) ;
    { Private declarations }
  public

  CONSTRUCTOR CREATE;
  destructor destroy;
  property L_FusrObj:TUsrObj read FusrObj write SetFusrObj ;
    { Public declarations }
  end;

implementation

{$R *.dfm}

constructor  TFrameUsr.CREATE;
begin
// inherited;

end;

destructor  TFrameUsr.DESTROY;
begin

 // inherited;
end;



procedure TFrameUsr.SetFusrObj(aval: TUsrObj);
var
L:Integer ;

function GetTypeCall(aval: TphoneVar):string;
begin
  case aval of
    aGor: Result:='���������';
    aMgor: Result:='�������������';
    aMobile: Result:='���������';
    aZarub:  Result:='����������';
    aVnut: result:='����������';
    else result:='������������' ;
  end;


end;


begin
   FusrObj:=aval ;
   lbl1.Caption:= '��������: '+ FusrObj.L_UsrName ;

   strngrd1.Cells[0,0]:='�����.';
   strngrd1.Cells[1,0]:='����� ���������.';
   strngrd1.Cells[2,0]:='����� � ��������';
   strngrd1.Cells[3,0]:='��� ������';
   strngrd1.RowCount:=FusrObj.L_CallList.Count+1 ;

    For L := 0 to FusrObj.L_CallList.Count -1 do
     begin
       strngrd1.Cells[0,1+L]:= IntToStr( FusrObj.L_CallList.Items[L].L_IntLine) ;
       strngrd1.Cells[1,1+L]:= FusrObj.L_CallList.Items[L].L_Phone ;
       strngrd1.Cells[2,1+L]:= IntToStr(FusrObj.L_CallList.Items[L].L_TimeCall) ;
       strngrd1.Cells[3,1+L]:= GetTypeCall( FusrObj.L_CallList.Items[L].L_CallType) ;
     end;



end;

end.
