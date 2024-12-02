# Rangos de subdirectorios para cada nivel de zoom
zoom_levels = {
    '18': (73889, 73965),
    '17': (36944, 36983),
    '16': (18472, 18492),
    '15': (9236, 9246),
    '14': (4618, 4623),
    '13': (2309, 2312),
    '12': (1154, 1156),
    '11': (557, 558),
    '10': (288, 289),
}

# Función para generar las líneas para el pubspec.yaml
def generate_assets_entries(zoom_levels):
    entries = [
        "- assets/maps/",
        "- assets/maps/10/",
        "- assets/maps/11/",
        "- assets/maps/12/",
        "- assets/maps/13/",
        "- assets/maps/14/",
        "- assets/maps/15/",
        "- assets/maps/16/",
        "- assets/maps/17/",
        "- assets/maps/18/"
    ]
    
    for level, (start, end) in zoom_levels.items():
        for i in range(start, end):
            entries.append(f"- assets/maps/{level}/{i}/")

    return entries

# Generar las entradas y unirlas en una cadena de texto
pubspec_entries = "\n".join(generate_assets_entries(zoom_levels))
print(pubspec_entries)
