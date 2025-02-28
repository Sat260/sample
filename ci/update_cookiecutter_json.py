"""Script to update ``cookiecutter.json`` with the user entered project info."""

from __future__ import annotations

import argparse
import json
from pathlib import Path

ARGS = {
    'project-name': 'The project name',
    'project-description': 'The project short description',
    'owner-name': 'The full name of the repository owner',
    'owner-email': (
        'The email address of the repository owner (must be a valid Medtronic email'
        ' address)'
    ),
    'owner-username': 'The GitHub username of the repository owner',
    'coverage_badge_gist_id': 'The id of the coverage badge gist',
}


def update_cookiecutter_json(
    project_name: str | None,
    project_description: str | None,
    owner_name: str | None,
    owner_email: str | None,
    owner_username: str | None,
    coverage_badge_gist_id: str | None,
) -> None:
    """Update the ``cookiecutter.json`` file.

    This function updates ``cookiecutter.json`` with the provided ``project_name`` and
    ``project_description``.

    Parameters
    ----------
    project_name : str | None
        Name of the GitHub project
    project_description : str | None
        Short description of the GitHub project
    owner_name : str | None
        Full name of the repository owner
    owner_email : str | None
        Email address of the repository owner (must be a valid Medtronic email)
    owner_username : str | None
        GitHub user name of the repository owner
    coverage_badge_gist_id : str | None
    """
    with Path('../cookiecutter.json').open(encoding='utf-8') as file:
        data = json.load(file)

    if project_name:
        data['project_name'] = project_name

    if project_description:
        data['project_short_description'] = project_description

    if owner_name:
        data['full_name'] = owner_name

    if owner_email:
        data['email'] = owner_email

    if owner_username:
        data['github_username'] = owner_username

    if coverage_badge_gist_id:
        data['coverage_badge_gist_id'] = coverage_badge_gist_id

    with Path('../cookiecutter.json').open(mode='w', encoding='utf-8') as file:
        json.dump(data, file, indent=2)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(
        description='Updates the `cookiecutter.json` file with provided user values when'
        'a new repo is created from the GitHub template.',
    )

    for arg, description in ARGS.items():
        parser.add_argument(
            f'--{arg}',
            type=str,
            help=description,
            required=False,
        )

    args = parser.parse_args()

    update_cookiecutter_json(
        args.project_name,
        args.project_description,
        args.owner_name,
        args.owner_email,
        args.owner_username,
        None,
    )
