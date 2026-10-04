# CRC Error Detection Simulator
Computer Networks assignment: a Streamlit app that demonstrates Cyclic Redundancy Check using manual modulo-2 (XOR) division. No external CRC library.

## Files
- `crc.py` – CRC logic (validation, division, frame generation, bit flip, verification)
- `app.py` – Streamlit GUI
- `requirements.txt` – dependencies

## Install and run
```
pip install -r requirements.txt
streamlit run app.py
```
Opens at http://localhost:8501

## Test cases
| Data | Generator | CRC | Transmitted frame |
|---|---|---|---|
| 1101011011 | 10011 | 1110 | 11010110111110 |
| 100100 | 1101 | 001 | 100100001 |
| 1010101 | 101 | 00 | 101010100 |
| 11010011101100 | 1011 | 100 | 11010011101100100 |

With "No Error" the receiver remainder is all zeros. Flipping any single bit gives a non-zero remainder (ERROR DETECTED).

## Summary
CRC treats data as a polynomial and divides it by a generator polynomial using XOR (no carries). The sender appends r zeros (r = generator length - 1), divides, and replaces the zeros with the remainder. The receiver divides the whole frame; remainder 0 means no error detected. CRC detects all single-bit errors, all burst errors up to r bits, and all odd numbers of errors if the generator has an x+1 factor. Some error patterns divisible by the generator go undetected. It detects errors but cannot correct them, so the frame is discarded and retransmitted.
