const E = union(enum) {
    A: [9]u8,
    B: u64,
};
const S = struct {
    x: u8,
    y: E,
};

const assertOrPanic = @import("std").debug.assertOrPanic;

test "bug 394 fixed" {
    const x = S{
        .x = 3,
        .y = E{ .B = 1 },
    };
    assertOrPanic(x.x == 3);
}
