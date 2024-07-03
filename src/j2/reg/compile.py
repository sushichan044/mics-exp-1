# use 1st arg as output file name

import sys


if __name__ == "__main__":
    args = sys.argv[1:]
    if len(args) < 1:
        print("Usage: python compile.py <main_module> [module1 module2 ...]")
        sys.exit(1)

    main_module_name = args[0]
    if main_module_name.endswith(".v"):
        main_module_name = main_module_name[:-2]

    modules = [main_module_name + ".v"] + args[1:]

    # execute compile with iverilog
    cmd = f"iverilog -o {main_module_name} -s {main_module_name} {' '.join(modules)}"
    print("Executing: ", cmd)
    print("Output below: ")
    print("--------------------------------------------------")
    import os

    os.system(cmd)
