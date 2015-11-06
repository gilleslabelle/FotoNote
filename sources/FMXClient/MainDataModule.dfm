object DataModule1: TDataModule1
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 248
  Width = 412
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=C:\DataGL\Projets\FotoNote\data\NotesDb.db'
      'DriverID=SQLite')
    Connected = True
    LoginPrompt = False
    BeforeConnect = FDConnection1BeforeConnect
    Left = 88
    Top = 72
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 200
    Top = 104
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'FMX'
    Left = 144
    Top = 168
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
end
