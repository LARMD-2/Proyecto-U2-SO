#include "types.h"
#include "defs.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"
#include "x86.h"
#include "syscall.h"
#include "stat.h"

//variable para activar el trazado de syscalls
int syscall_tracing = 0;


// arreglo de nombres de syscalls para el trazado
static char *syscall_names[] = {
  "",
  "fork", "exit", "wait", "pipe", "read", "kill", "exec",
  "fstat", "chdir", "dup", "getpid", "sbrk", "sleep",
  "uptime", "open", "write", "mknod", "unlink",
  "link", "mkdir", "close", "trace"
};

// User code makes a system call with INT T_SYSCALL.
// System call number in %eax.
// Arguments on the stack, from the user call to the C
// library system call function. The saved user %esp points
// to a saved program counter, and then the first argument.

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  struct proc *curproc = myproc();

  if(addr >= curproc->sz || addr+4 > curproc->sz)
    return -1;
  *ip = *(int*)(addr);
  return 0;
}

// Fetch the nul-terminated string at addr from the current process.
// Doesn't actually copy the string - just sets *pp to point at it.
// Returns length of string, not including nul.
int
fetchstr(uint addr, char **pp)
{
  char *s, *ep;
  struct proc *curproc = myproc();

  if(addr >= curproc->sz)
    return -1;
  *pp = (char*)addr;
  ep = (char*)curproc->sz;
  for(s = *pp; s < ep; s++){
    if(*s == 0)
      return s - *pp;
  }
  return -1;
}

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
}

// Fetch the nth word-sized system call argument as a pointer
// to a block of memory of size bytes.  Check that the pointer
// lies within the process address space.
int
argptr(int n, char **pp, int size)
{
  int i;
  struct proc *curproc = myproc();
 
  if(argint(n, &i) < 0)
    return -1;
  if(size < 0 || (uint)i >= curproc->sz || (uint)i+size > curproc->sz)
    return -1;
  *pp = (char*)i;
  return 0;
}

// Fetch the nth word-sized system call argument as a string pointer.
// Check that the pointer is valid and the string is nul-terminated.
// (There is no shared writable memory, so the string can't change
// between this check and being used by the kernel.)
int
argstr(int n, char **pp)
{
  int addr;
  if(argint(n, &addr) < 0)
    return -1;
  return fetchstr(addr, pp);
}

extern int sys_chdir(void);
extern int sys_close(void);
extern int sys_dup(void);
extern int sys_exec(void);
extern int sys_exit(void);
extern int sys_fork(void);
extern int sys_fstat(void);
extern int sys_getpid(void);
extern int sys_kill(void);
extern int sys_link(void);
extern int sys_mkdir(void);
extern int sys_mknod(void);
extern int sys_open(void);
extern int sys_pipe(void);
extern int sys_read(void);
extern int sys_sbrk(void);
extern int sys_sleep(void);
extern int sys_unlink(void);
extern int sys_wait(void);
extern int sys_write(void);
extern int sys_uptime(void);
extern int sys_trace(void);  // Nueva syscall para tracing

static int (*syscalls[])(void) = {
[SYS_fork]    sys_fork,
[SYS_exit]    sys_exit,
[SYS_wait]    sys_wait,
[SYS_pipe]    sys_pipe,
[SYS_read]    sys_read,
[SYS_kill]    sys_kill,
[SYS_exec]    sys_exec,
[SYS_fstat]   sys_fstat,
[SYS_chdir]   sys_chdir,
[SYS_dup]     sys_dup,
[SYS_getpid]  sys_getpid,
[SYS_sbrk]    sys_sbrk,
[SYS_sleep]   sys_sleep,
[SYS_uptime]  sys_uptime,
[SYS_open]    sys_open,
[SYS_write]   sys_write,
[SYS_mknod]   sys_mknod,
[SYS_unlink]  sys_unlink,
[SYS_link]    sys_link,
[SYS_mkdir]   sys_mkdir,
[SYS_close]   sys_close,
[SYS_trace]   sys_trace,  // Nueva syscall para tracing
};

