load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

filegroup_all = """filegroup(
     name = "all",
     srcs = glob(["**"]),
     visibility = ["//visibility:public"],
 )
 """

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

cc_library_static = """

cc_library(
    name = "static_libs",
    srcs = glob(["**/*.lib", "**/*.a"]),
    visibility = ["//visibility:public"],
)
"""

cc_library_shared = """
static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

cc_library(
    name = "static_libs",
    srcs = static_srcs,
    visibility = ["//visibility:public"],
)

cc_library(
    name = "shared_libs",
    srcs = shared_srcs,
    visibility = ["//visibility:public"],
    deps = [
        ":static_libs",
    ]
)

cc_library(
    name = "shared_jni_libs",
    srcs = shared_jni_srcs,
    visibility = ["//visibility:public"],
)
"""

def __setup_bzlmodrio_apriltaglib_cpp_dependencies(mctx):
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.2.0-3/apriltaglib-3.2.0-3-headers.zip",
        sha256 = "bf2f4196f6d2cb80de8259221b0977fe89143b86071d10c8e613a1d9da37ed82",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.2.0-3/apriltaglib-3.2.0-3-sources.zip",
        sha256 = "ff0a18d1d705034e8a09954d45d51e77e88a44537194389a9723a79d72c5d116",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.2.0-3/apriltaglib-3.2.0-3-linuxarm32static.zip",
        sha256 = "d1f85522bd671816de3edc952271b9f9fd4e295ecbf42b8e810bc527e829a33b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.2.0-3/apriltaglib-3.2.0-3-linuxarm64static.zip",
        sha256 = "663d89c5e1077ecd178ef3ac73fcab5a5dff3ed97dfc45f2e40b4649da3a460b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.2.0-3/apriltaglib-3.2.0-3-linuxathenastatic.zip",
        sha256 = "9fe441f9b0283ae6448cf6cd001ea8d57b85ecec6cc3be4c8b15efbe89725878",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.2.0-3/apriltaglib-3.2.0-3-linuxx86-64static.zip",
        sha256 = "2ba90e634b60ffcc0c2a8548e0d4e98060f59224523963fdd896b6ce9efad6c2",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.2.0-3/apriltaglib-3.2.0-3-osxuniversalstatic.zip",
        sha256 = "5816cab35c0f8b564f487aae43dbd037b36518db983d6f7f3a19de5ca744c42d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.2.0-3/apriltaglib-3.2.0-3-windowsx86-64static.zip",
        sha256 = "b6950ac078a87666225bb931554b04388f4c5cefe572bd90eeadb1a0ebf2d402",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_windowsx86static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.2.0-3/apriltaglib-3.2.0-3-windowsx86static.zip",
        sha256 = "54842fb2087ba0ec8780404368ccc1442fda14ca9d2c47128b56f3ffae37bff1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.2.0-3/apriltaglib-3.2.0-3-linuxarm32staticdebug.zip",
        sha256 = "d560b5dcf1cb649d1e55e41849ecb1ff1dc968185812d70c07b8eab5acef83e3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.2.0-3/apriltaglib-3.2.0-3-linuxarm64staticdebug.zip",
        sha256 = "00c61aafdc3d9e4a2de8400d4e1b601ba0da833bb99f5691071aa2f2633a3a5c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.2.0-3/apriltaglib-3.2.0-3-linuxathenastaticdebug.zip",
        sha256 = "5320a8b09a54a487ba9c6d5c7548d9cbc3d335a71ca219b9975ec8dec32f0096",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.2.0-3/apriltaglib-3.2.0-3-linuxx86-64staticdebug.zip",
        sha256 = "7d900cc825d1bd60c76b3e711137b943aa3b8fa98ab29fc45ebec159191d488a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.2.0-3/apriltaglib-3.2.0-3-osxuniversalstaticdebug.zip",
        sha256 = "8347799c7b1d6b4ebf0c19993f254b8fd54c4c4e4ec9be575a07387f92c52737",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.2.0-3/apriltaglib-3.2.0-3-windowsx86-64staticdebug.zip",
        sha256 = "9a6dda77b86a1aa6dd837171f09efb8bafb4d4f84c69a84c6378a194adf830df",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_windowsx86staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.2.0-3/apriltaglib-3.2.0-3-windowsx86staticdebug.zip",
        sha256 = "cbff1fde3dfb2a63dcbd48a5fecc1d9ba17f966003a7a85d561d88a0bc0bd792",
        build_file_content = cc_library_static,
    )

def setup_legacy_bzlmodrio_apriltaglib_cpp_dependencies():
    __setup_bzlmodrio_apriltaglib_cpp_dependencies(None)

setup_bzlmodrio_apriltaglib_cpp_dependencies = module_extension(
    __setup_bzlmodrio_apriltaglib_cpp_dependencies,
)
