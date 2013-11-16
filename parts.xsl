<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output omit-xml-declaration="yes" indent="no"/>


<xsl:template match="/"># vim:ts=4 sts=0 sw=4

<xsl:text>ADMIN
	PART_NAME=</xsl:text><xsl:value-of select="/AVRPART/ADMIN/PART_NAME"/><xsl:text>
	CORE_VERSION=</xsl:text><xsl:value-of select="/AVRPART/CORE/CORE_VERSION"/>
	<xsl:if test="not(/AVRPART/CORE/NEW_INSTRUCTIONS='[]')">a</xsl:if><xsl:text>
	SPEED=</xsl:text><xsl:value-of select="/AVRPART/ADMIN/SPEED"/><xsl:text>
	SIGNATURE=$</xsl:text><xsl:value-of select="substring(/AVRPART/ADMIN/SIGNATURE/ADDR000,2)"/>
	<xsl:value-of select="substring(/AVRPART/ADMIN/SIGNATURE/ADDR001,2)"/>
	<xsl:value-of select="substring(/AVRPART/ADMIN/SIGNATURE/ADDR002,2)"/><xsl:text>
	TOGGLE_PIN=</xsl:text><xsl:value-of select="/AVRPART/ICE_SETTINGS/SIMULATOR/PORTB/TOGGLE_PIN"/><xsl:text>
	OSCCAL=</xsl:text><xsl:for-each select="/AVRPART/PROGRAMMING/OscCal/*">
	<xsl:text>,</xsl:text><xsl:value-of select="substring-before(substring-after(.,','),' ')"/>
	</xsl:for-each><xsl:text>
	PROGIF=</xsl:text>
	<xsl:if test="/AVRPART/PROGRAMMING/ISPInterface">isp</xsl:if>
	<xsl:if test="/AVRPART/PROGRAMMING/HVInterface">
	<xsl:if test="AVRPART/ICE_SETTINGS/STK500_2/PPControlStack">,hvpp</xsl:if>
	<xsl:if test="AVRPART/ICE_SETTINGS/STK500_2/HvspControlStack">,hvsp</xsl:if>
	</xsl:if>
	<xsl:if test="/AVRPART/ICE_SETTINGS/JTAGICEmkII/Interface='DebugWire'">,dw</xsl:if>	
	<xsl:if test="/AVRPART/PROGRAMMING/JTAGInterface">,mj</xsl:if>
	<xsl:text>
</xsl:text>


<xsl:text>
MEMORY
	FLASH=</xsl:text><xsl:value-of select="/AVRPART/MEMORY/PROG_FLASH"/>
	<xsl:text>,</xsl:text><xsl:value-of select="/AVRPART/PROGRAMMING/FlashPageSize"/><xsl:text>
	EEPROM=</xsl:text><xsl:value-of select="/AVRPART/MEMORY/EEPROM"/>
	<xsl:text>,</xsl:text><xsl:value-of select="/AVRPART/PROGRAMMING/EepromPageSize"/><xsl:text>
	IRAM=</xsl:text><xsl:value-of select="/AVRPART/MEMORY/INT_SRAM/SIZE"/>
	<xsl:text>,</xsl:text><xsl:value-of select="/AVRPART/MEMORY/INT_SRAM/START_ADDR"/><xsl:text>
	ERAM=</xsl:text><xsl:value-of select="/AVRPART/MEMORY/EXT_SRAM/SIZE"/>
	<xsl:text>,</xsl:text><xsl:value-of select="/AVRPART/MEMORY/EXT_SRAM/START_ADDR"/><xsl:text>
</xsl:text>


<xsl:if test="/AVRPART/MEMORY/BOOT_CONFIG">
<xsl:text>
BOOT
	RWW=</xsl:text><xsl:value-of select="/AVRPART/MEMORY/BOOT_CONFIG/RWW_START_ADDR"/>
	<xsl:text>,</xsl:text><xsl:value-of select="/AVRPART/MEMORY/BOOT_CONFIG/RWW_STOP_ADDR"/><xsl:text>
	NRWW=</xsl:text><xsl:value-of select="/AVRPART/MEMORY/BOOT_CONFIG/NRWW_START_ADDR"/>
	<xsl:text>,</xsl:text><xsl:value-of select="/AVRPART/MEMORY/BOOT_CONFIG/NRWW_STOP_ADDR"/>
	<xsl:if test="/AVRPART/MEMORY/BOOT_CONFIG/BOOTSZMODE1/BOOTSTART"><xsl:text>
	BOOTSIZES=</xsl:text><xsl:value-of select="/AVRPART/MEMORY/BOOT_CONFIG/BOOTSZMODE1/BOOTSTART"/>
	<xsl:text>,</xsl:text><xsl:value-of select="/AVRPART/MEMORY/BOOT_CONFIG/BOOTSZMODE2/BOOTSTART"/>
	<xsl:text>,</xsl:text><xsl:value-of select="/AVRPART/MEMORY/BOOT_CONFIG/BOOTSZMODE3/BOOTSTART"/>
	<xsl:text>,</xsl:text><xsl:value-of select="/AVRPART/MEMORY/BOOT_CONFIG/BOOTSZMODE4/BOOTSTART"/></xsl:if>
