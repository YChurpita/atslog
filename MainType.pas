unit MainType;

interface
  uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes ;

type TphoneVar=(aGor,aMgor,aMobile,aZarub,aVnut) ;

type TusrPhPase = record
      FusrName:string ;
      Fline:Integer ;
 end;
type TusrBaseList= array of TusrPhPase ;

type TmobOper =record
  Fcode:string;
  FmobName:string ;
end;

type TmobOprList = array of TmobOper ;


type TOnGetUserCallDate = procedure( Datein, Datetto: string) of object ;


implementation

end.
