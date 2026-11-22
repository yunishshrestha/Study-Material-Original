gates = [
    ("AND",  [([1, 1], 1), ([1, -1], -1), ([-1, 1], -1), ([-1, -1], -1)]),
    ("OR",   [([1, 1], 1), ([1, -1], 1), ([-1, 1], 1), ([-1, -1], -1)]),
    ("NAND", [([1, 1], -1), ([1, -1], 1), ([-1, 1], 1), ([-1, -1], 1)]),
    ("NOR",  [([1, 1], -1), ([1, -1], -1), ([-1, 1], -1), ([-1, -1], 1)]),
]

def hebbian(name, data):
    print("=" * 50)
    print(f"  HEBBIAN NETWORK: {name} GATE")
    print("  Program by: Yunish Shrestha")
    print("  Roll No: 46")
    print("=" * 50)
    print(f"\n{name} Gate Truth Table:")
    print(" x1 x2 | Target")
    print(" ---------------")
    for x, t in data:
        print(f" {x[0]:2} {x[1]:2} | {t:2}")
    w1 = w2 = bias = 0.0
    eta = 1.0
    print("\n" + "=" * 50)
    print("  TRAINING")
    print("=" * 50)
    print(f"Initial: w1={w1}, w2={w2}, bias={bias}, η={eta}\n")
    for epoch in range(5):
        print(f"Epoch {epoch+1}")
        print("-" * 30)
        for x, target in data:
            x1, x2 = x
            y = target
            dw1, dw2, db = eta * x1 * y, eta * x2 * y, eta * y
            w1 += dw1
            w2 += dw2
            bias += db
            print(f"  ({x1:2}, {x2:2}) => y={y:2} | Δw=({dw1:3.0f}, {dw2:3.0f}) | w=({w1:3.0f}, {w2:3.0f}) bias={bias:3.0f}")
    print("\n" + "=" * 50)
    print("  FINAL WEIGHTS")
    print("=" * 50)
    print(f"  w1 = {w1:.0f}, w2 = {w2:.0f}, bias = {bias:.0f}")
    print("\n" + "=" * 50)
    print("  TESTING")
    print("=" * 50)
    print("\n x1 x2 | yin | y | Expected")
    print(" " + "-" * 30)
    for x, target in data:
        x1, x2 = x
        yin = x1 * w1 + x2 * w2 + bias
        y = 1 if yin >= 0 else -1
        status = "yes" if y == target else "NO"
        print(f" {x1:2} {x2:2} | {yin:4.0f} | {y:2} | {target:2} {status}")
    print("\n" + "=" * 50)
    print(f"{name} Gate learned successfully!" if y == target else f"{name} Gate NOT learned!")
    print("=" * 50)
    if name == "NAND":
        print(" ")
        print("Gate    w1    w2   bias   Decision Boundary")
        print("AND     10    10   -10    x1 + x2 >= 1")
        print("OR      10    10    10    x1 + x2 >= -1")
        print("NAND   -10   -10    10    -x1 - x2 + 10 >= 0")
        print("=" * 50)
    if name == "NOR":
        print("\n" + "=" * 50)
        print("Comparison: All logic gates")
        print("=" * 50)
        print(" ")
        print("Gate    w1    w2   bias   pattern        status")
        print("AND     10    10   -10    w=+n, b=-n     [yes]")
        print("OR      10    10    10    w=+n, b=+n     [yes]")
        print("NAND   -10   -10    10    w=-n, b=+n     [yes]")
        print("NOR    -10   -10   -10    w=-n, b=-n     [yes]")
        print("=" * 50)

for name, data in gates:
    hebbian(name, data)