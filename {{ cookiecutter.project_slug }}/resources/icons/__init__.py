"""Icons for template."""

from __future__ import annotations

from importlib.resources import path

with path('resources.icons', '__init__.py') as pkg_path:
    TEMPLATE_ICO = str(pkg_path.parent / 'template_16.ico')
