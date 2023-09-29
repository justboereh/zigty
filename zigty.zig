const std = @import("std");
const testing = std.testing;

const OnRun = *const fn (args: []const []const u8) anyerror!void;

pub const Argument = struct {
    name: []u8,
    short: ?[]const u8 = null,
    description: ?[]const u8 = null,
    type: type,
    transform: *const fn (value: Argument.type) anyerror!void,

    pub fn value(comptime self: *Argument) !self.type {}
};

pub const Command = struct {
    name: []u8,
    description: ?[]const u8 = null,
    commands: []const *const Command = null,

    arguments: []const *const Argument = null,
    positionals: ?[]const u8 = null,

    onRun: OnRun,
};

pub const App = struct {
    name: []const u8,
    author: ?[]const u8 = null,
    version: ?[]const u8 = null,
    description: ?[]const u8 = null,

    templates: []u8 = null,

    commands: ?[]const *const Command = null,
    arguments: ?[]const *const Argument = null,
    positionals: ?[]const u8 = null,

    positionalsBeforeArguments: ?bool = false,

    onRun: OnRun,

    pub fn defineCommand(self: *App, command: Command) void {
        self.commands = command;
    }

    pub fn defineArgument(self: *App, argument: Argument) void {
        self.arguments = argument;
    }
};

pub fn RunApp(app: App) !void {
    _ = app;
}

test "basic add functionality" {
    const app = App{
        .name = "zitytest",
    };

    _ = app;
}
