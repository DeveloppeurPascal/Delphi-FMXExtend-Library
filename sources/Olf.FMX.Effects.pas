unit Olf.FMX.Effects;

interface

uses
  System.SysUtils, System.Classes, FMX.Types, FMX.Effects, FMX.Graphics,
  FMX.Bind.Editors, Data.Bind.Components;

type
  /// <summary>
  /// To activate visual LiveBindings on inherited components.
  /// </summary>
  TOlfLiveBindedEffect = class(TEffect)
  end;

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

  [ComponentPlatformsAttribute(pfidWindows or pfidOSX or pfidLinux or
    pfidAndroid or pfidiOS)]
  TOlfRotateEffect = class(TOlfLiveBindedEffect)
  private
    FRotation: Single;
    procedure SetRotation(const Value: Single);
    procedure ObserverToggle(const AObserver: IObserver; const Value: Boolean);
  protected
    { Déclarations protégées }
    function CanObserve(const ID: Integer): Boolean; override;
    procedure ObserverAdded(const ID: Integer;
      const Observer: IObserver); override;
  public
    constructor Create(AOwner: TComponent); override;
    procedure ProcessEffect(const Canvas: TCanvas; const Visual: TBitmap;
      const Data: Single); override;
  published
    property Enabled;
    property trigger;
    property Rotation: Single read FRotation write SetRotation;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('OlfSoftware', [TOlfFlipHorizontalEffect,
    TOlfFlipVerticalEffect, TOlfRotateEffect]);
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

{ TOlfRotateEffect }
function TOlfRotateEffect.CanObserve(const ID: Integer): Boolean;
begin
  case ID of
    TObserverMapping.EditLinkID, TObserverMapping.ControlValueID:
      Result := True;
  else
    Result := False;
  end;
end;

constructor TOlfRotateEffect.Create(AOwner: TComponent);
begin
  inherited;
  FEffectStyle := [TEffectStyle.DisablePaint];
end;

procedure TOlfRotateEffect.ObserverAdded(const ID: Integer;
  const Observer: IObserver);
begin
  if ID = TObserverMapping.EditLinkID then
    Observer.OnObserverToggle := ObserverToggle;
end;

procedure TOlfRotateEffect.ObserverToggle(const AObserver: IObserver;
  const Value: Boolean);
var
  LEditLinkObserver: IEditLinkObserver;
begin
  if Value then
  begin
    if Supports(AObserver, IEditLinkObserver, LEditLinkObserver) then
      Enabled := not LEditLinkObserver.IsReadOnly;
  end
  else
    Enabled := True;
end;

procedure TOlfRotateEffect.ProcessEffect(const Canvas: TCanvas;
  const Visual: TBitmap; const Data: Single);
begin
  inherited;
  Visual.Rotate(FRotation);
end;

procedure TOlfRotateEffect.SetRotation(const Value: Single);
begin
  if Value <> FRotation then
  begin
    FRotation := Value;
    UpdateParentEffects;
  end;
end;

initialization

RegisterFmxClasses([TOlfFlipHorizontalEffect,
  TOlfFlipVerticalEffect, TOlfRotateEffect]);
Data.Bind.Components.RegisterValuePropertyName
  (TArray<TClass>.Create(TOlfRotateEffect), 'Rotation', 'FMX');

finalization

Data.Bind.Components.UnregisterValuePropertyName
  (TArray<TClass>.Create(TOlfRotateEffect));

end.
