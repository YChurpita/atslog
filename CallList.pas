unit CallList;

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

  CallObj  ;

  type  TCallList = class(TObjectList)

   private


   protected
   procedure Put(Index: Integer; Item: TphClall); virtual;
   function Get(Index: Integer): TphClall; virtual;
   procedure w_OwnsObjects(at: boolean); virtual;


  public
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    property Items[Index: Integer]:TphClall read Get write Put;
    // � ������� Items ����� �������� ������ � ��������, ���������� � ������.
    // Items �������� ��������� �� ���������, � ������ ��������� ��� ������ �����������:
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    procedure Sort(Compare: TListSortCompare); virtual;
    // ����� ��������� �������� ������.
    // � ������� TListSortCompare ������ ���� �������, ��� ������� ����������� ������� � ������:
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    function Add(Obj: TphClall): Integer; virtual;
    // ��������� ����� ������ � ����� ������, ����������� �������� Count �� ������� �,
    // ���� ����������, �������� ������, ���������� �������� Capacity (�� ���������� ����� ��� ��������).
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    procedure Insert(Index: Integer; Obj: TphClall); virtual;
    // ��������� ����� ������ �� ��������� �������, ������� ������� �� ���� ����� �������, � ����� ��� ��������� �� ��� ��������.
    // Index � �������, �� ������� ����������� ������, ��������� � AObject.
    // ��� ������������� ��� ������ �������� ���������� ������.
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    procedure delete(Index: Integer); virtual;
    // ���������� �� Extract ���, ��� � �������� ��������� ���������� �� ���, � ������.
    // ���� OwnsObjects ����� true, �� ����� �� ���������� ����� Free.
    // ����� ������� ���������� ������, ������� �������������� ��� �������� �������, ���������� ��������� �������� Capacity.
    // ������� ��������� � Count ���������� ��� ��, ��� � � Extract.
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    procedure Clear; virtual;
    // ���� ����� ������� ��� �������� �� ������, ����������� ������,
    // ������������ ��� �������� ��������, � ����� ����������� �������� Capacity �������� 0.
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    function Getitems(Index: Integer): TphClall; virtual;
    // ���� �� ������� ���������� ������
    procedure setitems(Index: Integer; const Value: TphClall); virtual;
    // �������� ������ �� ������������� �������
    function first: TphClall; virtual; // ���������� ������ ������� ������.
    function last: TphClall; virtual; // ���������� ��������� ������� ������.
    function IndexOf(AObject: TphClall): Integer; virtual;
     procedure Assign(Dest: TCallList);
  //  procedure ResizeMessageWidth(const aRes:integer);
    CONSTRUCTOR CREATE;
    destructor destroy;
    procedure  AddCall(const aval:TphClall);
  end;
implementation
//------------------------------------------------------------------------------
constructor TCallList.CREATE;
begin
  inherited ;
end;
//------------------------------------------------------------------------------
destructor TCallList.destroy;
begin
  inherited  ;
end;
//------------------------------------------------------------------------------
procedure  TCallList.Put(Index: Integer; Item: TphClall);
begin
  if Item is TphClall then
    inherited Items[Index] := Item;
end;
//------------------------------------------------------------------------------
function  TCallList.Get(Index: Integer): TphClall;
begin
  if Count - 1 >= Index then // �������� �� ������������ Index-�,�����
    Result := TphClall(inherited Items[Index]) // ������� ����������
  else
    Result := nil;
end;
//------------------------------------------------------------------------------
procedure  TCallList.w_OwnsObjects(at: boolean);
begin
  inherited OwnsObjects := at;
end;


//------------------------------------------------------------------------------
procedure  TCallList.Sort(Compare: TListSortCompare);
begin
  inherited Sort(Compare);
end;
//------------------------------------------------------------------------------
function  TCallList.Add(Obj: TphClall): Integer;
begin
  if Obj is TphClall  then
    Result := inherited Add(Obj);
end;
//------------------------------------------------------------------------------
procedure  TCallList.Insert(Index: Integer; Obj: TphClall);
begin
  inherited Insert(Index, Obj);
end;
//------------------------------------------------------------------------------
procedure  TCallList.delete(Index: Integer);
begin
  inherited delete(Index) ;
end;
// ------------------------------------------------------------------------------
procedure  TCallList.Clear;
begin
  inherited Clear;
end;
//------------------------------------------------------------------------------
function  TCallList.Getitems(Index: Integer): TphClall;
begin
  // Result :=  (inherited GetItem(index) as TWriterFrame);
  if Count - 1 >= Index then // �������� �� ������������ Index-�,�����
    Result := TphClall(inherited Items[Index]) // ������� ����������
  else
    Result := nil;
end;
//------------------------------------------------------------------------------
procedure  TCallList.setitems(Index: Integer; const Value: TphClall);
begin
  inherited SetItem(Index, Value);
end;
//------------------------------------------------------------------------------
function  TCallList.first: TphClall; // ���������� ������ �������
begin
  Result := TphClall(inherited first);
end;
//------------------------------------------------------------------------------
 function  TCallList.last: TphClall; // ���������� ��������� �������
begin
  Result := TphClall(inherited last);
end;
//------------------------------------------------------------------------------
function  TCallList.IndexOf(AObject: TphClall): Integer;
begin
  Result := inherited IndexOf(AObject);
end;
//------------------------------------------------------------------------------
procedure TCallList.AddCall(const aval:TphClall);
var
n:integer ;
begin
   n := Add(TphClall.CREATE);
        items[n].Assign(aval);
end;

procedure TCallList.Assign(Dest: TCallList);
var
I:integer ;
begin
 I:=0 ;
    if (Dest is TCallList) then
      begin
        Clear ;
        for I := 0 to TCallList(Dest).Count -1 do
          begin
            AddCall(TCallList(Dest).Items[I]) ;
          end;
      end
    else
    inherited Assign(Dest);
end;

//------------------------------------------------------------------------------


end.
