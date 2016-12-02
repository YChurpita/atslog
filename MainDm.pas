unit MainDm;

interface

uses
  System.SysUtils,
  System.Classes,
  DBAccess,
  Uni,
  Data.DB,
  MemDS,
  UniDacVcl,
  UniProvider,
  MySQLUniProvider,
  UsrObj,
  CallObj,
  ComObj,
  ActiveX,
  Excel_TLB ,
  MainType;

type
  TDMain = class(TDataModule)
    UniConnection1: TUniConnection;
    MySQLUniProvider1: TMySQLUniProvider;
    UniConnectDialog1: TUniConnectDialog;
    CalsUQ: TUniQuery;
    CallsUTrRead: TUniTransaction;
    CallsUDs: TUniDataSource;
    CallsUTrWrite: TUniTransaction;
    CountryUQ: TUniQuery;
    CountryUniTrRead: TUniTransaction;
    Countryds: TUniDataSource;
    CountryUniTrWrite: TUniTransaction;
    ExtLinesUQ: TUniQuery;
    ExtLinesUTrRead: TUniTransaction;
    ExtLinesUDS: TUniDataSource;
    ExtLinesUTWrite: TUniTransaction;
    IntrPhUQ: TUniQuery;
    IntrPhUTrRead: TUniTransaction;
    IntrPhUDS: TUniDataSource;
    IntrPhUTrWrite: TUniTransaction;
    TownsUQ: TUniQuery;
    TownsUiTrRead: TUniTransaction;
    TownsUDS: TUniDataSource;
    TownsUTrWrite: TUniTransaction;
    UsersUQ: TUniQuery;
    UsersUTrRead: TUniTransaction;
    UsersUDS: TUniDataSource;
    UsersUTrWrite: TUniTransaction;
    unqryunqry: TUniQuery;
    untrnsctnRead: TUniTransaction;
    SelectQuaryds: TUniDataSource;
    untrnsctnWrite: TUniTransaction;
    procedure UniConnection1AfterConnect(Sender: TObject);
    procedure UniConnection1AfterDisconnect(Sender: TObject);
  private


    { Private declarations }
  public
    procedure OpenQuary;
    procedure CloseQuary;
    function GetCsllDate(const Datein, Datetto:string; Dline:integer):TUsrObj ;
    procedure getDateUser(const Datein, Datetto: string; var val:TusrBaseList ) ;
    procedure getMobileOper(  var val:TmobOprList) ;
    { Public declarations }
  end;

var
  DMain: TDMain;

