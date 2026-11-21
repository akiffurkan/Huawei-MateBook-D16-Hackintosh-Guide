DefinitionBlock ("", "SSDT", 2, "HACK", "GPI0", 0x00000000)
{
    External (GPHD, FieldUnitObj)

    Scope (\_SB)
    {
        Device (GPOF)
        {
            Name (_HID, "GPOF0000")
            Method (_INI, 0, NotSerialized)
            {
                If (_OSI ("Darwin"))
                {
                    GPHD = Zero
                }
            }
        }
    }
}
