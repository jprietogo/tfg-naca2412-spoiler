# Spoilers sobre un perfil NACA 2412 · TFG (ANSYS Fluent)

**Estudio computacional de la influencia de diferentes elementos pasivos en las propiedades de perfiles aerodinámicos**

Trabajo Fin de Grado del Grado en Ingeniería en Tecnologías Industriales, Universidad de Alcalá (depósito: septiembre de 2024).
Autor: Jaime Prieto Gómez · Tutor: Francisco José Álvarez García.

[English version below](#english)

## Resumen

Simulaciones CFD 2D estacionarias con ANSYS Fluent de un perfil NACA 2412 con un spoiler en el extradós, en seis configuraciones, comparadas con los ensayos en túnel de viento de Lindsay y Walsh (2018). Se estudian la sustentación, el arrastre, la distribución de presiones y la estructura del flujo para ángulos de ataque de −8° a 32°.

- A ángulos de ataque bajos, el spoiler reduce la sustentación respecto al perfil sin spoiler; a ángulos altos, donde el perfil limpio ya está en pérdida, la mantiene elevada.
- El máximo de sustentación aumenta en cuatro de las seis configuraciones (hasta +17,7 %) y disminuye en dos.
- A α ≥ 20° el arrastre simulado es muy superior al experimental; se atribuye a las limitaciones del modelo 2D estacionario para representar la estela turbulenta.

## Contenido

```
.
├── matlab/
│   ├── naca2412_coordenadas.m       # Coordenadas del NACA 2412 (Anexo I)
│   └── tratamiento_resultados.m     # Gráficas de CD, CL y CL-CD (Anexo II)
├── geometria/
│   └── NACA2412_coordenadas.txt     # Coordenadas del perfil (cuerda de 1 m)
├── datos/
│   └── coeficientes_CL_CD.csv       # CL y CD por configuración y ángulo de ataque
└── docs/
    └── TFG_Jaime_Prieto_Gomez.pdf   # Memoria del TFG
```

## Configuración de la simulación

| Elemento | Valor |
|---|---|
| Código | ANSYS Fluent 2024 R1 |
| Tipo de simulación | 2D, estacionaria, flujo incompresible y turbulento |
| Modelo de turbulencia | RANS, k-ω SST |
| Fluido | Aire a 20 °C: ρ = 1,225 kg/m³, μ = 1,825·10⁻⁵ kg/(m·s) |
| Número de Reynolds | 783761 (cuerda de 1 m) |
| Velocidad del flujo | 11,6764 m/s en dirección +X |
| Ángulos de ataque | De −8° a 32°, en pasos de 4° |
| Dominio | Rectángulo de 12 × 8 m |
| Malla | Triangular: 21 mm en general y 14 mm en un círculo de 1,5 m de radio alrededor del perfil |
| Capas junto al contorno | Capas de 10 mm (Inflation): 10 capas para el perfil limpio y los spoilers menores, 5 para los mayores |
| Convergencia | Residuos de 10⁻³ (5·10⁻³ para k en algunos casos) |
| Geometría | Perfil con MATLAB y spoiler con Excel |

## Configuraciones del spoiler

Spoiler en el extradós definido por su posición *a*, su longitud *b* (ambas en % de la cuerda) y su ángulo δ respecto al extradós:

| a (%) | b (%) | δ (°) |
|---|---|---|
| 60 | 10 | 8, 15, 25 |
| 60 | 15 | 8, 15, 25 |

Más el perfil sin spoiler.

## Datos

`datos/coeficientes_CL_CD.csv` recoge, para cada configuración (`sin_spoiler`, `b10_d8`, …) y cada ángulo de ataque, los valores de CL y CD de las simulaciones. Una celda vacía indica que no hay dato para ese ángulo (en algunas configuraciones no se completaron todos los casos).

## Uso de los scripts

- `matlab/naca2412_coordenadas.m` calcula las coordenadas del perfil con las ecuaciones de la serie NACA de cuatro dígitos y las guarda en `NACA2412_coordenadas.txt`.
- `matlab/tratamiento_resultados.m` contiene los coeficientes de las simulaciones y dibuja CD y CL frente a α, y CL frente a CD.

## Referencia

S. D. Lindsay y P. Walsh, «Experimental investigation of spoiler deployment on wing stall», *Open Journal of Fluid Dynamics*, vol. 8, n.º 3, p. 308, 2018.

Las figuras 5.2, 5.4, 5.6, 5.8 y 5.10 de la memoria reproducen figuras de este trabajo con fines de comparación.

---

<a id="english"></a>

# Spoilers on a NACA 2412 airfoil · Bachelor's thesis (ANSYS Fluent)

**Computational study of the influence of different passive elements on the properties of airfoils**

Bachelor's thesis, Industrial Technologies Engineering, Universidad de Alcalá (submitted September 2024).
Author: Jaime Prieto Gómez · Supervisor: Francisco José Álvarez García.

## Summary

Steady 2D CFD simulations with ANSYS Fluent of a NACA 2412 airfoil with a spoiler on the upper surface, in six configurations, compared with the wind-tunnel tests of Lindsay and Walsh (2018). Lift, drag, pressure distribution and flow structure are studied for angles of attack from −8° to 32°.

- At low angles of attack, the spoiler reduces lift relative to the clean airfoil; at high angles, where the clean airfoil is already stalled, it keeps lift high.
- Maximum lift increases in four of the six configurations (up to +17.7%) and decreases in two.
- At α ≥ 20° the simulated drag is much higher than the experimental one; this is attributed to the limitations of a steady 2D model in representing the turbulent wake.

## Contents

- `matlab/naca2412_coordenadas.m`: NACA 2412 coordinates (Appendix I).
- `matlab/tratamiento_resultados.m`: plots of CD, CL and CL–CD (Appendix II).
- `geometria/NACA2412_coordenadas.txt`: airfoil coordinates (1 m chord).
- `datos/coeficientes_CL_CD.csv`: CL and CD per configuration and angle of attack.
- `docs/TFG_Jaime_Prieto_Gomez.pdf`: the thesis (in Spanish).

## Simulation setup

| Item | Value |
|---|---|
| Code | ANSYS Fluent 2024 R1 |
| Simulation type | 2D, steady, incompressible turbulent flow |
| Turbulence model | RANS, k-ω SST |
| Fluid | Air at 20 °C: ρ = 1.225 kg/m³, μ = 1.825·10⁻⁵ kg/(m·s) |
| Reynolds number | 783761 (1 m chord) |
| Flow velocity | 11.6764 m/s in the +X direction |
| Angles of attack | −8° to 32°, in 4° steps |
| Domain | 12 × 8 m rectangle |
| Mesh | Triangular: 21 mm overall and 14 mm in a circle of 1.5 m radius around the airfoil |
| Wall layers | 10 mm layers (Inflation): 10 layers for the clean airfoil and the smaller spoilers, 5 for the larger ones |
| Convergence | Residuals of 10⁻³ (5·10⁻³ for k in some cases) |
| Geometry | Airfoil with MATLAB and spoiler with Excel |

## Spoiler configurations

Upper-surface spoiler defined by its position *a*, length *b* (both as % of the chord) and angle δ relative to the upper surface: a = 60%, b = 10% and 15%, δ = 8°, 15° and 25°, plus the clean airfoil.

## Data

`datos/coeficientes_CL_CD.csv` lists the simulated CL and CD for each configuration (`sin_spoiler` = no spoiler, `b10_d8`, …) and angle of attack. An empty cell means there is no value for that angle.

## Reference

S. D. Lindsay and P. Walsh, "Experimental investigation of spoiler deployment on wing stall", *Open Journal of Fluid Dynamics*, vol. 8, no. 3, p. 308, 2018.

Figures 5.2, 5.4, 5.6, 5.8 and 5.10 of the thesis reproduce figures from this work for comparison purposes.
