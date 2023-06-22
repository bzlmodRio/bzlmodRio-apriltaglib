from get_apriltaglib_dependencies import get_apriltaglib_dependencies


def main():
    group = get_apriltaglib_dependencies()
    print(group.version)


if __name__ == "__main__":
    main()
