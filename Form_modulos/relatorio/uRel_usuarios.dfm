inherited frRel_usuario: TfrRel_usuario
  Caption = 'Relat'#243'rio de usu'#225'rios'
  ClientHeight = 435
  ClientWidth = 369
  ExplicitWidth = 385
  ExplicitHeight = 474
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnFundo: TPanel
    Width = 369
    Height = 369
    ExplicitWidth = 369
    ExplicitHeight = 369
    object Panel1: TPanel
      Left = 7
      Top = 8
      Width = 355
      Height = 354
      BevelInner = bvLowered
      ParentBackground = False
      TabOrder = 0
      object Panel3: TPanel
        Left = 2
        Top = 2
        Width = 351
        Height = 41
        Align = alTop
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
        object Panel2: TPanel
          Left = 57
          Top = 8
          Width = 278
          Height = 22
          BevelOuter = bvLowered
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
        end
        object edCodigo: TEdit
          Left = 12
          Top = 8
          Width = 31
          Height = 22
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
      end
    end
  end
  inherited pnBarra: TPanel
    Width = 369
    Align = alTop
    ExplicitWidth = 369
  end
  object pnUsuario: TPanel [2]
    Left = 0
    Top = 418
    Width = 369
    Height = 17
    Align = alBottom
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 2
  end
  inherited frxReport1: TfrxReport
    ReportOptions.CreateDate = 44679.968829838000000000
    ReportOptions.LastChange = 44681.605332060200000000
    Left = 96
    Top = 344
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 64.252010000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object frxDBDataset1BDCODUSU: TfrxMemoView
          Left = 7.559060000000000000
          Top = 3.779530000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'BDCODUSU'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."BDCODUSU"]')
        end
        object frxDBDataset1BDNOME: TfrxMemoView
          Left = 98.267780000000000000
          Top = 3.779530000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          DataField = 'BDNOME'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."BDNOME"]')
        end
        object frxDBDataset1BDLOGR: TfrxMemoView
          Left = 506.457020000000000000
          Top = 3.779530000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          DataField = 'BDLOGR'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."BDLOGR"]')
        end
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        Condition = 'frxDBDataset1."BDCODUSU"'
      end
    end
  end
  inherited frxDBDataset1: TfrxDBDataset
    Left = 40
    Top = 296
  end
  inherited PopupMenu1: TPopupMenu
    Left = 40
    Top = 344
  end
  inherited frxPDFExport1: TfrxPDFExport
    Left = 104
    Top = 296
  end
  inherited frxCSVExport1: TfrxCSVExport
    Left = 176
    Top = 296
  end
  inherited frxDOCXExport1: TfrxDOCXExport
    Left = 176
    Top = 344
  end
end
