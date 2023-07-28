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
JNI_PATTERN=[
    "**/*jni.dll",
    "**/*jni.so*",
    "**/*jni.dylib",
    "**/*_java*.dll",
    "**/lib*_java*.dylib",
    "**/lib*_java*.so",
]

static_srcs = glob([
        "**/*.lib",
        "**/*.a"
    ],
    exclude=["**/*jni.lib"]
)
shared_srcs = glob([
        "**/*.dll",
        "**/*.so*",
        "**/*.dylib",
    ],
    exclude=JNI_PATTERN + ["**/*.so.debug"]
)
shared_jni_srcs = glob(JNI_PATTERN, exclude=["**/*.so.debug"])

filegroup(
    name = "static_libs",
    srcs = static_srcs,
    visibility = ["//visibility:public"],
)

filegroup(
    name = "shared_libs",
    srcs = shared_srcs,
    visibility = ["//visibility:public"],
)

filegroup(
    name = "shared_jni_libs",
    srcs = shared_jni_srcs,
    visibility = ["//visibility:public"],
)
"""

def __setup_bzlmodrio_apriltaglib_cpp_dependencies(mctx):
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.2.0-8/apriltaglib-3.2.0-8-headers.zip",
        sha256 = "e1d1a779a82aad41c422cd218021eaab8d7d6bbd55414a0a0137c2529c03a1fb",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.2.0-8/apriltaglib-3.2.0-8-sources.zip",
        sha256 = "d2ebc0c20ddb121fa795f49e57c5f58c6bbdae40068cd117960c7f091bbe073a",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.2.0-8/apriltaglib-3.2.0-8-linuxarm32static.zip",
        sha256 = "fb79473aaf2fef4cb8a915d4d0ec16768612f4b1b6cc6b7edc7a1035d6bb874f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.2.0-8/apriltaglib-3.2.0-8-linuxarm64static.zip",
        sha256 = "ec1c7818a74a559ea066e1bf34c5fd58fdbfa88370f929dfa080a3c958e76a70",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.2.0-8/apriltaglib-3.2.0-8-linuxathenastatic.zip",
        sha256 = "1d1be86bf79a002dcaf17d682b3865f2b2099979568a1d8389f1113810906428",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.2.0-8/apriltaglib-3.2.0-8-linuxx86-64static.zip",
        sha256 = "ff093c7b601917a7921dca0110e955f8218d321b19d2600e7b30fcfd923bc68a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.2.0-8/apriltaglib-3.2.0-8-osxuniversalstatic.zip",
        sha256 = "0c336595917390287e83bec407d76e1d0eadcb2219fe47428fd6e9bc35c38b96",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.2.0-8/apriltaglib-3.2.0-8-windowsx86-64static.zip",
        sha256 = "39ae25f280d7d2927aed1a2c33eada6ef6a8e36bec02e446facf8a823f56a4de",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_windowsx86static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.2.0-8/apriltaglib-3.2.0-8-windowsx86static.zip",
        sha256 = "2532b690df25fc053fce73eca612be45c4357c8039b5b01eca75a45383d0e316",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.2.0-8/apriltaglib-3.2.0-8-windowsarm64static.zip",
        sha256 = "be4cb0806ed0db9877db861131b9738c4e2a17d2016be562487791e91f344f1a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.2.0-8/apriltaglib-3.2.0-8-linuxarm32staticdebug.zip",
        sha256 = "9752e1f818622ed7424a77ea5854d1155cd62b096e95d5a0640c34cb2d06ede4",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.2.0-8/apriltaglib-3.2.0-8-linuxarm64staticdebug.zip",
        sha256 = "5bfc2c7a4d8e5dc5e9653d7d97155bfa976de99899002578b3151393560531ce",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.2.0-8/apriltaglib-3.2.0-8-linuxathenastaticdebug.zip",
        sha256 = "fceb0a4998164b11deeba2cae1afcead2eca21f66e8c72e076d128b8444c4b30",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.2.0-8/apriltaglib-3.2.0-8-linuxx86-64staticdebug.zip",
        sha256 = "8924b4d43389eafa7e5dd9aadcb8e05680c55a5c01a254c004c25420042b3862",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.2.0-8/apriltaglib-3.2.0-8-osxuniversalstaticdebug.zip",
        sha256 = "84ba61bf8eee7fa22cb3492f4eda04baad58c5fc0ffa8e675d4eb39551a12277",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.2.0-8/apriltaglib-3.2.0-8-windowsx86-64staticdebug.zip",
        sha256 = "c3e20813bc3de13e2f3ef625a6949b55dcedac72633c4898c0090d39a19e27dc",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_windowsx86staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.2.0-8/apriltaglib-3.2.0-8-windowsx86staticdebug.zip",
        sha256 = "244e10dbad1070737222dcc925299aa441d5bc3870a673f24d3bd5c882957fcc",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.2.0-8/apriltaglib-3.2.0-8-windowsarm64staticdebug.zip",
        sha256 = "9d9f2b68a4766ec08184c3d66797ecd213de02911288b5c0e74ea0334fa1ab14",
        build_file_content = cc_library_static,
    )

def setup_legacy_bzlmodrio_apriltaglib_cpp_dependencies():
    __setup_bzlmodrio_apriltaglib_cpp_dependencies(None)

setup_bzlmodrio_apriltaglib_cpp_dependencies = module_extension(
    __setup_bzlmodrio_apriltaglib_cpp_dependencies,
)
