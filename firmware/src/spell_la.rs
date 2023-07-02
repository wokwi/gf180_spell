/* Logic analyzer interface for spell */

use super::la;
use super::spell_state::SpellState;

#[derive(Debug, PartialEq)]
pub struct CPUStatus {
    pub pc: u8,
    pub opcode: u8,
    pub sp: u8,
    pub state: SpellState,
    pub top: u8,
}

pub fn cpu_status() -> CPUStatus {
    la::sample();
    let la_value = la::data_in_read();
    CPUStatus {
        pc: la_value as u8,
        opcode: (la_value >> 8) as u8,
        sp: ((la_value >> 16) & 0x1F) as u8,
        state: (((la_value >> 21) & 0x7) as u8).into(),
        top: (la_value >> 24) as u8,
    }
}
