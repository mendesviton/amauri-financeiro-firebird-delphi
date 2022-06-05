inherited frCad_padrao1: TfrCad_padrao1
  Caption = 'frCad_padrao1'
  ClientHeight = 255
  ClientWidth = 432
  ExplicitWidth = 448
  ExplicitHeight = 294
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnFundo: TPanel
    Width = 432
    Height = 188
    ExplicitWidth = 432
    ExplicitHeight = 188
    inherited pnComponentes: TPanel
      Left = 6
      Top = 8
      Width = 417
      Height = 169
      ExplicitLeft = 6
      ExplicitTop = 8
      ExplicitWidth = 417
      ExplicitHeight = 169
      object lbDescricao: TLabel
        Left = 37
        Top = 89
        Width = 70
        Height = 14
        Caption = 'Descri'#231#227'o:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
      end
      object lbCodigo: TLabel
        Left = 58
        Top = 37
        Width = 49
        Height = 14
        Caption = 'C'#243'digo:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
      end
      object lbNome: TLabel
        Left = 72
        Top = 63
        Width = 35
        Height = 14
        Caption = 'Nome:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
      end
      object edDescricao: TEdit
        Left = 108
        Top = 86
        Width = 273
        Height = 22
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object ckPadrao: TCheckBox
        Left = 108
        Top = 114
        Width = 237
        Height = 17
        Caption = 'Forma de pagamento padr'#227'o'
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        State = cbChecked
        TabOrder = 1
      end
      object edCodigo: TEdit
        Left = 108
        Top = 34
        Width = 31
        Height = 22
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object Edit1: TEdit
        Left = 108
        Top = 60
        Width = 273
        Height = 22
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
    end
  end
  inherited pnUsuario: TPanel
    Top = 238
    Width = 432
  end
end