<xsl:text>
</xsl:text>
</xsl:if>


<xsl:text>
INTERRUPTS</xsl:text>
<xsl:for-each select="/AVRPART/INTERRUPT_VECTOR/*/PROGRAM_ADDRESS"><xsl:text>
	</xsl:text><xsl:value-of select="."/>=<xsl:value-of select="../SOURCE"/>
</xsl:for-each>
<xsl:text>
</xsl:text>

<xsl:if test="/AVRPART/ICE_SETTINGS/JTAGICEmkII/Interface">
<xsl:text>
OCD
	REV=</xsl:text><xsl:value-of select="/AVRPART/ADMIN/OCD_PARAMETERS/OCD_REVISION"/><xsl:text>
	OCDR=</xsl:text><xsl:value-of select="/AVRPART/ADMIN/OCD_PARAMETERS/OCD_REGISTER_ADDRESS"/><xsl:text>
	ID=</xsl:text><xsl:value-of select="/AVRPART/ICE_SETTINGS/JTAGICEmkII/ID"/><xsl:text>
	IF=</xsl:text><xsl:value-of select="/AVRPART/ICE_SETTINGS/JTAGICEmkII/Interface"/>
	<xsl:if test="/AVRPART/ICE_SETTINGS/JTAGICEmkII/Interface='JTAG'"><xsl:text>
	USE_JTAGID=</xsl:text><xsl:value-of select="/AVRPART/ADMIN/OCD_PARAMETERS/USE_JTAGID"/></xsl:if>
	<xsl:if test="/AVRPART/ICE_SETTINGS/JTAGICEmkII/DWbasePC">
	<xsl:if test="not(/AVRPART/ICE_SETTINGS/JTAGICEmkII/DWbasePC='0x00')"><xsl:text>
	BASE_PC=</xsl:text><xsl:value-of select="/AVRPART/ICE_SETTINGS/JTAGICEmkII/DWbasePC"/></xsl:if></xsl:if><xsl:text>
	ucRead=</xsl:text><xsl:value-of select="/AVRPART/ICE_SETTINGS/JTAGICEmkII/ucRead"/><xsl:text>
	ucWrite=</xsl:text><xsl:value-of select="/AVRPART/ICE_SETTINGS/JTAGICEmkII/ucWrite"/><xsl:text>
	ucExtRead=</xsl:text><xsl:value-of select="/AVRPART/ICE_SETTINGS/JTAGICEmkII/ucExtRead"/><xsl:text>
	ucExtWrite=</xsl:text><xsl:value-of select="/AVRPART/ICE_SETTINGS/JTAGICEmkII/ucExtWrite"/>
	<xsl:if test="/AVRPART/ICE_SETTINGS/JTAGICEmkII/Interface='DebugWire'"><xsl:text>
	ucEepromInst=</xsl:text><xsl:value-of select="/AVRPART/ICE_SETTINGS/JTAGICEmkII/ucEepromInst"/><xsl:text>
	ucFlashInst=</xsl:text><xsl:value-of select="/AVRPART/ICE_SETTINGS/JTAGICEmkII/ucFlashInst"/></xsl:if><xsl:text>
	ucUpperExtIOLoc=</xsl:text><xsl:value-of select="/AVRPART/ICE_SETTINGS/JTAGICEmkII/ucUpperExtIOLoc"/>

	<xsl:if test="/AVRPART/ICE_SETTINGS/JTAGICEmkII/ucAllowFullPageBitstream='0x01'"><xsl:text>
	ucAllowFullPageBitstream=1</xsl:text></xsl:if>
	<xsl:if test="/AVRPART/ICE_SETTINGS/JTAGICEmkII/CacheType='0x01'"><xsl:text>
	ucCacheType=1</xsl:text></xsl:if><xsl:text>
