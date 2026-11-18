/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20250807 (32-bit version)
 * Copyright (c) 2000 - 2025 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of D:/Hackintosh D16/repo_staging/EFI/OC/ACPI/SSDT-GPI0.aml
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x0000007C (124)
 *     Revision         0x02
 *     Checksum         0xC7
 *     OEM ID           "ZPSS"
 *     OEM Table ID     "GPI0"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20251212 (539300370)
 */
DefinitionBlock ("", "SSDT", 2, "ZPSS", "GPI0", 0x00000000)
{
    External (_SB_.GPI0, DeviceObj)
    External (_SB_.GPI0.XSTA, MethodObj)    // 0 Arguments

    Scope (\_SB.GPI0)
    {
        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            If (_OSI ("Darwin"))
            {
                Return (0x0F)
            }
            Else
            {
                Return (\_SB.GPI0.XSTA ())
            }
        }
    }
}

