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
  File last update : 2025-05-25T16:24:07.526+02:00
  Signature : ed68261af81a9a74272adaa4f42e833ef065fe00
  ***************************************************************************
*)

unit Olf.FMX.SelectDirectory;

interface

Uses
  System.Classes,
  FMX.Types;

type

  /// <summary>
  /// Open a modal dialog box to choose a directory.
  /// </summary>
  /// <remarks>
  /// This non visual component use SelectDirectory from FMX.Dialogs and depends on compatible platforms.
  /// The properties are used as it when calling the function.
  /// http://docwiki.embarcadero.com/Libraries/en/FMX.Dialogs.SelectDirectory
  /// </remarks>
{$IF CompilerVersion >= 33.0}
  [ComponentPlatformsAttribute(pfidWindows or pfidOSX)]
{$ELSE}
  [ComponentPlatformsAttribute(pidWin32 or pidWin64 or pidOSX32 or pidOSX64)]
{$ENDIF}

  TOlfSelectDirectoryDialog = class(TFMXObject)
  private
    FDirectory: string;
    FText: string;
    FRoot: string;
    procedure SetDirectory(const Value: string);
    procedure SetRoot(const Value: string);
    procedure SetText(const Value: string);
  protected
  public
    function Execute: boolean;
    constructor Create(AOwner: TComponent); override;
  published
    /// <summary>
    /// Text used as the dialog box title.
    /// </summary>
    property Text: string read FText write SetText;
    /// <summary>
    /// Root directory to filter the selection (can be empty)
    /// </summary>
    property Root: string read FRoot write SetRoot;
    /// <summary>
    /// Initial directory in input. Selected directory in output if the user confirm the selection.
    /// If nothing is selected, the output directory is the same as input directory.
    /// </summary>
    property Directory: string read FDirectory write SetDirectory;
  end;

procedure Register;

implementation

Uses
  FMX.Dialogs;

procedure Register;
begin
  RegisterComponents('OlfSoftware', [TOlfSelectDirectoryDialog]);
end;

{ TOlfSelectDirectoryDialog }

constructor TOlfSelectDirectoryDialog.Create(AOwner: TComponent);
begin
  inherited;
  FDirectory := '';
  FText := '';
  FRoot := '';
end;

function TOlfSelectDirectoryDialog.Execute: boolean;
var
  LDir: String;
begin
  LDir := FDirectory;
  result := SelectDirectory(FText, FRoot, LDir);
  if result then
    FDirectory := LDir;
end;

procedure TOlfSelectDirectoryDialog.SetDirectory(const Value: string);
begin
  FDirectory := Value;
end;

procedure TOlfSelectDirectoryDialog.SetRoot(const Value: string);
begin
  FRoot := Value;
end;

procedure TOlfSelectDirectoryDialog.SetText(const Value: string);
begin
  FText := Value;
end;

initialization

StartClassGroup(TFMXObject);
ActivateClassGroup(TFMXObject);
GroupDescendentsWith(TOlfSelectDirectoryDialog, TFMXObject);

end.
