"""Run the complete submission verification gate."""

from pathlib import Path
import sys


REPOSITORY_ROOT = Path(__file__).resolve().parent.parent
if str(REPOSITORY_ROOT) not in sys.path:
    sys.path.insert(0, str(REPOSITORY_ROOT))

from work.verification.verify_submission import main


if __name__ == "__main__":
    main()
