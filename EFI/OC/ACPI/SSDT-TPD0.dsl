DefinitionBlock ("", "SSDT", 2, "HACK", "TPD0", 0x00000000)
{
    External (_SB_.PC00.TPD0, DeviceObj)

    Scope (\_SB.PC00.TPD0)
    {
        Name (SBFB, ResourceTemplate ()
        {
            I2cSerialBusV2 (0x0038, ControllerInitiated, 0x00061A80,
                AddressingMode7Bit, "\\_SB.PC00.I2C0",
                0x00, ResourceConsumer, , Exclusive,
                )
        })

        Method (_CRS, 0, NotSerialized)
        {
            Return (SBFB)
        }
    }
}
