; -- emmy.iss --
; emmy Inno Setup installer script

#define AppName "Emmy"
#define AppVersion "0.0.0"
#define AppPublisher "Adam Hendry"
#define AppExeName "emmy.exe"
#define AppExt ".tmplt"
#define AppFilename "EmmyProgramFile.tmplt"
#define PythonVerion %PLACEHOLDER%

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{D3171320-3566-47AF-BE85-1C527BB834D8}
AppName={#AppName}
AppVersion={#AppVersion}
AppPublisher={#AppPublisher}
DefaultDirName={commonpf}\{#AppName}
DisableProgramGroupPage=yes
LicenseFile={#SourcePath}\LICENSE
; NOTE: Uncomment the following line to run in non administrative install mode
; (i.e. install for current user only.)
;PrivilegesRequired=lowest
OutputDir=dist
OutputBaseFilename=emmy-{#AppVersion}-python{#PythonVersion}-setup
SetupIconFile={#SourcePath}\resources\icons\emmy_16.ico
UninstallDisplayIcon={#SourcePath}\resources\icons\emmy_16.ico
Compression=lzma2
SolidCompression=yes
WizardStyle=modern
; Windows 10 20H2
MinVersion=10.0.19042
ChangesAssociations=yes

[Registry]
Root: HKA; Subkey: "Software\Classes\{#AppExt}\OpenWithProgids"; ValueType: string; ValueName: "{#AppFileName}"; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\{#AppFileName}"; ValueType: string; ValueName: ""; ValueData: "emmy File"; Flags: uninsdeletekey
Root: HKA; Subkey: "Software\Classes\{#AppFileName}\DefaultIcon"; ValueType: string; ValueName: ""; ValueData: "{app}\{#AppExeName},0"
Root: HKA; Subkey: "Software\Classes\{#AppFileName}\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\{#AppExeName}"" ""%1"""
Root: HKA; Subkey: "Software\Classes\Applications\{#AppExeName}\SupportedTypes"; ValueType: string; ValueName: "{#AppExt}"; ValueData: ""

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
; NOTE: Don't use "Flags: ignoreversion" on any shared system files
Source: "{#SourcePath}dist\emmy\{#AppExeName}"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#SourcePath}\dist\emmy\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
Name: "{autoprograms}\{#AppName}"; Filename: "{app}\{#AppExeName}"
Name: "{autodesktop}\{#AppName}"; Filename: "{app}\{#AppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#AppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(AppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

