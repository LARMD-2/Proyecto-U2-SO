#include "types.h"
#include "x86.h"
#include "defs.h"
#include "date.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"
#include "spinlock.h"

extern int syscall_tracing;

// Estructura de tabla de procesos (declarada en proc.c)
extern struct {
  struct spinlock lock;
  struct proc proc[NPROC];
} ptable;

// Estructura para información de procesos (definida en user.h para user-space)
struct proc_info {
  int pid;
  char name[16];
  int state;  // 0=UNUSED, 1=EMBRYO, 2=SLEEPING, 3=RUNNABLE, 4=RUNNING, 5=ZOMBIE
};

int
sys_fork(void)
{
  return fork();
}

int
sys_exit(void)
{
  exit();
  return 0;  // not reached
}

int
sys_wait(void)
{
  return wait();
}

int
sys_kill(void)
{
  int pid;

  if(argint(0, &pid) < 0)
    return -1;
  return kill(pid);
}

int
sys_getpid(void)
{
  return myproc()->pid;
}

int
sys_sbrk(void)
{
  int addr;
  int n;

  if(argint(0, &n) < 0)
    return -1;
  addr = myproc()->sz;
  if(growproc(n) < 0)
    return -1;
  return addr;
}

int
sys_sleep(void)
{
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
    return -1;
  acquire(&tickslock);
  ticks0 = ticks;
  while(ticks - ticks0 < n){
    if(myproc()->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
  return 0;
}

// return how many clock tick interrupts have occurred
// since start.
int
sys_uptime(void)
{
  uint xticks;

  acquire(&tickslock);
  xticks = ticks;
  release(&tickslock);
  return xticks;
}

int
sys_trace(void)
{
  int enable;

  if(argint(0, &enable) < 0)
    return -1;
  syscall_tracing = enable;  // Activa (1) o desactiva (0) el tracing de syscalls
  return 0;
}

// Syscall para obtener información de procesos
int
sys_getprocs(void)
{
  struct proc_info *buf;
  int max, count = 0;
  struct proc *p;

  if(argptr(0, (void*)&buf, sizeof(struct proc_info)) < 0)
    return -1;
  if(argint(1, &max) < 0)
    return -1;

  // Iterar sobre la tabla de procesos
  for(p = ptable.proc; p < &ptable.proc[NPROC] && count < max; p++){
    if(p->state != UNUSED){
      buf[count].pid = p->pid;
      strncpy(buf[count].name, p->name, 15);
      buf[count].name[15] = 0;
      buf[count].state = p->state;  // 0=UNUSED, 1=EMBRYO, 2=SLEEPING, 3=RUNNABLE, 4=RUNNING, 5=ZOMBIE
      count++;
    }
  }

  return count;  // Retorna el número de procesos obtenidos
}
