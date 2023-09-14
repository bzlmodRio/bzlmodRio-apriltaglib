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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.3.0-1/apriltaglib-3.3.0-1-headers.zip",
        sha256 = "b62f857f96c523d2cb8e1d7868df470d3b31890e3579ab3299efe37bc931c21e",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.3.0-1/apriltaglib-3.3.0-1-sources.zip",
        sha256 = "d0fa2eab79189a7810252ac2d17a9136ac6dfccbccbf6f5e65a69bbcc6d5b7d9",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.3.0-1/apriltaglib-3.3.0-1-linuxarm32static.zip",
        sha256 = "57da65ca503c67b334843f1be2e2eb872742b842710588737a1dd2243ad7f4df",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.3.0-1/apriltaglib-3.3.0-1-linuxarm64static.zip",
        sha256 = "27c4892f2fdaf86c74a6f12f7444ba47d58b44f0499093c5e6a4f4a891416289",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.3.0-1/apriltaglib-3.3.0-1-linuxathenastatic.zip",
        sha256 = "9cbe44ae054d6a05a1527299958848d05340bde5f1c0e55bd494c30429deab73",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.3.0-1/apriltaglib-3.3.0-1-linuxx86-64static.zip",
        sha256 = "b90e1a5c67240327a6d5116c023096af5964af3592204e53b5ce35f04b959466",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.3.0-1/apriltaglib-3.3.0-1-osxuniversalstatic.zip",
        sha256 = "9a891fbe2f2304da98845653c60808026ee31dcbf8e7b345bda586948eb69719",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.3.0-1/apriltaglib-3.3.0-1-windowsx86-64static.zip",
        sha256 = "28d46cb07d00b4c9317cc7922f401a8d45bdf9883847a5436c10841326e772c4",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_windowsx86static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.3.0-1/apriltaglib-3.3.0-1-windowsx86static.zip",
        sha256 = "7e7d086c8f0d017755ff5a3b5240e492bf08afcc40ff7d833d4277c1af1761bc",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.3.0-1/apriltaglib-3.3.0-1-windowsarm64static.zip",
        sha256 = "ffed4aa53295b300020a4ce1360bd8f68f461386fb11cca5840126f81950c585",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.3.0-1/apriltaglib-3.3.0-1-linuxarm32staticdebug.zip",
        sha256 = "7c90d26cb259f99b0cbf3b34eb7633b78e46f33f0d986bbe56b5157c4ae390e2",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.3.0-1/apriltaglib-3.3.0-1-linuxarm64staticdebug.zip",
        sha256 = "e9d54be91c4c05fe02e5333864bd7654c951e26c7e9422b2a5413e5e0297774d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.3.0-1/apriltaglib-3.3.0-1-linuxathenastaticdebug.zip",
        sha256 = "3c56a57cd5ba991757cd71fddca3f2c927a5350d592e5a639a00c9e933def474",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.3.0-1/apriltaglib-3.3.0-1-linuxx86-64staticdebug.zip",
        sha256 = "af15d382160fefd9cb988b8e642c13f8f9a29032d2500dd885574c9725d33f96",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.3.0-1/apriltaglib-3.3.0-1-osxuniversalstaticdebug.zip",
        sha256 = "8f288e81ff04656f12a8e6a2f3b29d19950e17e944e892e517c050f2f2b4c656",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.3.0-1/apriltaglib-3.3.0-1-windowsx86-64staticdebug.zip",
        sha256 = "f79a8e0dfe685cbcb1eb5cb4a98b048f71abf9efca59900ffe1d1fa2bc13c1c8",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_windowsx86staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.3.0-1/apriltaglib-3.3.0-1-windowsx86staticdebug.zip",
        sha256 = "f7593c6a41db95f42a0b43495c1c9c1b9bf77bbef98bf0e57d46fdffe01fda16",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.3.0-1/apriltaglib-3.3.0-1-windowsarm64staticdebug.zip",
        sha256 = "381bc146a0881960f6a5a1db95d22fe8ac0be1dcf47bcf9cec6059a35337ae5c",
        build_file_content = cc_library_static,
    )

def setup_legacy_bzlmodrio_apriltaglib_cpp_dependencies():
    __setup_bzlmodrio_apriltaglib_cpp_dependencies(None)

setup_bzlmodrio_apriltaglib_cpp_dependencies = module_extension(
    __setup_bzlmodrio_apriltaglib_cpp_dependencies,
)
