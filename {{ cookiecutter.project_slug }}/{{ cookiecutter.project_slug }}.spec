# -*- mode: python ; coding: utf-8 -*-

block_cipher = None

a = Analysis(
    ['{{cookiecutter.project_slug}}\\__main__.py'],
    pathex=[],
    binaries=[
        ('.venv/Lib/site-packages/pyembree/rtcore_scene.cp38-win_amd64.pyd', 'pyembree'),
        ('.venv/Lib/site-packages/pyembree/rtcore.cp38-win_amd64.pyd', 'pyembree'),
        ('.venv/Lib/site-packages/pyembree.libs/.load-order-pyembree-0.2.11', 'pyembree.libs'),
        ('.venv/Lib/site-packages/pyembree.libs/embree.dll', 'pyembree.libs'),
        ('.venv/Lib/site-packages/pyembree.libs/tbb.dll', 'pyembree.libs'),
        ('.venv/Lib/site-packages/pyembree.libs/msvcp120.dll', 'pyembree.libs'),
        ('.venv/Lib/site-packages/pyembree.libs/msvcr120.dll', 'pyembree.libs'),
    ],
    data=[
        ('docs', 'docs'),
        ('resources', 'resources'),
    ],
    hiddenimports=[
        'vtkmodules',
        'vtkmodules.all',
        'vtkmodules.numpy_interface.dataset_adapter',
        'vtkmodules.qt.QVTKRenderWindowInteractor',
        'vtkmodules.util',
        'vtkmodules.util.numpy_support',
        'vtkmodules.vtkFiltersGeneral',
    ],
    hookspath=[],
    hooksconfig={},
    runtime_hooks=[],
    excludes=[],
    win_no_prefer_redirects=False,
    win_private_assemblies=False,
    cipher=block_cipher,
    noarchive=False,
)
pyz = PYZ(a.pure, a.zipped_data, cipher=block_cipher)

exe = EXE(
    pyz,
    a.scripts,
    [],
    exclude_binaries=True,
    name='{{cookiecutter.project_slug}}',
    debug=False,
    bootloader_ignore_signals=False,
    strip=False,
    upx=True,
    console=False,
    disable_windowed_traceback=False,
    argv_emulation=False,
    target_arch=None,
    codesign_identity=None,
    entitlements_file=None,
    icon='resources/icons/{{cookiecutter.project_slug}}_16.ico',
)
coll = COLLECT(
    exe,
    a.binaries,
    a.zipfiles,
    a.data,
    strip=False,
    upx=True,
    upx_exclude=[],
    name='{{cookiecutter.project_slug}}',
    icon='resources/icons/{{cookiecutter.project_slug}}_16.ico',
)
