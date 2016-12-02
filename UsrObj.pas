unit UsrObj;

interface
  uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  CallObj,
  CallList;

  Type TUsrObj= class (Tpersistent)

  private
  FusrName:string ;
  FcallList:TCallList ;

  procedure setUsrName(const val: string) ;
  function  getUserName:string ;
  public
  procedure Assign(Dest: TPersistent); override;
  CONSTRUCTOR CREATE;
  destructor destroy;
  property L_UsrName:string read  getUserName write    setUsrName ;
  property L_CallList:TCallList read FcallList write FcallList ;

  end;



implementation

{ TUsrObj }

procedure TUsrObj.Assign(Dest: TPersistent);
begin
   if (Dest is  TUsrObj) then
      begin
       FusrName := TUsrObj(Dest).L_UsrName;
       FcallList.Assign(TUsrObj(Dest).L_CallList);
      end
   else
    inherited Assign(Dest);

end;

constructor TUsrObj.CREATE;
begin
    inherited ;
    FcallList:=TCallList.CREATE ;
end;

destructor TUsrObj.destroy;
begin
    FcallList.destroy ;
    inherited ;
end;

function TUsrObj.getUserName: string;
begin
    result:=FusrName ;
end;

procedure TUsrObj.setUsrName(const val: string);
begin
    FusrName:=val ;
end;

end.
