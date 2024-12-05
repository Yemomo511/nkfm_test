load("@rules_kotlin//kotlin:jvm.bzl", "kt_jvm_binary", "kt_jvm_library")

exports_files(["copy.txt"])

kt_jvm_binary(
    name = "kt-runner",
    srcs = ["Main.kt"],
    main_class = "src.Main",
    deps = [":greeter"],
)

kt_jvm_library(
    name = "greeter",
    srcs = ["Greeter.kt"],
    visibility = ["//:__pkg__"],
)
