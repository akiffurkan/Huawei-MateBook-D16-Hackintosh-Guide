DefinitionBlock ("", "SSDT", 2, "HACK", "TPD0", 0x00000000)
{
    External (_SB_.PC00.I2C0, DeviceObj)
    External (_SB_.GPI0, DeviceObj)

    Scope (\_SB.PC00.I2C0)
    {
        Device (TPD0)
        {
            Name (_HID, "FTCS1000")
            Name (_CID, "PNP0C50")
            Name (_UID, One)
            Name (_S0W, 0x03)

            Method (_DSM, 4, Serialized)
            {
                If (Arg0 == ToUUID ("3cdff6f7-4267-4555-ad05-b30a3d8938de"))
                {
                    If (Arg2 == Zero)
                    {
                        Return (Buffer (One) { 0x03 })
                    }

                    If (Arg2 == One)
                    {
                        Return (0x0001)
                    }
                }

                Return (Buffer (One) { 0x00 })
            }

            Method (_STA, 0, NotSerialized)
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Name (SBFB, ResourceTemplate ()
            {
                I2cSerialBusV2 (0x0038, ControllerInitiated, 0x00061A80,
                    AddressingMode7Bit, "\\_SB.PC00.I2C0",
                    0x00, ResourceConsumer, , Exclusive,
                    )
            })

            Name (SBFG, ResourceTemplate ()
            {
                GpioInt (Level, ActiveLow, ExclusiveAndWake, PullDefault, 0x0000,
                    "\\_SB.GPI0", 0x00, ResourceConsumer, ,
                    )
                    {
                        0x00AD
                    }
            })

            Method (_CRS, 0, NotSerialized)
            {
                Return (ConcatenateResTemplate (SBFB, SBFG))
            }
        }
    }
}
