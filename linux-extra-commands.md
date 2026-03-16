## Redirection and appending
Redirection is used to control where the input/output of a command goes

### Redirection of output (>, >>) / input (<)
- `>` is used to **send the output of a command to a file**
  - This **overwrites** the file if it already exists
  - e.g. `echo "Hello, world!" > hello.txt`
- `>>` **appends output to a file, rather than overwriting it**
    - e.g. `"This is another line" >> hello.txt`
- `<` is used to **input the contents of a file to a command**
  - e.g. `sort < file.txt`


## Piping
Piping (`|`) is used to **pass the output of one command as the input to another command**. This allows you to **chain multiple commands together in sequence**.
- `ls | grep *.txt`
  - `ls` lists files/directories
  - `|` sends this to `grep *.txt`
  - `grep *.txt` filters the results and returns only .txt files
- `cat file.txt | grep "error" | wc -l >> errors.txt`
  - `cat` outputs the contents of `file.txt` - this is passed to `grep`
  - `grep "error"` filters for lines containing the string `"error"` - this is passed to `wc`
  - `wc -l` counts the number of lines returned by `grep`, in other words, the number of lines containing `"error"`
    - (word count --lines)
  - The final output is then appended to `errors.txt`


## Streams



