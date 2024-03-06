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
  [ComponentPlatformsAttribute(pfidWindows or pfidOSX)]
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
