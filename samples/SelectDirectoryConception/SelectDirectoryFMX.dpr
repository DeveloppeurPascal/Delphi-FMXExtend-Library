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
  File last update : 2025-05-25T16:24:08.000+02:00
  Signature : cb5d23f1145ecf50d44156c27318884dc0c9f91a
  ***************************************************************************
*)

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
