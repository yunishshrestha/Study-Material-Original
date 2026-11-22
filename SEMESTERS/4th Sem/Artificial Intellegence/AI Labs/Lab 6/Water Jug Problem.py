# Lab: Water Jug Problem
# Program by: Yunish Shrestha
# Roll no: 46

from collections import deque

def water_jug_bfs(capA, capB, target):
    initial = (0, 0)
    visited = set()
    queue = deque([(initial, [initial])])
    visited.add(initial)

    print("=" * 70)
    print(f"WATER JUG PROBLEM: {capA}-gallon and {capB}-gallon jugs")
    print(f"Target: {target} gallons")
    print("=" * 70)
    print()
    print("Exploring states...")
    print()

    step = 0

    while queue:
        state, path = queue.popleft()
        x, y = state
        step = step + 1

        if x == target or y == target:
            print("=" * 70)
            print("GOAL REACHED!")
            print("=" * 70)
            print(f"Solution found in {len(path)-1} steps:")
            print()
            for i, s in enumerate(path):
                print(f"Step {i}: Jug A = {s[0]}, Jug B = {s[1]}")
            print()
            print("=" * 70)
            return path

        next_states = []

        if x < capA:
            next_states.append((capA, y, "Fill A"))

        if y < capB:
            next_states.append((x, capB, "Fill B"))

        if x > 0:
            next_states.append((0, y, "Empty A"))

        if y > 0:
            next_states.append((x, 0, "Empty B"))

        if x > 0 and y < capB:
            pour = min(x, capB - y)
            next_states.append((x - pour, y + pour, f"Pour A → B ({pour} gallons)"))

        if y > 0 and x < capA:
            pour = min(y, capA - x)
            next_states.append((x + pour, y - pour, f"Pour B → A ({pour} gallons)"))

        print(f"Expanding ({x}, {y})")
        for nx, ny, action in next_states:
            print(f"  {action} → ({nx}, {ny})")

        for nx, ny, action in next_states:
            if (nx, ny) not in visited:
                visited.add((nx, ny))
                queue.append(((nx, ny), path + [(nx, ny)]))

    print("No solution found!")
    return None

print()
water_jug_bfs(4, 3, 2)