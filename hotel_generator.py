import random
import os
from dataclasses import dataclass
from typing import Optional, List

# ===========================================================
#   HOTEL PDDL PROBLEM GENERATOR
#   Supports:
#     1) Basic domain       -> hotel-basico
#     2) Extension 1        -> hotel-ext1
#     3) Extension 3        -> hotel-ext3
#     4) Extension 4        -> hotel-ext4
# ===========================================================

EXTENSIONS = {
    1: {"id": "basico", "domain": "hotel-basico",
        "label": "1) Basic (no rejections)"},
    2: {"id": "ext1", "domain": "hotel-ext1",
        "label": "2) Ext.1 – Rejections"},
    3: {"id": "ext3", "domain": "hotel-ext3",
        "label": "3) Ext.3 – Rejections + losses"},
    4: {"id": "ext4", "domain": "hotel-ext4",
        "label": "4) Ext.4 – Rejections + losses + distinct rooms"},
}


@dataclass
class ProblemConfig:
    level: int
    num_rooms: int
    num_reservations: int
    num_days: int
    cap_min: int
    cap_max: int
    size_min: int
    size_max: int
    max_duration: int
    seed: Optional[int]
    output_dir: str
    filename: str


# ===========================================================
#   SMALL INPUT HELPERS
# ===========================================================

def ask_int(prompt, default=None, min_value=None, max_value=None):
    """
    Ask for an integer with optional default and bounds.
    Keeps asking until valid.
    """
    while True:
        if default is not None:
            raw = input(f"{prompt} [{default}]: ").strip()
            if raw == "":
                value = default
            else:
                try:
                    value = int(raw)
                except ValueError:
                    print("  -> Please enter a valid integer.")
                    continue
        else:
            raw = input(f"{prompt}: ").strip()
            try:
                value = int(raw)
            except ValueError:
                print("  -> Please enter a valid integer.")
                continue

        if min_value is not None and value < min_value:
            print(f"  -> Value must be ≥ {min_value}.")
            continue
        if max_value is not None and value > max_value:
            print(f"  -> Value must be ≤ {max_value}.")
            continue
        return value


def ask_str(prompt, default=None):
    """Ask for a string with optional default."""
    if default is not None:
        raw = input(f"{prompt} [{default}]: ").strip()
        return raw if raw else default
    else:
        return input(f"{prompt}: ").strip()


def ask_yes_no(prompt, default=True):
    """Yes/No question with default."""
    suffix = "[Y/n]" if default else "[y/N]"
    while True:
        raw = input(f"{prompt} {suffix}: ").strip().lower()
        if raw == "" and default is not None:
            return default
        if raw in ("y", "yes", "s", "si", "sí"):
            return True
        if raw in ("n", "no"):
            return False
        print("  -> Please answer y/n.")


# ===========================================================
#   CORE PROBLEM GENERATION
# ===========================================================

def generate_problem(cfg):
    """
    Build a PDDL problem string given a configuration.
    Returns the full PDDL text.
    """
    if cfg.seed is not None:
        random.seed(cfg.seed)

    ext_info = EXTENSIONS[cfg.level]
    domain_name = ext_info["domain"]

    rooms = ["h{}".format(i) for i in range(1, cfg.num_rooms + 1)]
    reservations = ["r{}".format(i) for i in range(1, cfg.num_reservations + 1)]
    days = ["d{}".format(i) for i in range(1, cfg.num_days + 1)]

    lines = []  # type: List[str]

    # Header
    problem_name = cfg.filename.replace(".pddl", "")
    lines.append("(define (problem {})".format(problem_name))
    lines.append("  (:domain {})\n".format(domain_name))

    # Objects
    lines.append("  (:objects")
    lines.append("      ;; Rooms")
    lines.append("      " + " ".join(rooms) + " - habitacion\n")
    lines.append("      ;; Reservations")
    lines.append("      " + " ".join(reservations) + " - reserva\n")
    lines.append("      ;; Days")
    lines.append("      " + " ".join(days) + " - dia")
    lines.append("  )\n")

    # INIT
    lines.append("  (:init")

    # Counters depending on extension
    if cfg.level == 2:
        # Extension 1: only rejected-reservations counter
        lines.append("      ;; Counters (Ext.1)")
        lines.append("      (= (reservas-rechazadas) 0)")
    elif cfg.level == 3:
        # Extension 3: rejections + losses
        lines.append("      ;; Counters (Ext.3)")
        lines.append("      (= (perdida1) 0)")
        lines.append("      (= (perdida2) 0)")
        lines.append("      (= (perdida3) 0)")
        lines.append("      (= (reservas-rechazadas) 0)")
    elif cfg.level == 4:
        # Extension 4: rejections + losses + used-rooms
        lines.append("      ;; Counters (Ext.4)")
        lines.append("      (= (habitaciones-asignadas) 0)")
        lines.append("      (= (perdida1) 0)")
        lines.append("      (= (perdida2) 0)")
        lines.append("      (= (perdida3) 0)")
        lines.append("      (= (reservas-rechazadas) 0)")

    # Room capacities
    lines.append("\n      ;; Room capacities")
    for h in rooms:
        cap = random.randint(cfg.cap_min, cfg.cap_max)
        lines.append("      (= (capacidad {}) {})".format(h, cap))

    # Reservation sizes
    lines.append("\n      ;; Reservation sizes")
    for r in reservations:
        size = random.randint(cfg.size_min, cfg.size_max)
        lines.append("      (= (tamano-reserva {}) {})".format(r, size))

    # Reservation days and remaining-days
    max_dur = max(1, min(cfg.max_duration, cfg.num_days))
    lines.append("\n      ;; Reservation days and dias-restantes")
    for r in reservations:
        duration = random.randint(1, max_dur)
        latest_start = cfg.num_days - duration + 1
        start_day = random.randint(1, latest_start)

        for d in range(start_day, start_day + duration):
            lines.append("      (dia-de-reserva {} d{})".format(r, d))

        lines.append("      (= (dias-restantes {}) {})".format(r, duration))

    # All reservations start as pending
    lines.append("\n      ;; Pending reservations")
    for r in reservations:
        lines.append("      (pendiente {})".format(r))

    lines.append("  )\n")

    # GOAL
    if cfg.level == 1:
        # Basic: all reservations must be assigned (no rejections)
        lines.append("  (:goal")
        lines.append("    (forall (?r - reserva)")
        lines.append("      (asignada ?r))")
        lines.append("  )\n")
    else:
        # Extensions: assigned OR rejected
        lines.append("  (:goal")
        lines.append("    (forall (?r - reserva)")
        lines.append("      (or (asignada ?r) (rechazada ?r)))")
        lines.append("  )\n")

    # METRIC
    if cfg.level == 2:
        # Ext.1 – only rejected reservations
        lines.append("  (:metric minimize (reservas-rechazadas))")
    elif cfg.level == 3:
        # Ext.3 – rejections + losses
        lines.append("  (:metric minimize")
        lines.append("    (+ (reservas-rechazadas)")
        lines.append("       (+ (perdida1)")
        lines.append("          (+ (perdida2) (perdida3))))")
        lines.append("  )")
    elif cfg.level == 4:
        # Ext.4 – rejections + used rooms + losses
        lines.append("  (:metric minimize")
        lines.append("    (+ (reservas-rechazadas)")
        lines.append("       (+ (habitaciones-asignadas)")
        lines.append("          (+ (perdida1)")
        lines.append("             (+ (perdida2) (perdida3)))))")
        lines.append("  )")

    lines.append(")")

    return "\n".join(lines)


