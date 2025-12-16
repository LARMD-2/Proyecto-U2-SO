#include "types.h"
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
  uint ticks;
  
  ticks = uptime();
  
  // Mostrar ticks y conversión aproximada a segundos
  // Asumiendo que hay aproximadamente 100 ticks por segundo en XV6
  printf(1, "Uptime: %d ticks (%d seconds)\n", ticks, ticks / 100);
  
  exit();
}
