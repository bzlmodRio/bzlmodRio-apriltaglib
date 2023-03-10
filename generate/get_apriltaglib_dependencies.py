import sys
import os

from bazelrio_gentool.deps.dependency_container import DependencyContainer


def _default_native_static_platforms():
    platforms = [
        "linuxarm32",
        "linuxarm64",
        "linuxathena",
        "linuxx86-64",
        "osxuniversal",
        "windowsx86-64",
        "windowsx86",
    ]
    return [x + "static" for x in platforms] + [x + "staticdebug" for x in platforms]


def get_apriltaglib_dependencies():
    year = "2023"
    version = "3.2.0-3"

    group_id = f"edu.wpi.first.thirdparty.frc{year}"

    group = DependencyContainer(
        "bzlmodrio-apriltaglib", version, year, "https://frcmaven.wpi.edu/release"
    )
    group.create_cc_dependency(
        f"apriltaglib",
        parent_folder="apriltaglib",
        group_id=group_id,
        headers="headers",
        sources="sources",
        resources=_default_native_static_platforms(),
        has_jni=False,
    )

    return group


if __name__ == "__main__":
    get_opencv_dependencies()