</xsl:text>
</xsl:if>

<xsl:text>
IO_MODULE</xsl:text>
<xsl:for-each select="/AVRPART/IO_MODULE/*">
<xsl:sort select="name(.)"/>
	<xsl:if test="not(name(.)='MODULE_LIST')"><xsl:text>
	</xsl:text><xsl:value-of select="name(.)"/><xsl:text>
		LIST=</xsl:text><xsl:value-of select="LIST"/>
		<xsl:if test="not(LINK='')"><xsl:text>
		LINK=</xsl:text><xsl:value-of select="LINK"/>
		</xsl:if>
	</xsl:if>
</xsl:for-each>
<xsl:text>
</xsl:text>


<xsl:text>
IO_PORTS</xsl:text>
<xsl:for-each select="/AVRPART/MEMORY/IO_MEMORY/*/MEM_ADDR">
<xsl:sort select="."/>
	<xsl:text>
	</xsl:text><xsl:value-of select="name(..)"/>=<xsl:value-of select="."/>


	<xsl:for-each select="../*">
	<xsl:sort select="." order="descending"/>
	<xsl:choose>
		<xsl:when test="name(.)='MASK'"/>
		<xsl:when test="name(.)='INIT'"/>
		<xsl:when test="name(.)='IO_ADDR'"/>
		<xsl:when test="name(.)='MEM_ADDR'"/>
		<xsl:otherwise>
		<xsl:text>,</xsl:text>
		<xsl:value-of select="substring-before(name(.),'_MASK')"/>
		<xsl:choose>
			<xsl:when test="contains(.,80)">-7</xsl:when>
			<xsl:when test="contains(.,40)">-6</xsl:when>
			<xsl:when test="contains(.,20)">-5</xsl:when>
			<xsl:when test="contains(.,10)">-4</xsl:when>
			<xsl:when test="contains(.,08)">-3</xsl:when>
			<xsl:when test="contains(.,04)">-2</xsl:when>
			<xsl:when test="contains(.,02)">-1</xsl:when>
			<xsl:when test="contains(.,01)">-0</xsl:when>
			<xsl:otherwise><xsl:value-of select="name(.)"/>-??</xsl:otherwise>
		</xsl:choose>
		</xsl:otherwise>
	</xsl:choose>
	</xsl:for-each>
</xsl:for-each>
<xsl:text>
</xsl:text>

<!-- - - -Programming Info- - - -->

<xsl:text>
STK500</xsl:text>
<xsl:for-each select="/AVRPART/ICE_SETTINGS/STK500_2/*">
<xsl:choose>
	<xsl:when test="name(.)='PPControlStack'"><xsl:text>
	</xsl:text>
	<xsl:value-of select="name(.)"/>=<xsl:value-of select="."/>
	</xsl:when>
	
	<xsl:when test="name(.)='HvspControlStack'"><xsl:text>
	</xsl:text>
	<xsl:value-of select="name(.)"/>=<xsl:value-of select="."/>
	</xsl:when>

	<xsl:when test="name(.)='IspEnterProgMode'"></xsl:when>
	<xsl:when test="name(.)='IspLeaveProgMode'"></xsl:when>
	<xsl:when test="name(.)='IspReadFlash'"></xsl:when>
	<xsl:when test="name(.)='IspReadEeprom'"></xsl:when>
	<xsl:when test="name(.)='IspReadFuse'"></xsl:when>
	<xsl:when test="name(.)='IspReadLock'"></xsl:when>
	<xsl:when test="name(.)='IspReadSign'"></xsl:when>
	<xsl:when test="name(.)='IspReadOsccal'"></xsl:when>
	
	<xsl:when test="name(.)='PpLeaveProgMode'"></xsl:when>
	<xsl:when test="name(.)='PpReadFlash'"></xsl:when>
	<xsl:when test="name(.)='PpReadEeprom'"></xsl:when>

	<xsl:when test="name(.)='HvspLeaveProgMode'"></xsl:when>
	<xsl:when test="name(.)='HvspReadFlash'"></xsl:when>
	<xsl:when test="name(.)='HvspReadEeprom'"></xsl:when>
	<xsl:when test="name(.)='HvspProgramFuse'"></xsl:when>
	<xsl:when test="name(.)='HvspProgramLock'"></xsl:when>

	<xsl:otherwise><xsl:text>
	</xsl:text>
	<xsl:value-of select="name(.)"/>
	<xsl:for-each select="./*"><xsl:text>
		</xsl:text><xsl:value-of select="name(.)"/>=<xsl:value-of select="."/>
	</xsl:for-each>
	</xsl:otherwise>
