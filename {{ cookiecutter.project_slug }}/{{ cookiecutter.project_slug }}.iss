; -- {{cookiecutter.project_slug}}.iss --
; Inno Setup installer script for {{cookiecutter.project_slug}}

#define AppName "{{cookiecutter.project_slug}}"
#define AppVersion "0.1.0"
#define AppPublisher "Medtronic"
#define AppExeName "{{cookiecutter.project_slug}}.exe"
#define AppExt ".tmplt"
#define AppFilename "{{ cookiecutter.project_slug }}ProgramFile.tmplt"
; CI workflow `release.yml` autogenerates the version for each installer created
#define PythonVersion "Version"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; CI workflow `release.yml` autogenerates the GUID for each installer created
AppId={{ '{{xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx}' }}
AppName={{ '{#AppName}' }}
AppVersion={{ '{#AppVersion}' }}
AppPublisher={{ '{#AppPublisher}' }}
DefaultDirName={{ '{commonpf}\{#AppName}' }}
DisableProgramGroupPage=yes
LicenseFile={{ '{#SourcePath}' }}\LICENSE

; NOTE: Uncomment the following line to run in non administrative install mode
; (i.e. install for current user only.)
;PrivilegesRequired=lowest
OutputDir=dist
OutputBaseFilename={{cookiecutter.project_slug}}-{{ '{#AppVersion}-python{#PythonVersion}' }}-setup
SetupIconFile={{ '{#SourcePath}' }}\resources\icons\{{cookiecutter.project_slug}}_16.ico
UninstallDisplayIcon={{ '{#SourcePath}' }}\resources\icons\{{cookiecutter.project_slug}}_16.ico
Compression=lzma2
SolidCompression=yes
WizardStyle=modern
; Windows 10 20H2
MinVersion=10.0.19042
ChangesAssociations=yes

[Registry]
Root: HKA; Subkey: "Software\Classes\{{ '{#AppExt}' }}\OpenWithProgids"; ValueType: string; ValueName: "{{ '{#AppFileName}' }}"; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\{{ '{#AppFileName}' }}"; ValueType: string; ValueName: ""; ValueData: "{{cookiecutter.project_slug}} File"; Flags: uninsdeletekey
Root: HKA; Subkey: "Software\Classes\{{ '{#AppFileName}' }}\DefaultIcon"; ValueType: string; ValueName: ""; ValueData: "{{ '{app}\{#AppExeName}' }},0"
Root: HKA; Subkey: "Software\Classes\{{ '{#AppFileName}' }}\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{{ '{app}\{#AppExeName}' }}"" ""%1"""
Root: HKA; Subkey: "Software\Classes\Applications\{{ '{#AppExeName}' }}\SupportedTypes"; ValueType: string; ValueName: "{{ '{#AppExt}' }}"; ValueData: ""

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{{ '{cm:CreateDesktopIcon}' }}"; GroupDescription: "{{ '{cm:AdditionalIcons}' }}"; Flags: unchecked

[Files]
; NOTE: Don't use "Flags: ignoreversion" on any shared system files
Source: "{{ '{#SourcePath}' }}\dist\{{cookiecutter.project_slug}}\{{ '{#AppExeName}' }}"; DestDir: "{{ '{app}' }}"; Flags: ignoreversion
Source: "{{ '{#SourcePath}' }}\dist\{{cookiecutter.project_slug}}\*"; DestDir: "{{ '{app}' }}"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
Name: "{{ '{autoprograms}\{#AppName}' }}"; Filename: "{{ '{app}\{#AppExeName}' }}"
Name: "{{ '{autodesktop}\{#AppName}' }}"; Filename: "{{ '{app}\{#AppExeName}' }}"; Tasks: desktopicon

[Run]
{% raw %}
Filename: "{app}\{#AppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(AppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent
{% endraw %}
