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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.2.0-4/apriltaglib-3.2.0-4-headers.zip",
        sha256 = "30a7de3a5bdf5772257ffe3e4d9ad2a3b16c813b8bfaa006817b37ba42eadfff",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.2.0-4/apriltaglib-3.2.0-4-sources.zip",
        sha256 = "ea503de516a79b911920678cbd85bb681f12358b99a962e6739d4bd11d050323",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.2.0-4/apriltaglib-3.2.0-4-linuxarm32static.zip",
        sha256 = "8c253eb81def63e5442a97515a0d47721a29d9887a953ca31bdcdbe07abc9af4",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.2.0-4/apriltaglib-3.2.0-4-linuxarm64static.zip",
        sha256 = "1b380875e3a6b694d649bfb74aa7f17f4f54ee860c53c3c2682de4f4ae786266",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.2.0-4/apriltaglib-3.2.0-4-linuxathenastatic.zip",
        sha256 = "3c16b1379ee48914f4f5e9f87d84e15c4317be285d5fe53dfdc40a339a8e8848",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.2.0-4/apriltaglib-3.2.0-4-linuxx86-64static.zip",
        sha256 = "2fbfde43322b2bb81d685d0d54edf7a6f8891cd15d2814f4548f5996020ac27f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.2.0-4/apriltaglib-3.2.0-4-osxuniversalstatic.zip",
        sha256 = "860661e3d095d5820cfc721ce41d389d5f4e0d9da7b4398b7b756f26d3a0f17f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.2.0-4/apriltaglib-3.2.0-4-windowsx86-64static.zip",
        sha256 = "4835c6ffccc5193f4f215dac0ec17605f3cf3f4c446c23bad089752138c117e4",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_windowsx86static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.2.0-4/apriltaglib-3.2.0-4-windowsx86static.zip",
        sha256 = "d1fbafe7226d3eecfc1e1746f5018a76d251f42cea87c12ca1b1a7129137c6cc",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.2.0-4/apriltaglib-3.2.0-4-linuxarm32staticdebug.zip",
        sha256 = "180349fd3a0f59856ef0f75b0d56a413b60be7fdd8322eb7d98fda178a0172c4",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.2.0-4/apriltaglib-3.2.0-4-linuxarm64staticdebug.zip",
        sha256 = "79b1c879e941621bab0f6c6b0960d7fc33c296f7ee58524df94fe1557a7d63a2",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.2.0-4/apriltaglib-3.2.0-4-linuxathenastaticdebug.zip",
        sha256 = "694e7844d01b552e240d2b6038c6cad216a2cfaa2cf80bbc485bccd02089e512",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.2.0-4/apriltaglib-3.2.0-4-linuxx86-64staticdebug.zip",
        sha256 = "4a2950af2951cc66153febf4853439b4875ee3ebf9e8938b051c984dec150853",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.2.0-4/apriltaglib-3.2.0-4-osxuniversalstaticdebug.zip",
        sha256 = "ef739ffa81f48c863c75466e4a254fd72d1f9bd934cdbfa2c31d135b540bf6b1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.2.0-4/apriltaglib-3.2.0-4-windowsx86-64staticdebug.zip",
        sha256 = "bb30199c0739d5790facf40d646f67a6223bec42fae77395c4dd178b4f5e6efc",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_windowsx86staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.2.0-4/apriltaglib-3.2.0-4-windowsx86staticdebug.zip",
        sha256 = "83ceb506019f35c0c30bf507e8b57c856d6041ef4e7c71575ba8f69dd992d384",
        build_file_content = cc_library_static,
    )

def setup_legacy_bzlmodrio_apriltaglib_cpp_dependencies():
    __setup_bzlmodrio_apriltaglib_cpp_dependencies(None)

setup_bzlmodrio_apriltaglib_cpp_dependencies = module_extension(
    __setup_bzlmodrio_apriltaglib_cpp_dependencies,
)
