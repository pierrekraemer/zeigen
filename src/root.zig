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

pub fn mulSparseMatrixScalar(mat: *anyopaque, scalar: Scalar, matOut: *anyopaque) void {
    c.mulSparseMatrixScalar(mat, scalar, matOut);
}

pub fn subSparseMatrices(matA: *anyopaque, matB: *const anyopaque, matOut: *anyopaque) void {
    c.subSparseMatrices(matA, matB, matOut);
}

pub fn createSparseMatrix(rows: u32, cols: u32) ?*anyopaque {
    return c.createSparseMatrix(@intCast(rows), @intCast(cols));
}

pub fn createSparseMatrixFromTriplets(
    rows: u32,
    cols: u32,
    row_indices: []const u32,
    col_indices: []const u32,
    values: []const Scalar,
) ?*anyopaque {
    return c.createSparseMatrixFromTriplets(@intCast(rows), @intCast(cols), @intCast(row_indices.len), row_indices.ptr, col_indices.ptr, values.ptr);
}

pub fn createDiagonalSparseMatrixFromArray(arr: []const Scalar) ?*anyopaque {
    return c.createDiagonalSparseMatrixFromArray(@intCast(arr.len), arr.ptr);
}

pub fn solveSymmetricSparseLinearSystem(
    A: *const anyopaque,
    b: []const Scalar,
    x: []Scalar,
) void {
    c.solveSymmetricSparseLinearSystem(A, b.ptr, x.ptr, @intCast(b.len));
}

pub fn destroySparseMatrix(mat: *anyopaque) void {
    c.destroySparseMatrix(mat);
}
