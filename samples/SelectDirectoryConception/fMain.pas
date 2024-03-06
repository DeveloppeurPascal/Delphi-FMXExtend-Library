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
  FMX.Memo.Types,
  FMX.ScrollBox,
  FMX.Memo,
  FMX.Controls.Presentation,
  FMX.StdCtrls;

type
  TForm2 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}

uses
  System.IOUTils,
  Olf.FMX.SelectDirectory;

procedure TForm2.Button1Click(Sender: TObject);
var
  fs: TOlfSelectDirectoryDialog;
begin
  fs := TOlfSelectDirectoryDialog.Create(self);
  try
    fs.Text := 'Choisir un dossier';
    fs.root := '';
    fs.Directory := tpath.GetDocumentsPath;
    Memo1.lines.add('Current directory is "' + fs.Directory + '"');
    if fs.Execute then
      Memo1.lines.add('Selected folder: ' + fs.Directory)
    else
      Memo1.lines.add('No folder selected. Current directory is "' +
        fs.Directory + '"');
  finally
    fs.free;
  end;
end;

end.
