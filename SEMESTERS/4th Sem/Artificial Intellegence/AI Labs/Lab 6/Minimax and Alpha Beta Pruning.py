tree = {
    'A': ['B', 'C'],
    'B': ['D', 'E'],
    'C': ['F', 'G'],
    'D': [5, 3],
    'E': [8, 2],
    'F': [7, 4],
    'G': [9, 1]
}

def minimax(node, maxp):
    if isinstance(node, int):
        return node
    best = -float('inf') if maxp else float('inf')
    for child in tree[node]:
        value = minimax(child, not maxp)
        best = max(best, value) if maxp else min(best, value)
    return best

def ab(node, maxp, alpha, beta):
    if isinstance(node, int):
        return node
    best = -float('inf') if maxp else float('inf')
    for child in tree[node]:
        value = ab(child, not maxp, alpha, beta)
        if maxp:
            best = max(best, value)
            alpha = max(alpha, best)
        else:
            best = min(best, value)
            beta = min(beta, best)
        if beta <= alpha:
            break
    return best

print("GAME TREE\n")
print("                    MAX")
print("                   /   \\")
print("                  /     \\")
print("                 /       \\")
print("               MIN       MIN")
print("              /   \\     /   \\")
print("            MAX   MAX  MAX   MAX")
print("           /  \\  /  \\ /  \\  /  \\")
print("          5   3 8   2 7   4 9   1")

print("\nMINIMAX WITHOUT PRUNING")

r = minimax('A', True)

print("\nRoot Value (Best for MAX):", r)
print("\nExplanation:")
print("  - D = max(5,3) = 5")
print("  - E = max(8,2) = 8")
print("  - F = max(7,4) = 7")
print("  - G = max(9,1) = 9")
print("  - B = min(5,8) = 5")
print("  - C = min(7,9) = 7")
print("  - A = max(5,7) = 7")

print("\nMINIMAX WITH ALPHA-BETA PRUNING")

rp = ab('A', True, -float('inf'), float('inf'))

print("\nRoot Value (Best for MAX):", rp)
print("\nAlpha-Beta pruned branches that cannot affect the final decision.")
print("Result is the same as minimax but faster.")

print("\nCOMPARISON\n")
print("Both algorithms found the same root value:", r)
print("Alpha-Beta pruning is more efficient.")