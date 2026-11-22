# Lab: Tower of Hanoi
# Program by: Yunish Shrestha
# Roll no: 46

def tower_of_hanoi(n, source, destination, auxiliary, move_count):
    if n == 1:
        move_count[0] = move_count[0] + 1
        print(f"Move {move_count[0]}: Disk 1 from {source} to {destination}")
        return move_count

    tower_of_hanoi(n - 1, source, auxiliary, destination, move_count)

    move_count[0] = move_count[0] + 1
    print(f"Move {move_count[0]}: Disk {n} from {source} to {destination}")

    tower_of_hanoi(n - 1, auxiliary, destination, source, move_count)

    return move_count

def display_disks(n, source_peg, aux_peg, dest_peg, source, aux, dest):
    print("\nCurrent State:")
    print(f"  {source}: {source_peg}")
    print(f"  {aux}: {aux_peg}")
    print(f"  {dest}: {dest_peg}")

def tower_of_hanoi_visual(n, source, destination, auxiliary):
    source_peg = list(range(n, 0, -1))
    aux_peg = []
    dest_peg = []

    print("=" * 70)
    print(f"TOWER OF HANOI - {n} DISKS")
    print("=" * 70)
    print()
    print("Initial State:")
    display_disks(n, source_peg, aux_peg, dest_peg, source, auxiliary, destination)
    print()
    print("Moves:")
    print("-" * 70)

    move_count = [0]

    def hanoi_visual(n, src, dst, aux, src_peg, aux_peg, dst_peg):
        if n == 1:
            disk = src_peg.pop()
            dst_peg.append(disk)
            move_count[0] = move_count[0] + 1
            print(f"Move {move_count[0]}: Disk {disk} from {src} to {dst}")
            display_disks(n, src_peg, aux_peg, dst_peg, source, auxiliary, destination)
            return

        hanoi_visual(n - 1, src, aux, dst, src_peg, dst_peg, aux_peg)

        disk = src_peg.pop()
        dst_peg.append(disk)
        move_count[0] = move_count[0] + 1
        print(f"Move {move_count[0]}: Disk {disk} from {src} to {dst}")
        display_disks(n, src_peg, aux_peg, dst_peg, source, auxiliary, destination)

        hanoi_visual(n - 1, aux, dst, src, aux_peg, src_peg, dst_peg)

    hanoi_visual(n, source, destination, auxiliary, source_peg, aux_peg, dest_peg)

    print("-" * 70)
    print(f"\nTotal moves: {move_count[0]}")
    print(f"Formula: 2^{n} - 1 = {2**n - 1} moves")
    print("=" * 70)

print()
tower_of_hanoi_visual(3, 'A', 'C', 'B')