unit UserList;

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
  Contnrs,
  Controls,
  UsrObj  ;

  type  TUserList = class(TObjectList)
   private
   protected
   procedure Put(Index: Integer; Item:TUsrObj); virtual;
   function Get(Index: Integer): TUsrObj; virtual;
   procedure w_OwnsObjects(at: boolean); virtual;
  public
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    property Items[Index: Integer]:TUsrObj read Get write Put;
    procedure Sort(Compare: TListSortCompare); virtual;
    function Add(Obj: TUsrObj): Integer; virtual;
    procedure Insert(Index: Integer; Obj: TUsrObj); virtual;
    procedure delete(Index: Integer); virtual;
    procedure Clear; virtual;
    function Getitems(Index: Integer): TUsrObj; virtual;
    procedure setitems(Index: Integer; const Value: TUsrObj); virtual;
    function first: TUsrObj; virtual;
    function last: TUsrObj; virtual;
    function IndexOf(AObject: TUsrObj): Integer; virtual;
    procedure Assign(Dest: TUserList);
    CONSTRUCTOR CREATE;
    destructor destroy;
    procedure  AddCall(const aval:TUsrObj);
    function GetUserName(nVal:string):TUsrObj ;
    function  GetCallCount:Integer ;
  end;
implementation
//------------------------------------------------------------------------------
constructor TUserList.CREATE;
begin
  inherited ;
end;
//------------------------------------------------------------------------------
destructor TUserList.destroy;
begin
  inherited  ;
end;
//------------------------------------------------------------------------------
procedure  TUserList.Put(Index: Integer; Item: TUsrObj);
begin
  if Item is TUsrObj then
    inherited Items[Index] := Item;
end;
//------------------------------------------------------------------------------
function  TUserList.Get(Index: Integer): TUsrObj;
begin
  if Count - 1 >= Index then
    Result := TUsrObj(inherited Items[Index])
  else
    Result := nil;
end;
//------------------------------------------------------------------------------
procedure TUserList.w_OwnsObjects(at: boolean);
begin
  inherited OwnsObjects := at;
end;

procedure  TUserList.Sort(Compare: TListSortCompare);
begin
  inherited Sort(Compare);
end;
function TUserList.Add(Obj: TUsrObj): Integer;
begin
  if Obj is TUsrObj  then
    Result := inherited Add(Obj);
end;
//------------------------------------------------------------------------------
procedure  TUserList.Insert(Index: Integer; Obj: TUsrObj);
begin
  inherited Insert(Index, Obj);
end;
//------------------------------------------------------------------------------
procedure  TUserList.delete(Index: Integer);
begin
  inherited delete(Index) ;
end;
// ------------------------------------------------------------------------------
procedure  TUserList.Clear;
begin
  inherited Clear;
end;
//------------------------------------------------------------------------------
function  TUserList.Getitems(Index: Integer): TUsrObj;
begin

  if Count - 1 >= Index then
    Result := TUsrObj(inherited Items[Index])
  else
    Result := nil;
end;
//------------------------------------------------------------------------------
procedure  TUserList.setitems(Index: Integer; const Value: TUsrObj);
begin
  inherited SetItem(Index, Value);
end;
//------------------------------------------------------------------------------
function  TUserList.first: TUsrObj;
begin
  Result := TUsrObj(inherited first);
end;
//------------------------------------------------------------------------------
 function  TUserList.last: TUsrObj;
begin
  Result := TUsrObj(inherited last);
end;
//------------------------------------------------------------------------------
function  TUserList.IndexOf(AObject: TUsrObj): Integer;
begin
  Result := inherited IndexOf(AObject);
end;
//------------------------------------------------------------------------------
procedure TUserList.AddCall(const aval:TUsrObj);
var
n:integer ;
begin
   n := Add(TUsrObj.CREATE);
        items[n].Assign(aval);
end;

procedure TUserList.Assign(Dest: TUserList);
var
I:integer ;
begin
 I:=0 ;
    if (Dest is TUserList) then
      begin
        Clear ;
        for I := 0 to TUserList(Dest).Count -1 do
          begin
            AddCall(TUserList(Dest).Items[I]) ;
          end;
      end
    else
    inherited Assign(Dest);
end;

function TUserList.GetUserName(nVal:string):TUsrObj ;
var
i:Integer ;
begin
   for I := 0 to Count-1 do
     begin
      if items[I].L_UsrName =nVal  then
        begin
          result:=  items[I] ;
          Break ;
        end ;

     end;
end;

function TUserList.GetCallCount:Integer ;
var
i:integer ;
cnt:integer ;
begin
  result:= 0;
  cnt:=0 ;
    for I := 0 to Count-1 do
     begin
       cnt:= cnt+items[I].L_CallList.Count ;
     end;
  result:=cnt ;

end;



end.
