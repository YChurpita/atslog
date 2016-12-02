unit PhParser;

interface
 uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  RegExpr ,
  MainType ;

  type TphParser =class(TObject)
  protected

  private
  FphNamber:String ;
  FphcLength:Integer ;
  FphoneVar:TphoneVar ;
  FMobphCode:TmobOprList ;

  function IfMobile:Boolean ;
  function IfMobile2: Boolean;
  procedure SetFthNamber (const aVar:string) ;
  public
  constructor CREATE;
  destructor  DESTROY;
  procedure ParsNamber ;
  property L_PhNamber:string read FphNamber write SetFthNamber  ;
  property L_PhVar: TphoneVar read FphoneVar ;

  end;


implementation
uses Main ;

constructor TphParser.CREATE;
begin
  inherited;
end;

destructor TphParser.DESTROY;
begin
  inherited;
end;


function TphParser.IfMobile: Boolean;
var
i:integer ;
ph1,ph2,ph3:string ;
begin
 result:=false ;
 ph1:=  FphNamber ;
 SetLength( ph1, 2);

 FMobphCode:= MainForm.L_mobOpList ;

  for I := Low (FMobphCode) to High (FMobphCode) do
    begin
     ph2:=FMobphCode[I].Fcode ;
     ph3:=FMobphCode[I].Fcode ;

     SetLength( ph2, 1);

     if ph2='0' then
        begin
          Delete(ph3, 1, 1)  ;
        end;

     if ph3=ph1 then
        begin
          Result:= true ;
          Break ;
        end else result:=false ;

    end;

end;


function TphParser.IfMobile2: Boolean;
var
i:integer ;
ph1,ph2,ph3:string ;
begin
 result:=false ;
 ph1:=  FphNamber ;
 SetLength( ph1, 3);

 FMobphCode:= MainForm.L_mobOpList ;

  for I := Low (FMobphCode) to High (FMobphCode) do
    begin
     ph2:=FMobphCode[I].Fcode ;

     if ph2=ph1 then
        begin
          Result:= true ;
          Break ;
        end else result:=false ;

    end;

end;

procedure TphParser.ParsNamber;

begin
 if Length(FphNamber)=7 then
    begin
     FphoneVar:=aGor ;
     Exit ;
    end;

 if (Length(FphNamber)>8) and (Length(FphNamber) < 10)   then
   begin
       if IfMobile or IfMobile2 then
        begin
          FphoneVar:=aMobile ;
          exit ;
          end else
        begin
          FphoneVar:=aMgor;
          Exit ;
        end;
   end;

   if Length(FphNamber)>10   then
    begin
     FphoneVar:=aZarub;
     Exit ;
    end;

   if Length(FphNamber)<4   then    FphoneVar:=aVnut;

 //FphoneVar:=

end;

procedure TphParser.SetFthNamber(const aVar: string);
//98537572720
//5035761272
//974646909  моб
//552417070  межгород
//53733741
//2067210   городской
begin
   FphNamber:=aVar ;
   FphcLength:=Length(aVar) ;
end;

end.
