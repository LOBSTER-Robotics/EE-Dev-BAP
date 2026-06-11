from scapy.all import Raw
from scapy.packet import Raw as ScapyRaw


def int_to_min_bytes(value: int) -> bytes:
    if value < 0:
        raise ValueError(f"Negative values are not allowed: {value}")

    byte_count = max(1, (value.bit_length() + 7) // 8)
    return value.to_bytes(byte_count, byteorder="big")


def list_to_payload_bytes(payload_list: list[int]) -> bytes:
    result = bytearray()

    for value in payload_list:
        if not isinstance(value, int):
            raise TypeError(f"List item is not an int: {value}")

        result.extend(int_to_min_bytes(value))

    return bytes(result)


def normalize_payload(payload):
    match payload:
        case None:
            print("No payload")
            return None

        case ScapyRaw():
            print("Payload is already Scapy Raw")
            return payload

        case str():
            print("Payload is str")
            return Raw(payload.encode("utf-8"))

        case bytes():
            print("Payload is bytes")
            return Raw(payload)

        case bytearray():
            print("Payload is bytearray")
            return Raw(bytes(payload))

        case list():
            print("Payload is list")
            return Raw(list_to_payload_bytes(payload))

        case _:
            print(f"Payload is not a valid type: {type(payload)}")
            return None