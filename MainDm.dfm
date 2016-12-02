object DMain: TDMain
  OldCreateOrder = False
  Height = 422
  Width = 1108
  object UniConnection1: TUniConnection
    DataTypeMap = <>
    ProviderName = 'MySQL'
    Port = 3306
    Database = 'atslog'
    SpecificOptions.Strings = (
      'MySQL.Charset=cp1251')
    Username = 'root2'
    Server = '192.168.0.15'
    ConnectDialog = UniConnectDialog1
    AfterConnect = UniConnection1AfterConnect
    AfterDisconnect = UniConnection1AfterDisconnect
    Left = 40
    Top = 16
  end
  object MySQLUniProvider1: TMySQLUniProvider
    Left = 40
    Top = 84
  end
  object UniConnectDialog1: TUniConnectDialog
    DatabaseLabel = #1041#1072#1079#1072' '#1076#1072#1085#1085#1099#1093
    PortLabel = #1055#1086#1088#1090
    ProviderLabel = #1055#1088#1086#1074#1072#1081#1076#1077#1088
    Caption = #1057#1086#1077#1076#1080#1085#1077#1085#1080#1077
    UsernameLabel = #1048#1084#1103
    PasswordLabel = #1055#1072#1088#1086#1083#1100
    ServerLabel = #1057#1077#1088#1074#1077#1088
    ConnectButton = #1057#1086#1077#1076#1080#1085#1080#1090#1100
    CancelButton = #1054#1090#1084#1077#1085#1072
    LabelSet = lsRussian
    Left = 112
    Top = 16
  end
  object CalsUQ: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO calls'
      
        '  (timeofcall, forwarded, internally, co, way, number, duration,' +
        ' cost)'
      'VALUES'
      
        '  (:timeofcall, :forwarded, :internally, :co, :way, :number, :du' +
        'ration, :cost)')
    SQLDelete.Strings = (
      'DELETE FROM calls'
      'WHERE'
      
        '  timeofcall = :Old_timeofcall AND internally = :Old_internally ' +
        'AND co = :Old_co AND cost = :Old_cost')
    SQLUpdate.Strings = (
      'UPDATE calls'
      'SET'
      
        '  timeofcall = :timeofcall, forwarded = :forwarded, internally =' +
        ' :internally, co = :co, way = :way, number = :number, duration =' +
        ' :duration, cost = :cost'
      'WHERE'
      
        '  timeofcall = :Old_timeofcall AND internally = :Old_internally ' +
        'AND co = :Old_co AND cost = :Old_cost')
    SQLLock.Strings = (
      'SELECT * FROM calls'
      'WHERE'
      
        '  timeofcall = :Old_timeofcall AND internally = :Old_internally ' +
        'AND co = :Old_co AND cost = :Old_cost'
      'FOR UPDATE')
    SQLRefresh.Strings = (
      
        'SELECT timeofcall, forwarded, internally, co, way, number, durat' +
        'ion, cost FROM calls'
      'WHERE'
      
        '  timeofcall = :timeofcall AND internally = :internally AND co =' +
        ' :co AND cost = :cost')
    DataTypeMap = <>
    Connection = UniConnection1
    Transaction = CallsUTrRead
    UpdateTransaction = CallsUTrWrite
    SQL.Strings = (
      'select * from `calls` ;')
    Left = 16
    Top = 296
  end
  object CallsUTrRead: TUniTransaction
    DefaultConnection = UniConnection1
    Left = 80
    Top = 248
  end
  object CallsUDs: TUniDataSource
    DataSet = CalsUQ
    Left = 152
    Top = 304
  end
  object CallsUTrWrite: TUniTransaction
    DefaultConnection = UniConnection1
    Left = 80
    Top = 344
  end
  object CountryUQ: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO country'
      '  (id, name)'
      'VALUES'
      '  (:id, :name)')
    SQLDelete.Strings = (
      'DELETE FROM country'
      'WHERE'
      '  id = :Old_id')
    SQLUpdate.Strings = (
      'UPDATE country'
      'SET'
      '  id = :id, name = :name'
      'WHERE'
      '  id = :Old_id')
    SQLLock.Strings = (
      'SELECT * FROM country'
      'WHERE'
      '  id = :Old_id'
      'FOR UPDATE')
    SQLRefresh.Strings = (
      'SELECT id, name FROM country'
      'WHERE'
      '  id = :id')
    DataTypeMap = <>
    Connection = UniConnection1
    Transaction = CountryUniTrRead
    UpdateTransaction = CountryUniTrWrite
    SQL.Strings = (
      'select * from `country` ;')
    Left = 256
    Top = 56
  end
  object CountryUniTrRead: TUniTransaction
    DefaultConnection = UniConnection1
    Left = 320
    Top = 8
  end
  object Countryds: TUniDataSource
    DataSet = CountryUQ
    Left = 392
    Top = 64
  end
  object CountryUniTrWrite: TUniTransaction
    DefaultConnection = UniConnection1
    Left = 320
    Top = 104
  end
  object ExtLinesUQ: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO extlines'
      '  (line, name)'
      'VALUES'
      '  (:line, :name)')
    SQLDelete.Strings = (
      'DELETE FROM extlines'
      'WHERE'
      '  line = :Old_line')
    SQLUpdate.Strings = (
      'UPDATE extlines'
      'SET'
      '  line = :line, name = :name'
      'WHERE'
      '  line = :Old_line')
    SQLLock.Strings = (
      'SELECT * FROM extlines'
      'WHERE'
      '  line = :Old_line'
      'FOR UPDATE')
    SQLRefresh.Strings = (
      'SELECT line, name FROM extlines'
      'WHERE'
      '  line = :line')
    DataTypeMap = <>
    Connection = UniConnection1
    Transaction = ExtLinesUTrRead
    UpdateTransaction = ExtLinesUTWrite
    SQL.Strings = (
      'select * from `extlines` ;')
    Left = 568
    Top = 72
  end
  object ExtLinesUTrRead: TUniTransaction
    DefaultConnection = UniConnection1
    Left = 632
    Top = 24
  end
  object ExtLinesUDS: TUniDataSource
    DataSet = ExtLinesUQ
    Left = 704
    Top = 80
  end
  object ExtLinesUTWrite: TUniTransaction
    DefaultConnection = UniConnection1
    Left = 632
    Top = 120
  end
  object IntrPhUQ: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO intphones'
      '  (intnumber, name)'
      'VALUES'
      '  (:intnumber, :name)')
    SQLDelete.Strings = (
      'DELETE FROM intphones'
      'WHERE'
      '  intnumber = :Old_intnumber')
    SQLUpdate.Strings = (
      'UPDATE intphones'
      'SET'
      '  intnumber = :intnumber, name = :name'
      'WHERE'
      '  intnumber = :Old_intnumber')
    SQLLock.Strings = (
      'SELECT * FROM intphones'
      'WHERE'
      '  intnumber = :Old_intnumber'
      'FOR UPDATE')
    SQLRefresh.Strings = (
      'SELECT intnumber, name FROM intphones'
      'WHERE'
      '  intnumber = :intnumber')
    DataTypeMap = <>
    Connection = UniConnection1
    Transaction = IntrPhUTrRead
    UpdateTransaction = IntrPhUTrWrite
    SQL.Strings = (
      'select * from `intphones` ;')
    Left = 464
    Top = 248
  end
  object IntrPhUTrRead: TUniTransaction
    DefaultConnection = UniConnection1
    Left = 528
    Top = 200
  end
  object IntrPhUDS: TUniDataSource
    DataSet = IntrPhUQ
    Left = 600
    Top = 256
  end
  object IntrPhUTrWrite: TUniTransaction
    DefaultConnection = UniConnection1
    Left = 528
    Top = 296
  end
  object TownsUQ: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO towns'
      '  (id, id_country, name)'
      'VALUES'
      '  (:id, :id_country, :name)')
    SQLDelete.Strings = (
      'DELETE FROM towns'
      'WHERE'
      '  id = :Old_id AND id_country = :Old_id_country')
    SQLUpdate.Strings = (
      'UPDATE towns'
      'SET'
      '  id = :id, id_country = :id_country, name = :name'
      'WHERE'
      '  id = :Old_id AND id_country = :Old_id_country')
    SQLLock.Strings = (
      'SELECT * FROM towns'
      'WHERE'
      '  id = :Old_id AND id_country = :Old_id_country'
      'FOR UPDATE')
    SQLRefresh.Strings = (
      'SELECT id, id_country, name FROM towns'
      'WHERE'
      '  id = :id AND id_country = :id_country')
    DataTypeMap = <>
    Connection = UniConnection1
    Transaction = TownsUiTrRead
    UpdateTransaction = TownsUTrWrite
    SQL.Strings = (
      'select * from `towns` ;')
    MasterSource = Countryds
    MasterFields = 'id'
    DetailFields = 'id_country'
    Left = 864
    Top = 80
    ParamData = <
      item
        DataType = ftLongWord
        Name = 'id'
        ParamType = ptInput
        Value = 1
      end>
  end
  object TownsUiTrRead: TUniTransaction
    DefaultConnection = UniConnection1
    Left = 928
    Top = 32
  end
  object TownsUDS: TUniDataSource
    DataSet = TownsUQ
    Left = 1000
    Top = 88
  end
  object TownsUTrWrite: TUniTransaction
    DefaultConnection = UniConnection1
    Left = 928
    Top = 128
  end
  object UsersUQ: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO users'
      '  (internally, login, password, firstname, secondname, lastname)'
      'VALUES'
      
        '  (:internally, :login, :password, :firstname, :secondname, :las' +
        'tname)')
    SQLDelete.Strings = (
      'DELETE FROM users'
      'WHERE'
      '  internally = :Old_internally AND login = :Old_login')
    SQLUpdate.Strings = (
      'UPDATE users'
      'SET'
      
        '  internally = :internally, login = :login, password = :password' +
        ', firstname = :firstname, secondname = :secondname, lastname = :' +
        'lastname'
      'WHERE'
      '  internally = :Old_internally AND login = :Old_login')
    SQLLock.Strings = (
      'SELECT * FROM users'
      'WHERE'
      '  internally = :Old_internally AND login = :Old_login'
      'FOR UPDATE')
    SQLRefresh.Strings = (
      
        'SELECT internally, login, password, firstname, secondname, lastn' +
        'ame FROM users'
      'WHERE'
      '  internally = :internally AND login = :login')
    DataTypeMap = <>
    Connection = UniConnection1
    Transaction = UsersUTrRead
    UpdateTransaction = UsersUTrWrite
    SQL.Strings = (
      'select * from `users` ;')
    Left = 800
    Top = 264
  end
  object UsersUTrRead: TUniTransaction
    DefaultConnection = UniConnection1
    Left = 864
    Top = 216
  end
  object UsersUDS: TUniDataSource
    DataSet = UsersUQ
    Left = 936
    Top = 272
  end
  object UsersUTrWrite: TUniTransaction
    DefaultConnection = UniConnection1
    Left = 864
    Top = 312
  end
  object unqryunqry: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO calls'
      
        '  (timeofcall, forwarded, internally, co, way, number, duration,' +
        ' cost)'
      'VALUES'
      
        '  (:timeofcall, :forwarded, :internally, :co, :way, :number, :du' +
        'ration, :cost)')
    SQLDelete.Strings = (
      'DELETE FROM calls'
      'WHERE'
      
        '  timeofcall = :Old_timeofcall AND internally = :Old_internally ' +
        'AND co = :Old_co AND cost = :Old_cost')
    SQLUpdate.Strings = (
      'UPDATE calls'
      'SET'
      
        '  timeofcall = :timeofcall, forwarded = :forwarded, internally =' +
        ' :internally, co = :co, way = :way, number = :number, duration =' +
        ' :duration, cost = :cost'
      'WHERE'
      
        '  timeofcall = :Old_timeofcall AND internally = :Old_internally ' +
        'AND co = :Old_co AND cost = :Old_cost')
    SQLLock.Strings = (
      'SELECT * FROM calls'
      'WHERE'
      
        '  timeofcall = :Old_timeofcall AND internally = :Old_internally ' +
        'AND co = :Old_co AND cost = :Old_cost'
      'FOR UPDATE')
    SQLRefresh.Strings = (
      
        'SELECT timeofcall, forwarded, internally, co, way, number, durat' +
        'ion, cost FROM calls'
      'WHERE'
      
        '  timeofcall = :timeofcall AND internally = :internally AND co =' +
        ' :co AND cost = :cost')
    DataTypeMap = <>
    Connection = UniConnection1
    Transaction = untrnsctnRead
    UpdateTransaction = untrnsctnWrite
    SQL.Strings = (
      'SELECT '
      '  `calls`.`timeofcall`,'
      '  `calls`.`forwarded`,'
      '  `calls`.`internally`,'
      '  `calls`.`co`,'
      '  `calls`.`way`,'
      '  `calls`.`number`,'
      '  sum(`calls`.`duration`) as dur,'
      '  `calls`.`cost`'
      'FROM'
      
        '  `calls`  where  `calls`.`timeofcall` > '#39'2016-01-22 18:03:00'#39' a' +
        'nd   '
      
        '  `calls`.`timeofcall` < '#39'2016-05-22 18:03:00'#39'  group by  `calls' +
        '`.`number` ;')
    Left = 232
    Top = 312
  end
  object untrnsctnRead: TUniTransaction
    DefaultConnection = UniConnection1
    Left = 296
    Top = 264
  end
  object SelectQuaryds: TUniDataSource
    DataSet = unqryunqry
    Left = 368
    Top = 320
  end
  object untrnsctnWrite: TUniTransaction
    DefaultConnection = UniConnection1
    Left = 296
    Top = 360
  end
end
