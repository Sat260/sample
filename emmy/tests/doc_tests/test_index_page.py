"""Tests the documentation home page."""

from __future__ import annotations

import typing

import pytest

if typing.TYPE_CHECKING:
    from bs4 import BeautifulSoup

pytestmark = pytest.mark.sphinx('html')


@pytest.mark.parametrize(
    'page',
    [
        'index.html',
    ],
    indirect=True,
)
def test_index(page: BeautifulSoup) -> None:
    """Test the index page of the documentation.

    Parameters
    ----------
    page : BeautifulSoup
        (fixture) A scraper for page 'page'
    """
    # Arrange
    expected_title = 'Emmy'

    # Act
    return_value: str = page.find('title').contents[0].strip()  # type: ignore[union-attr]

    # Assert
    assert return_value.startswith(expected_title)
