#!/usr/bin/env python3
"""Golden vectors for the IEEE-754 binary16 fp16_mult / fp16_add units.

Reference: the exact product / sum of two binary16 values is representable
in float64 (product: 22 significand bits; sum: exponent span 40 bits +
11 bits < 53), so numpy's float64 -> float16 conversion performs the single
round-to-nearest-even that IEEE requires, including gradual underflow and
overflow to infinity.  Writes testbench/vectors/fp16_{mul,add}.hex, one
"aaaa bbbb yyyy" line per vector.  Deterministic (seed 1).
"""
import os
import numpy as np

HERE = os.path.dirname(os.path.abspath(__file__))
N_RANDOM = 20000
rng = np.random.default_rng(1)

def bits(x16):  # float16 -> uint16 bits
    return np.asarray(x16, dtype=np.float16).view(np.uint16)

def f16(u):     # uint16 bits -> float16
    return np.asarray(u, dtype=np.uint16).view(np.float16)

special = np.array([0x0000, 0x8000, 0x0001, 0x8001, 0x03FF, 0x83FF, 0x0400, 0x8400,
                    0x7BFF, 0xFBFF, 0x7C00, 0xFC00, 0x7E00, 0x3C00, 0xBC00, 0x3C01,
                    0x0200, 0x0002, 0x7BFE, 0x4000, 0x4200, 0x3800, 0x0800, 0x77FF],
                   dtype=np.uint16)

def pairs():
    r = rng.integers(0, 1 << 16, size=(N_RANDOM, 2), dtype=np.uint16)
    s = np.array([(x, y) for x in special for y in special], dtype=np.uint16)
    # near-cancellation pairs (same exponent, close mantissa, opposite sign)
    base = rng.integers(0, 1 << 15, size=2000, dtype=np.uint16)
    delta = rng.integers(0, 4, size=2000, dtype=np.uint16)
    c = np.stack([base, (base + delta) | np.uint16(0x8000)], axis=1)
    # subnormal-heavy pairs
    sub = rng.integers(0, 1 << 11, size=(3000, 2), dtype=np.uint16) | (rng.integers(0, 2, size=(3000, 2), dtype=np.uint16) << 15)
    # small-exponent normal pairs (products land in the subnormal range)
    sm = (rng.integers(1, 12, size=(3000, 2), dtype=np.uint16) << 10) | rng.integers(0, 1 << 10, size=(3000, 2), dtype=np.uint16)
    return np.concatenate([s, c, sub, sm, r])

def write(name, fn):
    p = pairs()
    a = f16(p[:, 0]).astype(np.float64)
    b = f16(p[:, 1]).astype(np.float64)
    with np.errstate(all="ignore"):
        y = fn(a, b).astype(np.float16)
    yb = bits(y)
    with open(os.path.join(HERE, "vectors", f"fp16_{name}.hex"), "w") as fh:
        for i in range(len(p)):
            fh.write(f"{p[i,0]:04x} {p[i,1]:04x} {yb[i]:04x}\n")
    print(name, len(p), "vectors")

write("mul", lambda a, b: a * b)
write("add", lambda a, b: a + b)
