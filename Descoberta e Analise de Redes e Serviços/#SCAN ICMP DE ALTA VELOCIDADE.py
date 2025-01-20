#SCAN ICMP DE ALTA VELOCIDADE

import random
import socket
import time
import ipaddress
import struct
from threading import Thread

SIGNAL = True

def checksum(source_string):
    csum = 0
    count_to = (len(source_string) // 2) * 2
    count = 0

    while count < count_to:
        this_val = (source_string[count + 1]) * 256 + (source_string[count])
        csum += this_val
        csum = (csum >> 16) + (csum & 0xffff)
        count += 2

    if count_to < len(source_string):
        csum += (source_string[len(source_string) - 1])
        csum = (csum >> 16) + (csum & 0xffff)

    csum = (csum >> 16) + (csum & 0xffff)
    answer = ~csum
    answer = answer & 0xffff
    answer = answer >> 8 | (answer << 8 & 0xff00)
    return answer
