object DataModule1: TDataModule1
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 248
  Width = 412
  object FDConnection1: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\admin\OneDrive\Documents\Projets\FotoNote\data' +
        '\NotesDb.db'
      'DriverID=SQLite')
    Connected = True
    LoginPrompt = False
    BeforeConnect = FDConnection1BeforeConnect
    Left = 88
    Top = 56
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 192
    Top = 64
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'FMX'
    Left = 72
    Top = 176
  end
  object tblNotes: TFDTable
    IndexFieldNames = 'ID'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'tblNotes'
    TableName = 'tblNotes'
    Left = 288
    Top = 88
    object tblNotesID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object tblNotesDescription: TWideMemoField
      FieldName = 'Description'
      Origin = 'Description'
      Required = True
      BlobType = ftWideMemo
    end
    object tblNotesDate: TFloatField
      FieldName = 'Date'
      Origin = 'Date'
      Required = True
    end
    object tblNotesPhoto: TBlobField
      FieldName = 'Photo'
      Origin = 'Photo'
    end
    object tblNotesNoteAudio: TBlobField
      FieldName = 'NoteAudio'
      Origin = 'NoteAudio'
    end
    object tblNotesClientID: TIntegerField
      FieldName = 'ClientID'
      Origin = 'ClientID'
    end
    object tblNotesClientNom: TWideMemoField
      FieldName = 'ClientNom'
      Origin = 'ClientNom'
      BlobType = ftWideMemo
    end
    object tblNotesImportance: TIntegerField
      FieldName = 'Importance'
      Origin = 'Importance'
    end
  end
  object dsNotes: TDataSource
    DataSet = tblNotes
    Left = 176
    Top = 184
  end
  object tblClients: TFDTable
    IndexFieldNames = 'ID'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'tblClients'
    TableName = 'tblClients'
    Left = 336
    Top = 96
    object tblClientsID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object tblClientsNom: TWideMemoField
      FieldName = 'Nom'
      Origin = 'Nom'
      Required = True
      BlobType = ftWideMemo
    end
    object tblClientsAdresse: TWideMemoField
      FieldName = 'Adresse'
      Origin = 'Adresse'
      BlobType = ftWideMemo
    end
    object tblClientsVille: TWideMemoField
      FieldName = 'Ville'
      Origin = 'Ville'
      BlobType = ftWideMemo
    end
    object tblClientsCodePostal: TWideMemoField
      FieldName = 'CodePostal'
      Origin = 'CodePostal'
      BlobType = ftWideMemo
    end
    object tblClientsTelephone: TWideMemoField
      FieldName = 'Telephone'
      Origin = 'Telephone'
      BlobType = ftWideMemo
    end
    object tblClientsLongitude: TFloatField
      FieldName = 'Longitude'
      Origin = 'Longitude'
    end
    object tblClientsLatitude: TFloatField
      FieldName = 'Latitude'
      Origin = 'Latitude'
    end
  end
  object tblInfo: TFDTable
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'tblInfo'
    TableName = 'tblInfo'
    Left = 352
    Top = 160
    object tblInfoLastUpdateTableClients: TFloatField
      FieldName = 'LastUpdateTableClients'
      Origin = 'LastUpdateTableClients'
    end
  end
end
