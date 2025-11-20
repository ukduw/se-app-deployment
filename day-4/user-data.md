# User Data
User data: **Launch instance -> Advanced details -> "User data - *optional*"**

This field accepts a **script** that runs when the **instance spins up**. This is more difficult to debug.


### Scripting differences
- No need for sudo; user data runs as root
- User data starts in / (root)
- .bashrc for env var's doesn't work

