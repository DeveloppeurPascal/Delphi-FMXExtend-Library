unit Olf.FMX.Effects;

interface

uses
  System.SysUtils, System.Classes, FMX.Types, FMX.Effects, FMX.Graphics;

type

  [ComponentPlatformsAttribute(pfidWindows or pfidOSX or pfidLinux or
    pfidAndroid or pfidiOS)]
  TOlfFlipHorizontalEffect = class(TEffect)
  private
  protected
  public
    constructor Create(AOwner: TComponent); override;
    procedure ProcessEffect(const Canvas: TCanvas; const Visual: TBitmap;
      const Data: Single); override;
  published
    property Enabled;
    property trigger;
  end;

  [ComponentPlatformsAttribute(pfidWindows or pfidOSX or pfidLinux or
    pfidAndroid or pfidiOS)]
  TOlfFlipVerticalEffect = class(TEffect)
  private
  protected
  public
    constructor Create(AOwner: TComponent); override;
    procedure ProcessEffect(const Canvas: TCanvas; const Visual: TBitmap;
      const Data: Single); override;
  published
    property Enabled;
    property trigger;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('OlfSoftware', [TOlfFlipHorizontalEffect,
    TOlfFlipVerticalEffect]);
end;

{ TOlfFlipHorizontalEffect }

constructor TOlfFlipHorizontalEffect.Create(AOwner: TComponent);
begin
  inherited;
  FEffectStyle := [TEffectStyle.DisablePaint];
end;

procedure TOlfFlipHorizontalEffect.ProcessEffect(const Canvas: TCanvas;
  const Visual: TBitmap; const Data: Single);
begin
  inherited;
  Visual.FlipHorizontal;
end;

{ TOlfFlipVerticalEffect }

constructor TOlfFlipVerticalEffect.Create(AOwner: TComponent);
begin
  inherited;
  FEffectStyle := [TEffectStyle.DisablePaint];
end;

procedure TOlfFlipVerticalEffect.ProcessEffect(const Canvas: TCanvas;
  const Visual: TBitmap; const Data: Single);
begin
  inherited;
  Visual.FlipVertical;
end;

initialization

RegisterFmxClasses([TOlfFlipHorizontalEffect, TOlfFlipVerticalEffect]);

end.
