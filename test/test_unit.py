#

"""Unit tests."""

import unittest

import githubactionthing


class TestProjectVersion(unittest.TestCase):
    """Project version string."""

    def test_project_has_version_string(self) -> None:
        """Project should have a vesion string."""
        self.assertIn('__version__', dir(githubactionthing))
        self.assertIsInstance(githubactionthing.__version__, str)


# EOF
