﻿inherited frCad_usuario: TfrCad_usuario
  Top = 77
  Caption = 'Cadastro de usu'#225'rios'
  ClientHeight = 499
  ClientWidth = 515
  Color = 14737632
  Position = poDesigned
  ExplicitWidth = 531
  ExplicitHeight = 538
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnFundo: TPanel
    Width = 515
    Height = 482
    ExplicitWidth = 515
    ExplicitHeight = 482
    inherited pnComponentes: TPanel
      Left = 9
      Top = 8
      Height = 464
      ExplicitLeft = 9
      ExplicitTop = 8
      ExplicitHeight = 464
      object Bevel2: TBevel [0]
        Left = 12
        Top = 227
        Width = 468
        Height = 11
        Shape = bsTopLine
      end
      object lbCidade: TLabel [1]
        Left = 261
        Top = 418
        Width = 49
        Height = 14
        Caption = 'Cidade:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
      end
      object lbCidadeCarteira: TLabel [2]
        Left = 180
        Top = 170
        Width = 49
        Height = 14
        Caption = 'Cidade:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
      end
      object lbCodigo: TLabel [3]
        Left = 57
        Top = 271
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
      object lbCodigoCarteira: TLabel [4]
        Left = 180
        Top = 54
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
      object lbCPF: TLabel [5]
        Left = 78
        Top = 328
        Width = 28
        Height = 14
        Caption = 'CPF:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
      end
      object lbCPFCarteira: TLabel [6]
        Left = 180
        Top = 124
        Width = 28
        Height = 14
        Caption = 'CPF:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
      end
      object lbEmail: TLabel [7]
        Left = 64
        Top = 299
        Width = 42
        Height = 14
        Caption = 'Email:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
      end
      object lbEmailCarteira: TLabel [8]
        Left = 180
        Top = 100
        Width = 42
        Height = 14
        Caption = 'Email:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
      end
      object lbEnderecoCarteira: TLabel [9]
        Left = 180
        Top = 147
        Width = 63
        Height = 14
        Caption = 'Endere'#231'o:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
      end
      object lbLogradouro: TLabel [10]
        Left = 29
        Top = 357
        Width = 77
        Height = 14
        Caption = 'Logradouro:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
      end
      object lbNome: TLabel [11]
        Left = 151
        Top = 272
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
      object lbNomeCarteira: TLabel [12]
        Left = 180
        Top = 76
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
      object lbNomelogr: TLabel [13]
        Left = 29
        Top = 388
        Width = 77
        Height = 14
        Caption = 'Nome local:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
      end
      object lbNumero: TLabel [14]
        Left = 57
        Top = 418
        Width = 49
        Height = 14
        Caption = 'Numero:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
      end
      object lbUF: TLabel [15]
        Left = 289
        Top = 357
        Width = 21
        Height = 14
        Caption = 'UF:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
      end
      object lbUFCarteira: TLabel [16]
        Left = 180
        Top = 191
        Width = 49
        Height = 14
        Caption = 'Estado:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
      end
      object cbLogradouro: TComboBox [17]
        Left = 107
        Top = 354
        Width = 137
        Height = 22
        Style = csDropDownList
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        OnChange = cbLogradouroChange
        Items.Strings = (
          'Rua'
          'Acesso'
          'Acampamento'
          'Acesso Local'
          'Adro'
          #193'rea Especial'
          'Aeroporto'
          'Alameda'
          'Avenida Marginal Direita'
          'Avenida Marginal Esquerda'
          'Anel Vi'#225'rio'
          'Antiga Estrada'
          'Art'#233'ria'
          'Alto'
          'Atalho'
          'V'#9#193'rea Verde'
          'Avenida'
          'Avenida Contorno'
          'Avenida Marginal'
          'Avenida Velha'
          'Balne'#225'rio'
          'Beco'
          'Buraco'
          'Belvedere'
          'Bloco'
          'Bal'#227'o'
          'Blocos'
          'Bulevar'
          'Bosque'
          'Boulevard'
          'Baixa'
          'Cais'
          'Cal'#231'ada'
          'Caminho'
          'Canal'
          'Ch'#225'cara'
          'Chapad'#227'o'
          'Ciclovia'
          'Circular'
          'Conjunto'
          'Conjunto Mutir'#227'o'
          'Complexo Vi'#225'rio'
          'Col'#244'nia'
          'Comunidade'
          'Condom'#237'nio'
          'Corredor'
          'Campo'
          'C'#243'rrego'
          'Contorno'
          'Descida'
          'Desvio'
          'Distrito'
          'Entre Bloco'
          'Estrada Intermunicipal'
          'Enseada'
          'Entrada Particular'
          'Entre Quadra'
          'Escada'
          'Escadaria'
          'Estrada Estadual'
          'Estrada Vicinal'
          'Estrada de Liga'#231#227'o'
          'Estrada Municipal'
          'Esplanada'
          'Estrada de Servid'#227'o'
          'Estrada'
          'Estrada Velha'
          'Estrada Antiga'
          'Esta'#231#227'o'
          'Est'#225'dio'
          'Est'#226'ncia'
          'Estrada Particular'
          'Estacionamento'
          'Evang'#233'lica'
          'Elevada'
          'Eixo Industrial'
          'Favela'
          'Fazenda'
          'Ferrovia'
          'Fonte'
          'Feira'
          'Forte'
          'Galeria'
          'Granja'
          'N'#250'cleo Habitacional'
          'Ilha'
          'Indeterminado'
          'Ilhota'
          'Jardim'
          'Jardinete'
          'Ladeira'
          'Lagoa'
          'Lago'
          'Loteamento'
          'Largo'
          'Lote'
          'Mercado'
          'Marina'
          'Modulo'
          'Proje'#231#227'o'
          'Morro'
          'Monte'
          'N'#250'cleo'
          'N'#250'cleo Rural'
          'Outeiro'
          'Paralela'
          'Passeio'
          'P'#225'tio'
          'Pra'#231'a'
          'Pra'#231'a de Esportes'
          'Parada'
          'Paradouro'
          'Ponta'
          'Praia'
          'Prolongamento'
          'Parque Municipal'
          'Parque'
          'Parque Residencial'
          'Passarela'
          'Passagem'
          'Passagem de Pedestre'
          'Passagem Subterr'#226'nea'
          'Ponte'
          'Porto'
          'Quadra'
          'Quinta'
          'Quintas'
          'Ramal'
          'Recreio'
          'Recanto'
          'Retiro'
          'Residencial'
          'Reta'
          'Ruela'
          'Rampa'
          'Rodo Anel'
          'Rodovia'
          'Rotula'
          'Rua de Pedestre'
          'Margem'
          'Retorno'
          'Rotat'#243'ria'
          'Segunda Avenida'
          'Sitio'
          'Servid'#227'o'
          'Setor'
          'Subida'
          'Trincheira'
          'Terminal'
          'Trecho'
          'Trevo'
          'T'#250'nel'
          'Travessa'
          'Travessa Particular'
          'Travessa Velha'
          'Unidade'
          'Via'
          'Via de Acesso'
          'Vala'
          'Via Costeira'
          'Viaduto'
          'Vereda'
          'Via Elevado'
          'Vila'
          'Viela'
          'Vale'
          'Via Litor'#226'nea'
          'Via de Pedestre'
          'Variante'
          'Zague')
      end
      object cbUF: TComboBox [18]
        Left = 316
        Top = 354
        Width = 145
        Height = 22
        Style = csDropDownList
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        OnChange = cbUFChange
      end
      object ckSituação: TCheckBox [19]
        Left = 336
        Top = 244
        Width = 122
        Height = 17
        Caption = 'Usu'#225'rio ativo'
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        State = cbChecked
        TabOrder = 9
        OnClick = ckSituaçãoClick
      end
      object edCidade: TEdit [20]
        Left = 316
        Top = 415
        Width = 145
        Height = 22
        BevelEdges = [beTop]
        BevelInner = bvSpace
        BevelKind = bkFlat
        BevelOuter = bvRaised
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
        OnChange = edCidadeChange
        OnExit = edCidadeExit
      end
      object edCodigo: TEdit [21]
        Left = 107
        Top = 268
        Width = 31
        Height = 22
        BevelEdges = [beTop]
        BevelInner = bvSpace
        BevelKind = bkFlat
        BevelOuter = bvRaised
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnChange = edCodigoChange
        OnExit = edCodigoExit
      end
      object edEmail: TEdit [22]
        Left = 106
        Top = 296
        Width = 351
        Height = 22
        BevelEdges = [beTop]
        BevelInner = bvSpace
        BevelKind = bkFlat
        BevelOuter = bvRaised
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnChange = edEmailChange
        OnExit = edEmailExit
      end
      object edNome: TEdit [23]
        Left = 185
        Top = 268
        Width = 273
        Height = 22
        BevelEdges = [beTop]
        BevelInner = bvSpace
        BevelKind = bkFlat
        BevelOuter = bvRaised
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnChange = edNomeChange
        OnExit = edNomeExit
      end
      object edNumero: TEdit [24]
        Left = 106
        Top = 415
        Width = 138
        Height = 22
        BevelEdges = [beTop]
        BevelInner = bvSpace
        BevelKind = bkFlat
        BevelOuter = bvRaised
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        OnChange = edNumeroChange
        OnExit = edNumeroExit
      end
      object edRua: TEdit [25]
        Left = 107
        Top = 385
        Width = 354
        Height = 22
        BevelEdges = [beTop]
        BevelInner = bvSpace
        BevelKind = bkFlat
        BevelOuter = bvRaised
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        OnChange = edRuaChange
        OnExit = edRuaExit
      end
      object mkCPF: TMaskEdit [26]
        Left = 107
        Top = 325
        Width = 138
        Height = 22
        BevelEdges = [beTop]
        BevelInner = bvSpace
        BevelOuter = bvRaised
        BevelKind = bkFlat
        EditMask = '000\.000\.000\-00;1;_'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        MaxLength = 14
        ParentFont = False
        TabOrder = 3
        Text = '   .   .   -  '
        OnChange = mkCPFChange
        OnExit = mkCPFExit
        OnKeyPress = mkCPFKeyPress
      end
      object Panel2: TPanel [27]
        Left = 12
        Top = 54
        Width = 161
        Height = 150
        BevelKind = bkFlat
        Caption = 'Foto usu'#225'rio'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 10
        object Image1: TImage
          Left = -2
          Top = -3
          Width = 162
          Height = 153
          PopupMenu = PopupMenu1
        end
      end
      inherited pnBarra: TPanel
        Height = 39
        TabOrder = 11
        ExplicitHeight = 39
        inherited sbConsulta: TSpeedButton
          Height = 37
          ExplicitHeight = 37
        end
        inherited sbGravarRegistro: TSpeedButton
          Height = 37
          ExplicitHeight = 37
        end
        inherited sbExcluirRegistro: TSpeedButton
          Height = 37
          ExplicitHeight = 37
        end
        inherited spLimpaCampos: TSpeedButton
          Height = 37
          ExplicitHeight = 37
        end
      end
    end
  end
  inherited pnUsuario: TPanel
    Top = 482
    Width = 515
    ExplicitTop = 482
    ExplicitWidth = 515
  end
  object PopupMenu1: TPopupMenu
    Left = 312
    Top = 128
    object Insiraasuafoto1: TMenuItem
      Caption = 'Insira a sua foto '
      OnClick = Insiraasuafoto1Click
    end
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Left = 376
  end
  object PopupMenu2: TPopupMenu
    Left = 424
    Top = 142
    object qweqweqwewq1: TMenuItem
      Caption = 'qweqweqwewq'
    end
  end
end
