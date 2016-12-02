program AtsStat;

uses
  Vcl.Forms,
  Main in 'Main.pas' {MainForm},
  MainDm in 'MainDm.pas' {DMain: TDataModule},
  Abonents in 'Abonents.pas' {AbonentsForm},
  Country in 'Country.pas' {CountryForm},
  ExtLine in 'ExtLine.pas' {ExtLineForm},
  Ufunct in 'Ufunct.pas',
  PhParser in 'PhParser.pas',
  CallObj in 'CallObj.pas',
  UsrObj in 'UsrObj.pas',
  CallList in 'CallList.pas',
  UserList in 'UserList.pas',
  MainType in 'MainType.pas',
  FormSearchCall in 'FormSearchCall.pas' {SerchCallForm},
  UserFrame in 'UserFrame.pas' {FrameUsr: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TDMain, DMain);
  Application.CreateForm(TAbonentsForm, AbonentsForm);
  Application.CreateForm(TCountryForm, CountryForm);
  Application.CreateForm(TExtLineForm, ExtLineForm);
  Application.CreateForm(TSerchCallForm, SerchCallForm);
  Application.Run;
end.
