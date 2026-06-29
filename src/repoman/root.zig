//! ----------------------------------------------------------------------------
//! repoman root module
//! This module is responsible for managing the nosns repository and files.
//!
//! Author: J. L. Hay
//! ----------------------------------------------------------------------------

const std = @import("std");

// -----------------------------------------------------------------------------
// Types

/// Represents issues detected in validation
const ValidationError = error{
    /// The provided directory does not exist
    NoSuchDirectory,
};

// -----------------------------------------------------------------------------
// Public Functions

/// Validates the repository contained at `dir_path`. Returns a
/// `ValidiationError` if the repository is in anyway invalid. If `dir_path` is
/// a relative path, it will be taken from the current working directory.
pub fn validateRepository(io: std.Io, dir_path: []const u8) ValidationError!void {
    const dir_options: std.Io.Dir.OpenOptions = .{
        .access_sub_paths = true,
        .iterate = false,
        .follow_symlinks = false,
    };
    var dir: std.Io.Dir.OpenError!std.Io.Dir = std.Io.Dir.OpenError.Unexpected;
    if (std.fs.path.isAbsolute(dir_path)) {
        dir = std.Io.Dir.openDirAbsolute(io, dir_path, dir_options);
    } else {
        dir = std.Io.Dir.openDir(std.Io.Dir.cwd(), io, dir_path, dir_options);
    }

    if (dir) |_| {} else |_| {
        return ValidationError.NoSuchDirectory;
    }
}

// -----------------------------------------------------------------------------
// Tests

test "validateRepository rejects non-existent directory" {
    const io = std.testing.io;
    try std.testing.expect(ValidationError.NoSuchDirectory == validateRepository(io, "path/does/not/exist"));
}
