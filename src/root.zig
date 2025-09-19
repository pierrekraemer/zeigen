const std = @import("std");
const c = @cImport({
    @cInclude("mat4.h");
});

const Scalar = f32;
fn Vec(comptime N: usize) type {
    return [N]Scalar;
}
const Vec2 = Vec(2);
const Vec3 = Vec(3);
const Vec4 = Vec(4);
const Mat3 = [3]Vec3;
const Mat4 = [4]Vec4;

pub fn computeInverseWithCheck(m: *const Mat4, inv: *Mat4) bool {
    var invertible: bool = undefined;
    c.computeInverseWithCheck(@ptrCast(m), @ptrCast(inv), &invertible);
    return invertible;
}
