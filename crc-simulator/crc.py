"""
crc.py - CRC logic (modulo-2 division using XOR).
No GUI code and no external CRC library is used here.
"""


def validate_bits(text, name="Input"):
    """Return an error message if text is not a non-empty 0/1 string, else None."""
    if text == "":
        return f"{name} must not be empty."
    if any(ch not in "01" for ch in text):
        return f"{name} must contain only 0 and 1."
    return None


def validate_generator(gen):
    """Generator must be binary, at least 2 bits long and start with 1."""
    error = validate_bits(gen, "Generator")
    if error:
        return error
    if len(gen) < 2:
        return "Generator must contain at least two bits."
    if gen[0] != "1":
        return "Generator must start with 1."
    return None


def xor_bits(a, b):
    """XOR two equal-length bit strings: '1011' ^ '1101' -> '0110'."""
    return "".join("0" if x == y else "1" for x, y in zip(a, b))


def mod2_division(dividend, gen):
    """
    Divide dividend by gen using modulo-2 (XOR) long division.
    Returns (remainder, steps).
    remainder has len(gen)-1 bits.
    Each step is a dict describing one XOR (shift = position of the window).
    """
    n = len(gen)
    bits = list(dividend)
    steps = []
    for i in range(len(bits) - n + 1):
        if bits[i] == "1":                      # only XOR when leading bit is 1
            window = "".join(bits[i:i + n])
            result = xor_bits(window, gen)
            bits[i:i + n] = list(result)
            steps.append({"shift": i, "window": window, "gen": gen, "result": result})
    remainder = "".join(bits[-(n - 1):])
    return remainder, steps


def format_division(dividend, gen, steps, remainder):
    """Build a readable text version of the long division."""
    n = len(gen)
    lines = [f"Dividend : {dividend}", f"Divisor  : {gen}", ""]
    lines.append(dividend)
    for k, s in enumerate(steps, 1):
        pad = " " * s["shift"]
        lines.append(f"{pad}{s['gen']}   <- step {k}: XOR (leading bit is 1)")
        lines.append(pad + "-" * n)
        lines.append(f"{pad}{s['result']}")
    lines.append("")
    lines.append(f"Remainder (CRC) = {remainder}")
    return "\n".join(lines)


def generate_crc(data, gen):
    """Append (len(gen)-1) zeros, divide, and build the transmitted frame."""
    zeros = len(gen) - 1
    padded = data + "0" * zeros
    remainder, steps = mod2_division(padded, gen)
    return {
        "data": data, "gen": gen, "zeros": zeros, "padded": padded,
        "remainder": remainder, "frame": data + remainder, "steps": steps,
        "text": format_division(padded, gen, steps, remainder),
    }


def flip_bit(frame, position):
    """Flip one bit. position is 1-based (1 = leftmost bit)."""
    i = position - 1
    flipped = "1" if frame[i] == "0" else "0"
    return frame[:i] + flipped + frame[i + 1:]


def verify(frame, gen):
    """Divide received frame by gen. All-zero remainder => no error detected."""
    remainder, steps = mod2_division(frame, gen)
    return {
        "remainder": remainder, "ok": set(remainder) == {"0"},
        "text": format_division(frame, gen, steps, remainder),
    }