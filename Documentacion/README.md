# Integrantes

1. Russell Jhean Paul Arratia Paz       2023-119004
2. Nelly Adriana Carita Pinchi          2023-119007

# Guía de Uso - XV6 con Nuevas Funcionalidades

Este documento explica cómo compilar, ejecutar y utilizar las nuevas funcionalidades implementadas en XV6.

---

## Tabla de Contenidos
1. [Compilación y Ejecución](#compilación-y-ejecución)
2. [Tracer (Entregable 1)](#tracer-entregable-1)
3. [Uptime Extendido (Entregable 2)](#uptime-extendido-entregable-2)
4. [Schedinfo (Entregable 2)](#schedinfo-entregable-2)
5. [Count (Entregable 2)](#count-entregable-2)

---

## Compilación y Ejecución

### Compilar el proyecto
```bash
cd /home/adriana/Desktop/Proyecto-U2-SO
make clean
make
```

### Ejecutar en QEMU
```bash
make qemu
```

Verás el prompt de XV6:
```
xv6...
cpu0: starting
...
init: starting sh
$
```

### Salir de QEMU
Presiona `Ctrl+A` luego `X`, o simplemente `Ctrl+C`.

---

## Tracer (Entregable 1)

El tracer permite monitorear y registrar todas las llamadas al sistema (syscalls) que se ejecutan.

### Activar el trazado

```bash
$ trace 1
```

O usando el comando:

```bash
$ trace on
```

### Ver syscalls mientras se ejecutan

Una vez activado, cualquier comando que ejecutes mostrará las syscalls:

```bash
$ trace 1
$ uptime
syscall: uptime
Uptime: 1234 ticks (12 seconds)
```

### Desactivar el trazado

```bash
$ trace 0
```

O usando el comando:

```bash
$ trace off
```

### Ejemplo completo

```bash
$ trace on              # Activar trazado
$ schedinfo             # Ejecutar schedinfo - verás syscall: getprocs
PID    NAME       STATE
---    ----       -----
1      init       RUNNING
...
$ trace off             # Desactivar trazado
$ schedinfo             # Sin mensajes de trazado
PID    NAME       STATE
...
```

---

## Uptime Extendido (Entregable 2)

Muestra el tiempo que ha estado activo el sistema desde el último inicio.

### Uso básico

```bash
$ uptime
```

### Salida esperada

```
Uptime: 1234 ticks (12 seconds)
```

Donde:
- **ticks**: número de interrupciones de reloj transcurridas
- **seconds**: conversión aproximada (dividiendo ticks entre 100, ya que XV6 usa ~100 ticks/segundo)

### Ejemplos

```bash
$ uptime
Uptime: 100 ticks (1 seconds)

$ uptime
Uptime: 500 ticks (5 seconds)

$ uptime
Uptime: 2000 ticks (20 seconds)
```

### Con trazado activado

```bash
$ trace 1
$ uptime
syscall: uptime
Uptime: 1234 ticks (12 seconds)
```

---

## Schedinfo (Entregable 2)

Muestra información sobre todos los procesos activos en el sistema.

### Uso básico

```bash
$ schedinfo
```

### Salida esperada

```
PID    NAME       STATE
---    ----       -----
1      init       SLEEPING
2      sh         RUNNING
3      schedinfo  RUNNING
...
Total de procesos: X
```

### Significado de campos

- **PID**: Identificador único del proceso
- **NAME**: Nombre del proceso
- **STATE**: Estado actual del proceso:
  - `UNUSED`: Slot no utilizado
  - `EMBRYO`: Proceso siendo creado
  - `SLEEPING`: Esperando un evento (bloqueado)
  - `RUNNABLE`: Listo para ejecutar
  - `RUNNING`: Actualmente ejecutándose
  - `ZOMBIE`: Terminado, esperando que parent haga wait()

### Ejemplos

**Ejemplo 1: Estado inicial**
```bash
$ schedinfo
PID    NAME       STATE
---    ----       -----
1      init       SLEEPING
2      sh         RUNNING
3      schedinfo  RUNNING
Total de procesos: 3
```

**Ejemplo 2: Con trazado activado**
```bash
$ trace 1
$ schedinfo
syscall: getprocs
PID    NAME       STATE
---    ----       -----
1      init       SLEEPING
2      sh         SLEEPING
3      schedinfo  RUNNING
Total de procesos: 3
```

**Ejemplo 3: Cambios de estado**

Ejecuta `schedinfo` varias veces rápidamente. Notarás que los estados cambian:

```bash
$ schedinfo
PID    NAME       STATE
---    ----       -----
1      init       RUNNING
2      sh         SLEEPING
Total de procesos: 2

$ schedinfo
PID    NAME       STATE
---    ----       -----
1      init       SLEEPING
2      sh         RUNNING
Total de procesos: 2
```

---

## Count (Entregable 3)

Registra y muestra el contador de syscalls que se han ejecutado.

### Uso básico

```bash
$ count
```

### Salida esperada

Muestra el número total de syscalls ejecutadas desde el inicio del sistema:

```
Total syscalls executed: 1234
```

### Ejemplos

```bash
$ count
Total syscalls executed: 50

$ uptime
Uptime: 100 ticks (1 seconds)

$ count
Total syscalls executed: 52
```

**Nota**: El contador se incrementa cada vez que se ejecuta una syscall en el kernel.

### Con trazado activado

```bash
$ trace 1
$ count
syscall: count
Total syscalls executed: 100
```

---

## Casos de Uso Combinados

### Monitoreo completo del sistema

```bash
$ trace 1              # Activar trazado
$ uptime               # Ver uptime
$ schedinfo            # Ver procesos
$ count                # Ver contador de syscalls
$ trace 0              # Desactivar trazado
```

### Observar cambios en tiempo real

```bash
$ schedinfo
$ schedinfo
$ schedinfo
```

Ejecuta esto varias veces y observa cómo cambian los estados de los procesos.

### Verificar actividad del sistema

```bash
$ count                # Obtener línea base
$ uptime
$ uptime
$ uptime
$ count                # Comparar incremento
```

---