implementation
 uses main ;
{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDMain.CloseQuary;
begin
    CalsUQ.Active:=false ;
    CountryUQ.Active:=false ;
    ExtLinesUQ.Active:=false ;
    IntrPhUQ.Active:=false ;
    TownsUQ.Active:=false ;
    UsersUQ.Active:=false ;
end;

function TDMain.GetCsllDate(const Datein, Datetto: string; Dline:integer):TUsrObj;
var
Sglt:string ;
Phcall:TphClall ;
begin
  Sglt:='SELECT ' +
        ' `calls`.`timeofcall`, '  +
        ' `calls`.`forwarded`, '  +
        ' `calls`.`internally`, ' +
        ' `calls`.`co`, '        +
        ' `calls`.`way`, '       +
        ' `calls`.`number`,  '  +
        'sum(`calls`.`duration`) AS `dur`,  '  +
        ' `calls`.`cost`, '  +
        ' `intphones`.`name` '+
        'FROM  '   +
        ' `intphones`  '+
        'LEFT OUTER JOIN `calls` ON (`intphones`.`Internalline` = `calls`.`internally`) ' +
        'WHERE   '  +
        ' `calls`.`number`<>0 AND ' +
        ' `calls`.`timeofcall` > :DataIn AND  ' +
        ' `calls`.`timeofcall` < :DataTo AND  ' +
        ' `calls`.`internally` = :Dline '  +
        '  group by  `calls`.`number`  '+
        '  ORDER BY '+
        ' `calls`.`internally` ;' ;

   result:=TUsrObj.CREATE ;

    with   unqryunqry  do
      begin
        Active:=false ;
        SQL.Clear;
        SQL.Add(Sglt );
        ParamByName('DataIn').AsString:=Datein;
        ParamByName('DataTo').AsString:=Datetto;
        ParamByName('Dline').AsInteger:=Dline;
        Active:=true  ;

        First;
        while not  EOF do
          begin
            result.L_UsrName:=FieldValues['name'] ;

             Phcall:=TphClall.Create ;
             try
              Phcall.L_Phone:=Uinttostr(FieldValues['number']);
              Phcall.L_TimeCall:=FieldValues['dur'] ;
              Phcall.L_IntLine:= FieldValues['internally'] ;

              result.L_CallList.AddCall(Phcall) ;

             finally
              Phcall.Destroy ;
             end;

           next ;
          end;


        Close ;
      end;
end;

procedure  TDMain.getDateUser(const Datein, Datetto: string;  var val:TusrBaseList) ;
 var
 Sglt:string ;
 Phcall:TphClall ;
 I:integer ;

 function GetLine(val:Integer; arr:TusrBaseList):Boolean ;
 var
 c:integer ;
 begin
   result:=false ;
   for c := Low( arr) to High( arr) do
    begin
     if  arr[c].Fline= val then
       begin
        Result:=true  ;
        Break ;
       end else result:=false ;

    end;
 end;

begin
  I:=0 ;
  Sglt:='SELECT ' +
    ' `calls`.`timeofcall`, '  +
    ' `calls`.`forwarded`, '  +
    ' `calls`.`internally`, ' +
    ' `calls`.`co`, '        +
    ' `calls`.`way`, '       +
    ' `calls`.`number`,  '  +
    'sum(`calls`.`duration`) AS `dur`,  '  +
    ' `calls`.`cost`, '  +
    ' `intphones`.`name` '+
    'FROM  '   +
    ' `intphones`  '+
    'LEFT OUTER JOIN `calls` ON (`intphones`.`Internalline` = `calls`.`internally`) ' +
    'WHERE   '  +
    ' `calls`.`number`<>0 AND ' +
    ' `calls`.`timeofcall` > :DataIn AND  ' +
    ' `calls`.`timeofcall` < :DataTo    ' +
    '  group by  `calls`.`number`  '+
    '  ORDER BY '+
    ' `calls`.`internally` ;' ;


    with   unqryunqry  do
      begin
        Active:=false ;
        SQL.Clear;
        SQL.Add(Sglt );
        ParamByName('DataIn').AsString:=Datein;
        ParamByName('DataTo').AsString:=Datetto;
        Active:=true  ;

        First;
        while not  EOF do
          begin

           SetLength(val ,I+1 ) ;
             if  GetLine(FieldValues['internally']  ,val)= false then
               begin
                 val[I].FusrName:=FieldValues['name'] ;
                 val[I].Fline:= FieldValues['internally']  ;
                 Inc(I);
               end ;
           next ;
          end;


        Close ;
      end;

end;

procedure  TDMain.getMobileOper(  var val:TmobOprList) ;
 var
 Sglt:string ;
 Phcall:TphClall ;
 I:integer ;
begin
      I:=0 ;
      Sglt:='SELECT ' +
        '* from viewMobile  ;' ;

   with   unqryunqry  do
    begin
     Active:=false ;
     SQL.Clear;
     SQL.Add(Sglt );
     Active:=true  ;

     First;
      while not  EOF do
       begin
        SetLength(val ,I+1 ) ;
        val[I].Fcode:=FieldValues['mobopcode'] ;
        val[I].FmobName:= FieldValues['OperName']  ;
        Inc(I);
        next ;
       end;
     Close ;
    end;

end;


procedure TDMain.OpenQuary;
begin
    CalsUQ.Active:=True ;
    CountryUQ.Active:=True ;
    ExtLinesUQ.Active:=True ;
    IntrPhUQ.Active:=True ;
    TownsUQ.Active:=True ;
    UsersUQ.Active:=True ;

end;

procedure TDMain.UniConnection1AfterConnect(Sender: TObject);
begin
  MainForm.StatusBar1.Panels[0].Text:='����� � �������� �����������!' ;
  OpenQuary;
  MainForm.GetMobOper;
  MainForm.btn1.Enabled:=false ;
  MainForm.btn2.Enabled:=true ;

end;

procedure TDMain.UniConnection1AfterDisconnect(Sender: TObject);
begin
  MainForm.StatusBar1.Panels[0].Text:='����� � �������� ���������!' ;
  MainForm.btn1.Enabled:=false ;
   MainForm.btn2.Enabled:=false ;
  CloseQuary;
end;



end.
