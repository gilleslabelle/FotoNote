object frmPhoto: TfrmPhoto
  Left = 0
  Top = 0
  Caption = 'Photos du cell'
  ClientHeight = 601
  ClientWidth = 1042
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 8
    Top = 8
    Width = 337
    Height = 225
    Stretch = True
  end
  object Label1: TLabel
    Left = 88
    Top = 392
    Width = 31
    Height = 13
    Caption = 'Label1'
  end
  object Button1: TButton
    Left = 580
    Top = 568
    Width = 75
    Height = 25
    Caption = 'Accepter'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 488
    Top = 568
    Width = 75
    Height = 25
    Caption = 'info'
    TabOrder = 1
  end
  object Memo1: TMemo
    Left = 8
    Top = 249
    Width = 337
    Height = 137
    Lines.Strings = (
      'Memo1')
    TabOrder = 2
  end
  object logMemo: TMemo
    Left = 16
    Top = 440
    Width = 993
    Height = 113
    Lines.Strings = (
      'logMemo')
    ScrollBars = ssVertical
    TabOrder = 3
  end
  object Button3: TButton
    Left = 304
    Top = 408
    Width = 75
    Height = 25
    Caption = 'updateprojets'
    TabOrder = 4
    OnClick = Button3Click
  end
  object BindNavigator1: TBindNavigator
    Left = 409
    Top = 190
    Width = 600
    Height = 25
    DataSource = BindSourceDB1
    Orientation = orHorizontal
    TabOrder = 5
  end
  object DBGrid1: TDBGrid
    Left = 409
    Top = 64
    Width = 593
    Height = 120
    DataSource = DataSource1
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object CheckBox1: TCheckBox
    Left = 848
    Top = 344
    Width = 97
    Height = 17
    Caption = 'CheckBox1'
    TabOrder = 7
  end
  object MediaReceiverManager: TTetheringManager
    OnPairedFromLocal = MediaReceiverManagerPairedFromLocal
    OnPairedToRemote = MediaReceiverManagerPairedToRemote
    OnRequestManagerPassword = MediaReceiverManagerRequestManagerPassword
    OnRemoteManagerShutdown = MediaReceiverManagerRemoteManagerShutdown
    OnEndAutoConnect = MediaReceiverManagerEndAutoConnect
    Password = 'AtelierMathieu'
    Text = 'AM.PhotoReceiverManager'
    AllowedAdapters = 'Network'
    Left = 96
    Top = 544
  end
  object MediaReceiverProfile: TTetheringAppProfile
    Manager = MediaReceiverManager
    Text = 'AM.PhotoReceiverApp'
    Actions = <>
    Resources = <
      item
        Name = 'License'
        IsPublic = True
      end>
    OnResourceReceived = MediaReceiverProfileResourceReceived
    Left = 248
    Top = 544
  end
  object FDMemTblClients: TFDMemTable
    AfterPost = FDMemTblClientsAfterPost
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 232
    Top = 392
    object FDMemTblClientsNom: TStringField
      FieldName = 'Nom'
    end
    object FDMemTblClientsAdresse: TStringField
      FieldName = 'Adresse'
    end
    object FDMemTblClientsVille: TStringField
      FieldName = 'Ville'
    end
    object FDMemTblClientsLongitude: TFloatField
      FieldName = 'Longitude'
    end
    object FDMemTblClientsLatitude: TFloatField
      FieldName = 'Latitude'
    end
    object FDMemTblClientsTelephone: TStringField
      FieldName = 'Telephone'
    end
    object FDMemTblClientsDescription: TStringField
      FieldName = 'Description'
    end
  end
  object FDStanStorageXMLLink1: TFDStanStorageXMLLink
    Left = 536
    Top = 376
  end
  object BindSourceDB1: TBindSourceDB
    DataSet = FDMemTblClients
    ScopeMappings = <>
    Left = 512
    Top = 304
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 20
    Top = 5
  end
  object DataSource1: TDataSource
    DataSet = FDMemTblClients
    Left = 416
    Top = 312
  end
  object TetheringAppProfile1: TTetheringAppProfile
    Manager = MediaReceiverManager
    Text = 'AM.PhotoReceiverCameraApp'
    Visible = False
    Enabled = False
    Actions = <>
    Resources = <
      item
        Name = 'License'
        IsPublic = True
      end>
    Left = 680
    Top = 328
  end
end
