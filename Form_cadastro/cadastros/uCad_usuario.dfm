inherited frCad_usuario: TfrCad_usuario
  Top = 77
  Caption = 'Cadastro de usu'#225'rios'
  ClientHeight = 448
  ClientWidth = 531
  Color = 14737632
  Position = poDesigned
  ExplicitWidth = 547
  ExplicitHeight = 487
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnFundo: TPanel
    Width = 531
    Height = 431
    Color = clWhite
    ExplicitLeft = -8
    ExplicitTop = -6
    ExplicitWidth = 531
    ExplicitHeight = 530
    inherited pnComponentes: TPanel
      Width = 529
      Height = 429
      ExplicitWidth = 529
      ExplicitHeight = 429
      inherited pnBarra: TPanel
        Width = 525
        Height = 39
        ExplicitWidth = 525
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
          Left = 475
          Height = 37
          ExplicitLeft = 475
          ExplicitHeight = 37
        end
      end
      object GroupBox1: TGroupBox
        Left = 15
        Top = 216
        Width = 502
        Height = 193
        Caption = 'Login e senha '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object Label1: TLabel
          Left = 267
          Top = 74
          Width = 35
          Height = 14
          Caption = 'Login'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
        end
        object Label2: TLabel
          Left = 267
          Top = 99
          Width = 35
          Height = 14
          Caption = 'Senha'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
        end
        object Label3: TLabel
          Left = 197
          Top = 125
          Width = 105
          Height = 14
          Caption = 'Confirmar Senha'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
        end
        object Panel2: TPanel
          Left = 18
          Top = 30
          Width = 159
          Height = 147
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
          TabOrder = 0
          object Image1: TImage
            Left = -2
            Top = -3
            Width = 162
            Height = 153
            PopupMenu = PopupMenu1
          end
        end
        object Edit1: TEdit
          Left = 308
          Top = 122
          Width = 165
          Height = 22
          Hint = 'Confirmar senha '
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
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
        end
        object Edit2: TEdit
          Left = 308
          Top = 71
          Width = 166
          Height = 22
          Hint = 'Login de acesso ao sistema'
          BevelEdges = [beLeft, beTop]
          BevelInner = bvNone
          BevelOuter = bvNone
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          PasswordChar = '*'
          ShowHint = True
          TabOrder = 2
        end
        object Edit3: TEdit
          Left = 308
          Top = 96
          Width = 165
          Height = 22
          Hint = 'Senha de acesso ao sistema'
          BevelEdges = [beLeft, beTop]
          BevelInner = bvNone
          BevelOuter = bvNone
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          PasswordChar = '*'
          ShowHint = True
          TabOrder = 3
        end
      end
      object GroupBox2: TGroupBox
        Left = 15
        Top = 49
        Width = 502
        Height = 161
        Caption = 'Dados Cadastrais'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        object Label4: TLabel
          Left = 139
          Top = 116
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
        object Label5: TLabel
          Left = 35
          Top = 41
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
        object Label6: TLabel
          Left = 321
          Top = 66
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
        object Label7: TLabel
          Left = 42
          Top = 66
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
        object Label8: TLabel
          Left = 9
          Top = 91
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
        object Label9: TLabel
          Left = 122
          Top = 41
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
        object Label10: TLabel
          Left = 37
          Top = 116
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
        object Label11: TLabel
          Left = 321
          Top = 116
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
        object cbLogradouro: TComboBox
          Left = 86
          Top = 88
          Width = 99
          Height = 22
          Style = csDropDownList
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
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
        object cbUF: TComboBox
          Left = 347
          Top = 113
          Width = 138
          Height = 22
          Style = csDropDownList
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object ckSituacao: TCheckBox
          Left = 339
          Top = 15
          Width = 121
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
          TabOrder = 2
          OnClick = ckSituacaoClick
        end
        object edCidade: TEdit
          Left = 193
          Top = 113
          Width = 121
          Height = 22
          BevelEdges = [beTop]
          BevelInner = bvNone
          BevelOuter = bvNone
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnExit = edCidadeExit
        end
        object edCodigo: TEdit
          Left = 85
          Top = 38
          Width = 30
          Height = 22
          BevelEdges = [beTop]
          BevelInner = bvNone
          BevelOuter = bvNone
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnExit = edCodigoExit
        end
        object edEmail: TEdit
          Left = 86
          Top = 63
          Width = 225
          Height = 22
          BevelEdges = [beTop]
          BevelInner = bvNone
          BevelOuter = bvNone
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          OnExit = edEmailExit
        end
        object edNome: TEdit
          Left = 164
          Top = 38
          Width = 321
          Height = 22
          BevelEdges = [beTop]
          BevelInner = bvNone
          BevelOuter = bvNone
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          OnExit = edNomeExit
        end
        object edNumero: TEdit
          Left = 86
          Top = 113
          Width = 40
          Height = 22
          BevelEdges = [beTop]
          BevelInner = bvNone
          BevelOuter = bvNone
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
          OnExit = edNumeroExit
        end
        object edRua: TEdit
          Left = 193
          Top = 88
          Width = 292
          Height = 22
          BevelEdges = [beTop]
          BevelInner = bvNone
          BevelOuter = bvNone
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
          OnExit = edRuaExit
        end
        object mkCPF: TMaskEdit
          Left = 348
          Top = 63
          Width = 137
          Height = 22
          BevelEdges = [beTop]
          BevelInner = bvNone
          BevelOuter = bvNone
          BevelKind = bkFlat
          EditMask = '000\.000\.000\-00;1;_'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          MaxLength = 14
          ParentFont = False
          TabOrder = 9
          Text = '   .   .   -  '
          OnExit = mkCPFExit
          OnKeyPress = mkCPFKeyPress
        end
      end
    end
  end
  inherited pnUsuario: TPanel
    Top = 431
    Width = 531
    ExplicitLeft = -1
    ExplicitTop = 593
    ExplicitWidth = 526
  end
  object PopupMenu1: TPopupMenu
    Left = 336
    Top = 232
    object Insiraasuafoto1: TMenuItem
      Caption = 'Insira a sua foto '
      OnClick = Insiraasuafoto1Click
    end
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Left = 384
    Top = 232
  end
  object PopupMenu2: TPopupMenu
    Left = 432
    Top = 230
    object qweqweqwewq1: TMenuItem
      Caption = 'qweqweqwewq'
    end
  end
end
