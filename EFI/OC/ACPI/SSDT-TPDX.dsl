/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20250807 (32-bit version)
 * Copyright (c) 2000 - 2025 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of D:/Hackintosh D16/repo_staging/EFI/OC/ACPI/SSDT-TPDX.aml
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000170 (368)
 *     Revision         0x02
 *     Checksum         0x54
 *     OEM ID           "HACK"
 *     OEM Table ID     "TPDX"
 *     OEM Revision     0x00000004 (4)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20250807 (539297799)
 */
DefinitionBlock ("", "SSDT", 2, "HACK", "TPDX", 0x00000004)
{
    External (_SB_.PC00.I2C0, DeviceObj)
    External (_SB_.PC00.TPD0.SBFI, BuffObj)
    External (GRXE, MethodObj)    // 2 Arguments
    External (SGII, MethodObj)    // 2 Arguments
    External (SGRA, MethodObj)    // 2 Arguments

    Scope (_SB.PC00.I2C0)
    {
        Device (TPDX)
        {
            Name (_HID, "FTCS1000")  // _HID: Hardware ID
            Name (_CID, "PNP0C50" /* HID Protocol Device (I2C bus) */)  // _CID: Compatible ID
            Name (_UID, One)  // _UID: Unique ID
            Name (_S0W, 0x03)  // _S0W: S0 Device Wake State
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }

                Return (Zero)
            }

            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {
                SGRA (0x0908000D, One)
                SGII (0x0908000D, Zero)
                GRXE (0x0908000D, Zero)
                Name (SBFB, ResourceTemplate ()
                {
                    I2cSerialBusV2 (0x0038, ControllerInitiated, 0x000186A0,
                        AddressingMode7Bit, "\\_SB.PC00.I2C0",
                        0x00, ResourceConsumer, , Exclusive,
                        )
                })
                Return (ConcatenateResTemplate (SBFB, \_SB.PC00.TPD0.SBFI))
            }

            Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
            {
                If ((Arg0 == ToUUID ("3cdff6f7-4267-4555-ad05-b30a3d8938de") /* HID I2C Device */))
                {
                    If ((Arg2 == Zero))
                    {
                        If ((Arg1 == One))
                        {
                            Return (Buffer (One)
                            {
                                 0x03                                             // .
                            })
                        }

                        Return (Buffer (One)
                        {
                             0x00                                             // .
                        })
                    }

                    If ((Arg2 == One))
                    {
                        Return (One)
                    }
                }

                Return (Buffer (One)
                {
                     0x00                                             // .
                })
            }
        }
    }
}

