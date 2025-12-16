
_count:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

#define MAX_SYSCALLS 25  // Ajustar según NELEM(syscalls)

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
  unsigned int counts[MAX_SYSCALLS];
  char *names[] = {
   f:	8d 7d 84             	lea    -0x7c(%ebp),%edi
  12:	be e0 08 00 00       	mov    $0x8e0,%esi
{
  17:	53                   	push   %ebx
  18:	51                   	push   %ecx
  19:	81 ec f4 00 00 00    	sub    $0xf4,%esp
  1f:	8b 41 04             	mov    0x4(%ecx),%eax
  22:	8b 19                	mov    (%ecx),%ebx
  char *names[] = {
  24:	b9 19 00 00 00       	mov    $0x19,%ecx
  29:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    "fstat", "chdir", "dup", "getpid", "sbrk", "sleep",
    "uptime", "open", "write", "mknod", "unlink",
    "link", "mkdir", "close", "trace", "getprocs", "getcounts"
  };

  if(getcounts(counts) < 0){
  2b:	8d b5 20 ff ff ff    	lea    -0xe0(%ebp),%esi
  31:	56                   	push   %esi
{
  32:	89 85 14 ff ff ff    	mov    %eax,-0xec(%ebp)
  if(getcounts(counts) < 0){
  38:	e8 b6 03 00 00       	call   3f3 <getcounts>
  3d:	83 c4 10             	add    $0x10,%esp
  40:	85 c0                	test   %eax,%eax
  42:	78 58                	js     9c <main+0x9c>
    printf(2, "Error al obtener contadores\n");
    exit();
  }

  if(argc == 1){
  44:	83 fb 01             	cmp    $0x1,%ebx
  47:	74 79                	je     c2 <main+0xc2>
    for(int i = 1; i < MAX_SYSCALLS; i++){
      if(counts[i] > 0){
        printf(1, "%s: %d\n", names[i], counts[i]);
      }
    }
  } else if(argc == 2){
  49:	83 fb 02             	cmp    $0x2,%ebx
  4c:	74 13                	je     61 <main+0x61>
      printf(2, "Número de syscall inválido\n");
      exit();
    }
    printf(1, "%s: %d\n", names[num], counts[num]);
  } else {
    printf(2, "Uso: count [número de syscall]\n");
  4e:	50                   	push   %eax
  4f:	50                   	push   %eax
  50:	68 ac 08 00 00       	push   $0x8ac
  55:	6a 02                	push   $0x2
  57:	e8 44 04 00 00       	call   4a0 <printf>
    exit();
  5c:	e8 e2 02 00 00       	call   343 <exit>
    int num = atoi(argv[1]);
  61:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
  67:	83 ec 0c             	sub    $0xc,%esp
  6a:	ff 70 04             	push   0x4(%eax)
  6d:	e8 5e 02 00 00       	call   2d0 <atoi>
    if(num < 1 || num >= MAX_SYSCALLS){
  72:	83 c4 10             	add    $0x10,%esp
  75:	8d 50 ff             	lea    -0x1(%eax),%edx
  78:	83 fa 17             	cmp    $0x17,%edx
  7b:	77 32                	ja     af <main+0xaf>
    printf(1, "%s: %d\n", names[num], counts[num]);
  7d:	ff b4 85 20 ff ff ff 	push   -0xe0(%ebp,%eax,4)
  84:	ff 74 85 84          	push   -0x7c(%ebp,%eax,4)
  88:	68 f6 07 00 00       	push   $0x7f6
  8d:	6a 01                	push   $0x1
  8f:	e8 0c 04 00 00       	call   4a0 <printf>
  94:	83 c4 10             	add    $0x10,%esp
  }
  exit();
  97:	e8 a7 02 00 00       	call   343 <exit>
    printf(2, "Error al obtener contadores\n");
  9c:	53                   	push   %ebx
  9d:	53                   	push   %ebx
  9e:	68 c0 07 00 00       	push   $0x7c0
  a3:	6a 02                	push   $0x2
  a5:	e8 f6 03 00 00       	call   4a0 <printf>
    exit();
  aa:	e8 94 02 00 00       	call   343 <exit>
      printf(2, "Número de syscall inválido\n");
  af:	52                   	push   %edx
  b0:	52                   	push   %edx
  b1:	68 fe 07 00 00       	push   $0x7fe
  b6:	6a 02                	push   $0x2
  b8:	e8 e3 03 00 00       	call   4a0 <printf>
      exit();
  bd:	e8 81 02 00 00       	call   343 <exit>
    printf(1, "Contadores de syscalls:\n");
  c2:	51                   	push   %ecx
  c3:	51                   	push   %ecx
  c4:	68 dd 07 00 00       	push   $0x7dd
  c9:	6a 01                	push   $0x1
  cb:	e8 d0 03 00 00       	call   4a0 <printf>
  d0:	83 c4 10             	add    $0x10,%esp
  d3:	eb 0b                	jmp    e0 <main+0xe0>
  d5:	8d 76 00             	lea    0x0(%esi),%esi
    for(int i = 1; i < MAX_SYSCALLS; i++){
  d8:	83 c3 01             	add    $0x1,%ebx
  db:	83 fb 19             	cmp    $0x19,%ebx
  de:	74 b7                	je     97 <main+0x97>
      if(counts[i] > 0){
  e0:	8b 04 9e             	mov    (%esi,%ebx,4),%eax
  e3:	85 c0                	test   %eax,%eax
  e5:	74 f1                	je     d8 <main+0xd8>
        printf(1, "%s: %d\n", names[i], counts[i]);
  e7:	50                   	push   %eax
  e8:	ff 74 9d 84          	push   -0x7c(%ebp,%ebx,4)
  ec:	68 f6 07 00 00       	push   $0x7f6
  f1:	6a 01                	push   $0x1
  f3:	e8 a8 03 00 00       	call   4a0 <printf>
  f8:	83 c4 10             	add    $0x10,%esp
  fb:	eb db                	jmp    d8 <main+0xd8>
  fd:	66 90                	xchg   %ax,%ax
  ff:	90                   	nop

00000100 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 100:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 101:	31 c0                	xor    %eax,%eax
{
 103:	89 e5                	mov    %esp,%ebp
 105:	53                   	push   %ebx
 106:	8b 4d 08             	mov    0x8(%ebp),%ecx
 109:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 10c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 110:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 114:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 117:	83 c0 01             	add    $0x1,%eax
 11a:	84 d2                	test   %dl,%dl
 11c:	75 f2                	jne    110 <strcpy+0x10>
    ;
  return os;
}
 11e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 121:	89 c8                	mov    %ecx,%eax
 123:	c9                   	leave
 124:	c3                   	ret
 125:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 12c:	00 
 12d:	8d 76 00             	lea    0x0(%esi),%esi

00000130 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 130:	55                   	push   %ebp
 131:	89 e5                	mov    %esp,%ebp
 133:	53                   	push   %ebx
 134:	8b 55 08             	mov    0x8(%ebp),%edx
 137:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 13a:	0f b6 02             	movzbl (%edx),%eax
 13d:	84 c0                	test   %al,%al
 13f:	75 17                	jne    158 <strcmp+0x28>
 141:	eb 3a                	jmp    17d <strcmp+0x4d>
 143:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 148:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 14c:	83 c2 01             	add    $0x1,%edx
 14f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 152:	84 c0                	test   %al,%al
 154:	74 1a                	je     170 <strcmp+0x40>
 156:	89 d9                	mov    %ebx,%ecx
 158:	0f b6 19             	movzbl (%ecx),%ebx
 15b:	38 c3                	cmp    %al,%bl
 15d:	74 e9                	je     148 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 15f:	29 d8                	sub    %ebx,%eax
}
 161:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 164:	c9                   	leave
 165:	c3                   	ret
 166:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 16d:	00 
 16e:	66 90                	xchg   %ax,%ax
  return (uchar)*p - (uchar)*q;
 170:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 174:	31 c0                	xor    %eax,%eax
 176:	29 d8                	sub    %ebx,%eax
}
 178:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 17b:	c9                   	leave
 17c:	c3                   	ret
  return (uchar)*p - (uchar)*q;
 17d:	0f b6 19             	movzbl (%ecx),%ebx
 180:	31 c0                	xor    %eax,%eax
 182:	eb db                	jmp    15f <strcmp+0x2f>
 184:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 18b:	00 
 18c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000190 <strlen>:

uint
strlen(const char *s)
{
 190:	55                   	push   %ebp
 191:	89 e5                	mov    %esp,%ebp
 193:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 196:	80 3a 00             	cmpb   $0x0,(%edx)
 199:	74 15                	je     1b0 <strlen+0x20>
 19b:	31 c0                	xor    %eax,%eax
 19d:	8d 76 00             	lea    0x0(%esi),%esi
 1a0:	83 c0 01             	add    $0x1,%eax
 1a3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 1a7:	89 c1                	mov    %eax,%ecx
 1a9:	75 f5                	jne    1a0 <strlen+0x10>
    ;
  return n;
}
 1ab:	89 c8                	mov    %ecx,%eax
 1ad:	5d                   	pop    %ebp
 1ae:	c3                   	ret
 1af:	90                   	nop
  for(n = 0; s[n]; n++)
 1b0:	31 c9                	xor    %ecx,%ecx
}
 1b2:	5d                   	pop    %ebp
 1b3:	89 c8                	mov    %ecx,%eax
 1b5:	c3                   	ret
 1b6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1bd:	00 
 1be:	66 90                	xchg   %ax,%ax

000001c0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1c0:	55                   	push   %ebp
 1c1:	89 e5                	mov    %esp,%ebp
 1c3:	57                   	push   %edi
 1c4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1c7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1ca:	8b 45 0c             	mov    0xc(%ebp),%eax
 1cd:	89 d7                	mov    %edx,%edi
 1cf:	fc                   	cld
 1d0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1d2:	8b 7d fc             	mov    -0x4(%ebp),%edi
 1d5:	89 d0                	mov    %edx,%eax
 1d7:	c9                   	leave
 1d8:	c3                   	ret
 1d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001e0 <strchr>:

char*
strchr(const char *s, char c)
{
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	8b 45 08             	mov    0x8(%ebp),%eax
 1e6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1ea:	0f b6 10             	movzbl (%eax),%edx
 1ed:	84 d2                	test   %dl,%dl
 1ef:	75 12                	jne    203 <strchr+0x23>
 1f1:	eb 1d                	jmp    210 <strchr+0x30>
 1f3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 1f8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 1fc:	83 c0 01             	add    $0x1,%eax
 1ff:	84 d2                	test   %dl,%dl
 201:	74 0d                	je     210 <strchr+0x30>
    if(*s == c)
 203:	38 d1                	cmp    %dl,%cl
 205:	75 f1                	jne    1f8 <strchr+0x18>
      return (char*)s;
  return 0;
}
 207:	5d                   	pop    %ebp
 208:	c3                   	ret
 209:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 210:	31 c0                	xor    %eax,%eax
}
 212:	5d                   	pop    %ebp
 213:	c3                   	ret
 214:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 21b:	00 
 21c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000220 <gets>:

char*
gets(char *buf, int max)
{
 220:	55                   	push   %ebp
 221:	89 e5                	mov    %esp,%ebp
 223:	57                   	push   %edi
 224:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 225:	8d 75 e7             	lea    -0x19(%ebp),%esi
{
 228:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 229:	31 db                	xor    %ebx,%ebx
{
 22b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 22e:	eb 27                	jmp    257 <gets+0x37>
    cc = read(0, &c, 1);
 230:	83 ec 04             	sub    $0x4,%esp
 233:	6a 01                	push   $0x1
 235:	56                   	push   %esi
 236:	6a 00                	push   $0x0
 238:	e8 1e 01 00 00       	call   35b <read>
    if(cc < 1)
 23d:	83 c4 10             	add    $0x10,%esp
 240:	85 c0                	test   %eax,%eax
 242:	7e 1d                	jle    261 <gets+0x41>
      break;
    buf[i++] = c;
 244:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 248:	8b 55 08             	mov    0x8(%ebp),%edx
 24b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 24f:	3c 0a                	cmp    $0xa,%al
 251:	74 10                	je     263 <gets+0x43>
 253:	3c 0d                	cmp    $0xd,%al
 255:	74 0c                	je     263 <gets+0x43>
  for(i=0; i+1 < max; ){
 257:	89 df                	mov    %ebx,%edi
 259:	83 c3 01             	add    $0x1,%ebx
 25c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 25f:	7c cf                	jl     230 <gets+0x10>
 261:	89 fb                	mov    %edi,%ebx
      break;
  }
  buf[i] = '\0';
 263:	8b 45 08             	mov    0x8(%ebp),%eax
 266:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
 26a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 26d:	5b                   	pop    %ebx
 26e:	5e                   	pop    %esi
 26f:	5f                   	pop    %edi
 270:	5d                   	pop    %ebp
 271:	c3                   	ret
 272:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 279:	00 
 27a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000280 <stat>:

int
stat(const char *n, struct stat *st)
{
 280:	55                   	push   %ebp
 281:	89 e5                	mov    %esp,%ebp
 283:	56                   	push   %esi
 284:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 285:	83 ec 08             	sub    $0x8,%esp
 288:	6a 00                	push   $0x0
 28a:	ff 75 08             	push   0x8(%ebp)
 28d:	e8 f1 00 00 00       	call   383 <open>
  if(fd < 0)
 292:	83 c4 10             	add    $0x10,%esp
 295:	85 c0                	test   %eax,%eax
 297:	78 27                	js     2c0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 299:	83 ec 08             	sub    $0x8,%esp
 29c:	ff 75 0c             	push   0xc(%ebp)
 29f:	89 c3                	mov    %eax,%ebx
 2a1:	50                   	push   %eax
 2a2:	e8 f4 00 00 00       	call   39b <fstat>
  close(fd);
 2a7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 2aa:	89 c6                	mov    %eax,%esi
  close(fd);
 2ac:	e8 ba 00 00 00       	call   36b <close>
  return r;
 2b1:	83 c4 10             	add    $0x10,%esp
}
 2b4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2b7:	89 f0                	mov    %esi,%eax
 2b9:	5b                   	pop    %ebx
 2ba:	5e                   	pop    %esi
 2bb:	5d                   	pop    %ebp
 2bc:	c3                   	ret
 2bd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 2c0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2c5:	eb ed                	jmp    2b4 <stat+0x34>
 2c7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 2ce:	00 
 2cf:	90                   	nop

000002d0 <atoi>:

int
atoi(const char *s)
{
 2d0:	55                   	push   %ebp
 2d1:	89 e5                	mov    %esp,%ebp
 2d3:	53                   	push   %ebx
 2d4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2d7:	0f be 02             	movsbl (%edx),%eax
 2da:	8d 48 d0             	lea    -0x30(%eax),%ecx
 2dd:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 2e0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 2e5:	77 1e                	ja     305 <atoi+0x35>
 2e7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 2ee:	00 
 2ef:	90                   	nop
    n = n*10 + *s++ - '0';
 2f0:	83 c2 01             	add    $0x1,%edx
 2f3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 2f6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 2fa:	0f be 02             	movsbl (%edx),%eax
 2fd:	8d 58 d0             	lea    -0x30(%eax),%ebx
 300:	80 fb 09             	cmp    $0x9,%bl
 303:	76 eb                	jbe    2f0 <atoi+0x20>
  return n;
}
 305:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 308:	89 c8                	mov    %ecx,%eax
 30a:	c9                   	leave
 30b:	c3                   	ret
 30c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000310 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 310:	55                   	push   %ebp
 311:	89 e5                	mov    %esp,%ebp
 313:	57                   	push   %edi
 314:	8b 45 10             	mov    0x10(%ebp),%eax
 317:	8b 55 08             	mov    0x8(%ebp),%edx
 31a:	56                   	push   %esi
 31b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 31e:	85 c0                	test   %eax,%eax
 320:	7e 13                	jle    335 <memmove+0x25>
 322:	01 d0                	add    %edx,%eax
  dst = vdst;
 324:	89 d7                	mov    %edx,%edi
 326:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 32d:	00 
 32e:	66 90                	xchg   %ax,%ax
    *dst++ = *src++;
 330:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 331:	39 f8                	cmp    %edi,%eax
 333:	75 fb                	jne    330 <memmove+0x20>
  return vdst;
}
 335:	5e                   	pop    %esi
 336:	89 d0                	mov    %edx,%eax
 338:	5f                   	pop    %edi
 339:	5d                   	pop    %ebp
 33a:	c3                   	ret

0000033b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 33b:	b8 01 00 00 00       	mov    $0x1,%eax
 340:	cd 40                	int    $0x40
 342:	c3                   	ret

00000343 <exit>:
SYSCALL(exit)
 343:	b8 02 00 00 00       	mov    $0x2,%eax
 348:	cd 40                	int    $0x40
 34a:	c3                   	ret

0000034b <wait>:
SYSCALL(wait)
 34b:	b8 03 00 00 00       	mov    $0x3,%eax
 350:	cd 40                	int    $0x40
 352:	c3                   	ret

00000353 <pipe>:
SYSCALL(pipe)
 353:	b8 04 00 00 00       	mov    $0x4,%eax
 358:	cd 40                	int    $0x40
 35a:	c3                   	ret

0000035b <read>:
SYSCALL(read)
 35b:	b8 05 00 00 00       	mov    $0x5,%eax
 360:	cd 40                	int    $0x40
 362:	c3                   	ret

00000363 <write>:
SYSCALL(write)
 363:	b8 10 00 00 00       	mov    $0x10,%eax
 368:	cd 40                	int    $0x40
 36a:	c3                   	ret

0000036b <close>:
SYSCALL(close)
 36b:	b8 15 00 00 00       	mov    $0x15,%eax
 370:	cd 40                	int    $0x40
 372:	c3                   	ret

00000373 <kill>:
SYSCALL(kill)
 373:	b8 06 00 00 00       	mov    $0x6,%eax
 378:	cd 40                	int    $0x40
 37a:	c3                   	ret

0000037b <exec>:
SYSCALL(exec)
 37b:	b8 07 00 00 00       	mov    $0x7,%eax
 380:	cd 40                	int    $0x40
 382:	c3                   	ret

00000383 <open>:
SYSCALL(open)
 383:	b8 0f 00 00 00       	mov    $0xf,%eax
 388:	cd 40                	int    $0x40
 38a:	c3                   	ret

0000038b <mknod>:
SYSCALL(mknod)
 38b:	b8 11 00 00 00       	mov    $0x11,%eax
 390:	cd 40                	int    $0x40
 392:	c3                   	ret

00000393 <unlink>:
SYSCALL(unlink)
 393:	b8 12 00 00 00       	mov    $0x12,%eax
 398:	cd 40                	int    $0x40
 39a:	c3                   	ret

0000039b <fstat>:
SYSCALL(fstat)
 39b:	b8 08 00 00 00       	mov    $0x8,%eax
 3a0:	cd 40                	int    $0x40
 3a2:	c3                   	ret

000003a3 <link>:
SYSCALL(link)
 3a3:	b8 13 00 00 00       	mov    $0x13,%eax
 3a8:	cd 40                	int    $0x40
 3aa:	c3                   	ret

000003ab <mkdir>:
SYSCALL(mkdir)
 3ab:	b8 14 00 00 00       	mov    $0x14,%eax
 3b0:	cd 40                	int    $0x40
 3b2:	c3                   	ret

000003b3 <chdir>:
SYSCALL(chdir)
 3b3:	b8 09 00 00 00       	mov    $0x9,%eax
 3b8:	cd 40                	int    $0x40
 3ba:	c3                   	ret

000003bb <dup>:
SYSCALL(dup)
 3bb:	b8 0a 00 00 00       	mov    $0xa,%eax
 3c0:	cd 40                	int    $0x40
 3c2:	c3                   	ret

000003c3 <getpid>:
SYSCALL(getpid)
 3c3:	b8 0b 00 00 00       	mov    $0xb,%eax
 3c8:	cd 40                	int    $0x40
 3ca:	c3                   	ret

000003cb <sbrk>:
SYSCALL(sbrk)
 3cb:	b8 0c 00 00 00       	mov    $0xc,%eax
 3d0:	cd 40                	int    $0x40
 3d2:	c3                   	ret

000003d3 <sleep>:
SYSCALL(sleep)
 3d3:	b8 0d 00 00 00       	mov    $0xd,%eax
 3d8:	cd 40                	int    $0x40
 3da:	c3                   	ret

000003db <uptime>:
SYSCALL(uptime)
 3db:	b8 0e 00 00 00       	mov    $0xe,%eax
 3e0:	cd 40                	int    $0x40
 3e2:	c3                   	ret

000003e3 <trace>:
SYSCALL(trace)  // Enlace para la syscall de tracing
 3e3:	b8 16 00 00 00       	mov    $0x16,%eax
 3e8:	cd 40                	int    $0x40
 3ea:	c3                   	ret

000003eb <getprocs>:
SYSCALL(getprocs)  // Enlace para la syscall de obtener info de procesos
 3eb:	b8 17 00 00 00       	mov    $0x17,%eax
 3f0:	cd 40                	int    $0x40
 3f2:	c3                   	ret

000003f3 <getcounts>:
SYSCALL(getcounts)  // Enlace para la syscall de obtener contadores de syscalls
 3f3:	b8 18 00 00 00       	mov    $0x18,%eax
 3f8:	cd 40                	int    $0x40
 3fa:	c3                   	ret
 3fb:	66 90                	xchg   %ax,%ax
 3fd:	66 90                	xchg   %ax,%ax
 3ff:	90                   	nop

00000400 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 400:	55                   	push   %ebp
 401:	89 e5                	mov    %esp,%ebp
 403:	57                   	push   %edi
 404:	56                   	push   %esi
 405:	53                   	push   %ebx
 406:	89 cb                	mov    %ecx,%ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 408:	89 d1                	mov    %edx,%ecx
{
 40a:	83 ec 3c             	sub    $0x3c,%esp
 40d:	89 45 c0             	mov    %eax,-0x40(%ebp)
  if(sgn && xx < 0){
 410:	85 d2                	test   %edx,%edx
 412:	0f 89 80 00 00 00    	jns    498 <printint+0x98>
 418:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 41c:	74 7a                	je     498 <printint+0x98>
    x = -xx;
 41e:	f7 d9                	neg    %ecx
    neg = 1;
 420:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
 425:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 428:	31 f6                	xor    %esi,%esi
 42a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 430:	89 c8                	mov    %ecx,%eax
 432:	31 d2                	xor    %edx,%edx
 434:	89 f7                	mov    %esi,%edi
 436:	f7 f3                	div    %ebx
 438:	8d 76 01             	lea    0x1(%esi),%esi
 43b:	0f b6 92 9c 09 00 00 	movzbl 0x99c(%edx),%edx
 442:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
 446:	89 ca                	mov    %ecx,%edx
 448:	89 c1                	mov    %eax,%ecx
 44a:	39 da                	cmp    %ebx,%edx
 44c:	73 e2                	jae    430 <printint+0x30>
  if(neg)
 44e:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 451:	85 c0                	test   %eax,%eax
 453:	74 07                	je     45c <printint+0x5c>
    buf[i++] = '-';
 455:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)

  while(--i >= 0)
 45a:	89 f7                	mov    %esi,%edi
 45c:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 45f:	8b 75 c0             	mov    -0x40(%ebp),%esi
 462:	01 df                	add    %ebx,%edi
 464:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    putc(fd, buf[i]);
 468:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
 46b:	83 ec 04             	sub    $0x4,%esp
 46e:	88 45 d7             	mov    %al,-0x29(%ebp)
 471:	8d 45 d7             	lea    -0x29(%ebp),%eax
 474:	6a 01                	push   $0x1
 476:	50                   	push   %eax
 477:	56                   	push   %esi
 478:	e8 e6 fe ff ff       	call   363 <write>
  while(--i >= 0)
 47d:	89 f8                	mov    %edi,%eax
 47f:	83 c4 10             	add    $0x10,%esp
 482:	83 ef 01             	sub    $0x1,%edi
 485:	39 c3                	cmp    %eax,%ebx
 487:	75 df                	jne    468 <printint+0x68>
}
 489:	8d 65 f4             	lea    -0xc(%ebp),%esp
 48c:	5b                   	pop    %ebx
 48d:	5e                   	pop    %esi
 48e:	5f                   	pop    %edi
 48f:	5d                   	pop    %ebp
 490:	c3                   	ret
 491:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 498:	31 c0                	xor    %eax,%eax
 49a:	eb 89                	jmp    425 <printint+0x25>
 49c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000004a0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 4a0:	55                   	push   %ebp
 4a1:	89 e5                	mov    %esp,%ebp
 4a3:	57                   	push   %edi
 4a4:	56                   	push   %esi
 4a5:	53                   	push   %ebx
 4a6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4a9:	8b 75 0c             	mov    0xc(%ebp),%esi
{
 4ac:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i = 0; fmt[i]; i++){
 4af:	0f b6 1e             	movzbl (%esi),%ebx
 4b2:	83 c6 01             	add    $0x1,%esi
 4b5:	84 db                	test   %bl,%bl
 4b7:	74 67                	je     520 <printf+0x80>
 4b9:	8d 4d 10             	lea    0x10(%ebp),%ecx
 4bc:	31 d2                	xor    %edx,%edx
 4be:	89 4d d0             	mov    %ecx,-0x30(%ebp)
 4c1:	eb 34                	jmp    4f7 <printf+0x57>
 4c3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 4c8:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 4cb:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 4d0:	83 f8 25             	cmp    $0x25,%eax
 4d3:	74 18                	je     4ed <printf+0x4d>
  write(fd, &c, 1);
 4d5:	83 ec 04             	sub    $0x4,%esp
 4d8:	8d 45 e7             	lea    -0x19(%ebp),%eax
 4db:	88 5d e7             	mov    %bl,-0x19(%ebp)
 4de:	6a 01                	push   $0x1
 4e0:	50                   	push   %eax
 4e1:	57                   	push   %edi
 4e2:	e8 7c fe ff ff       	call   363 <write>
 4e7:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 4ea:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 4ed:	0f b6 1e             	movzbl (%esi),%ebx
 4f0:	83 c6 01             	add    $0x1,%esi
 4f3:	84 db                	test   %bl,%bl
 4f5:	74 29                	je     520 <printf+0x80>
    c = fmt[i] & 0xff;
 4f7:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 4fa:	85 d2                	test   %edx,%edx
 4fc:	74 ca                	je     4c8 <printf+0x28>
      }
    } else if(state == '%'){
 4fe:	83 fa 25             	cmp    $0x25,%edx
 501:	75 ea                	jne    4ed <printf+0x4d>
      if(c == 'd'){
 503:	83 f8 25             	cmp    $0x25,%eax
 506:	0f 84 04 01 00 00    	je     610 <printf+0x170>
 50c:	83 e8 63             	sub    $0x63,%eax
 50f:	83 f8 15             	cmp    $0x15,%eax
 512:	77 1c                	ja     530 <printf+0x90>
 514:	ff 24 85 44 09 00 00 	jmp    *0x944(,%eax,4)
 51b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 520:	8d 65 f4             	lea    -0xc(%ebp),%esp
 523:	5b                   	pop    %ebx
 524:	5e                   	pop    %esi
 525:	5f                   	pop    %edi
 526:	5d                   	pop    %ebp
 527:	c3                   	ret
 528:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 52f:	00 
  write(fd, &c, 1);
 530:	83 ec 04             	sub    $0x4,%esp
 533:	8d 55 e7             	lea    -0x19(%ebp),%edx
 536:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 53a:	6a 01                	push   $0x1
 53c:	52                   	push   %edx
 53d:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 540:	57                   	push   %edi
 541:	e8 1d fe ff ff       	call   363 <write>
 546:	83 c4 0c             	add    $0xc,%esp
 549:	88 5d e7             	mov    %bl,-0x19(%ebp)
 54c:	6a 01                	push   $0x1
 54e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 551:	52                   	push   %edx
 552:	57                   	push   %edi
 553:	e8 0b fe ff ff       	call   363 <write>
        putc(fd, c);
 558:	83 c4 10             	add    $0x10,%esp
      state = 0;
 55b:	31 d2                	xor    %edx,%edx
 55d:	eb 8e                	jmp    4ed <printf+0x4d>
 55f:	90                   	nop
        printint(fd, *ap, 16, 0);
 560:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 563:	83 ec 0c             	sub    $0xc,%esp
 566:	b9 10 00 00 00       	mov    $0x10,%ecx
 56b:	8b 13                	mov    (%ebx),%edx
 56d:	6a 00                	push   $0x0
 56f:	89 f8                	mov    %edi,%eax
        ap++;
 571:	83 c3 04             	add    $0x4,%ebx
        printint(fd, *ap, 16, 0);
 574:	e8 87 fe ff ff       	call   400 <printint>
        ap++;
 579:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 57c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 57f:	31 d2                	xor    %edx,%edx
 581:	e9 67 ff ff ff       	jmp    4ed <printf+0x4d>
        s = (char*)*ap;
 586:	8b 45 d0             	mov    -0x30(%ebp),%eax
 589:	8b 18                	mov    (%eax),%ebx
        ap++;
 58b:	83 c0 04             	add    $0x4,%eax
 58e:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 591:	85 db                	test   %ebx,%ebx
 593:	0f 84 87 00 00 00    	je     620 <printf+0x180>
        while(*s != 0){
 599:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 59c:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 59e:	84 c0                	test   %al,%al
 5a0:	0f 84 47 ff ff ff    	je     4ed <printf+0x4d>
 5a6:	8d 55 e7             	lea    -0x19(%ebp),%edx
 5a9:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 5ac:	89 de                	mov    %ebx,%esi
 5ae:	89 d3                	mov    %edx,%ebx
  write(fd, &c, 1);
 5b0:	83 ec 04             	sub    $0x4,%esp
 5b3:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
 5b6:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 5b9:	6a 01                	push   $0x1
 5bb:	53                   	push   %ebx
 5bc:	57                   	push   %edi
 5bd:	e8 a1 fd ff ff       	call   363 <write>
        while(*s != 0){
 5c2:	0f b6 06             	movzbl (%esi),%eax
 5c5:	83 c4 10             	add    $0x10,%esp
 5c8:	84 c0                	test   %al,%al
 5ca:	75 e4                	jne    5b0 <printf+0x110>
      state = 0;
 5cc:	8b 75 d4             	mov    -0x2c(%ebp),%esi
 5cf:	31 d2                	xor    %edx,%edx
 5d1:	e9 17 ff ff ff       	jmp    4ed <printf+0x4d>
        printint(fd, *ap, 10, 1);
 5d6:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 5d9:	83 ec 0c             	sub    $0xc,%esp
 5dc:	b9 0a 00 00 00       	mov    $0xa,%ecx
 5e1:	8b 13                	mov    (%ebx),%edx
 5e3:	6a 01                	push   $0x1
 5e5:	eb 88                	jmp    56f <printf+0xcf>
        putc(fd, *ap);
 5e7:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 5ea:	83 ec 04             	sub    $0x4,%esp
 5ed:	8d 55 e7             	lea    -0x19(%ebp),%edx
        putc(fd, *ap);
 5f0:	8b 03                	mov    (%ebx),%eax
        ap++;
 5f2:	83 c3 04             	add    $0x4,%ebx
        putc(fd, *ap);
 5f5:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 5f8:	6a 01                	push   $0x1
 5fa:	52                   	push   %edx
 5fb:	57                   	push   %edi
 5fc:	e8 62 fd ff ff       	call   363 <write>
        ap++;
 601:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 604:	83 c4 10             	add    $0x10,%esp
      state = 0;
 607:	31 d2                	xor    %edx,%edx
 609:	e9 df fe ff ff       	jmp    4ed <printf+0x4d>
 60e:	66 90                	xchg   %ax,%ax
  write(fd, &c, 1);
 610:	83 ec 04             	sub    $0x4,%esp
 613:	88 5d e7             	mov    %bl,-0x19(%ebp)
 616:	8d 55 e7             	lea    -0x19(%ebp),%edx
 619:	6a 01                	push   $0x1
 61b:	e9 31 ff ff ff       	jmp    551 <printf+0xb1>
 620:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
 625:	bb a5 08 00 00       	mov    $0x8a5,%ebx
 62a:	e9 77 ff ff ff       	jmp    5a6 <printf+0x106>
 62f:	90                   	nop

00000630 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 630:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 631:	a1 48 0c 00 00       	mov    0xc48,%eax
{
 636:	89 e5                	mov    %esp,%ebp
 638:	57                   	push   %edi
 639:	56                   	push   %esi
 63a:	53                   	push   %ebx
 63b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 63e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 641:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 648:	8b 10                	mov    (%eax),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 64a:	39 c8                	cmp    %ecx,%eax
 64c:	73 32                	jae    680 <free+0x50>
 64e:	39 d1                	cmp    %edx,%ecx
 650:	72 04                	jb     656 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 652:	39 d0                	cmp    %edx,%eax
 654:	72 32                	jb     688 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 656:	8b 73 fc             	mov    -0x4(%ebx),%esi
 659:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 65c:	39 fa                	cmp    %edi,%edx
 65e:	74 30                	je     690 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 660:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 663:	8b 50 04             	mov    0x4(%eax),%edx
 666:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 669:	39 f1                	cmp    %esi,%ecx
 66b:	74 3a                	je     6a7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 66d:	89 08                	mov    %ecx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 66f:	5b                   	pop    %ebx
  freep = p;
 670:	a3 48 0c 00 00       	mov    %eax,0xc48
}
 675:	5e                   	pop    %esi
 676:	5f                   	pop    %edi
 677:	5d                   	pop    %ebp
 678:	c3                   	ret
 679:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 680:	39 d0                	cmp    %edx,%eax
 682:	72 04                	jb     688 <free+0x58>
 684:	39 d1                	cmp    %edx,%ecx
 686:	72 ce                	jb     656 <free+0x26>
{
 688:	89 d0                	mov    %edx,%eax
 68a:	eb bc                	jmp    648 <free+0x18>
 68c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 690:	03 72 04             	add    0x4(%edx),%esi
 693:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 696:	8b 10                	mov    (%eax),%edx
 698:	8b 12                	mov    (%edx),%edx
 69a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 69d:	8b 50 04             	mov    0x4(%eax),%edx
 6a0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 6a3:	39 f1                	cmp    %esi,%ecx
 6a5:	75 c6                	jne    66d <free+0x3d>
    p->s.size += bp->s.size;
 6a7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 6aa:	a3 48 0c 00 00       	mov    %eax,0xc48
    p->s.size += bp->s.size;
 6af:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6b2:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 6b5:	89 08                	mov    %ecx,(%eax)
}
 6b7:	5b                   	pop    %ebx
 6b8:	5e                   	pop    %esi
 6b9:	5f                   	pop    %edi
 6ba:	5d                   	pop    %ebp
 6bb:	c3                   	ret
 6bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000006c0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 6c0:	55                   	push   %ebp
 6c1:	89 e5                	mov    %esp,%ebp
 6c3:	57                   	push   %edi
 6c4:	56                   	push   %esi
 6c5:	53                   	push   %ebx
 6c6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6c9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 6cc:	8b 15 48 0c 00 00    	mov    0xc48,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6d2:	8d 78 07             	lea    0x7(%eax),%edi
 6d5:	c1 ef 03             	shr    $0x3,%edi
 6d8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 6db:	85 d2                	test   %edx,%edx
 6dd:	0f 84 8d 00 00 00    	je     770 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6e3:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 6e5:	8b 48 04             	mov    0x4(%eax),%ecx
 6e8:	39 f9                	cmp    %edi,%ecx
 6ea:	73 64                	jae    750 <malloc+0x90>
  if(nu < 4096)
 6ec:	bb 00 10 00 00       	mov    $0x1000,%ebx
 6f1:	39 df                	cmp    %ebx,%edi
 6f3:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 6f6:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 6fd:	eb 0a                	jmp    709 <malloc+0x49>
 6ff:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 700:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 702:	8b 48 04             	mov    0x4(%eax),%ecx
 705:	39 f9                	cmp    %edi,%ecx
 707:	73 47                	jae    750 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 709:	89 c2                	mov    %eax,%edx
 70b:	3b 05 48 0c 00 00    	cmp    0xc48,%eax
 711:	75 ed                	jne    700 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
 713:	83 ec 0c             	sub    $0xc,%esp
 716:	56                   	push   %esi
 717:	e8 af fc ff ff       	call   3cb <sbrk>
  if(p == (char*)-1)
 71c:	83 c4 10             	add    $0x10,%esp
 71f:	83 f8 ff             	cmp    $0xffffffff,%eax
 722:	74 1c                	je     740 <malloc+0x80>
  hp->s.size = nu;
 724:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 727:	83 ec 0c             	sub    $0xc,%esp
 72a:	83 c0 08             	add    $0x8,%eax
 72d:	50                   	push   %eax
 72e:	e8 fd fe ff ff       	call   630 <free>
  return freep;
 733:	8b 15 48 0c 00 00    	mov    0xc48,%edx
      if((p = morecore(nunits)) == 0)
 739:	83 c4 10             	add    $0x10,%esp
 73c:	85 d2                	test   %edx,%edx
 73e:	75 c0                	jne    700 <malloc+0x40>
        return 0;
  }
}
 740:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 743:	31 c0                	xor    %eax,%eax
}
 745:	5b                   	pop    %ebx
 746:	5e                   	pop    %esi
 747:	5f                   	pop    %edi
 748:	5d                   	pop    %ebp
 749:	c3                   	ret
 74a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 750:	39 cf                	cmp    %ecx,%edi
 752:	74 4c                	je     7a0 <malloc+0xe0>
        p->s.size -= nunits;
 754:	29 f9                	sub    %edi,%ecx
 756:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 759:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 75c:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 75f:	89 15 48 0c 00 00    	mov    %edx,0xc48
}
 765:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 768:	83 c0 08             	add    $0x8,%eax
}
 76b:	5b                   	pop    %ebx
 76c:	5e                   	pop    %esi
 76d:	5f                   	pop    %edi
 76e:	5d                   	pop    %ebp
 76f:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
 770:	c7 05 48 0c 00 00 4c 	movl   $0xc4c,0xc48
 777:	0c 00 00 
    base.s.size = 0;
 77a:	b8 4c 0c 00 00       	mov    $0xc4c,%eax
    base.s.ptr = freep = prevp = &base;
 77f:	c7 05 4c 0c 00 00 4c 	movl   $0xc4c,0xc4c
 786:	0c 00 00 
    base.s.size = 0;
 789:	c7 05 50 0c 00 00 00 	movl   $0x0,0xc50
 790:	00 00 00 
    if(p->s.size >= nunits){
 793:	e9 54 ff ff ff       	jmp    6ec <malloc+0x2c>
 798:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 79f:	00 
        prevp->s.ptr = p->s.ptr;
 7a0:	8b 08                	mov    (%eax),%ecx
 7a2:	89 0a                	mov    %ecx,(%edx)
 7a4:	eb b9                	jmp    75f <malloc+0x9f>
