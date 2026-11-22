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
 *     Length           0x00000067 (103)
 *     Revision         0x02
 *     Checksum         0x92
 *     OEM ID           "HACK"
 *     OEM Table ID     "GPI0"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20250807 (539297799)
 */
DefinitionBlock ("", "SSDT", 2, "HACK", "GPI0", 0x00000000)
{
    External (GPHD, FieldUnitObj)

    Scope (\_SB)
    {
        Device (GPOF)
        {
            Name (_HID, "GPOF0000")  // _HID: Hardware ID
            Method (_INI, 0, NotSerialized)  // _INI: Initialize
            {
                If (_OSI ("Darwin"))
                {
                    GPHD = Zero
                }
            }
        }
    }
}