void
syscall(void)
{
  int num;
  struct proc *curproc = myproc();

  num = curproc->tf->eax;
  // Si el trazado de syscalls está activado, imprimir el nombre de la syscall
  if(syscall_tracing && num > 0 && num < NELEM(syscall_names) && syscall_names[num]) {
    cprintf("syscall: %s", syscall_names[num]);
    switch(num){
      case SYS_fork:
        // 0 parámetros
        break;
      case SYS_exit:
        {
          int status;
          if(argint(0, &status) >= 0)
            cprintf("(%d)", status);
        }
        break;
      case SYS_wait:
        // 0 parámetros
        break;
      case SYS_pipe:
        {
          int *p;
          if(argptr(0, (char**)&p, sizeof(int)*2) >= 0)
            cprintf("(%p)", p);
        }
        break;
      case SYS_read:
        {
          int fd, n;
          char *buf;
          if(argint(0, &fd) >= 0 && argptr(1, &buf, 1) >= 0 && argint(2, &n) >= 0)
            cprintf("(%d, %p, %d)", fd, buf, n);
        }
        break;
      case SYS_kill:
        {
          int pid;
          if(argint(0, &pid) >= 0)
            cprintf("(%d)", pid);
        }
        break;
      case SYS_exec:
        {
          char *path, *argv;
          if(argstr(0, &path) >= 0 && argptr(1, &argv, 1) >= 0)
            cprintf("(\"%s\", %p)", path, argv);
        }
        break;
      case SYS_fstat:
        {
          int fd;
          struct stat *st;
          if(argint(0, &fd) >= 0 && argptr(1, (char**)&st, sizeof(*st)) >= 0)
            cprintf("(%d, %p)", fd, st);
        }
        break;
      case SYS_chdir:
        {
          char *path;
          if(argstr(0, &path) >= 0)
            cprintf("(\"%s\")", path);
        }
        break;
      case SYS_dup:
        {
          int fd;
          if(argint(0, &fd) >= 0)
            cprintf("(%d)", fd);
        }
        break;
      case SYS_getpid:
        // 0 parámetros
        break;
      case SYS_sbrk:
        {
          int n;
          if(argint(0, &n) >= 0)
            cprintf("(%d)", n);
        }
        break;
      case SYS_sleep:
        {
          int n;
          if(argint(0, &n) >= 0)
            cprintf("(%d)", n);
        }
        break;
      case SYS_uptime:
        // 0 parámetros
        break;
      case SYS_open:
        {
          char *path;
          int omode;
          if(argstr(0, &path) >= 0 && argint(1, &omode) >= 0)
            cprintf("(\"%s\", %d)", path, omode);
        }
        break;
      case SYS_write:
        {
          int fd, n;
          char *buf;
          if(argint(0, &fd) >= 0 && argptr(1, &buf, 1) >= 0 && argint(2, &n) >= 0)
            cprintf("(%d, %p, %d)", fd, buf, n);
        }
        break;
      case SYS_mknod:
        {
          char *path;
          short major, minor;
          if(argstr(0, &path) >= 0 && argint(1, (int*)&major) >= 0 && argint(2, (int*)&minor) >= 0)
            cprintf("(\"%s\", %d, %d)", path, major, minor);
        }
        break;
      case SYS_unlink:
        {
          char *path;
          if(argstr(0, &path) >= 0)
            cprintf("(\"%s\")", path);
        }
        break;
      case SYS_link:
        {
          char *old, *new;
          if(argstr(0, &old) >= 0 && argstr(1, &new) >= 0)
            cprintf("(\"%s\", \"%s\")", old, new);
        }
        break;
      case SYS_mkdir:
        {
          char *path;
          if(argstr(0, &path) >= 0)
            cprintf("(\"%s\")", path);
        }
        break;
      case SYS_close:
        {
          int fd;
          if(argint(0, &fd) >= 0)
            cprintf("(%d)", fd);
        }
        break;
      case SYS_trace:
        {
          int enable;
          if(argint(0, &enable) >= 0)
            cprintf("(%d)", enable);
        }
        break;
      default:
        // Para syscalls no manejadas, no imprimir params
        break;
    }
    cprintf("\n");
  }
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
    curproc->tf->eax = syscalls[num]();
  } else {
    cprintf("%d %s: unknown sys call %d\n",
            curproc->pid, curproc->name, num);
    curproc->tf->eax = -1;
  }
}
