#!/usr/bin/env python

"""Setup."""

import pathlib

import setuptools  # type: ignore[import]


def _get_version() -> str:
    file_name = 'CHANGELOG.rst'
    line_number = 5
    here_path = pathlib.Path(__file__).resolve().parent
    with here_path.joinpath(file_name).open(encoding='utf-8') as file_:
        changelog = file_.read()
    version = changelog.splitlines()[line_number]
    return version


def _main() -> None:
    setuptools.setup(
        # see 'setup.cfg'
        version=_get_version(),
    )


if __name__ == '__main__':
    _main()

# EOF
