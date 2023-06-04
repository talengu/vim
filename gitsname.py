import sys

def main():
    data = sys.argv[1:]
    if not sys.stdin.isatty():
        data.append(sys.stdin.read())
    return data


if __name__ == '__main__':
    data = main()
    for line in data[0].split("\n"):
        print(line.split(" ")[-1])
