from eth_utils import keccak
from web3 import Web3
import json

def bytes_to_bits(byte_data: bytes, bits: int) -> list:
    val = int.from_bytes(byte_data, "big")
    return [int(b) for b in bin(val)[2:].zfill(bits)][::-1]

user_hex = "WRITE YOUR ADDRESS"
amount_int = "WRITE AMOUNT LOCKED * (10**18)

user_bytes = Web3.to_bytes(hexstr=user_hex)[-20:]
amount_bytes = amount_int.to_bytes(32, 'big')

data = user_bytes + amount_bytes
hash_bytes = keccak(data)

input_json = {
    "user": bytes_to_bits(user_bytes, 160),
    "amount": bytes_to_bits(amount_bytes, 256),
    "expectedHash": bytes_to_bits(hash_bytes, 256)
}

with open("input.json", "w") as f:
    json.dump(input_json, f, indent=2)

print("✅ input.json created")
