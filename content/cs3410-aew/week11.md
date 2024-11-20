Hello!

I will include some stuff here that might be useful for exercises.

## Exercise starter code
### Thread exercise non-blocking io starter code
```c
#include <stdio.h>
#include <string.h>

long count_evens_from_1_to_5billion() {
    long count = 0;
    for (long i = 0; i < 5e9; i++) {
        if (count % 2 == 0) ++count;
    }
    return count;
}

int main() {
    char name[100];

    printf("What's your name?\n");
    printf("> ");
    fgets(name, sizeof(name), stdin);

    // remove newline character that fgets adds
    size_t len = strlen(name);
    if (len > 0 && name[len - 1] == '\n') name[len - 1] = '\0';

    long res = count_evens_from_1_to_5billion();
    printf("Hello, %s!\n Did you know that there are %ld even numbers from 1 to 1,000,000,000?\n", name, res);
}
```





## pthread
The [Man page](https://www.man7.org/linux/man-pages/man0/pthread.h.0p.html) for `pthread.h` is probably the most accurate information you can find, honestly I think it's good practice to be familiar with man pages, so I will recommend this approach, but the [CS 3410 notes](https://www.cs.cornell.edu/courses/cs3410/2024fa/notes/parallel.html) are pretty good too. 

A reminder to the most relevant functions to look for:
- pthread_create
- pthread_join


### Example template for exercises
```c
#include <stdio.h>
#include <pthread.h>

void* some_thread_func(void* args) {
    // code here

    return NULL;
}

int main() {
    // code here

    return 0;
}
```





## Possibly useful reference for sorting



### C implementation of quicksort
```c
void swap(int *a, int *b) {
    int temp = *a;
    *a = *b; 
    *b = temp;
}
```





## Troubleshooting for exercises
Last week, we ran into some issues that seem to be:
- Live Share is buggy
- windows not having access to the same stuff covered in course

### Live Share
I think it would be cool to use and up to you, but it's most important you can get code working on your computer first. If you do use, remember:
- have the liveshare plugin installed in VSCode
- [Live Share quickstart for sharing](https://learn.microsoft.com/en-us/visualstudio/liveshare/quickstart/share)
- [Live Share quickstart for join](https://learn.microsoft.com/en-us/visualstudio/liveshare/quickstart/join)

### Windows issues
As you may know, Windows is not POSIX-based like Mac or Linux, so you won't have access to stuff like pthread by default.

I'm aware of a few solutions for this that may be worth trying out:
- You could ssh into ugclinux and work from there; I recommend this path as I think it would be simplest ([link to CS 3410 page on ssh](https://www.cs.cornell.edu/courses/cs3410/2024fa/rsrc/ssh.html))
  - Notes on connecting to ssh through VSCode: you may need the "Remote - SSH" plugin, and then to SSH there should be a button on the bottom left corner.
- Use Docker; I wouldn't be able to help much with this since I have limited Docker experience.
- You could download a pthread implementation online ([sourceforge download](https://sourceforge.net/projects/pthreads4w/)); I don't have a Windows device to test this on currently, so I'm not sure how well this would go.






## Some good conceptual questions to be able to answer

Q: Can you explain the difference between parallelism and concurrency?


Q: Can you explain what lr.w and sc.w do? Why might they useful over lr and sw? 


