unit CallObj;

interface
  uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls ,
  PhParser ,
  MainType;



  Type TphClall= class (TPersistent)

  private

  Fphone: string ;             //����� ��������
  FTimeCall:Integer ;          // ����� ������ � ���
  FintLine:integer ;           // ��������� ����� ���������
  FcallType:TphoneVar ;        // ��� ������ - ��������� , ��������� , ��������


  procedure setphone(const val:string) ;
  procedure setTimeCall(const val:integer) ;
  procedure setIntLine(const val:integer) ;
  procedure setCallType(const val:TphoneVar) ;


  function getphone:string ;
  function getTimeCall:integer ;
  function getIntLine:integer ;
  function getCallType: TphoneVar ;

  public
  procedure Assign(Dest: TPersistent); override;
  property  L_Phone:string read getphone write  setphone  ;
  property  L_TimeCall: integer read  getTimeCall write   setTimeCall ;
  property  L_IntLine: integer read getIntLine write setIntLine;
  property  L_CallType: TphoneVar read getCallType write  setCallType ;

  end;

implementation

{ TphClall }

procedure TphClall.Assign(Dest: TPersistent);
begin
    if (Dest is TphClall) then
      begin
       Fphone := TphClall(Dest).L_Phone;
       FTimeCall := TphClall(Dest).L_TimeCall;
       FintLine := TphClall(Dest).FintLine;
       FcallType:= TphClall(Dest).L_CallType
      end
    else
    inherited Assign(Dest);

end;

function TphClall.getCallType: TphoneVar;
begin
  Result:=  FcallType ;
end;

function TphClall.getIntLine: integer;
begin
  result:=FIntLine;
end;

function TphClall.getphone: string;
begin
  result:=Fphone ;
end;

function TphClall.getTimeCall: integer;
begin
  Result:= FTimeCall ;
end;

procedure TphClall.setCallType(const val: TphoneVar);
begin
  fCallType:=val ;
end;

procedure TphClall.setIntLine(const val: integer);
begin
  FIntLine:=val ;
end;

procedure TphClall.setphone(const val: string);
var
phParser: TphParser;
begin
  Fphone:=val ;
  phParser:=TphParser.CREATE;

  try
   phParser.L_PhNamber:= Fphone ;
   phParser.ParsNamber ;
   FcallType:=phParser.L_PhVar ;
  finally
   phParser.DESTROY ;
  end;


end;

procedure TphClall.setTimeCall(const val: integer);
begin
   FTimeCall:=val ;
end;



end.
