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
In Linux, there are **3 standard streams**:
- **Standard Input (stdin)**
  - The stream **from which a command gets its input**
  - It's **usually the keyboard** but can be **redirected from a file or another command**
    - Examples above...
- **Standard Output (stdout)**
  - The stream **where a command writes its output**
  - By **default**, this is the **terminal screen**
    - `echo "This is stdout` - prints to terminal
    - 3rd example below...
- **Standard Error (stderr)**
  - The stream **where a command writes it error messages**
  - By **default**, this is also the **terminal screen**, but it **can be redirected separately from stdout**
    - `ls non_existent_file` - prints error to terminal
    - `ls non_existent_file 2> error_log.txt` - `2>` redirects errors, in this case, to `error_log.txt`
    - `ls non_existent_file > output.txt 2>&1` - `2` is `stderr`, `1` is `stdout` - in this case, they're both being redirected to the same file, `output.txt`
    - `ls non_existent_file >> output.txt 2>> error.txt` - in this case, `stdout` is **appended** to `output.txt`, while `stderr` is **appended** to `error.txt`


