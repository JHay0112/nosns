const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    // nosns repository management module
    const repoman_module = b.addModule("repoman", .{
        .root_source_file = b.path("src/repoman/root.zig"),
        .target = target,
    });

    // nosns TUI
    const tui_exe = b.addExecutable(.{
        .name = "nosns-tui",
        .root_module = b.createModule(.{
            .root_source_file = b.path("src/tui/main.zig"),
            .target = target,
            .optimize = optimize,
            .imports = &.{
                .{ .name = "repoman", .module = repoman_module },
            },
        }),
    });
    b.installArtifact(tui_exe);

    // zig build run
    const run_step = b.step("run", "Run the app");
    const run_cmd = b.addRunArtifact(tui_exe);
    run_step.dependOn(&run_cmd.step);
    run_cmd.step.dependOn(b.getInstallStep());
    if (b.args) |args| {
        run_cmd.addArgs(args);
    }

    // nosns module tests
    const mod_tests = b.addTest(.{
        .root_module = repoman_module,
    });
    const run_mod_tests = b.addRunArtifact(mod_tests);

    // nosns TUI tests
    const exe_tests = b.addTest(.{
        .root_module = tui_exe.root_module,
    });
    const run_exe_tests = b.addRunArtifact(exe_tests);

    // zig build test
    const test_step = b.step("test", "Run tests");
    test_step.dependOn(&run_mod_tests.step);
    test_step.dependOn(&run_exe_tests.step);
}
