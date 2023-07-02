const REG_PC: u32 = 0x3400_0000;
const REG_SP: u32 = 0x3400_0004;
const REG_EXEC: u32 = 0x3400_0008;
const REG_CTRL: u32 = 0x3400_000c;
const REG_CYCLES_PER_MS: u32 = 0x3400_0010;
const REG_STACK_TOP: u32 = 0x3400_0014;
const REG_STACK_PUSH: u32 = 0x3400_0018;
const REG_INT_ENABLE: u32 = 0x3400_0020;
const REG_INT: u32 = 0x3400_0024;

pub const CTRL_RUN_OFFSET: u32 = 0;
pub const CTRL_SINGLE_STEP_OFFSET: u32 = 1;
pub const CTRL_SRAM_ENABLE_OFFSET: u32 = 2;
pub const CTRL_EDGE_INTERRUPTS_OFFSET: u32 = 3;

pub const INTR_SLEEP: u32 = 0;
pub const INTR_STOP: u32 = 1;
pub const INTR_COUNT: u32 = 2;

pub fn read_pc() -> u32 {
    unsafe { core::ptr::read_volatile(REG_PC as *const u32) }
}

pub fn write_pc(value: u32) {
    unsafe {
        core::ptr::write_volatile(REG_PC as *mut u32, value);
    }
}

pub fn read_sp() -> u32 {
    unsafe { core::ptr::read_volatile(REG_SP as *const u32) }
}

pub fn write_sp(value: u32) {
    unsafe {
        core::ptr::write_volatile(REG_SP as *mut u32, value);
    }
}

pub fn read_opcode() -> u8 {
    unsafe { core::ptr::read_volatile(REG_EXEC as *const u8) }
}

pub fn exec(opcode: u8) {
    unsafe {
        core::ptr::write_volatile(REG_EXEC as *mut u8, opcode);
    }
    wait_until_done();
}

pub fn read_ctrl() -> u32 {
    unsafe { core::ptr::read_volatile(REG_CTRL as *const u32) }
}

pub fn write_ctrl(value: u32) {
    unsafe {
        core::ptr::write_volatile(REG_CTRL as *mut u32, value);
    }
}

pub fn read_cycles_per_ms() -> u32 {
    unsafe { core::ptr::read_volatile(REG_CYCLES_PER_MS as *const u32) }
}

pub fn write_cycles_per_ms(value: u32) {
    unsafe {
        core::ptr::write_volatile(REG_CYCLES_PER_MS as *mut u32, value);
    }
}

pub fn read_stack_top() -> u8 {
    unsafe { core::ptr::read_volatile(REG_STACK_TOP as *const u8) }
}

pub fn write_stack_top(value: u8) {
    unsafe {
        core::ptr::write_volatile(REG_STACK_TOP as *mut u8, value);
    }
}

pub fn stack_push(value: u8) {
    unsafe {
        core::ptr::write_volatile(REG_STACK_PUSH as *mut u8, value);
    }
}

pub fn read_int_enable() -> u32 {
    unsafe { core::ptr::read_volatile(REG_INT_ENABLE as *const u32) }
}

pub fn write_int_enable(value: u32) {
    unsafe {
        core::ptr::write_volatile(REG_INT_ENABLE as *mut u32, value);
    }
}

pub fn read_int() -> u32 {
    unsafe { core::ptr::read_volatile(REG_INT as *const u32) }
}

pub fn write_int(value: u32) {
    unsafe {
        core::ptr::write_volatile(REG_INT as *mut u32, value);
    }
}

pub fn run() {
    let mut ctrl = read_ctrl();
    ctrl |= 1 << CTRL_RUN_OFFSET;
    ctrl &= !(1 << CTRL_SINGLE_STEP_OFFSET);
    write_ctrl(ctrl);
}

pub fn wait_until_done() {
    while read_ctrl() & (1 << CTRL_RUN_OFFSET) != 0 {}
}

pub fn stop() {
    let mut ctrl = read_ctrl();
    ctrl &= !(1 << CTRL_RUN_OFFSET);
    write_ctrl(ctrl);
}

pub fn step() {
    let mut ctrl = read_ctrl();
    ctrl |= 1 << CTRL_RUN_OFFSET;
    ctrl |= 1 << CTRL_SINGLE_STEP_OFFSET;
    write_ctrl(ctrl);
}

pub fn write_progmem_byte(addr: u8, value: u8) {
    stack_push(value);
    stack_push(addr);
    exec('!' as u8);
}

pub fn write_program(addr: u8, bytes: &[u8]) {
    for (i, byte) in bytes.iter().enumerate() {
        write_progmem_byte(addr + (i as u8), *byte);
    }
}
