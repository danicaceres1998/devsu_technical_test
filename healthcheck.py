from requests import get
from os import environ

def main():
    r = get(f'http://localhost:{environ["PORT"]}/api')
    if r.status_code != 200:
        exit(1)


if __name__ == '__main__':
    main()