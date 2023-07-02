#![no_std]
#![no_main]

extern crate riscv_rt;

use riscv_rt::entry;

mod delay;
mod gpio;
mod la;
mod mprj;
mod spell;
mod spell_la;
mod spell_state;
use spell_state::SpellState;
mod uart;
mod wishbone;

mod uart_printer;
use uart_printer::Printer;

#[panic_handler]
fn panic(_info: &::core::panic::PanicInfo) -> ! {
    println!("PANIC!!! {}", _info);
    loop {}
}

const PIN: u8 = 0x36;
const DDR: u8 = 0x37;
const PORT: u8 = 0x38;

#[entry]
fn main() -> ! {
    gpio::init();
    uart::init();
    wishbone::wishbone_enable(true);
    la::enable_write(0xffff_ffff_0000_0000); // SPELL only uses the lower 32 bits of the LA

    // Setup the SPELL IO pins: First four pins are outputs, next four are inputs
    for i in 8..12 {
        mprj::set_io_mode(i, mprj::GPIO_MODE_USER_STD_OUT_MONITORED);
    }
    for i in 12..16 {
        mprj::set_io_mode(i, mprj::GPIO_MODE_MGMT_STD_OUT_MONITORED);
    }

    mprj::commit();

    println!("SPELL test suite\n");

    // Test one: add two numbers
    spell::stack_push(5 as u8);
    spell::stack_push(6 as u8);
    spell::exec('+' as u8); // Add two numbers
    assert_eq!(spell::read_stack_top(), 11 as u8);
    assert_eq!(spell::read_sp(), 1);
    println!(
        "✅ Test passed: {} + {} = {}",
        5,
        6,
        spell::read_stack_top()
    );

    // Test two: multiply two numbers
    spell::write_sp(0);
    spell::write_pc(0);
    #[rustfmt::skip]
    spell::write_program(0, &[
        10, 11,
        1, 'w' as u8,
        0, 'x' as u8,
        'x' as u8, 1, 'r' as u8, '+' as u8,
        'x' as u8, 6, '@' as u8,
        1, 'r' as u8, '-' as u8,
        'z' as u8,
    ]);
    spell::run();
    spell::wait_until_done();
    assert_eq!(spell::read_stack_top(), 110 as u8);
    assert_eq!(spell::read_pc(), 17);
    assert_eq!(spell::read_sp(), 1);
    println!(
        "✅ Test passed: {} * {} = {}",
        10,
        11,
        spell::read_stack_top()
    );

    // Test Logic Analyzer interface
    spell::write_sp(0);
    spell::write_progmem_byte(0x17, 0x42);
    spell::write_pc(0x17);
    spell::stack_push(0x55);
    spell::exec('z' as u8); // Sleep
    assert_eq!(
        spell_la::cpu_status(),
        spell_la::CPUStatus {
            pc: 0x17,
            opcode: 'z' as u8,
            sp: 1,
            state: SpellState::Sleep,
            top: 0x55,
        }
    );
    println!("✅ LA test passed",);

    // Test IO pins as inputs
    spell::write_sp(0);
    spell::stack_push(0xf);
    spell::stack_push(DDR);
    spell::exec('w' as u8);

    mprj::io_write(12, 0);
    spell::stack_push(PIN);
    spell::exec('r' as u8);
    assert_eq!(spell::read_stack_top() & 0x10, 0); // IO4 should be low

    mprj::io_write(12, 1);
    spell::stack_push(PIN);
    spell::exec('r' as u8);
    assert_eq!(spell::read_stack_top() & 0x10, 0x10); // IO4 should be high

    mprj::io_write(12, 0);
    spell::stack_push(PIN);
    spell::exec('r' as u8);
    assert_eq!(spell::read_stack_top() & 0x10, 0); // IO4 should be low again

    println!("✅ IO pin input test passed.");

    // Test IO pins as outputs
    spell::write_sp(0);
    spell::stack_push(0x0f);
    spell::stack_push(DDR);
    spell::exec('w' as u8);

    spell::stack_push(0x02);
    spell::stack_push(PORT);
    spell::exec('w' as u8);
    assert_eq!(mprj::io_read(8), 0);
    assert_eq!(mprj::io_read(9), 1);
    assert_eq!(mprj::io_read(10), 0);
    assert_eq!(mprj::io_read(11), 0);

    spell::stack_push(0x03);
    spell::stack_push(PIN);
    spell::exec('w' as u8);
    assert_eq!(mprj::io_read(8), 1);
    assert_eq!(mprj::io_read(9), 0);
    assert_eq!(mprj::io_read(10), 0);
    assert_eq!(mprj::io_read(11), 0);

    spell::stack_push(0x09);
    spell::stack_push(PIN);
    spell::exec('w' as u8);
    assert_eq!(mprj::io_read(8), 0);
    assert_eq!(mprj::io_read(9), 0);
    assert_eq!(mprj::io_read(10), 0);
    assert_eq!(mprj::io_read(11), 1);

    spell::stack_push(0x07);
    spell::stack_push(PIN);
    spell::exec('w' as u8);
    assert_eq!(mprj::io_read(8), 1);
    assert_eq!(mprj::io_read(9), 1);
    assert_eq!(mprj::io_read(10), 1);
    assert_eq!(mprj::io_read(11), 1);

    println!("✅ IO pin output test passed.");

    // Final test: SPELL blinky
    println!("☠️ Now running SPELL blinky.");
    spell::write_sp(0);
    spell::write_pc(0);
    #[rustfmt::skip]
    spell::write_program(0, &[
        /* 0x00 */    0x1,
        /* 0x01 */    DDR,
        /* 0x02 */    'w' as u8,
        /* 0x03 */    0x1,
        /* 0x04 */    PIN,
        /* 0x05 */    'w' as u8,
        /* 0x06 */    200, // ms
        /* 0x07 */    ',' as u8,
        /* 0x08 */    0x03,
        /* 0x09 */    '=' as u8,
    ]);
    spell::run();
    spell::wait_until_done();

    panic!("Blinky should never terminate!");
}
