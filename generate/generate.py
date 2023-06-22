import os
import argparse
from get_apriltaglib_dependencies import get_apriltaglib_dependencies

from bazelrio_gentool.generate_group import generate_group
from bazelrio_gentool.generate_module_project_files import (
    generate_module_project_files,
    create_default_mandatory_settings,
)
from bazelrio_gentool.cli import add_generic_cli, GenericCliArgs
from bazelrio_gentool.clean_existing_version import clean_existing_version


def main():
    SCRIPT_DIR = os.environ["BUILD_WORKSPACE_DIRECTORY"]
    REPO_DIR = os.path.join(SCRIPT_DIR, "..")
    output_dir = os.path.join(REPO_DIR, "libraries")

    group = get_apriltaglib_dependencies()

    parser = argparse.ArgumentParser()
    add_generic_cli(parser)
    args = parser.parse_args()

    mandatory_dependencies = create_default_mandatory_settings(GenericCliArgs(args))

    clean_existing_version(REPO_DIR)
    generate_module_project_files(
        REPO_DIR,
        group,
        mandatory_dependencies,
        test_macos=False,
        include_windows_arm_compiler=True,
    )
    generate_group(output_dir, group, force_tests=True)


if __name__ == "__main__":
    """
    bazel run //:generate && buildifier --lint=fix -r ..
    """
    main()
