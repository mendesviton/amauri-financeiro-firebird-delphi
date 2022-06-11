inherited frCad_contas: TfrCad_contas
  Caption = 'Cadastro de contas'
  ClientHeight = 204
  ClientWidth = 432
  ExplicitWidth = 448
  ExplicitHeight = 243
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnFundo: TPanel
    Width = 432
    Height = 187
    ExplicitWidth = 432
    ExplicitHeight = 187
    inherited pnComponentes: TPanel
      Left = 7
      Top = 8
      Width = 417
      Height = 169
      ExplicitLeft = 7
      ExplicitTop = 8
      ExplicitWidth = 417
      ExplicitHeight = 169
      object lbCodigo: TLabel [0]
        Left = 58
        Top = 58
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
      object lbDescricao: TLabel [1]
        Left = 37
        Top = 110
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
      object lbNome: TLabel [2]
        Left = 72
        Top = 84
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
      object ckPadrao: TCheckBox [3]
        Left = 108
        Top = 135
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
        TabOrder = 0
      end
      object edCodigo: TEdit [4]
        Left = 108
        Top = 57
        Width = 31
        Height = 22
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        BevelEdges = [beLeft, beTop]
        BevelInner = bvNone
        BevelOuter = bvNone
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnExit = edCodigoExit
      end
      object edDescricao: TEdit [5]
        Left = 108
        Top = 107
        Width = 273
        Height = 22
        BevelEdges = [beLeft, beTop]
        BevelInner = bvNone
        BevelOuter = bvNone
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object edNome: TEdit [6]
        Left = 108
        Top = 82
        Width = 273
        Height = 22
        BevelEdges = [beLeft, beTop]
        BevelInner = bvNone
        BevelOuter = bvNone
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      inherited pnBarra: TPanel
        Width = 413
        TabOrder = 4
        ExplicitWidth = 413
        inherited spLimpaCampos: TSpeedButton
          Left = 363
          ExplicitLeft = 363
          ExplicitTop = 0
          ExplicitHeight = 38
        end
        object sbFormaPgto: TSpeedButton
          Left = 314
          Top = 1
          Width = 49
          Height = 38
          Hint = 'Cadastrar forma de pagamento'
          Align = alRight
          Flat = True
          Glyph.Data = {
            F6060000424DF606000000000000360000002800000018000000180000000100
            180000000000C006000000000000000000000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FF069CCFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FF145FFF0F5CFF145FFFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FF069CCF53C1E6069CCFFF00FFFF00FF
            FF00FF0E57F20E56F0FF00FFFF00FF0F5AFAE0EAFF0F5AFAFF00FFFF00FF125E
            FF0E56F0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF069CCF61C8EC53C1E63D
            B8E0069CCFFF00FF0E59F66395FF5F92FF0F59F80F5AFA3C7BFFCCDCFF3C7BFF
            0F5AFA0F5BFD6093FF6395FF0F5AFAFF00FFFF00FFFF00FFFF00FF069CCF73D7
            F961C8EC53C1E63DB8E029ADD9069CCF1F67FF6093FFC7D9FF89AFFFC1D5FFBD
            D2FFB9D0FFBDD2FFC1D5FF89AFFFC7D9FF6093FF1F67FFFF00FFFF00FFFF00FF
            069CCF86DBF173D7F961C8EC53C1E63DB8E029ADD91BA4D1069CCF1761FF85AC
            FFB4CCFFB3CBFFB6CDFFB6CDFFB6CDFFB3CBFFB4CCFF85ACFF145FFFFF00FFFF
            00FFFF00FF069CCF9BE4F586DBF173D7F961C8EC53C1E63DB8E029ADD91BA4D1
            069CCF1A64FFB3CBFFACC7FF92B5FF4B85FF427FFF4B85FF92B5FFACC7FFB3CB
            FF1A64FFFF00FFFF00FF069CCF069CCF069CCF069CCF73D7F961C8EC53C1E63D
            B8E029ADD93072FF246AFF5D91FFA8C4FFA8C4FF4D86FF1F67FFFF00FF1F67FF
            4D86FFA8C4FFA8C4FF5D91FF246AFF3072FFFF00FFFF00FFFF00FF069CCF73D7
            F961C8EC53C1E63DB8E029ADD93072FFCEDEFFC3D7FFA0BEFFA3C0FF4681FFFF
            00FFFF00FFFF00FF4681FFA3C0FFA0BEFFC3D7FFCEDEFF3072FFFF00FFFF00FF
            FF00FF069CCF73D7F961C8EC53C1E63DB8E029ADD93576FF2C70FF5088FFAFC9
            FF9ABAFF4D86FF0F5CFFFF00FF0F5CFF4D86FF9ABAFFAFC9FF5088FF2C70FF35
            76FFFF00FFFF00FFFF00FF069CCF73D7F961C8EC53C1E63DB8E029ADD9069CCF
            FF00FF2C70FFC1D5FF92B5FF8EB2FF4D86FF4A84FF4D86FF81A9FF92B5FFC2D6
            FF2C70FFFF00FFFF00FFFF00FFFF00FFFF00FF069CCF73D7F961C8EC53C1E63D
            B8E029ADD9069CCFFF00FF3072FF75A1FFA0BFFF8DB2FF8BB0FF8DB2FF8DB2FF
            8DB2FFA0BFFF75A1FF3072FFFF00FFFF00FFFF00FFFF00FF167820069CCF73D7
            F961C8EC53C1E63DB8E029ADD9069CCF3173FF6898FFC0D4FFA0BEFFD2E0FFC1
            D5FF98B9FFBCD1FFD2E0FF9EBDFFC0D4FF6898FF3173FFFF00FFFF00FF167820
            1B7324069CCF73D7F961C8EC53C1E63DB8E029ADD9069CCF3F7DFF80A9FF7BA5
            FF3676FF3878FF588EFF8EB2FF588EFF3878FF3676FF7BA5FF80A9FF3F7DFFFF
            00FFFF00FF206B2825AD3C069CCF069CCF069CCF069CCF069CCF069CCF069CCF
            119220427FFF427FFFFF00FFFF00FF3F7DFFD9E5FF3F7DFFFF00FFFF00FF417E
            FF427FFFFF00FFFF00FF206B2822A93734B64D2CB24445C262FCFCFCE2B591E2
            B591FCF9F458DE8619A02C169A26167820FF00FFFF00FF4883FF4681FF4883FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF16782045C26245C26234B64D45C2
            6259E18E45C26259E18EF0E3D259E18E19A02C19A02C119220206B28FF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF16782045C262
            45C26245C26237B65037B65059E18EFCF9F4FCFCFC45C26219A02C19A02C19A0
            2C206B28FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FF11922058DE8645C26245C26245C262F7EADBFCFCFCF0E3D245C2621EA633
            19A02C19A02C19A02C206B28FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FF11922059E18E55DB8145C26258DE86FCFCFC59E18E59
            E18E45C26225AD3C1EA63319A02C169A26206B28FF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF22A937EBDECC45C26245C2
            62FCFCFCEBDECCF0E3D2FCFCFC45C26225AD3C1EA633206B28FF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF108E1D
            59E18EEBDECC58DE8659E18EF6FDFDFCFCFC59E18E37B65030B54922A937206B
            28FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FF22A93759E18EF0E3D2EBDECCF0E3D2F0E3D255DB8145C262
            2CB244167820FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF11922022A93758DE8658DE8645
            C26234B64D167820167820FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FF119220119220119220167820FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          ParentShowHint = False
          ShowHint = True
          OnClick = spLimpaCamposClick
          ExplicitLeft = 308
          ExplicitTop = 0
        end
      end
    end
  end
  inherited pnUsuario: TPanel
    Top = 187
    Width = 432
    ExplicitTop = 187
    ExplicitWidth = 432
  end
end