</xsl:choose>
</xsl:for-each>


<xsl:text>

STK600</xsl:text>
<xsl:for-each select="/AVRPART/ICE_SETTINGS/STK600/*">
<xsl:choose>
	<xsl:when test="name(.)='PPControlStack'"><xsl:text>
	</xsl:text>
	<xsl:value-of select="name(.)"/>=<xsl:value-of select="."/>
	</xsl:when>
	
	<xsl:when test="name(.)='HvspControlStack'"><xsl:text>
	</xsl:text>
	<xsl:value-of select="name(.)"/>=<xsl:value-of select="."/>
	</xsl:when>

	<xsl:when test="name(.)='IspEnterProgMode'"></xsl:when>
	<xsl:when test="name(.)='IspLeaveProgMode'"></xsl:when>
	<xsl:when test="name(.)='IspReadFlash'"></xsl:when>
	<xsl:when test="name(.)='IspReadEeprom'"></xsl:when>
	<xsl:when test="name(.)='IspReadFuse'"></xsl:when>
	<xsl:when test="name(.)='IspReadLock'"></xsl:when>
	<xsl:when test="name(.)='IspReadSign'"></xsl:when>
	<xsl:when test="name(.)='IspReadOsccal'"></xsl:when>
	
	<xsl:when test="name(.)='PpLeaveProgMode'"></xsl:when>
	<xsl:when test="name(.)='PpReadFlash'"></xsl:when>
	<xsl:when test="name(.)='PpReadEeprom'"></xsl:when>

	<xsl:when test="name(.)='HvspLeaveProgMode'"></xsl:when>
	<xsl:when test="name(.)='HvspReadFlash'"></xsl:when>
	<xsl:when test="name(.)='HvspReadEeprom'"></xsl:when>
	<xsl:when test="name(.)='HvspProgramFuse'"></xsl:when>
	<xsl:when test="name(.)='HvspProgramLock'"></xsl:when>

	<xsl:otherwise><xsl:text>
	</xsl:text>
	<xsl:value-of select="name(.)"/>
	<xsl:for-each select="./*"><xsl:text>
		</xsl:text><xsl:value-of select="name(.)"/>=<xsl:value-of select="."/>
	</xsl:for-each>
	</xsl:otherwise>
</xsl:choose>
</xsl:for-each>


<xsl:text>

FUSES</xsl:text>
<xsl:for-each select="/AVRPART/V2/templates/module[@class='FUSE']/registers/reg">
<xsl:text>
	</xsl:text><xsl:value-of select="@name"/>
	<xsl:for-each select="bitfield"><xsl:text>
		</xsl:text><xsl:value-of select="@name"/>=<xsl:value-of select="@mask"/>,<xsl:value-of select="@text"/>

		<xsl:variable name="enu" select="@enum"/>
		<xsl:for-each select="/AVRPART/V2/templates/module[@class='FUSE']/enumerator">
		<xsl:if test="@name=$enu">
			<xsl:for-each select="enum"><xsl:text>
			</xsl:text><xsl:value-of select="@val"/>=<xsl:value-of select="@text"/>
			</xsl:for-each>
		</xsl:if>
		</xsl:for-each>
	</xsl:for-each>
</xsl:for-each>


<xsl:text>

LOCKBITS</xsl:text>
<xsl:for-each select="/AVRPART/V2/templates/module[@class='LOCKBIT']/registers/reg[@name='LOCKBIT']/bitfield">
<xsl:text>
	</xsl:text><xsl:value-of select="@name"/>=<xsl:value-of select="@mask"/>,<xsl:value-of select="@text"/>

	<xsl:variable name="enu" select="@enum"/>
	<xsl:for-each select="/AVRPART/V2/templates/module[@class='LOCKBIT']/enumerator">
		<xsl:if test="@name=$enu">
			<xsl:for-each select="enum"><xsl:text>
		</xsl:text><xsl:value-of select="@val"/>=<xsl:value-of select="@text"/>
			</xsl:for-each>
		</xsl:if>
	</xsl:for-each>
</xsl:for-each>
<xsl:text>

</xsl:text>
</xsl:template>
</xsl:stylesheet>  
