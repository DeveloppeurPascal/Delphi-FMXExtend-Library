unit fMain;
interface
uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.ListBox, FMX.Layouts,
  Olf.FMX.Effects, FMX.Effects, FMX.Objects, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.Components;
type
  TForm1 = class(TForm)
    Image1: TImage;
    OlfFlipHorizontalEffect1: TOlfFlipHorizontalEffect;
    OlfFlipVerticalEffect1: TOlfFlipVerticalEffect;
    ListBox1: TListBox;
    lbiFlipHorizontal: TListBoxItem;
    lbiFlipVertical: TListBoxItem;
    Label1: TLabel;
    lbiNoEffect: TListBoxItem;
    lbiRotateEffect: TListBoxItem;
    OlfRotateEffect1: TOlfRotateEffect;
    Label2: TLabel;
    BindingsList1: TBindingsList;
    LinkControlToPropertyText: TLinkControlToProperty;
    adRotation: TArcDial;
    LinkControlToPropertyRotation: TLinkControlToProperty;
    procedure lbiFlipHorizontalClick(Sender: TObject);
    procedure lbiFlipVerticalClick(Sender: TObject);
    procedure lbiNoEffectClick(Sender: TObject);
    procedure lbiRotateEffectClick(Sender: TObject);
  private
    { Déclarations privées }
    procedure StopEffects;
  public
    { Déclarations publiques }
  end;
var
  Form1: TForm1;
implementation
{$R *.fmx}
procedure TForm1.lbiFlipHorizontalClick(Sender: TObject);
begin
  if OlfFlipHorizontalEffect1.Enabled then
    OlfFlipHorizontalEffect1.Enabled := false
  else
  begin
    StopEffects;
    OlfFlipHorizontalEffect1.Enabled := true;
  end;
end;
procedure TForm1.lbiFlipVerticalClick(Sender: TObject);
begin
  if OlfFlipVerticalEffect1.Enabled then
    OlfFlipVerticalEffect1.Enabled := false
  else
  begin
    StopEffects;
    OlfFlipVerticalEffect1.Enabled := true;
  end;
end;
procedure TForm1.lbiNoEffectClick(Sender: TObject);
begin
  StopEffects;
end;
procedure TForm1.lbiRotateEffectClick(Sender: TObject);
begin
  if OlfFlipVerticalEffect1.Enabled then
    OlfFlipVerticalEffect1.Enabled := false
  else
  begin
    StopEffects;
    OlfRotateEffect1.Data:=adRotation.Value;
    OlfRotateEffect1.Enabled := true;
  end;
end;

procedure TForm1.StopEffects;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
    if (components[i] is teffect) and ((components[i] as teffect).Enabled) then
      (components[i] as teffect).Enabled := false;
end;
end.
