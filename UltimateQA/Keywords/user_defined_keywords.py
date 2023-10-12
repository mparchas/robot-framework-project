import random
import string

def gen_random_credentials(num: int) -> dict:
    signs = string.ascii_letters + string.digits
    credentials_dict = {}
    for n in range(num):
        credentials_dict[''.join(random.sample(signs, random.randint(3, 10)))] = ''.join(random.sample(signs, random.randint(3, 10)))
    return credentials_dict
