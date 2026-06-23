const std = @import("std");

// Creates the build graph
pub fn build(b: *std.Build) void {
    // Standard target, user chooses
    const target = b.standardTargetOptions(.{});
    // Standard optimisation, user chooses
    const optimize = b.standardOptimizeOption(.{});

    // nosns core module
    // May be exported for use by other Zig projects
    const mod = b.addModule("nosns", .{
        // Root file is the only source of public declarations
        .root_source_file = b.path("src/root.zig"),
        .target = target,
    });

    // nosns TUI
    const exe = b.addExecutable(.{
        .name = "nosns",
        .root_module = b.createModule(.{
            .root_source_file = b.path("src/main.zig"),
            .target = target,
            .optimize = optimize,
            .imports = &.{
                .{ .name = "nosns", .module = mod },
            },
        }),
    });
    b.installArtifact(exe);

    // zig build run
    const run_step = b.step("run", "Run the app");
    const run_cmd = b.addRunArtifact(exe);
    run_step.dependOn(&run_cmd.step);
    run_cmd.step.dependOn(b.getInstallStep());
    if (b.args) |args| {
        run_cmd.addArgs(args);
    }

    // nosns module tests
    const mod_tests = b.addTest(.{
        .root_module = mod,
    });
    const run_mod_tests = b.addRunArtifact(mod_tests);

    // nosns TUI tests
    const exe_tests = b.addTest(.{
        .root_module = exe.root_module,
    });
    const run_exe_tests = b.addRunArtifact(exe_tests);

    // zig build test
    const test_step = b.step("test", "Run tests");
    test_step.dependOn(&run_mod_tests.step);
    test_step.dependOn(&run_exe_tests.step);
}
