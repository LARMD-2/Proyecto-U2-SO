#include "types.h"
#include "stat.h"
#include "user.h"

#define MAX_SYSCALLS 25  // Ajustar según NELEM(syscalls)

int
main(int argc, char *argv[])
{
  unsigned int counts[MAX_SYSCALLS];
  char *names[] = {
    "", "fork", "exit", "wait", "pipe", "read", "kill", "exec",
    "fstat", "chdir", "dup", "getpid", "sbrk", "sleep",
    "uptime", "open", "write", "mknod", "unlink",
    "link", "mkdir", "close", "trace", "getprocs", "getcounts"
  };

  if(getcounts(counts) < 0){
    printf(2, "Error al obtener contadores\n");
    exit();
  }

  if(argc == 1){
    // Sin parámetros: mostrar resumen
    printf(1, "Contadores de syscalls:\n");
    for(int i = 1; i < MAX_SYSCALLS; i++){
      if(counts[i] > 0){
        printf(1, "%s: %d\n", names[i], counts[i]);
      }
    }
  } else if(argc == 2){
    // Con parámetro: mostrar contador específico
    int num = atoi(argv[1]);
    if(num < 1 || num >= MAX_SYSCALLS){
      printf(2, "Número de syscall inválido\n");
      exit();
    }
    printf(1, "%s: %d\n", names[num], counts[num]);
  } else {
    printf(2, "Uso: count [número de syscall]\n");
    exit();
  }
  exit();
}