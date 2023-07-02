const REG_LA1_IENA: *mut u32 = 0xf0003000u32 as _;
const REG_LA0_IENA: *mut u32 = 0xf0003004u32 as _;
const REG_LA1_OENB: *mut u32 = 0xf0003008u32 as _;
const REG_LA0_OENB: *mut u32 = 0xf000300cu32 as _;
const REG_LA1_DATA_IN: *mut u32 = 0xf0003010u32 as _;
const REG_LA0_DATA_IN: *mut u32 = 0xf0003014u32 as _;
const REG_LA1_DATA_OUT: *mut u32 = 0xf0003018u32 as _;
const REG_LA0_DATA_OUT: *mut u32 = 0xf000301cu32 as _;

const REG_LA_SAMPLE: *mut u32 = 0x25000030u32 as _;

pub fn enable_read() -> u64 {
    let mut enable: u64 = 0;
    unsafe {
        enable |= core::ptr::read_volatile(REG_LA1_IENA) as u64;
        enable <<= 32;
        enable |= core::ptr::read_volatile(REG_LA0_IENA) as u64;
    }
    enable
}

pub fn enable_write(enable: u64) {
    unsafe {
        core::ptr::write_volatile(REG_LA1_IENA, (enable >> 32) as u32);
        core::ptr::write_volatile(REG_LA0_IENA, enable as u32);
    }
}

pub fn oenb_read() -> u64 {
    let mut oenb: u64 = 0;
    unsafe {
        oenb |= core::ptr::read_volatile(REG_LA1_OENB) as u64;
        oenb <<= 32;
        oenb |= core::ptr::read_volatile(REG_LA0_OENB) as u64;
    }
    oenb
}

pub fn oenb_write(oenb: u64) {
    unsafe {
        core::ptr::write_volatile(REG_LA1_OENB, (oenb >> 32) as u32);
        core::ptr::write_volatile(REG_LA0_OENB, oenb as u32);
    }
}

pub fn sample() {
    unsafe {
        core::ptr::write_volatile(REG_LA_SAMPLE, 1);
    }
}

pub fn data_in_read() -> u64 {
    let mut data_in: u64 = 0;
    unsafe {
        data_in |= core::ptr::read_volatile(REG_LA1_DATA_IN) as u64;
        data_in <<= 32;
        data_in |= core::ptr::read_volatile(REG_LA0_DATA_IN) as u64;
    }
    data_in
}

pub fn data_out_read() -> u64 {
    let mut data_out: u64 = 0;
    unsafe {
        data_out |= core::ptr::read_volatile(REG_LA1_DATA_OUT) as u64;
        data_out <<= 32;
        data_out |= core::ptr::read_volatile(REG_LA0_DATA_OUT) as u64;
    }
    data_out
}

pub fn data_out_write(data_out: u64) {
    unsafe {
        core::ptr::write_volatile(REG_LA1_DATA_OUT, (data_out >> 32) as u32);
        core::ptr::write_volatile(REG_LA0_DATA_OUT, data_out as u32);
    }
}
