const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const zeigen_mod = b.addModule("zeigen", .{
        .root_source_file = b.path("src/root.zig"),
        .target = target,
        .optimize = optimize,
        // .link_libc = true,
        // .link_libcpp = true,
    });

    const lib = b.addLibrary(.{
        .name = "zeigen",
        .linkage = .static,
        .root_module = zeigen_mod,
    });

    lib.addIncludePath(b.path("eigen-master"));
    lib.addIncludePath(b.path("src"));
    lib.addCSourceFiles(.{
        .root = b.path("src"),
        .files = &.{
            "mat4.cpp",
        },
    });

    b.installArtifact(lib);
}
