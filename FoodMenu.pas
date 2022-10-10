unit FoodMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;
// .gitignore deleted
type
  TForm2 = class(TForm)
    AddFoodButton: TButton;
    Button2: TButton;
    Button3: TButton;
    ListBox1: TListBox;
    TypeOrSpiceEd: TEdit;
    Label1: TLabel;
    NameEd: TEdit;
    Label2: TLabel;
    ChefEd: TEdit;
    ComboBox1: TComboBox;
    DynamicLabel: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure AddFoodButtonClick(Sender: TObject);
    procedure OnComboChange(Sender: TObject);
    procedure ShowMenu(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

 FoodString = string[70];
 SpiceRating = 0..10;
{ creating class hierarchy }

{ declare FoodOb class }

FoodOb = class(TObject)
   name : FoodString;
   chef : FoodString;
   function Describe : FoodString;
   constructor Create(aName, aChef : FoodString);
   destructor Destroy;override;

end;

{ declare a Spicy food class }

SpicyFood = class (FoodOb)
  spicescore : SpiceRating;
  function Describe : FoodString;
  constructor Create(aName, aChef : FoodString; aSpiceScore : SpiceRating);
  destructor Destroy;override;
end;

{ create a Normal food class }

NormalFood = class (FoodOb)
  refType : FoodString;
  function Describe : FoodString;
  constructor Create(aName, aChef : FoodString; aRefType : FoodString);
  destructor Destroy;override;
end;


//var
//    FoodArr : array[1..5] of TObject;
var
  Form2: TForm2;
  obList : TList;

implementation

{$R *.dfm}

procedure TForm2.FormCreate(Sender: TObject);
begin
    ComboBox1.Items.Add('Spicy');
    ComboBox1.Items.Add('Normal');
    obList := TList.Create;
end;

procedure TForm2.AddFoodButtonClick(Sender: TObject);
var
  category : string;
  name : string;
  chef : string;
  spicescore : SpiceRating;
  refType : FoodString;
  normalFoodItem : NormalFood;
  spicyFoodItem : SpicyFood;
begin
  category := ComboBox1.Text;
  name := NameEd.Text;
  chef := ChefEd.Text;
  if category = 'Spicy' then
  begin
    spicescore := StrToInt(TypeOrSpiceEd.Text);
    spicyFoodItem := SpicyFood.Create(name, chef, spicescore);
    obList.Add(spicyFoodItem);
  end
  else if category = 'Normal' then
   begin
     refType := TypeOrSpiceEd.Text;
     normalFoodItem := NormalFood.Create(name, chef, reftype);
     obList.Add(normalFoodItem);
   end;
end;



procedure TForm2.OnComboChange(Sender: TObject);
var
  category : string;
begin
    category := ComboBox1.Text;
    if category='Spicy' then
    begin
      DynamicLabel.Caption := 'Enter Spice Score [1-10]:';
      DynamicLabel.Visible := true;
      TypeOrSpiceEd.Visible := true
    end
    else if category='Normal' then
    begin
      DynamicLabel.Caption := 'Enter RefType:';
      DynamicLabel.Visible := true;
      TypeOrSpiceEd.Visible := true
    end;

end;


{ FoodOb }

constructor FoodOb.Create(aName, aChef: FoodString);
begin
    inherited Create;
    Form2.ListBox1.Items.Add('CONSTRUCTOR: BookOb.Create');
    name := aName;
    chef := aChef;
    Describe();
end;

function FoodOb.Describe: FoodString;
begin
    result := Format('[GENERAL FOOD] %s BY %s', [name, chef]);
end;

destructor FoodOb.Destroy;
begin
  Form2.ListBox1.Items.Add('DESTRUCTOR: BookOb.Destroy');
  name := '';
  chef := '';
  inherited Destroy;
end;

{ SpicyFood }

constructor SpicyFood.Create(aName, aChef: FoodString;
  aSpiceScore: SpiceRating);
begin
   inherited Create(aName, aChef);
   Form2.ListBox1.Items.Add('CONSTRUCTOR: SpicyFoodOb.Create');
   spicescore := aSpiceScore;
   Describe();
end;

function SpicyFood.Describe: FoodString;
begin
     result := Format('[SPICY FOOD] %s by %s with spice score of %d', [name, chef, spicescore]);
end;

destructor SpicyFood.Destroy;
begin

  inherited;
end;

{ NormalFood }

constructor NormalFood.Create(aName, aChef, aRefType: FoodString);
begin
  inherited Create(aName, aChef);
   Form2.ListBox1.Items.Add('CONSTRUCTOR: NormalFoodOb.Create');
   reftype := aRefType;
end;

function NormalFood.Describe: FoodString;
begin
     result := Format('[NORMAL FOOD] %s by %s with reference from %s', [name, chef, refType]);
end;

destructor NormalFood.Destroy;
begin

  inherited;
end;

procedure TForm2.ShowMenu(Sender: TObject);
var
  i : integer;
  s : FoodString;
  desc : FoodString;
  foodObject : FoodOb;
begin
  for i := 0 to obList.Count-1 do
  begin
      foodObject := FoodOb(obList.Items[i]);
      if(foodObject is SpicyFood) then
      begin
        desc := SpicyFood(foodObject).Describe;
        ListBox1.Items.Add(desc);
      end
      else
      begin
        desc := NormalFood(foodObject).Describe;
        ListBox1.Items.Add(desc);
      end;
      var val := ListBox1.Items.Count;
  end;
end;


end.
