/// <summary>
/// ***************************************************************************
///
/// Delphi FMX Extend Library
///
/// Copyright 2021-2024 Patrick Prémartin under AGPL 3.0 license.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
/// THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
/// FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
/// DEALINGS IN THE SOFTWARE.
///
/// ***************************************************************************
///
/// Set of FireMonkey components for Delphi multi-platform projects.
///
/// ***************************************************************************
///
/// Author(s) :
///      Patrick PREMARTIN
///
/// Site :
///      https://fmxextend.developpeur-pascal.fr/
///
/// Project site :
///      https://github.com/DeveloppeurPascal/Delphi-FMXExtend-Library
///
/// ***************************************************************************
/// File last update : 28/05/2024 12:18:50
/// Signature : 483e026f64f163cdbc72a40b823b2df5417dc077
/// ***************************************************************************
/// </summary>

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
