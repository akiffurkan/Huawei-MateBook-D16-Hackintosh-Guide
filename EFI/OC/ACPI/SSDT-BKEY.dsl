DefinitionBlock ("", "SSDT", 2, "HACK", "BKEY", 0x00000000)
{
    External (_SB_.PC00.LPCB.HWEC, DeviceObj)
    External (_SB_.PC00.LPCB.HWEC.XQ0A, MethodObj)
    External (_SB_.PC00.LPCB.HWEC.XQ0B, MethodObj)
    External (_SB_.PC00.GFX0.DD1F, DeviceObj)

    Scope (\_SB.PC00.LPCB.HWEC)
    {
        Method (_Q0A, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                Notify (\_SB.PC00.GFX0.DD1F, 0x87)
            }
            Else
            {
                \_SB.PC00.LPCB.HWEC.XQ0A ()
            }
        }

        Method (_Q0B, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                Notify (\_SB.PC00.GFX0.DD1F, 0x86)
            }
            Else
            {
                \_SB.PC00.LPCB.HWEC.XQ0B ()
            }
        }
    }
}
