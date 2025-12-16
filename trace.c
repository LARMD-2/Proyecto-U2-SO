#include "types.h"
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
  if(argc != 2){
    printf(2, "Uso: trace on|off\n");
    exit();
  }
  if(strcmp(argv[1], "on") == 0){
    trace(1);  // Activar tracing
    printf(1, "Tracing activado\n");
  } else if(strcmp(argv[1], "off") == 0){
    trace(0);  // Desactivar tracing
    printf(1, "Tracing desactivado\n");
  } else {
    printf(2, "Argumento invalido: use 'on' o 'off'\n");
    exit();
  }
  exit();
}