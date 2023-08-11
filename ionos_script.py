import argparse
import requests


with open(".ionos_prefix", "r") as fp:
    prefix = fp.read().strip()

with open(".ionos_key", "r") as fp:
    key = fp.read().strip()

headers = {
    "X-API-Key": f"{prefix}.{key}"
}

zone_id = "e8007bf2-3483-11ee-920c-0a5864441240"
record_id = "d863508c-10d9-9c84-a1a9-f43a2439a2a3"
registry_record_id = "8faccae7-fd94-9c9a-d80f-59f13a101d8b"


def get_zones():
    url = "https://api.hosting.ionos.com/dns/v1/zones"
    response = requests.get(url, headers=headers)
    return response.json()


def create_record(zone_id, data):
    url = f"https://api.hosting.ionos.com/dns/v1/zones/{zone_id}/records"
    print(url)
    response = requests.post(url, headers=headers, json=data)
    return response.json()

def update_record(zone_id, record_id, new_ip_address):
    url = f"https://api.hosting.ionos.com/dns/v1/zones/{zone_id}/records/{record_id}"
    print(url)
    data = {"content": new_ip_address}
    response = requests.put(url, headers=headers, json=data)
    return response.json()

def create_cloud_record():
    record = create_record(zone_id, [{
        "name": "cloud.mygpu.de",
        "type": "A",
        "content": "1.2.3.4",
        "ttl": 60,
        "prio": 0,
        "disabled": False
    }])

    print(record)


if __name__ == "__main__":
    public_ip_address = requests.get("https://ifconfig.me").text
    response = update_record(zone_id, record_id, public_ip_address)
    print(response)
    response = update_record(zone_id, registry_record_id, public_ip_address)
    print(response)
