load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

cc_library_headers = """cc_library(
    name = "headers",
    hdrs = glob(["**"]),
    includes = ["."],
    visibility = ["//visibility:public"],
)
"""

cc_library_sources = """filegroup(
     name = "sources",
     srcs = glob(["**"]),
     visibility = ["//visibility:public"],
 )
 """

def __setup_bzlmodrio_apriltaglib_cpp_dependencies(mctx):
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/apriltaglib/3.3.0-2/apriltaglib-3.3.0-2-headers.zip",
        sha256 = "433cbc73fccbaa4526fa65b78604e5b8c44db344521d12fc4935f5fe41f526bd",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/apriltaglib/3.3.0-2/apriltaglib-3.3.0-2-sources.zip",
        sha256 = "08237d8dce1b7d8881b94057f146eca9e4df3e83cc8e67e649a5830c244cacc5",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/apriltaglib/3.3.0-2/apriltaglib-3.3.0-2-linuxarm32static.zip",
        sha256 = "da46e70024bef0719dfef1ee82cfe37d02aa414c1bbacc91549743a63e25b19f",
        build_file = "@bzlmodrio-apriltaglib//private/cpp/apriltaglib:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/apriltaglib/3.3.0-2/apriltaglib-3.3.0-2-linuxarm64static.zip",
        sha256 = "be1723aa4eb1f5183bce7f1340acef6ca3cabf1a220cbc69e68252c659d586c9",
        build_file = "@bzlmodrio-apriltaglib//private/cpp/apriltaglib:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/apriltaglib/3.3.0-2/apriltaglib-3.3.0-2-linuxathenastatic.zip",
        sha256 = "7ec7b7b416854276f027d671a11fd40b80d3015a10d356e7b9ed6f207d5e5c7e",
        build_file = "@bzlmodrio-apriltaglib//private/cpp/apriltaglib:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/apriltaglib/3.3.0-2/apriltaglib-3.3.0-2-linuxx86-64static.zip",
        sha256 = "9bd65ce67adf2c548a629a89fbc5d2013062c99114f581e158dd9cc8622ad90d",
        build_file = "@bzlmodrio-apriltaglib//private/cpp/apriltaglib:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/apriltaglib/3.3.0-2/apriltaglib-3.3.0-2-osxuniversalstatic.zip",
        sha256 = "bc25b7626f58c29d27e12d29e41ba7495c7933f4947cf487682abc0db56396a3",
        build_file = "@bzlmodrio-apriltaglib//private/cpp/apriltaglib:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/apriltaglib/3.3.0-2/apriltaglib-3.3.0-2-windowsx86-64static.zip",
        sha256 = "9a4fa7f5a38c224f511d2d6bd7af7ad85a0ec272208939f84afe42ee7c34cada",
        build_file = "@bzlmodrio-apriltaglib//private/cpp/apriltaglib:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_windowsx86static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/apriltaglib/3.3.0-2/apriltaglib-3.3.0-2-windowsx86static.zip",
        sha256 = "22f9f5af427d98205b281693ed68f1b99fa20d207d5f9f3cc761c4e1e16e09d6",
        build_file = "@bzlmodrio-apriltaglib//private/cpp/apriltaglib:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/apriltaglib/3.3.0-2/apriltaglib-3.3.0-2-windowsarm64static.zip",
        sha256 = "f0a6b82e3c6a911680192d5509fa5c7eb6cf2ccfa38494d070e966b900b04a44",
        build_file = "@bzlmodrio-apriltaglib//private/cpp/apriltaglib:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/apriltaglib/3.3.0-2/apriltaglib-3.3.0-2-linuxarm32staticdebug.zip",
        sha256 = "f01891d873b75c9e65dff53dfc64c28fde710cd4ca4f4d8359ead8ca0604f512",
        build_file = "@bzlmodrio-apriltaglib//private/cpp/apriltaglib:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/apriltaglib/3.3.0-2/apriltaglib-3.3.0-2-linuxarm64staticdebug.zip",
        sha256 = "1252437e488b00a069a823e43fa4f07168999cba836588a28eef87043f344cf0",
        build_file = "@bzlmodrio-apriltaglib//private/cpp/apriltaglib:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/apriltaglib/3.3.0-2/apriltaglib-3.3.0-2-linuxathenastaticdebug.zip",
        sha256 = "45d5dbb7dc3e2753b4cc2925c278b34dd69f5e520b1a4b4e9d99b0381889f46d",
        build_file = "@bzlmodrio-apriltaglib//private/cpp/apriltaglib:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/apriltaglib/3.3.0-2/apriltaglib-3.3.0-2-linuxx86-64staticdebug.zip",
        sha256 = "686c4cbe0896e8fa37871e776b640872a76170d8a64c0554a81574528769f900",
        build_file = "@bzlmodrio-apriltaglib//private/cpp/apriltaglib:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/apriltaglib/3.3.0-2/apriltaglib-3.3.0-2-osxuniversalstaticdebug.zip",
        sha256 = "8d10e39b7ebfcd0c647cb5a80add107c88fceefca2db227bec58d037b2587402",
        build_file = "@bzlmodrio-apriltaglib//private/cpp/apriltaglib:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/apriltaglib/3.3.0-2/apriltaglib-3.3.0-2-windowsx86-64staticdebug.zip",
        sha256 = "b3af9d9a59d8251e4eb21adfd5098acb428e7998aaa55df66d37cb36d68089de",
        build_file = "@bzlmodrio-apriltaglib//private/cpp/apriltaglib:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_windowsx86staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/apriltaglib/3.3.0-2/apriltaglib-3.3.0-2-windowsx86staticdebug.zip",
        sha256 = "e0f6775790e859193dae25145acabbb13da6b9bdc2999e64b24b60720df1de3e",
        build_file = "@bzlmodrio-apriltaglib//private/cpp/apriltaglib:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/apriltaglib/3.3.0-2/apriltaglib-3.3.0-2-windowsarm64staticdebug.zip",
        sha256 = "ad1b2abc4cff5d5bba9612ff4e805a85b6177ca28daa800ad006951511990183",
        build_file = "@bzlmodrio-apriltaglib//private/cpp/apriltaglib:static.BUILD.bazel",
    )

def setup_legacy_bzlmodrio_apriltaglib_cpp_dependencies():
    __setup_bzlmodrio_apriltaglib_cpp_dependencies(None)

setup_bzlmodrio_apriltaglib_cpp_dependencies = module_extension(
    __setup_bzlmodrio_apriltaglib_cpp_dependencies,
)
