(* C2PP
  ***************************************************************************

  Delphi FMX Extend Library

  Copyright 2021-2025 Patrick Pr�martin under AGPL 3.0 license.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
  THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
  DEALINGS IN THE SOFTWARE.

  ***************************************************************************

  Set of FireMonkey components for Delphi multi-platform projects.

  ***************************************************************************

  Author(s) :
  Patrick PREMARTIN

  Site :
  https://fmxextend.developpeur-pascal.fr/

  Project site :
  https://github.com/DeveloppeurPascal/Delphi-FMXExtend-Library

  ***************************************************************************
  File last update : 2025-05-25T16:22:59.298+02:00
  Signature : 2cd747bd4c5d184a83bea9d06ce47a5af82f24d5
  ***************************************************************************
*)

unit fMain;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.Controls.Presentation,
  FMX.StdCtrls,
  FMX.ListBox,
  FMX.Layouts,
  Olf.FMX.Effects,
  FMX.Effects,
  FMX.Objects,
  Data.Bind.EngExt,
  FMX.Bind.DBEngExt,
  System.Rtti,
  System.Bindings.Outputs,
  FMX.Bind.Editors,
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
    { D�clarations priv�es }
    procedure StopEffects;
  public
    { D�clarations publiques }
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
    OlfRotateEffect1.Data := adRotation.Value;
    OlfRotateEffect1.Enabled := true;
  end;
end;

procedure TForm1.StopEffects;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
    if (Components[i] is teffect) and ((Components[i] as teffect).Enabled) then
      (Components[i] as teffect).Enabled := false;
end;

end.
