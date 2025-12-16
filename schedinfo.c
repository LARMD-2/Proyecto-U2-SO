#include "types.h"
#include "stat.h"
#include "user.h"

// Tabla de nombres para los estados de proceso
char *state_names[] = {
  "UNUSED",
  "EMBRYO",
  "SLEEPING",
  "RUNNABLE",
  "RUNNING",
  "ZOMBIE"
};

int main(int argc, char *argv[])
{
  struct proc_info procs[64];  // Buffer para hasta 64 procesos
  int count, i;
  
  // Obtener información de todos los procesos
  count = getprocs(procs, 64);
  
  if(count < 0) {
    printf(1, "schedinfo: error al obtener información de procesos\n");
    exit();
  }
  
  // Imprimir encabezado
  printf(1, "PID    NAME       STATE\n");
  printf(1, "---    ----       -----\n");
  
  // Imprimir información de cada proceso
  for(i = 0; i < count; i++) {
    printf(1, "%d    %s       %s\n", 
           procs[i].pid, 
           procs[i].name,
           procs[i].state >= 0 && procs[i].state <= 5 ? state_names[procs[i].state] : "UNKNOWN");
  }
  
  printf(1, "\nTotal de procesos: %d\n", count);
  
  exit();
}
