# myfetch.sh

A simple and visually appealing Bash system information script. `myfetch.sh` displays your system details alongside ASCII art for a clean and colorful terminal summary.

---

## Features

* Shows the following system information:

  * User and hostname
  * Operating System
  * Kernel version
  * Shell
  * Terminal emulator
  * Desktop environment
  * Screen resolution
  * Uptime
  * CPU model
  * Memory usage
* Colorful output for better readability
* ASCII art display for a visually appealing presentation
* Lightweight and fully written in Bash
* Easy to customize

---

## Preview

```
razvan@ThinkCentre-M920q
---------------------------------------
OS:        Ubuntu 22.04
Kernel:    6.2.0-26-generic
Shell:     bash
Resolution: 1920x1080
Terminal:  gnome-terminal
User:      razvan
Uptime:    up 3 hours, 42 minutes
CPU:       Intel(R) Core(TM) i5-9500 CPU @ 3.00GHz
Memory:    4.5G/16G
```

Alongside a sleek ASCII art logo.

---

## Installation

1. Clone the repository:

```bash
git clone https://github.com/raz-th/myfetch.git
```

2. Navigate into the project directory:

```bash
cd myfetch.sh
```

3. Make the script executable:

```bash
chmod +x myfetch.sh
```

---

## Usage

Run the script in your terminal:

```bash
./myfetch.sh
```

Optional: Add it to your shell profile (`.bashrc` or `.zshrc`) to show the info on terminal startup:

```bash
echo "~/path/to/myfetch.sh" >> ~/.bashrc
```

---

## Customization

* **Colors:** Modify the ANSI color codes at the top of the script (`RED`, `GREEN`, `BLUE`, etc.).
* **ASCII Art:** Change or replace the art in the `readarray -t ART <<'EOF'` section.
* **Information:** Add, remove, or reorder fields in the `INFO` array.

---

## Requirements

* Bash 4+
* Linux system
* `lscpu`, `free`, `xdpyinfo` utilities installed

---

## Contributing

Feel free to submit issues, suggest features, or contribute improvements via pull requests.

---

## License

This project is open-source and available under the MIT License.
