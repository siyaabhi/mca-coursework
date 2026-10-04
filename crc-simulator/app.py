"""
app.py - Streamlit GUI for the CRC Error Detection Simulator.
Run with:  streamlit run app.py
"""
import random
import streamlit as st
import crc

st.set_page_config(page_title="CRC Error Detection Simulator", page_icon="🔐", layout="centered")


def show_bits(bits, crc_len=0, flipped=None):
    """Show a frame as coloured boxes: data = grey, CRC = amber, flipped bit = red."""
    cells = ""
    for i, b in enumerate(bits, 1):
        bg, fg = "#e8edf5", "#14213d"
        if crc_len and i > len(bits) - crc_len:
            bg = "#f2b134"
        if flipped == i:
            bg, fg = "#d7263d", "#ffffff"
        cells += (f"<span style='display:inline-block;width:26px;height:32px;line-height:32px;"
                  f"text-align:center;margin:2px;border-radius:5px;font-family:monospace;"
                  f"font-weight:bold;background:{bg};color:{fg}'>{b}</span>")
    st.markdown(cells, unsafe_allow_html=True)


# ---------- Session state (remembers values between button clicks) ----------
if "sent" not in st.session_state:
    st.session_state.sent = None      # result of the sender's CRC calculation
if "history" not in st.session_state:
    st.session_state.history = []     # one row per receiver verification
if "pos" not in st.session_state:
    st.session_state.pos = 1          # bit position chosen for the error

# ---------- Header ----------
st.title("CRC Error Detection Simulator")
st.caption("Computer Networks — Cyclic Redundancy Check")

with st.expander("How does CRC work?"):
    st.markdown("""
1. **Sender** appends *(generator length − 1)* zeros to the data.
2. It divides this by the generator using **modulo-2 (XOR) division**. The remainder is the **CRC**.
3. The CRC replaces the appended zeros, giving the **transmitted frame** (data + CRC).
4. **Receiver** divides the received frame by the same generator.
5. Remainder **all zeros** → no error detected. Otherwise → **error detected**.
""")

# ---------- 1. Sender ----------
st.header("1. Sender")
col1, col2 = st.columns(2)
data = col1.text_input("Data Bits", value="1101011011")
gen = col2.text_input("Generator Bits", value="10011")

if st.button("Generate CRC", type="primary"):
    # Validate before doing any calculation
    error = crc.validate_bits(data, "Data") or crc.validate_generator(gen)
    if error:
        st.session_state.sent = None
        st.error(error)
    else:
        st.session_state.sent = crc.generate_crc(data, gen)
        st.session_state.pos = 1

sent = st.session_state.sent
if sent is None:
    st.info("Enter data and generator bits, then click **Generate CRC**.")
    st.stop()

st.success("CRC generated successfully.")
m1, m2, m3 = st.columns(3)
m1.metric("Zeros appended", sent["zeros"])
m2.metric("CRC remainder", sent["remainder"])
m3.metric("Frame length", len(sent["frame"]))
st.write(f"**Original data:** `{sent['data']}`   |   **Generator:** `{sent['gen']}`")
st.write("**Transmitted frame** (data + CRC in amber):")
show_bits(sent["frame"], crc_len=sent["zeros"])

# ---------- 2. CRC Calculation ----------
st.header("2. CRC Calculation")
st.caption(f"Data with {sent['zeros']} zeros appended: {sent['padded']}")
st.code(sent["text"], language=None)

# ---------- 3. Transmission Channel ----------
st.header("3. Transmission Channel")
st.markdown("<h4 style='text-align:center'>📤 SENDER &nbsp;➜&nbsp; 📡 TRANSMISSION CHANNEL &nbsp;➜&nbsp; 📥 RECEIVER</h4>",
            unsafe_allow_html=True)

mode = st.radio("Channel condition", ["No Error", "Introduce Error"], horizontal=True)
frame = sent["frame"]
flipped_pos = None
received = frame

if mode == "Introduce Error":
    def random_bit():
        st.session_state.pos = random.randint(1, len(frame))

    c1, c2 = st.columns([3, 1])
    c1.slider("Bit position to flip (1 = leftmost)", 1, len(frame), key="pos")
    c2.write("")
    c2.button("🎲 Random error", on_click=random_bit)
    flipped_pos = st.session_state.pos
    received = crc.flip_bit(frame, flipped_pos)

st.write("**Transmitted frame:**")
show_bits(frame, crc_len=sent["zeros"])
st.write("**Received frame:**")
show_bits(received, crc_len=sent["zeros"], flipped=flipped_pos)
st.write(f"**Changed bit position:** {flipped_pos if flipped_pos else 'None'}")

# ---------- 4. Receiver ----------
st.header("4. Receiver")
if st.button("Verify Received Frame", type="primary"):
    result = crc.verify(received, sent["gen"])
    st.write(f"**Calculated remainder:** `{result['remainder']}`")
    if result["ok"]:
        st.success("✓ NO ERROR DETECTED")
        st.write("The remainder is all zeros, so the frame is accepted as correct.")
    else:
        st.error("✗ ERROR DETECTED")
        st.write("The remainder is not zero, so the frame was corrupted and would be discarded.")
    with st.expander("Show receiver's division"):
        st.code(result["text"], language=None)
    st.session_state.history.append({
        "Data": sent["data"], "Generator": sent["gen"], "Sent frame": frame,
        "Received frame": received, "Flipped bit": flipped_pos or "-",
        "Remainder": result["remainder"],
        "Result": "No error" if result["ok"] else "Error detected",
    })

# ---------- History and reset ----------
st.header("Transmission History")
if st.session_state.history:
    st.dataframe(st.session_state.history, width="stretch")
else:
    st.caption("No verifications yet in this session.")

if st.button("Reset everything"):
    st.session_state.clear()
    st.rerun()