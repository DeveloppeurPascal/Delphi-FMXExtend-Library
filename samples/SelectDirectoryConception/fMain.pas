(* C2PP
  ***************************************************************************

  Delphi FMX Extend Library

  Copyright 2021-2025 Patrick Prémartin under AGPL 3.0 license.

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
  Signature : 9352699a531fe774fa7c7dacf63eb4eca1440b4e
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
