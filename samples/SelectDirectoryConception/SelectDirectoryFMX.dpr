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
/// Signature : 3c117c761e8896896abcd7975286ad3f131cd866
/// ***************************************************************************
/// </summary>

program SelectDirectoryFMX;

uses
  System.StartUpCopy,
  FMX.Forms,
  fMain in 'fMain.pas' {Form2},
  Olf.FMX.SelectDirectory in '..\..\src\Olf.FMX.SelectDirectory.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
