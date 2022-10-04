object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Food Menu Catalogue'
  ClientHeight = 424
  ClientWidth = 618
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object Label1: TLabel
    Left = 448
    Top = 56
    Width = 62
    Height = 15
    Caption = 'Food Name'
  end
  object Label2: TLabel
    Left = 448
    Top = 106
    Width = 25
    Height = 15
    Caption = 'Chef'
  end
  object DynamicLabel: TLabel
    Left = 450
    Top = 211
    Width = 41
    Height = 15
    Caption = 'RefType'
    Visible = False
  end
  object AddFoodButton: TButton
    Left = 448
    Top = 274
    Width = 146
    Height = 25
    Caption = 'Add Food'
    TabOrder = 0
    OnClick = AddFoodButtonClick
  end
  object Button2: TButton
    Left = 449
    Top = 305
    Width = 146
    Height = 25
    Caption = 'Clear All'
    TabOrder = 1
  end
  object Button3: TButton
    Left = 449
    Top = 336
    Width = 146
    Height = 25
    Caption = 'Show Menu'
    TabOrder = 2
    OnClick = ShowMenu
  end
  object ListBox1: TListBox
    Left = 40
    Top = 46
    Width = 393
    Height = 315
    ItemHeight = 15
    TabOrder = 3
  end
  object TypeOrSpiceEd: TEdit
    Left = 449
    Top = 232
    Width = 146
    Height = 23
    TabOrder = 4
    Visible = False
  end
  object NameEd: TEdit
    Left = 448
    Top = 77
    Width = 146
    Height = 23
    TabOrder = 5
  end
  object ChefEd: TEdit
    Left = 448
    Top = 127
    Width = 146
    Height = 23
    TabOrder = 6
  end
  object ComboBox1: TComboBox
    Left = 450
    Top = 171
    Width = 145
    Height = 23
    TabOrder = 7
    Text = '---Select Category---'
    OnChange = OnComboChange
  end
end
