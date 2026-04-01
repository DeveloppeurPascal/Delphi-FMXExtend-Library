(* C2PP
  ***************************************************************************

  Delphi FMX Extend Library
  Copyright (c) 2021-2026 Patrick PREMARTIN

  This program is free software: you can redistribute it and/or modify
  it under the terms of the GNU Affero General Public License as
  published by the Free Software Foundation, either version 3 of the
  License, or (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU Affero General Public License for more details.

  You should have received a copy of the GNU Affero General Public License
  along with this program.  If not, see <https://www.gnu.org/licenses/>.

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
  File last update : 2025-05-25T16:24:07.517+02:00
  Signature : cb4495a36c525d4aa71c30b2e6bc97ab8455aaf9
  ***************************************************************************
*)

unit Olf.FMX.Effects;

interface

uses
  System.SysUtils,
  System.Classes,
  FMX.Types,
  FMX.Effects,
  FMX.Graphics,
  FMX.Bind.Editors,
  Data.Bind.Components;

type
  /// <summary>
  /// To activate visual LiveBindings on inherited components.
  /// </summary>
  TOlfLiveBindedEffect = class(TEffect)
  end;

{$IF CompilerVersion >= 33.0}
  [ComponentPlatformsAttribute(pfidWindows or pfidOSX or pfidLinux or
    pfidAndroid or pfidiOS)]
{$ELSE}
  [ComponentPlatformsAttribute(pidWin32 or pidWin64 or pidOSX32 or pidOSX64 or
    pidiOSSimulator or pidiOSDevice32 or pidiOSDevice64 or pidAndroid or
    pidAndroid64 or pidLinux64)]
{$ENDIF}

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

{$IF CompilerVersion >= 33.0}
  [ComponentPlatformsAttribute(pfidWindows or pfidOSX or pfidLinux or
    pfidAndroid or pfidiOS)]
{$ELSE}
  [ComponentPlatformsAttribute(pidWin32 or pidWin64 or pidOSX32 or pidOSX64 or
    pidiOSSimulator or pidiOSDevice32 or pidiOSDevice64 or pidAndroid or
    pidAndroid64 or pidLinux64)]
{$ENDIF}

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

{$IF CompilerVersion >= 33.0}
  [ComponentPlatformsAttribute(pfidWindows or pfidOSX or pfidLinux or
    pfidAndroid or pfidiOS)]
{$ELSE}
  [ComponentPlatformsAttribute(pidWin32 or pidWin64 or pidOSX32 or pidOSX64 or
    pidiOSSimulator or pidiOSDevice32 or pidiOSDevice64 or pidAndroid or
    pidAndroid64 or pidLinux64)]
{$ENDIF}

  TOlfRotateEffect = class(TOlfLiveBindedEffect)
  private
    FRotation: Single;
    procedure SetRotation(const Value: Single);
    procedure ObserverToggle(const AObserver: IObserver; const Value: Boolean);
  protected
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
  FRotation := 0;
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

RegisterFmxClasses([TOlfFlipHorizontalEffect, TOlfFlipVerticalEffect,
  TOlfRotateEffect]);
Data.Bind.Components.RegisterValuePropertyName
  (TArray<TClass>.Create(TOlfRotateEffect), 'Rotation', 'FMX');

finalization

Data.Bind.Components.UnregisterValuePropertyName
  (TArray<TClass>.Create(TOlfRotateEffect));

end.
