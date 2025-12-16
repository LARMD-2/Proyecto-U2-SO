
_schedinfo:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  "RUNNING",
  "ZOMBIE"
};

int main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
  struct proc_info procs[64];  // Buffer para hasta 64 procesos
  int count, i;
  
  // Obtener información de todos los procesos
  count = getprocs(procs, 64);
   f:	8d 85 e8 f9 ff ff    	lea    -0x618(%ebp),%eax
{
  15:	53                   	push   %ebx
  16:	51                   	push   %ecx
  17:	81 ec 10 06 00 00    	sub    $0x610,%esp
  count = getprocs(procs, 64);
  1d:	6a 40                	push   $0x40
  1f:	50                   	push   %eax
  20:	e8 86 03 00 00       	call   3ab <getprocs>
  
  if(count < 0) {
  25:	83 c4 10             	add    $0x10,%esp
  28:	85 c0                	test   %eax,%eax
  2a:	78 7c                	js     a8 <main+0xa8>
    printf(1, "schedinfo: error al obtener información de procesos\n");
    exit();
  }
  
  // Imprimir encabezado
  printf(1, "PID    NAME       STATE\n");
  2c:	52                   	push   %edx
  2d:	89 c7                	mov    %eax,%edi
  2f:	52                   	push   %edx
  30:	68 70 07 00 00       	push   $0x770
  35:	6a 01                	push   $0x1
  37:	e8 24 04 00 00       	call   460 <printf>
  printf(1, "---    ----       -----\n");
  3c:	59                   	pop    %ecx
  3d:	5b                   	pop    %ebx
  3e:	68 89 07 00 00       	push   $0x789
  43:	6a 01                	push   $0x1
  45:	e8 16 04 00 00       	call   460 <printf>
  
  // Imprimir información de cada proceso
  for(i = 0; i < count; i++) {
  4a:	83 c4 10             	add    $0x10,%esp
  4d:	85 ff                	test   %edi,%edi
  4f:	74 44                	je     95 <main+0x95>
  51:	8d 9d ec f9 ff ff    	lea    -0x614(%ebp),%ebx
  57:	31 f6                	xor    %esi,%esi
  59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    printf(1, "%d    %s       %s\n", 
           procs[i].pid, 
           procs[i].name,
           procs[i].state >= 0 && procs[i].state <= 5 ? state_names[procs[i].state] : "UNKNOWN");
  60:	8b 53 10             	mov    0x10(%ebx),%edx
    printf(1, "%d    %s       %s\n", 
  63:	b8 68 07 00 00       	mov    $0x768,%eax
  68:	83 fa 05             	cmp    $0x5,%edx
  6b:	77 07                	ja     74 <main+0x74>
  6d:	8b 04 95 3c 0b 00 00 	mov    0xb3c(,%edx,4),%eax
  74:	83 ec 0c             	sub    $0xc,%esp
  for(i = 0; i < count; i++) {
  77:	83 c6 01             	add    $0x1,%esi
    printf(1, "%d    %s       %s\n", 
  7a:	50                   	push   %eax
  7b:	53                   	push   %ebx
  for(i = 0; i < count; i++) {
  7c:	83 c3 18             	add    $0x18,%ebx
    printf(1, "%d    %s       %s\n", 
  7f:	ff 73 e4             	push   -0x1c(%ebx)
  82:	68 a2 07 00 00       	push   $0x7a2
  87:	6a 01                	push   $0x1
  89:	e8 d2 03 00 00       	call   460 <printf>
  for(i = 0; i < count; i++) {
  8e:	83 c4 20             	add    $0x20,%esp
  91:	39 f7                	cmp    %esi,%edi
  93:	75 cb                	jne    60 <main+0x60>
  }
  
  printf(1, "\nTotal de procesos: %d\n", count);
  95:	50                   	push   %eax
  96:	57                   	push   %edi
  97:	68 b5 07 00 00       	push   $0x7b5
  9c:	6a 01                	push   $0x1
  9e:	e8 bd 03 00 00       	call   460 <printf>
  
  exit();
  a3:	e8 5b 02 00 00       	call   303 <exit>
    printf(1, "schedinfo: error al obtener información de procesos\n");
  a8:	56                   	push   %esi
  a9:	56                   	push   %esi
  aa:	68 04 08 00 00       	push   $0x804
  af:	6a 01                	push   $0x1
  b1:	e8 aa 03 00 00       	call   460 <printf>
    exit();
  b6:	e8 48 02 00 00       	call   303 <exit>
  bb:	66 90                	xchg   %ax,%ax
  bd:	66 90                	xchg   %ax,%ax
  bf:	90                   	nop

000000c0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  c0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  c1:	31 c0                	xor    %eax,%eax
{
  c3:	89 e5                	mov    %esp,%ebp
  c5:	53                   	push   %ebx
  c6:	8b 4d 08             	mov    0x8(%ebp),%ecx
  c9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
  d0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  d4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  d7:	83 c0 01             	add    $0x1,%eax
  da:	84 d2                	test   %dl,%dl
  dc:	75 f2                	jne    d0 <strcpy+0x10>
    ;
  return os;
}
  de:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  e1:	89 c8                	mov    %ecx,%eax
  e3:	c9                   	leave
  e4:	c3                   	ret
  e5:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  ec:	00 
  ed:	8d 76 00             	lea    0x0(%esi),%esi

000000f0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  f0:	55                   	push   %ebp
  f1:	89 e5                	mov    %esp,%ebp
  f3:	53                   	push   %ebx
  f4:	8b 55 08             	mov    0x8(%ebp),%edx
  f7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  fa:	0f b6 02             	movzbl (%edx),%eax
  fd:	84 c0                	test   %al,%al
  ff:	75 17                	jne    118 <strcmp+0x28>
 101:	eb 3a                	jmp    13d <strcmp+0x4d>
 103:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 108:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 10c:	83 c2 01             	add    $0x1,%edx
 10f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 112:	84 c0                	test   %al,%al
 114:	74 1a                	je     130 <strcmp+0x40>
 116:	89 d9                	mov    %ebx,%ecx
 118:	0f b6 19             	movzbl (%ecx),%ebx
 11b:	38 c3                	cmp    %al,%bl
 11d:	74 e9                	je     108 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 11f:	29 d8                	sub    %ebx,%eax
}
 121:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 124:	c9                   	leave
 125:	c3                   	ret
 126:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 12d:	00 
 12e:	66 90                	xchg   %ax,%ax
  return (uchar)*p - (uchar)*q;
 130:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 134:	31 c0                	xor    %eax,%eax
 136:	29 d8                	sub    %ebx,%eax
}
 138:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 13b:	c9                   	leave
 13c:	c3                   	ret
  return (uchar)*p - (uchar)*q;
 13d:	0f b6 19             	movzbl (%ecx),%ebx
 140:	31 c0                	xor    %eax,%eax
 142:	eb db                	jmp    11f <strcmp+0x2f>
 144:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 14b:	00 
 14c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000150 <strlen>:

uint
strlen(const char *s)
{
 150:	55                   	push   %ebp
 151:	89 e5                	mov    %esp,%ebp
 153:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 156:	80 3a 00             	cmpb   $0x0,(%edx)
 159:	74 15                	je     170 <strlen+0x20>
 15b:	31 c0                	xor    %eax,%eax
 15d:	8d 76 00             	lea    0x0(%esi),%esi
 160:	83 c0 01             	add    $0x1,%eax
 163:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 167:	89 c1                	mov    %eax,%ecx
 169:	75 f5                	jne    160 <strlen+0x10>
    ;
  return n;
}
 16b:	89 c8                	mov    %ecx,%eax
 16d:	5d                   	pop    %ebp
 16e:	c3                   	ret
 16f:	90                   	nop
  for(n = 0; s[n]; n++)
 170:	31 c9                	xor    %ecx,%ecx
}
 172:	5d                   	pop    %ebp
 173:	89 c8                	mov    %ecx,%eax
 175:	c3                   	ret
 176:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 17d:	00 
 17e:	66 90                	xchg   %ax,%ax

00000180 <memset>:

void*
memset(void *dst, int c, uint n)
{
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	57                   	push   %edi
 184:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 187:	8b 4d 10             	mov    0x10(%ebp),%ecx
 18a:	8b 45 0c             	mov    0xc(%ebp),%eax
 18d:	89 d7                	mov    %edx,%edi
 18f:	fc                   	cld
 190:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 192:	8b 7d fc             	mov    -0x4(%ebp),%edi
 195:	89 d0                	mov    %edx,%eax
 197:	c9                   	leave
 198:	c3                   	ret
 199:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001a0 <strchr>:

char*
strchr(const char *s, char c)
{
 1a0:	55                   	push   %ebp
 1a1:	89 e5                	mov    %esp,%ebp
 1a3:	8b 45 08             	mov    0x8(%ebp),%eax
 1a6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1aa:	0f b6 10             	movzbl (%eax),%edx
 1ad:	84 d2                	test   %dl,%dl
 1af:	75 12                	jne    1c3 <strchr+0x23>
 1b1:	eb 1d                	jmp    1d0 <strchr+0x30>
 1b3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 1b8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 1bc:	83 c0 01             	add    $0x1,%eax
 1bf:	84 d2                	test   %dl,%dl
 1c1:	74 0d                	je     1d0 <strchr+0x30>
    if(*s == c)
 1c3:	38 d1                	cmp    %dl,%cl
 1c5:	75 f1                	jne    1b8 <strchr+0x18>
      return (char*)s;
  return 0;
}
 1c7:	5d                   	pop    %ebp
 1c8:	c3                   	ret
 1c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 1d0:	31 c0                	xor    %eax,%eax
}
 1d2:	5d                   	pop    %ebp
 1d3:	c3                   	ret
 1d4:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1db:	00 
 1dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000001e0 <gets>:

char*
gets(char *buf, int max)
{
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	57                   	push   %edi
 1e4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 1e5:	8d 75 e7             	lea    -0x19(%ebp),%esi
{
 1e8:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 1e9:	31 db                	xor    %ebx,%ebx
{
 1eb:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 1ee:	eb 27                	jmp    217 <gets+0x37>
    cc = read(0, &c, 1);
 1f0:	83 ec 04             	sub    $0x4,%esp
 1f3:	6a 01                	push   $0x1
 1f5:	56                   	push   %esi
 1f6:	6a 00                	push   $0x0
 1f8:	e8 1e 01 00 00       	call   31b <read>
    if(cc < 1)
 1fd:	83 c4 10             	add    $0x10,%esp
 200:	85 c0                	test   %eax,%eax
 202:	7e 1d                	jle    221 <gets+0x41>
      break;
    buf[i++] = c;
 204:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 208:	8b 55 08             	mov    0x8(%ebp),%edx
 20b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 20f:	3c 0a                	cmp    $0xa,%al
 211:	74 10                	je     223 <gets+0x43>
 213:	3c 0d                	cmp    $0xd,%al
 215:	74 0c                	je     223 <gets+0x43>
  for(i=0; i+1 < max; ){
 217:	89 df                	mov    %ebx,%edi
 219:	83 c3 01             	add    $0x1,%ebx
 21c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 21f:	7c cf                	jl     1f0 <gets+0x10>
 221:	89 fb                	mov    %edi,%ebx
      break;
  }
  buf[i] = '\0';
 223:	8b 45 08             	mov    0x8(%ebp),%eax
 226:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
 22a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 22d:	5b                   	pop    %ebx
 22e:	5e                   	pop    %esi
 22f:	5f                   	pop    %edi
 230:	5d                   	pop    %ebp
 231:	c3                   	ret
 232:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 239:	00 
 23a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000240 <stat>:

int
stat(const char *n, struct stat *st)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	56                   	push   %esi
 244:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 245:	83 ec 08             	sub    $0x8,%esp
 248:	6a 00                	push   $0x0
 24a:	ff 75 08             	push   0x8(%ebp)
 24d:	e8 f1 00 00 00       	call   343 <open>
  if(fd < 0)
 252:	83 c4 10             	add    $0x10,%esp
 255:	85 c0                	test   %eax,%eax
 257:	78 27                	js     280 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 259:	83 ec 08             	sub    $0x8,%esp
 25c:	ff 75 0c             	push   0xc(%ebp)
 25f:	89 c3                	mov    %eax,%ebx
 261:	50                   	push   %eax
 262:	e8 f4 00 00 00       	call   35b <fstat>
  close(fd);
 267:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 26a:	89 c6                	mov    %eax,%esi
  close(fd);
 26c:	e8 ba 00 00 00       	call   32b <close>
  return r;
 271:	83 c4 10             	add    $0x10,%esp
}
 274:	8d 65 f8             	lea    -0x8(%ebp),%esp
 277:	89 f0                	mov    %esi,%eax
 279:	5b                   	pop    %ebx
 27a:	5e                   	pop    %esi
 27b:	5d                   	pop    %ebp
 27c:	c3                   	ret
 27d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 280:	be ff ff ff ff       	mov    $0xffffffff,%esi
 285:	eb ed                	jmp    274 <stat+0x34>
 287:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 28e:	00 
 28f:	90                   	nop

00000290 <atoi>:

int
atoi(const char *s)
{
 290:	55                   	push   %ebp
 291:	89 e5                	mov    %esp,%ebp
 293:	53                   	push   %ebx
 294:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 297:	0f be 02             	movsbl (%edx),%eax
 29a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 29d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 2a0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 2a5:	77 1e                	ja     2c5 <atoi+0x35>
 2a7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 2ae:	00 
 2af:	90                   	nop
    n = n*10 + *s++ - '0';
 2b0:	83 c2 01             	add    $0x1,%edx
 2b3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 2b6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 2ba:	0f be 02             	movsbl (%edx),%eax
 2bd:	8d 58 d0             	lea    -0x30(%eax),%ebx
 2c0:	80 fb 09             	cmp    $0x9,%bl
 2c3:	76 eb                	jbe    2b0 <atoi+0x20>
  return n;
}
 2c5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2c8:	89 c8                	mov    %ecx,%eax
 2ca:	c9                   	leave
 2cb:	c3                   	ret
 2cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000002d0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2d0:	55                   	push   %ebp
 2d1:	89 e5                	mov    %esp,%ebp
 2d3:	57                   	push   %edi
 2d4:	8b 45 10             	mov    0x10(%ebp),%eax
 2d7:	8b 55 08             	mov    0x8(%ebp),%edx
 2da:	56                   	push   %esi
 2db:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2de:	85 c0                	test   %eax,%eax
 2e0:	7e 13                	jle    2f5 <memmove+0x25>
 2e2:	01 d0                	add    %edx,%eax
  dst = vdst;
 2e4:	89 d7                	mov    %edx,%edi
 2e6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 2ed:	00 
 2ee:	66 90                	xchg   %ax,%ax
    *dst++ = *src++;
 2f0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 2f1:	39 f8                	cmp    %edi,%eax
 2f3:	75 fb                	jne    2f0 <memmove+0x20>
  return vdst;
}
 2f5:	5e                   	pop    %esi
 2f6:	89 d0                	mov    %edx,%eax
 2f8:	5f                   	pop    %edi
 2f9:	5d                   	pop    %ebp
 2fa:	c3                   	ret

000002fb <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2fb:	b8 01 00 00 00       	mov    $0x1,%eax
 300:	cd 40                	int    $0x40
 302:	c3                   	ret

00000303 <exit>:
SYSCALL(exit)
 303:	b8 02 00 00 00       	mov    $0x2,%eax
 308:	cd 40                	int    $0x40
 30a:	c3                   	ret

0000030b <wait>:
SYSCALL(wait)
 30b:	b8 03 00 00 00       	mov    $0x3,%eax
 310:	cd 40                	int    $0x40
 312:	c3                   	ret

00000313 <pipe>:
SYSCALL(pipe)
 313:	b8 04 00 00 00       	mov    $0x4,%eax
 318:	cd 40                	int    $0x40
 31a:	c3                   	ret

0000031b <read>:
SYSCALL(read)
 31b:	b8 05 00 00 00       	mov    $0x5,%eax
 320:	cd 40                	int    $0x40
 322:	c3                   	ret

00000323 <write>:
SYSCALL(write)
 323:	b8 10 00 00 00       	mov    $0x10,%eax
 328:	cd 40                	int    $0x40
 32a:	c3                   	ret

0000032b <close>:
SYSCALL(close)
 32b:	b8 15 00 00 00       	mov    $0x15,%eax
 330:	cd 40                	int    $0x40
 332:	c3                   	ret

00000333 <kill>:
SYSCALL(kill)
 333:	b8 06 00 00 00       	mov    $0x6,%eax
 338:	cd 40                	int    $0x40
 33a:	c3                   	ret

0000033b <exec>:
SYSCALL(exec)
 33b:	b8 07 00 00 00       	mov    $0x7,%eax
 340:	cd 40                	int    $0x40
 342:	c3                   	ret

00000343 <open>:
SYSCALL(open)
 343:	b8 0f 00 00 00       	mov    $0xf,%eax
 348:	cd 40                	int    $0x40
 34a:	c3                   	ret

0000034b <mknod>:
SYSCALL(mknod)
 34b:	b8 11 00 00 00       	mov    $0x11,%eax
 350:	cd 40                	int    $0x40
 352:	c3                   	ret

00000353 <unlink>:
SYSCALL(unlink)
 353:	b8 12 00 00 00       	mov    $0x12,%eax
 358:	cd 40                	int    $0x40
 35a:	c3                   	ret

0000035b <fstat>:
SYSCALL(fstat)
 35b:	b8 08 00 00 00       	mov    $0x8,%eax
 360:	cd 40                	int    $0x40
 362:	c3                   	ret

00000363 <link>:
SYSCALL(link)
 363:	b8 13 00 00 00       	mov    $0x13,%eax
 368:	cd 40                	int    $0x40
 36a:	c3                   	ret

0000036b <mkdir>:
SYSCALL(mkdir)
 36b:	b8 14 00 00 00       	mov    $0x14,%eax
 370:	cd 40                	int    $0x40
 372:	c3                   	ret

00000373 <chdir>:
SYSCALL(chdir)
 373:	b8 09 00 00 00       	mov    $0x9,%eax
 378:	cd 40                	int    $0x40
 37a:	c3                   	ret

0000037b <dup>:
SYSCALL(dup)
 37b:	b8 0a 00 00 00       	mov    $0xa,%eax
 380:	cd 40                	int    $0x40
 382:	c3                   	ret

00000383 <getpid>:
SYSCALL(getpid)
 383:	b8 0b 00 00 00       	mov    $0xb,%eax
 388:	cd 40                	int    $0x40
 38a:	c3                   	ret

0000038b <sbrk>:
SYSCALL(sbrk)
 38b:	b8 0c 00 00 00       	mov    $0xc,%eax
 390:	cd 40                	int    $0x40
 392:	c3                   	ret

00000393 <sleep>:
SYSCALL(sleep)
 393:	b8 0d 00 00 00       	mov    $0xd,%eax
 398:	cd 40                	int    $0x40
 39a:	c3                   	ret

0000039b <uptime>:
SYSCALL(uptime)
 39b:	b8 0e 00 00 00       	mov    $0xe,%eax
 3a0:	cd 40                	int    $0x40
 3a2:	c3                   	ret

000003a3 <trace>:
SYSCALL(trace)  // Enlace para la syscall de tracing
 3a3:	b8 16 00 00 00       	mov    $0x16,%eax
 3a8:	cd 40                	int    $0x40
 3aa:	c3                   	ret

000003ab <getprocs>:
SYSCALL(getprocs)  // Enlace para la syscall de obtener info de procesos
 3ab:	b8 17 00 00 00       	mov    $0x17,%eax
 3b0:	cd 40                	int    $0x40
 3b2:	c3                   	ret

000003b3 <getcounts>:
SYSCALL(getcounts)  // Enlace para la syscall de obtener contadores de syscalls
 3b3:	b8 18 00 00 00       	mov    $0x18,%eax
 3b8:	cd 40                	int    $0x40
 3ba:	c3                   	ret
 3bb:	66 90                	xchg   %ax,%ax
 3bd:	66 90                	xchg   %ax,%ax
 3bf:	90                   	nop

000003c0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 3c0:	55                   	push   %ebp
 3c1:	89 e5                	mov    %esp,%ebp
 3c3:	57                   	push   %edi
 3c4:	56                   	push   %esi
 3c5:	53                   	push   %ebx
 3c6:	89 cb                	mov    %ecx,%ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 3c8:	89 d1                	mov    %edx,%ecx
{
 3ca:	83 ec 3c             	sub    $0x3c,%esp
 3cd:	89 45 c0             	mov    %eax,-0x40(%ebp)
  if(sgn && xx < 0){
 3d0:	85 d2                	test   %edx,%edx
 3d2:	0f 89 80 00 00 00    	jns    458 <printint+0x98>
 3d8:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 3dc:	74 7a                	je     458 <printint+0x98>
    x = -xx;
 3de:	f7 d9                	neg    %ecx
    neg = 1;
 3e0:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
 3e5:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 3e8:	31 f6                	xor    %esi,%esi
 3ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 3f0:	89 c8                	mov    %ecx,%eax
 3f2:	31 d2                	xor    %edx,%edx
 3f4:	89 f7                	mov    %esi,%edi
 3f6:	f7 f3                	div    %ebx
 3f8:	8d 76 01             	lea    0x1(%esi),%esi
 3fb:	0f b6 92 94 08 00 00 	movzbl 0x894(%edx),%edx
 402:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
 406:	89 ca                	mov    %ecx,%edx
 408:	89 c1                	mov    %eax,%ecx
 40a:	39 da                	cmp    %ebx,%edx
 40c:	73 e2                	jae    3f0 <printint+0x30>
  if(neg)
 40e:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 411:	85 c0                	test   %eax,%eax
 413:	74 07                	je     41c <printint+0x5c>
    buf[i++] = '-';
 415:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)

  while(--i >= 0)
 41a:	89 f7                	mov    %esi,%edi
 41c:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 41f:	8b 75 c0             	mov    -0x40(%ebp),%esi
 422:	01 df                	add    %ebx,%edi
 424:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    putc(fd, buf[i]);
 428:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
 42b:	83 ec 04             	sub    $0x4,%esp
 42e:	88 45 d7             	mov    %al,-0x29(%ebp)
 431:	8d 45 d7             	lea    -0x29(%ebp),%eax
 434:	6a 01                	push   $0x1
 436:	50                   	push   %eax
 437:	56                   	push   %esi
 438:	e8 e6 fe ff ff       	call   323 <write>
  while(--i >= 0)
 43d:	89 f8                	mov    %edi,%eax
 43f:	83 c4 10             	add    $0x10,%esp
 442:	83 ef 01             	sub    $0x1,%edi
 445:	39 c3                	cmp    %eax,%ebx
 447:	75 df                	jne    428 <printint+0x68>
}
 449:	8d 65 f4             	lea    -0xc(%ebp),%esp
 44c:	5b                   	pop    %ebx
 44d:	5e                   	pop    %esi
 44e:	5f                   	pop    %edi
 44f:	5d                   	pop    %ebp
 450:	c3                   	ret
 451:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 458:	31 c0                	xor    %eax,%eax
 45a:	eb 89                	jmp    3e5 <printint+0x25>
 45c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000460 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 460:	55                   	push   %ebp
 461:	89 e5                	mov    %esp,%ebp
 463:	57                   	push   %edi
 464:	56                   	push   %esi
 465:	53                   	push   %ebx
 466:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 469:	8b 75 0c             	mov    0xc(%ebp),%esi
{
 46c:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i = 0; fmt[i]; i++){
 46f:	0f b6 1e             	movzbl (%esi),%ebx
 472:	83 c6 01             	add    $0x1,%esi
 475:	84 db                	test   %bl,%bl
 477:	74 67                	je     4e0 <printf+0x80>
 479:	8d 4d 10             	lea    0x10(%ebp),%ecx
 47c:	31 d2                	xor    %edx,%edx
 47e:	89 4d d0             	mov    %ecx,-0x30(%ebp)
 481:	eb 34                	jmp    4b7 <printf+0x57>
 483:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 488:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 48b:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 490:	83 f8 25             	cmp    $0x25,%eax
 493:	74 18                	je     4ad <printf+0x4d>
  write(fd, &c, 1);
 495:	83 ec 04             	sub    $0x4,%esp
 498:	8d 45 e7             	lea    -0x19(%ebp),%eax
 49b:	88 5d e7             	mov    %bl,-0x19(%ebp)
 49e:	6a 01                	push   $0x1
 4a0:	50                   	push   %eax
 4a1:	57                   	push   %edi
 4a2:	e8 7c fe ff ff       	call   323 <write>
 4a7:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 4aa:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 4ad:	0f b6 1e             	movzbl (%esi),%ebx
 4b0:	83 c6 01             	add    $0x1,%esi
 4b3:	84 db                	test   %bl,%bl
 4b5:	74 29                	je     4e0 <printf+0x80>
    c = fmt[i] & 0xff;
 4b7:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 4ba:	85 d2                	test   %edx,%edx
 4bc:	74 ca                	je     488 <printf+0x28>
      }
    } else if(state == '%'){
 4be:	83 fa 25             	cmp    $0x25,%edx
 4c1:	75 ea                	jne    4ad <printf+0x4d>
      if(c == 'd'){
 4c3:	83 f8 25             	cmp    $0x25,%eax
 4c6:	0f 84 04 01 00 00    	je     5d0 <printf+0x170>
 4cc:	83 e8 63             	sub    $0x63,%eax
 4cf:	83 f8 15             	cmp    $0x15,%eax
 4d2:	77 1c                	ja     4f0 <printf+0x90>
 4d4:	ff 24 85 3c 08 00 00 	jmp    *0x83c(,%eax,4)
 4db:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 4e0:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4e3:	5b                   	pop    %ebx
 4e4:	5e                   	pop    %esi
 4e5:	5f                   	pop    %edi
 4e6:	5d                   	pop    %ebp
 4e7:	c3                   	ret
 4e8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 4ef:	00 
  write(fd, &c, 1);
 4f0:	83 ec 04             	sub    $0x4,%esp
 4f3:	8d 55 e7             	lea    -0x19(%ebp),%edx
 4f6:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 4fa:	6a 01                	push   $0x1
 4fc:	52                   	push   %edx
 4fd:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 500:	57                   	push   %edi
 501:	e8 1d fe ff ff       	call   323 <write>
 506:	83 c4 0c             	add    $0xc,%esp
 509:	88 5d e7             	mov    %bl,-0x19(%ebp)
 50c:	6a 01                	push   $0x1
 50e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 511:	52                   	push   %edx
 512:	57                   	push   %edi
 513:	e8 0b fe ff ff       	call   323 <write>
        putc(fd, c);
 518:	83 c4 10             	add    $0x10,%esp
      state = 0;
 51b:	31 d2                	xor    %edx,%edx
 51d:	eb 8e                	jmp    4ad <printf+0x4d>
 51f:	90                   	nop
        printint(fd, *ap, 16, 0);
 520:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 523:	83 ec 0c             	sub    $0xc,%esp
 526:	b9 10 00 00 00       	mov    $0x10,%ecx
 52b:	8b 13                	mov    (%ebx),%edx
 52d:	6a 00                	push   $0x0
 52f:	89 f8                	mov    %edi,%eax
        ap++;
 531:	83 c3 04             	add    $0x4,%ebx
        printint(fd, *ap, 16, 0);
 534:	e8 87 fe ff ff       	call   3c0 <printint>
        ap++;
 539:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 53c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 53f:	31 d2                	xor    %edx,%edx
 541:	e9 67 ff ff ff       	jmp    4ad <printf+0x4d>
        s = (char*)*ap;
 546:	8b 45 d0             	mov    -0x30(%ebp),%eax
 549:	8b 18                	mov    (%eax),%ebx
        ap++;
 54b:	83 c0 04             	add    $0x4,%eax
 54e:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 551:	85 db                	test   %ebx,%ebx
 553:	0f 84 87 00 00 00    	je     5e0 <printf+0x180>
        while(*s != 0){
 559:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 55c:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 55e:	84 c0                	test   %al,%al
 560:	0f 84 47 ff ff ff    	je     4ad <printf+0x4d>
 566:	8d 55 e7             	lea    -0x19(%ebp),%edx
 569:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 56c:	89 de                	mov    %ebx,%esi
 56e:	89 d3                	mov    %edx,%ebx
  write(fd, &c, 1);
 570:	83 ec 04             	sub    $0x4,%esp
 573:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
 576:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 579:	6a 01                	push   $0x1
 57b:	53                   	push   %ebx
 57c:	57                   	push   %edi
 57d:	e8 a1 fd ff ff       	call   323 <write>
        while(*s != 0){
 582:	0f b6 06             	movzbl (%esi),%eax
 585:	83 c4 10             	add    $0x10,%esp
 588:	84 c0                	test   %al,%al
 58a:	75 e4                	jne    570 <printf+0x110>
      state = 0;
 58c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
 58f:	31 d2                	xor    %edx,%edx
 591:	e9 17 ff ff ff       	jmp    4ad <printf+0x4d>
        printint(fd, *ap, 10, 1);
 596:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 599:	83 ec 0c             	sub    $0xc,%esp
 59c:	b9 0a 00 00 00       	mov    $0xa,%ecx
 5a1:	8b 13                	mov    (%ebx),%edx
 5a3:	6a 01                	push   $0x1
 5a5:	eb 88                	jmp    52f <printf+0xcf>
        putc(fd, *ap);
 5a7:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 5aa:	83 ec 04             	sub    $0x4,%esp
 5ad:	8d 55 e7             	lea    -0x19(%ebp),%edx
        putc(fd, *ap);
 5b0:	8b 03                	mov    (%ebx),%eax
        ap++;
 5b2:	83 c3 04             	add    $0x4,%ebx
        putc(fd, *ap);
 5b5:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 5b8:	6a 01                	push   $0x1
 5ba:	52                   	push   %edx
 5bb:	57                   	push   %edi
 5bc:	e8 62 fd ff ff       	call   323 <write>
        ap++;
 5c1:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 5c4:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5c7:	31 d2                	xor    %edx,%edx
 5c9:	e9 df fe ff ff       	jmp    4ad <printf+0x4d>
 5ce:	66 90                	xchg   %ax,%ax
  write(fd, &c, 1);
 5d0:	83 ec 04             	sub    $0x4,%esp
 5d3:	88 5d e7             	mov    %bl,-0x19(%ebp)
 5d6:	8d 55 e7             	lea    -0x19(%ebp),%edx
 5d9:	6a 01                	push   $0x1
 5db:	e9 31 ff ff ff       	jmp    511 <printf+0xb1>
 5e0:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
 5e5:	bb fc 07 00 00       	mov    $0x7fc,%ebx
 5ea:	e9 77 ff ff ff       	jmp    566 <printf+0x106>
 5ef:	90                   	nop

000005f0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5f0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5f1:	a1 54 0b 00 00       	mov    0xb54,%eax
{
 5f6:	89 e5                	mov    %esp,%ebp
 5f8:	57                   	push   %edi
 5f9:	56                   	push   %esi
 5fa:	53                   	push   %ebx
 5fb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 5fe:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 601:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 608:	8b 10                	mov    (%eax),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 60a:	39 c8                	cmp    %ecx,%eax
 60c:	73 32                	jae    640 <free+0x50>
 60e:	39 d1                	cmp    %edx,%ecx
 610:	72 04                	jb     616 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 612:	39 d0                	cmp    %edx,%eax
 614:	72 32                	jb     648 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 616:	8b 73 fc             	mov    -0x4(%ebx),%esi
 619:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 61c:	39 fa                	cmp    %edi,%edx
 61e:	74 30                	je     650 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 620:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 623:	8b 50 04             	mov    0x4(%eax),%edx
 626:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 629:	39 f1                	cmp    %esi,%ecx
 62b:	74 3a                	je     667 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 62d:	89 08                	mov    %ecx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 62f:	5b                   	pop    %ebx
  freep = p;
 630:	a3 54 0b 00 00       	mov    %eax,0xb54
}
 635:	5e                   	pop    %esi
 636:	5f                   	pop    %edi
 637:	5d                   	pop    %ebp
 638:	c3                   	ret
 639:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 640:	39 d0                	cmp    %edx,%eax
 642:	72 04                	jb     648 <free+0x58>
 644:	39 d1                	cmp    %edx,%ecx
 646:	72 ce                	jb     616 <free+0x26>
{
 648:	89 d0                	mov    %edx,%eax
 64a:	eb bc                	jmp    608 <free+0x18>
 64c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 650:	03 72 04             	add    0x4(%edx),%esi
 653:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 656:	8b 10                	mov    (%eax),%edx
 658:	8b 12                	mov    (%edx),%edx
 65a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 65d:	8b 50 04             	mov    0x4(%eax),%edx
 660:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 663:	39 f1                	cmp    %esi,%ecx
 665:	75 c6                	jne    62d <free+0x3d>
    p->s.size += bp->s.size;
 667:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 66a:	a3 54 0b 00 00       	mov    %eax,0xb54
    p->s.size += bp->s.size;
 66f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 672:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 675:	89 08                	mov    %ecx,(%eax)
}
 677:	5b                   	pop    %ebx
 678:	5e                   	pop    %esi
 679:	5f                   	pop    %edi
 67a:	5d                   	pop    %ebp
 67b:	c3                   	ret
 67c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000680 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 680:	55                   	push   %ebp
 681:	89 e5                	mov    %esp,%ebp
 683:	57                   	push   %edi
 684:	56                   	push   %esi
 685:	53                   	push   %ebx
 686:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 689:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 68c:	8b 15 54 0b 00 00    	mov    0xb54,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 692:	8d 78 07             	lea    0x7(%eax),%edi
 695:	c1 ef 03             	shr    $0x3,%edi
 698:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 69b:	85 d2                	test   %edx,%edx
 69d:	0f 84 8d 00 00 00    	je     730 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6a3:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 6a5:	8b 48 04             	mov    0x4(%eax),%ecx
 6a8:	39 f9                	cmp    %edi,%ecx
 6aa:	73 64                	jae    710 <malloc+0x90>
  if(nu < 4096)
 6ac:	bb 00 10 00 00       	mov    $0x1000,%ebx
 6b1:	39 df                	cmp    %ebx,%edi
 6b3:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 6b6:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 6bd:	eb 0a                	jmp    6c9 <malloc+0x49>
 6bf:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6c0:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 6c2:	8b 48 04             	mov    0x4(%eax),%ecx
 6c5:	39 f9                	cmp    %edi,%ecx
 6c7:	73 47                	jae    710 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 6c9:	89 c2                	mov    %eax,%edx
 6cb:	3b 05 54 0b 00 00    	cmp    0xb54,%eax
 6d1:	75 ed                	jne    6c0 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
 6d3:	83 ec 0c             	sub    $0xc,%esp
 6d6:	56                   	push   %esi
 6d7:	e8 af fc ff ff       	call   38b <sbrk>
  if(p == (char*)-1)
 6dc:	83 c4 10             	add    $0x10,%esp
 6df:	83 f8 ff             	cmp    $0xffffffff,%eax
 6e2:	74 1c                	je     700 <malloc+0x80>
  hp->s.size = nu;
 6e4:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 6e7:	83 ec 0c             	sub    $0xc,%esp
 6ea:	83 c0 08             	add    $0x8,%eax
 6ed:	50                   	push   %eax
 6ee:	e8 fd fe ff ff       	call   5f0 <free>
  return freep;
 6f3:	8b 15 54 0b 00 00    	mov    0xb54,%edx
      if((p = morecore(nunits)) == 0)
 6f9:	83 c4 10             	add    $0x10,%esp
 6fc:	85 d2                	test   %edx,%edx
 6fe:	75 c0                	jne    6c0 <malloc+0x40>
        return 0;
  }
}
 700:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 703:	31 c0                	xor    %eax,%eax
}
 705:	5b                   	pop    %ebx
 706:	5e                   	pop    %esi
 707:	5f                   	pop    %edi
 708:	5d                   	pop    %ebp
 709:	c3                   	ret
 70a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 710:	39 cf                	cmp    %ecx,%edi
 712:	74 4c                	je     760 <malloc+0xe0>
        p->s.size -= nunits;
 714:	29 f9                	sub    %edi,%ecx
 716:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 719:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 71c:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 71f:	89 15 54 0b 00 00    	mov    %edx,0xb54
}
 725:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 728:	83 c0 08             	add    $0x8,%eax
}
 72b:	5b                   	pop    %ebx
 72c:	5e                   	pop    %esi
 72d:	5f                   	pop    %edi
 72e:	5d                   	pop    %ebp
 72f:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
 730:	c7 05 54 0b 00 00 58 	movl   $0xb58,0xb54
 737:	0b 00 00 
    base.s.size = 0;
 73a:	b8 58 0b 00 00       	mov    $0xb58,%eax
    base.s.ptr = freep = prevp = &base;
 73f:	c7 05 58 0b 00 00 58 	movl   $0xb58,0xb58
 746:	0b 00 00 
    base.s.size = 0;
 749:	c7 05 5c 0b 00 00 00 	movl   $0x0,0xb5c
 750:	00 00 00 
    if(p->s.size >= nunits){
 753:	e9 54 ff ff ff       	jmp    6ac <malloc+0x2c>
 758:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 75f:	00 
        prevp->s.ptr = p->s.ptr;
 760:	8b 08                	mov    (%eax),%ecx
 762:	89 0a                	mov    %ecx,(%edx)
 764:	eb b9                	jmp    71f <malloc+0x9f>
