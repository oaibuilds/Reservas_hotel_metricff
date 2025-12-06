import os
import random

# ------------------------------
# CONFIGURACIÓ
# ------------------------------
NUM_DIES = 30
CAP_MIN = 1
CAP_MAX = 4  # tant per habitacions com reserves

OUTPUT_DIR = "extension-4-escala/5"

if not os.path.exists(OUTPUT_DIR):
    os.makedirs(OUTPUT_DIR)


# ------------------------------
# FUNCIÓ PER DEMANAR L'EXTENSIÓ
# ------------------------------
def triar_extensio():
    print("Tria l'extensió del problema:")
    print("  1 - Basic")
    print("  2 - Extensió 1")
    print("  3 - Extensió 3")
    print("  4 - Extensió 4")
    while True:
        opcio = input("Introdueix un número (1-4) [1]: ").strip()
        if opcio == "":
            return 1
        if opcio in ("1", "2", "3", "4"):
            return int(opcio)
        print("Opció invàlida, torna-ho a provar.")


def generar_problema(seed, extensio, num_habitacions, num_reserves):
    random.seed(seed)

    # Generem habitacions, reserves i dies
    habitacions = [f"h{i+1}" for i in range(num_habitacions)]
    reserves = [f"r{i+1}" for i in range(num_reserves)]
    dies = [f"d{i+1}" for i in range(NUM_DIES)]

    # Capacitats
    cap_h = {h: random.randint(CAP_MIN, CAP_MAX) for h in habitacions}
    cap_r = {r: random.randint(CAP_MIN, CAP_MAX) for r in reserves}

    # Dies assignats a reserves
    dies_reserva = {}
    dies_restants = {}

    for r in reserves:
        durada = random.randint(CAP_MIN, 5)
        dies_restants[r] = durada
        start = random.randint(0, NUM_DIES - durada)
        dies_reserva[r] = dies[start:start+durada]

    # ------------------------------
    # GENERACIÓ DEL FITXER .pddl
    # ------------------------------
    nom_fitxer = os.path.join(OUTPUT_DIR, f"prob_{seed}.pddl")

    with open(nom_fitxer, "w") as f:
        f.write(f"(define (problem prob{seed})\n")

        # Domain segons extensió
        if extensio == 1:
            f.write("  (:domain hotel-basico)\n\n")
        elif extensio == 2:
            f.write("  (:domain hotel-ext1)\n\n")
        elif extensio == 3:
            f.write("  (:domain hotel-ext3)\n\n")
        elif extensio == 4:
            f.write("  (:domain hotel-ext4)\n\n")

        # OBJECTS
        f.write("  (:objects\n")
        f.write("      " + " ".join(habitacions) + " - habitacion\n\n")
        f.write("      " + " ".join(reserves) + " - reserva\n\n")
        f.write("      " + " ".join(dies) + " - dia\n  )\n\n")

        # INIT
        f.write("  (:init\n\n")

        # Contadors segons extensió
        if extensio == 2:
            # Ext.1 – només reserves rebutjades
            f.write("      (= (reservas-rechazadas) 0)\n")
        elif extensio == 3:
            # Ext.3 – rejections + losses
            f.write("      (= (perdida1) 0)\n")
            f.write("      (= (perdida2) 0)\n")
            f.write("      (= (perdida3) 0)\n")
            f.write("      (= (reservas-rechazadas) 0)\n")
        elif extensio == 4:
            # Ext.4 – rejections + used rooms + losses
            f.write("      (= (habitaciones-asignadas) 0)\n")
            f.write("      (= (perdida1) 0)\n")
            f.write("      (= (perdida2) 0)\n")
            f.write("      (= (perdida3) 0)\n")
            f.write("      (= (reservas-rechazadas) 0)\n")

        # Capacitats de les habitacions
        for h in habitacions:
            f.write(f"      (= (capacidad {h}) {cap_h[h]})\n")
        f.write("\n")

        # Tamany de reserves
        for r in reserves:
            f.write(f"      (= (tamano-reserva {r}) {cap_r[r]})\n")
        f.write("\n")

        # Dies de cada reserva i dies restants
        for r in reserves:
            for d in dies_reserva[r]:
                f.write(f"      (dia-de-reserva {r} {d})\n")
            f.write(f"      (= (dias-restantes {r}) {dies_restants[r]})\n")
            f.write("\n")

        # Pendents
        for r in reserves:
            f.write(f"      (pendiente {r})\n")

        f.write("  )\n\n")

        # GOAL
        f.write("  (:goal\n")
        if extensio == 1:
            f.write("    (forall (?r - reserva) (asignada ?r))\n")
        else:
            f.write("    (forall (?r - reserva) (or (asignada ?r) (rechazada ?r)))\n")
        f.write("  )\n\n")

        # METRIC
        if extensio == 2:
            f.write("  (:metric minimize (reservas-rechazadas))\n")
        elif extensio == 3:
            f.write("  (:metric minimize (+ (reservas-rechazadas) (+ (perdida1) (+ (perdida2) (perdida3)))))\n")
        elif extensio == 4:
            f.write("  (:metric minimize (+ (reservas-rechazadas) (+ (habitaciones-asignadas) (+ (perdida1) (+ (perdida2) (perdida3))))))\n")

        f.write(")\n")

    return nom_fitxer


# ------------------------------
# FUNCIÓ PRINCIPAL
# ------------------------------
def generar_batch(seeds, extensio, num_habitacions, num_reserves):
    fitxers = []
    for seed in seeds:
        fitxer = generar_problema(seed, extensio, num_habitacions, num_reserves)
        fitxers.append(fitxer)
    return fitxers


# EXEMPLE D'ÚS
if __name__ == "__main__":
    seeds = [123, 456, 789, 1234, 5678, 91011, 45, 321, 876, 543]
    extensio = triar_extensio()
    num_habitacions = 5
    num_reserves = 5

    fitxers = generar_batch(seeds, extensio, num_habitacions, num_reserves)

    print("Fitxers generats:")
    for fx in fitxers:
        print(" -", fx)
