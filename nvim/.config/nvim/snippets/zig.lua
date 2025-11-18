return {
    -- stdout definition
    s("stdout", {
        t("var stdout_buffer: [1024]u8 = undefined;"),
        t({ "", "" }),
        t("var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);"),
        t({ "", "" }),
        t("const stdout = &stdout_writer.interface;"),
    }),
    -- stdin definition
    s("stdin", {
        t("var stdin_buffer: [1024]u8 = undefined;"),
        t({ "", "" }),
        t("var stdin_reader = std.fs.File.stdin().reader(&stdin_buffer);"),
        t({ "", "" }),
        t("const stdin = &stdin_reader.interface;"),
    }),
    -- GeneralPurposeAllocator definition
    s("gpa", {
        t("var gpa = std.heap.GeneralPurposeAllocator(.{}){};"),
        t({ "", "" }),
        t("defer _ = gpa.deinit();"),
        t({ "", "" }),
        t("const allocator = gpa.allocator();"),
    }),
    -- ArenaAllocator definition
    s("aa", {
        t("var aa = std.heap.ArenaAllocator.init(allocator);"),
        t({ "", "" }),
        t("defer aa.deinit();"),
        t({ "", "" }),
        t("const arena_allocator = aa.allocator();"),
    }),
}
