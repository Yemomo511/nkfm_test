def _copy_library_impl(ctx):
    ## 复制文件，粘贴文件，添加一个yemomo-的前缀
    ## 只允许一个文件
    if len(ctx.files.srcs) != 1:
        fail("Only one file is allowed")
    files = ctx.files.srcs[0]
    outfile = ctx.actions.declare_file("yemomo_{}".format(files.basename))
    ctx.actions.run(
        inputs = [files],
        outputs = [outfile],
        executable = "cp",
        arguments = [files.path, outfile.path],
    )

    return DefaultInfo(files = depset([outfile]))

copy_library = rule(
    implementation = _copy_library_impl,
    attrs = {
        "srcs": attr.label_list(allow_files = True),
    },
)
