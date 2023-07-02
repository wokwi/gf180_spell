#[derive(Debug, PartialEq)]
pub enum SpellState {
    Fetch,
    FetchData,
    Execute,
    Store,
    Delay,
    Sleep,
    Invalid,
}

impl From<u8> for SpellState {
    fn from(orig: u8) -> Self {
        match orig {
            0x0 => return SpellState::Fetch,
            0x1 => return SpellState::FetchData,
            0x2 => return SpellState::Execute,
            0x3 => return SpellState::Store,
            0x4 => return SpellState::Delay,
            0x5 => return SpellState::Sleep,
            _ => return SpellState::Invalid,
        };
    }
}
