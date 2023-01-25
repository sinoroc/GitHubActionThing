#

"""Meta information."""

import importlib.metadata

PROJECT_NAME = 'GitHubActionThing'

_DISTRIBUTION_METADATA = importlib.metadata.metadata(PROJECT_NAME)

VERSION = _DISTRIBUTION_METADATA['Version']

# EOF
