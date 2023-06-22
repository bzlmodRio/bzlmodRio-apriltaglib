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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.2.0-5/apriltaglib-3.2.0-5-headers.zip",
        sha256 = "d2eaa7866bdded8d5fdc9a88c035cca5d4c2ff8f0a384920c9ee386b1d3b10ee",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.2.0-5/apriltaglib-3.2.0-5-sources.zip",
        sha256 = "d7db508e2dd8175935e789a841949767056348decd4ba5b83eec0b1ebb94167d",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.2.0-5/apriltaglib-3.2.0-5-linuxarm32static.zip",
        sha256 = "6eb825d0d9c985308ca0ab0148920156ac6da57c3c7a74eb3d1ff02a5d2393c8",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.2.0-5/apriltaglib-3.2.0-5-linuxarm64static.zip",
        sha256 = "fd591af23495613e41a41743b60e242ac33ca89b6534d72301351219b679f620",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.2.0-5/apriltaglib-3.2.0-5-linuxathenastatic.zip",
        sha256 = "f899b3469bb77995db73551fae778dc0d0caa15fb4f1126167e94c5221a7af45",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.2.0-5/apriltaglib-3.2.0-5-linuxx86-64static.zip",
        sha256 = "b34d5756ecd89190af7f3084ea300889f685ecde0e842de1acaff29087b8c421",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.2.0-5/apriltaglib-3.2.0-5-osxuniversalstatic.zip",
        sha256 = "10723530c1960b02e106d388d0b4cd81c6f2ccc149c32bee1be7e6f1f17e85d5",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.2.0-5/apriltaglib-3.2.0-5-windowsx86-64static.zip",
        sha256 = "69e1c13d838985ab7420b1c055de99be806492c8b2000f0cda3bca747a0ab4a1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_windowsx86static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.2.0-5/apriltaglib-3.2.0-5-windowsx86static.zip",
        sha256 = "c98f64f357eb5256fbbfd1e0cbfdf7a099feebbb35ca845693f56fe6795efd27",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.2.0-5/apriltaglib-3.2.0-5-windowsarm64static.zip",
        sha256 = "2b7f286e1c6dbc27115f6a6436de4bf12f50b6fd97d9d0c65ae3264396aaad65",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.2.0-5/apriltaglib-3.2.0-5-linuxarm32staticdebug.zip",
        sha256 = "7cd163303f739e92c6084ef472a174523dc0b0a07c4906a98fdf804e6dade0ab",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.2.0-5/apriltaglib-3.2.0-5-linuxarm64staticdebug.zip",
        sha256 = "309de53d4e7db889e20bd6f97d2d05c26fd3aad851f8f2aa6c6c531ed5de6e67",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.2.0-5/apriltaglib-3.2.0-5-linuxathenastaticdebug.zip",
        sha256 = "9d1fdd34ab6958710caa8e94a73f5f1bbbd5eaa1425ff3192deb1c1529f60fa3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.2.0-5/apriltaglib-3.2.0-5-linuxx86-64staticdebug.zip",
        sha256 = "d37bbddc39f1f5e5d624fda84fb97eee4b4056965d2559461efe596c5747aadc",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.2.0-5/apriltaglib-3.2.0-5-osxuniversalstaticdebug.zip",
        sha256 = "7c10bd7e484a592a131315db65290095022f670fde783b43b18a805bae99848d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.2.0-5/apriltaglib-3.2.0-5-windowsx86-64staticdebug.zip",
        sha256 = "d6cd137a3c88f50cf383f5f529568c337543a308dc920969ccc670fab9330cf6",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_windowsx86staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.2.0-5/apriltaglib-3.2.0-5-windowsx86staticdebug.zip",
        sha256 = "a5b3516356a8d3b9ca1915317e0e5c78adb26c4de9f4bd2277b278c27ab3cb37",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_apriltaglib_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/apriltaglib/3.2.0-5/apriltaglib-3.2.0-5-windowsarm64staticdebug.zip",
        sha256 = "267ec713efc4f6688cca6ac8960be9a571a05f598338fef8580f125e3f0c5331",
        build_file_content = cc_library_static,
    )

def setup_legacy_bzlmodrio_apriltaglib_cpp_dependencies():
    __setup_bzlmodrio_apriltaglib_cpp_dependencies(None)

setup_bzlmodrio_apriltaglib_cpp_dependencies = module_extension(
    __setup_bzlmodrio_apriltaglib_cpp_dependencies,
)