def write_problem(cfg):
    """Generate and write the problem to disk. Returns full path."""
    if not os.path.isdir(cfg.output_dir):
        os.makedirs(cfg.output_dir)
    full_path = os.path.join(cfg.output_dir, cfg.filename)

    pddl_text = generate_problem(cfg)
    with open(full_path, "w", encoding="utf-8") as f:
        f.write(pddl_text)

    return full_path


# ===========================================================
#   INTERACTIVE MENU
# ===========================================================

def interactive_menu():
    print("\n========================================")
    print("   HOTEL PROBLEM GENERATOR (PDDL)")
    print("========================================\n")

    # Extension selection
    print("Select extension:")
    for k in sorted(EXTENSIONS.keys()):
        print("  {}".format(EXTENSIONS[k]["label"]))
    print()

    while True:
        level = ask_int("Extension (1–4)", default=1, min_value=1, max_value=4)
        if level in EXTENSIONS:
            break
        print("  -> Invalid option, please choose 1, 2, 3 or 4.")

    ext_info = EXTENSIONS[level]
    print("\nSelected: {} (domain = {})\n".format(ext_info["label"], ext_info["domain"]))

    # Common parameters with sane defaults
    num_rooms = ask_int("Number of rooms", default=3, min_value=1)
    num_reservations = ask_int("Number of reservations", default=5, min_value=1)
    num_days = ask_int("Number of days (max 30)", default=10, min_value=1, max_value=30)

    cap_min = ask_int("Minimum room capacity", default=1, min_value=1)
    cap_max = ask_int("Maximum room capacity", default=max(2, cap_min), min_value=cap_min)

    size_min = ask_int("Minimum reservation size", default=1, min_value=1)
    size_max = ask_int("Maximum reservation size", default=max(2, size_min), min_value=size_min)

    max_duration = ask_int("Maximum stay length (days)", default=3, min_value=1, max_value=num_days)

    # Seed
    seed_str = ask_str("Random seed (ENTER = random)", default="")
    seed = int(seed_str) if seed_str.strip() != "" else None

    # Output directory & filename
    default_dir = "problemas"
    out_dir = ask_str("Output directory", default=default_dir)

    default_filename = "hotel-{}-h{}-r{}-d{}.pddl".format(
        ext_info["id"], num_rooms, num_reservations, num_days
    )
    filename = ask_str("Output filename", default=default_filename)

    cfg = ProblemConfig(
        level=level,
        num_rooms=num_rooms,
        num_reservations=num_reservations,
        num_days=num_days,
        cap_min=cap_min,
        cap_max=cap_max,
        size_min=size_min,
        size_max=size_max,
        max_duration=max_duration,
        seed=seed,
        output_dir=out_dir,
        filename=filename,
    )

    full_path = write_problem(cfg)
    print("\n✓ Problem generated successfully → {}\n".format(full_path))


def main():
    while True:
        interactive_menu()
        if not ask_yes_no("Generate another problem?", default=False):
            print("\nBye!\n")
            break


if __name__ == "__main__":
    main()
