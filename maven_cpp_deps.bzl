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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/apriltaglib/3.3.0-1/apriltaglib-3.3.0-1-headers.zip",
        sha256 = "fa6ce64431e2ebde73e5d0b45ec96aac1b0fc9516c88fa73ce29368522483642",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/apriltaglib/3.3.0-1/apriltaglib-3.3.0-1-sources.zip",
        sha256 = "3ab30ec8ec65cb77b632f4dd0a9f4b041e32c4a55ee1891673dea82229012b19",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/apriltaglib/3.3.0-1/apriltaglib-3.3.0-1-linuxarm32static.zip",
        sha256 = "6094b468a03a54c1d4f6acea7cc9f85d926eaded108faff5ed48cf8037dfa92d",
        build_file = "@bzlmodrio-apriltaglib//private/cpp/apriltaglib:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/apriltaglib/3.3.0-1/apriltaglib-3.3.0-1-linuxarm64static.zip",
        sha256 = "faa53f6e6bcfa6a6ee24fc09f90156045514935fad36506c99a1611be2e9c5aa",
        build_file = "@bzlmodrio-apriltaglib//private/cpp/apriltaglib:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/apriltaglib/3.3.0-1/apriltaglib-3.3.0-1-linuxathenastatic.zip",
        sha256 = "b81d7e7ee5b78aa27f87af68574624fc53a519bb7f397b8f592e41a6ac75e188",
        build_file = "@bzlmodrio-apriltaglib//private/cpp/apriltaglib:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/apriltaglib/3.3.0-1/apriltaglib-3.3.0-1-linuxx86-64static.zip",
        sha256 = "9fb31ad945951f08fc5395562b6a5a5118df3cc8f0063d250d80e6a9f4d77fc7",
        build_file = "@bzlmodrio-apriltaglib//private/cpp/apriltaglib:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/apriltaglib/3.3.0-1/apriltaglib-3.3.0-1-osxuniversalstatic.zip",
        sha256 = "4fbd4bb2325ab96d69d15d27f1a2afafaa442f4f538952f4ea928921f8accc20",
        build_file = "@bzlmodrio-apriltaglib//private/cpp/apriltaglib:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/apriltaglib/3.3.0-1/apriltaglib-3.3.0-1-windowsx86-64static.zip",
        sha256 = "62cd811a7e155f127c32951396d3c84ccd9ce1b440ee0097ef26d5e8cb813d3d",
        build_file = "@bzlmodrio-apriltaglib//private/cpp/apriltaglib:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_windowsx86static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/apriltaglib/3.3.0-1/apriltaglib-3.3.0-1-windowsx86static.zip",
        sha256 = "513b77873f2d9795166a327090a22cff49dd0bc5b4a28312b9827c67897f4342",
        build_file = "@bzlmodrio-apriltaglib//private/cpp/apriltaglib:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/apriltaglib/3.3.0-1/apriltaglib-3.3.0-1-windowsarm64static.zip",
        sha256 = "adef7e48ff366b2e909666811e1b58706b00de38b103aafd12e154dac88cfc3a",
        build_file = "@bzlmodrio-apriltaglib//private/cpp/apriltaglib:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/apriltaglib/3.3.0-1/apriltaglib-3.3.0-1-linuxarm32staticdebug.zip",
        sha256 = "4f981e6d7f7c3ec937bf837c2efbfacaad916bc352057bd85e8901ca3cc7ce8a",
        build_file = "@bzlmodrio-apriltaglib//private/cpp/apriltaglib:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/apriltaglib/3.3.0-1/apriltaglib-3.3.0-1-linuxarm64staticdebug.zip",
        sha256 = "255c3e09b0b9874ce576797c7e9bdbb64f0477d9409e24b9f385131c2d051b42",
        build_file = "@bzlmodrio-apriltaglib//private/cpp/apriltaglib:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/apriltaglib/3.3.0-1/apriltaglib-3.3.0-1-linuxathenastaticdebug.zip",
        sha256 = "800e7be48f9983a5663eaaedda12767b69b526cee52e2fc1becf3ee031919797",
        build_file = "@bzlmodrio-apriltaglib//private/cpp/apriltaglib:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/apriltaglib/3.3.0-1/apriltaglib-3.3.0-1-linuxx86-64staticdebug.zip",
        sha256 = "60faa3cc6455469bd13e0a916f128246c1f935ec356e4260e6a30fe9db1d96ba",
        build_file = "@bzlmodrio-apriltaglib//private/cpp/apriltaglib:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/apriltaglib/3.3.0-1/apriltaglib-3.3.0-1-osxuniversalstaticdebug.zip",
        sha256 = "484569b463fa2296cc1bdd378e186d3a670e65babe8785e9f8768268d785fa66",
        build_file = "@bzlmodrio-apriltaglib//private/cpp/apriltaglib:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/apriltaglib/3.3.0-1/apriltaglib-3.3.0-1-windowsx86-64staticdebug.zip",
        sha256 = "597bb048dfeb6f33cdc1b8be8f50d35085f33bb1e2a3d1cd4fbb237e6842f325",
        build_file = "@bzlmodrio-apriltaglib//private/cpp/apriltaglib:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_windowsx86staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/apriltaglib/3.3.0-1/apriltaglib-3.3.0-1-windowsx86staticdebug.zip",
        sha256 = "486403f48f96e9ae9349644cc36980ffc339c35d45b391925ee4bc1a767ca0bb",
        build_file = "@bzlmodrio-apriltaglib//private/cpp/apriltaglib:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/apriltaglib/3.3.0-1/apriltaglib-3.3.0-1-windowsarm64staticdebug.zip",
        sha256 = "13a5680fdcefffbd2f31fa24627147da0289366f7e973fd9b91e906ff7ee0ca2",
        build_file = "@bzlmodrio-apriltaglib//private/cpp/apriltaglib:static.BUILD.bazel",
    )

def setup_legacy_bzlmodrio_apriltaglib_cpp_dependencies():
    __setup_bzlmodrio_apriltaglib_cpp_dependencies(None)

setup_bzlmodrio_apriltaglib_cpp_dependencies = module_extension(
    __setup_bzlmodrio_apriltaglib_cpp_dependencies,
)
