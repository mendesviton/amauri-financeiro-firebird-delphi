object frLogin: TfrLogin
  Left = 0
  Top = 0
  Caption = 'Login'
  ClientHeight = 158
  ClientWidth = 300
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCanResize = FormCanResize
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 39
    Width = 300
    Height = 119
    Align = alClient
    BevelKind = bkFlat
    TabOrder = 0
    object lbLogin: TLabel
      Left = 53
      Top = 37
      Width = 42
      Height = 14
      Caption = 'Login:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
    end
    object lbSenha: TLabel
      Left = 53
      Top = 62
      Width = 42
      Height = 14
      Caption = 'Senha:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
    end
    object edLogin: TEdit
      Left = 97
      Top = 34
      Width = 141
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
      TabOrder = 0
    end
    object edSenha: TEdit
      Left = 97
      Top = 59
      Width = 141
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
      PasswordChar = '*'
      TabOrder = 1
      OnExit = edSenhaExit
    end
  end
  object pnBarra: TPanel
    Left = 0
    Top = 0
    Width = 300
    Height = 39
    Align = alTop
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    object sbLogar: TSpeedButton
      Left = 250
      Top = 1
      Width = 49
      Height = 37
      Hint = 'Gravar registro'
      Align = alRight
      Flat = True
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000232E0000232E00000000000000000000F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0D2E8DC82D3A744C27D1AB66105B15405B1
        541AB66144C27D82D3A7D2E8DCF0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0D4E9DE54C68801B05100AF5000AF50
        00AF5000AF5000AF5000AF5000AF5000AF5001B05154C688D4E9DEF0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F09BD9B80BB25700AF5000
        AF5000AF5000AF5000AF5000AF5000AF5000AF5000AF5000AF5000AF5000AF50
        0BB2579BD9B8F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F085D3A900AF
        5000AF5000AF5000AF5000AF5000AF5000AF5000AF5000AF5000AF5000AF5000
        AF5000AF5000AF5000AF5000AF5085D3A9F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        9DDAB900AF5000AF5000AF5000AF5000AF5000AF5000AF5000AF5000AF5000AF
        5000AF5000AF5000AF5000AF5000AF5000AF5000AF5000AF509DDAB9F0F0F0F0
        F0F0F0F0F0D4E9DE0CB35800AF5000AF5000AF5000AF5000AF5000AF5000AF50
        00AF5000AF5000AF5000AF5000AF5000AF5000AF5000AF5000AF5000AF5000AF
        500CB358D4E9DEF0F0F0F0F0F054C68800AF5000AF5000AF5000AF5000AF5000
        AF5026BB6AB1E7CAA8E4C41BB86200AF5000AF5000AF5000AF5000AF5000AF50
        00AF5000AF5000AF5000AF5054C688F0F0F0D2E8DC02B05200AF5000AF5000AF
        5000AF5000AF5025BB69E5F7EEFFFFFFFFFFFFDCF4E71FB96500AF5000AF5000
        AF5000AF5000AF5000AF5000AF5000AF5000AF5002B052D3E9DD80D2A500AF50
        00AF5000AF5000AF5000AF5021BA67E2F6ECFFFFFFFFFFFFFFFFFFFFFFFFE0F6
        EA23BA6800AF5000AF5000AF5000AF5000AF5000AF5000AF5000AF5000AF5080
        D2A542C17C00AF5000AF5000AF5000AF501FB965E0F6EAFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFE4F7ED27BB6B00AF5000AF5000AF5000AF5000AF5000AF
        5000AF5000AF5042C17C19B66100AF5000AF5000AF5017B660DCF4E7FFFFFFFF
        FFFFFFFFFFDFF5E9E2F6ECFFFFFFFFFFFFFFFFFFE6F8EE2ABC6D00AF5000AF50
        00AF5000AF5000AF5000AF5000AF5019B66106B15400AF5000AF5000AF507ED7
        A7FFFFFFFFFFFFFFFFFFE2F6EC21BA6722BA67E0F6EAFFFFFFFFFFFFFFFFFFE9
        F9F02EBE7000AF5000AF5000AF5000AF5000AF5000AF5006B15406B15400AF50
        00AF5000AF5060CD92FFFFFFFFFFFFE5F7EE25BB6900AF5000AF501FB965DCF4
        E7FFFFFFFFFFFFFFFFFFECFAF233BF7300AF5000AF5000AF5000AF5000AF5006
        B15419B66100AF5000AF5000AF5001B05166CF968BDBB020B96600AF5000AF50
        00AF5000AF501BB862D8F3E5FFFFFFFFFFFFFFFFFFEEFAF436C07500AF5000AF
        5000AF5000AF5019B66142C17C00AF5000AF5000AF5000AF5000AF5000AF5000
        AF5000AF5000AF5000AF5000AF5000AF5018B760D3F2E1FFFFFFFFFFFFFFFFFF
        F0FBF51CB86300AF5000AF5000AF5042C17C80D2A500AF5000AF5000AF5000AF
        5000AF5000AF5000AF5000AF5000AF5000AF5000AF5000AF5000AF5014B55ECF
        F0DEFFFFFFFFFFFFFFFFFF54CA8A00AF5000AF5000AF5080D2A5D2E8DC02B052
        00AF5000AF5000AF5000AF5000AF5000AF5000AF5000AF5000AF5000AF5000AF
        5000AF5000AF5012B55CC9EEDAFFFFFFDFF5E913B55D00AF5000AF5002B052D3
        E9DDF0F0F054C68800AF5000AF5000AF5000AF5000AF5000AF5000AF5000AF50
        00AF5000AF5000AF5000AF5000AF5000AF5004B0532FBE700AB25700AF5000AF
        5000AF5054C688F0F0F0F0F0F0D4E9DE0CB35800AF5000AF5000AF5000AF5000
        AF5000AF5000AF5000AF5000AF5000AF5000AF5000AF5000AF5000AF5000AF50
        00AF5000AF5000AF500CB358D4E9DEF0F0F0F0F0F0F0F0F09DDAB900AF5000AF
        5000AF5000AF5000AF5000AF5000AF5000AF5000AF5000AF5000AF5000AF5000
        AF5000AF5000AF5000AF5000AF5000AF509DDAB9F0F0F0F0F0F0F0F0F0F0F0F0
        F0F0F085D3A900AF5000AF5000AF5000AF5000AF5000AF5000AF5000AF5000AF
        5000AF5000AF5000AF5000AF5000AF5000AF5000AF5085D3A9F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F09BD9B80BB25700AF5000AF5000AF5000AF50
        00AF5000AF5000AF5000AF5000AF5000AF5000AF5000AF500BB2579BD9B8F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0D4E9DE54C68801
        B05100AF5000AF5000AF5000AF5000AF5000AF5000AF5000AF5001B05154C688
        D4E9DEF0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0D2E8DC82D3A744C27D1AB66105B15405B1541AB66144C27D82
        D3A7D2E8DCF0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0}
      ParentShowHint = False
      ShowHint = True
      OnClick = sbLogarClick
      ExplicitLeft = 251
      ExplicitTop = -4
    end
  end
end
