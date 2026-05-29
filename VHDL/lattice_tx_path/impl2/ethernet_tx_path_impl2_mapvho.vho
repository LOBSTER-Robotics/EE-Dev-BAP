
-- VHDL netlist produced by program ldbanno, Version Diamond (64-bit) 3.14.0.75.2

-- ldbanno -n VHDL -o ethernet_tx_path_impl2_mapvho.vho -w -neg -gui -msgset D:/BAP/EE-Dev-BAP/VHDL/lattice_tx_path/promote.xml ethernet_tx_path_impl2_map.ncd 
-- Netlist created on Thu May 28 12:54:22 2026
-- Netlist written on Thu May 28 12:54:27 2026
-- Design is for device LFE5U-45F
-- Design is for package CABGA381
-- Design is for performance grade 7

-- entity sapiobuf
  library IEEE, vital2000, ECP5U;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use ECP5U.COMPONENTS.ALL;

  entity sapiobuf is
    port (I: in Std_logic; PAD: out Std_logic);

    ATTRIBUTE Vital_Level0 OF sapiobuf : ENTITY IS TRUE;

  end sapiobuf;

  architecture Structure of sapiobuf is
  begin
    INST5: OB
      port map (I=>I, O=>PAD);
  end Structure;

-- entity rgmii_txcB
  library IEEE, vital2000, ECP5U;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use ECP5U.COMPONENTS.ALL;

  entity rgmii_txcB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "rgmii_txcB";

      tipd_IOLDO  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_IOLDO_rgmiitxc	 : VitalDelayType01 := (0 ns, 0 ns));

    port (IOLDO: in Std_logic; rgmiitxc: out Std_logic);

    ATTRIBUTE Vital_Level0 OF rgmii_txcB : ENTITY IS TRUE;

  end rgmii_txcB;

  architecture Structure of rgmii_txcB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal IOLDO_ipd 	: std_logic := 'X';
    signal rgmiitxc_out 	: std_logic := 'X';

    component sapiobuf
      port (I: in Std_logic; PAD: out Std_logic);
    end component;
  begin
    Inst2_OB: sapiobuf
      port map (I=>IOLDO_ipd, PAD=>rgmiitxc_out);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(IOLDO_ipd, IOLDO, tipd_IOLDO);
    END BLOCK;

    VitalBehavior : PROCESS (IOLDO_ipd, rgmiitxc_out)
    VARIABLE rgmiitxc_zd         	: std_logic := 'X';
    VARIABLE rgmiitxc_GlitchData 	: VitalGlitchDataType;


    BEGIN

    IF (TimingChecksOn) THEN

    END IF;

    rgmiitxc_zd 	:= rgmiitxc_out;

    VitalPathDelay01 (
      OutSignal => rgmiitxc, OutSignalName => "rgmiitxc", OutTemp => rgmiitxc_zd,
      Paths      => (0 => (InputChangeTime => IOLDO_ipd'last_event,
                           PathDelay => tpd_IOLDO_rgmiitxc,
                           PathCondition => TRUE)),
      GlitchData => rgmiitxc_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity sapoddrx1
  library IEEE, vital2000, ECP5U;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use ECP5U.COMPONENTS.ALL;

  entity sapoddrx1 is
    port (D0: in Std_logic; D1: in Std_logic; SCLK: in Std_logic; 
          RST: in Std_logic; Q: out Std_logic);

    ATTRIBUTE Vital_Level0 OF sapoddrx1 : ENTITY IS TRUE;

  end sapoddrx1;

  architecture Structure of sapoddrx1 is
  begin
    INST1: ODDRX1F
      generic map (GSR => "ENABLED")
      port map (SCLK=>SCLK, RST=>RST, D0=>D0, D1=>D1, Q=>Q);
  end Structure;

-- entity vcc
  library IEEE, vital2000, ECP5U;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use ECP5U.COMPONENTS.ALL;

  entity vcc is
    port (PWR1: out Std_logic);

    ATTRIBUTE Vital_Level0 OF vcc : ENTITY IS TRUE;

  end vcc;

  architecture Structure of vcc is
  begin
    INST1: VHI
      port map (Z=>PWR1);
  end Structure;

-- entity gnd
  library IEEE, vital2000, ECP5U;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use ECP5U.COMPONENTS.ALL;

  entity gnd is
    port (PWR0: out Std_logic);

    ATTRIBUTE Vital_Level0 OF gnd : ENTITY IS TRUE;

  end gnd;

  architecture Structure of gnd is
  begin
    INST1: VLO
      port map (Z=>PWR0);
  end Structure;

-- entity rgmii_txc_MGIOL
  library IEEE, vital2000, ECP5U;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use ECP5U.COMPONENTS.ALL;

  entity rgmii_txc_MGIOL is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "rgmii_txc_MGIOL";

      tipd_CLK  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_CLK_IOLDO	 : VitalDelayType01 := (0 ns, 0 ns);
      tperiod_CLK 	: VitalDelayType := 0 ns;
      tpw_CLK_posedge	: VitalDelayType := 0 ns;
      tpw_CLK_negedge	: VitalDelayType := 0 ns);

    port (IOLDO: out Std_logic; CLK: in Std_logic);

    ATTRIBUTE Vital_Level0 OF rgmii_txc_MGIOL : ENTITY IS TRUE;

  end rgmii_txc_MGIOL;

  architecture Structure of rgmii_txc_MGIOL is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal IOLDO_out 	: std_logic := 'X';
    signal CLK_ipd 	: std_logic := 'X';

    signal VCCI: Std_logic;
    signal GNDI: Std_logic;
    component gnd
      port (PWR0: out Std_logic);
    end component;
    component sapoddrx1
      port (D0: in Std_logic; D1: in Std_logic; SCLK: in Std_logic; 
            RST: in Std_logic; Q: out Std_logic);
    end component;
    component vcc
      port (PWR1: out Std_logic);
    end component;
  begin
    dut_rgmii_inst_DDR_TX_Inst3_ODDRX1F: sapoddrx1
      port map (D0=>VCCI, D1=>GNDI, SCLK=>CLK_ipd, RST=>GNDI, Q=>IOLDO_out);
    DRIVEVCC: vcc
      port map (PWR1=>VCCI);
    DRIVEGND: gnd
      port map (PWR0=>GNDI);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(CLK_ipd, CLK, tipd_CLK);
    END BLOCK;

    VitalBehavior : PROCESS (IOLDO_out, CLK_ipd)
    VARIABLE IOLDO_zd         	: std_logic := 'X';
    VARIABLE IOLDO_GlitchData 	: VitalGlitchDataType;

    VARIABLE tviol_CLK_CLK          	: x01 := '0';
    VARIABLE periodcheckinfo_CLK	: VitalPeriodDataType;

    BEGIN

    IF (TimingChecksOn) THEN
      VitalPeriodPulseCheck (
        TestSignal => CLK_ipd,
        TestSignalName => "CLK",
        Period => tperiod_CLK,
        PulseWidthHigh => tpw_CLK_posedge,
        PulseWidthLow => tpw_CLK_negedge,
        PeriodData => periodcheckinfo_CLK,
        Violation => tviol_CLK_CLK,
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        CheckEnabled => TRUE,
        MsgSeverity => warning);

    END IF;

    IOLDO_zd 	:= IOLDO_out;

    VitalPathDelay01 (
      OutSignal => IOLDO, OutSignalName => "IOLDO", OutTemp => IOLDO_zd,
      Paths      => (0 => (InputChangeTime => CLK_ipd'last_event,
                           PathDelay => tpd_CLK_IOLDO,
                           PathCondition => TRUE)),
      GlitchData => IOLDO_GlitchData,
      Mode       => ondetect, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity rgmii_txctlB
  library IEEE, vital2000, ECP5U;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use ECP5U.COMPONENTS.ALL;

  entity rgmii_txctlB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "rgmii_txctlB";

      tipd_IOLDO  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_IOLDO_rgmiitxctl	 : VitalDelayType01 := (0 ns, 0 ns));

    port (IOLDO: in Std_logic; rgmiitxctl: out Std_logic);

    ATTRIBUTE Vital_Level0 OF rgmii_txctlB : ENTITY IS TRUE;

  end rgmii_txctlB;

  architecture Structure of rgmii_txctlB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal IOLDO_ipd 	: std_logic := 'X';
    signal rgmiitxctl_out 	: std_logic := 'X';

    component sapiobuf
      port (I: in Std_logic; PAD: out Std_logic);
    end component;
  begin
    Inst1_OB4: sapiobuf
      port map (I=>IOLDO_ipd, PAD=>rgmiitxctl_out);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(IOLDO_ipd, IOLDO, tipd_IOLDO);
    END BLOCK;

    VitalBehavior : PROCESS (IOLDO_ipd, rgmiitxctl_out)
    VARIABLE rgmiitxctl_zd         	: std_logic := 'X';
    VARIABLE rgmiitxctl_GlitchData 	: VitalGlitchDataType;


    BEGIN

    IF (TimingChecksOn) THEN

    END IF;

    rgmiitxctl_zd 	:= rgmiitxctl_out;

    VitalPathDelay01 (

        OutSignal => rgmiitxctl, OutSignalName => "rgmiitxctl", OutTemp => rgmiitxctl_zd,
      Paths      => (0 => (InputChangeTime => IOLDO_ipd'last_event,
                           PathDelay => tpd_IOLDO_rgmiitxctl,
                           PathCondition => TRUE)),
      GlitchData => rgmiitxctl_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity rgmii_txctl_MGIOL
  library IEEE, vital2000, ECP5U;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use ECP5U.COMPONENTS.ALL;

  entity rgmii_txctl_MGIOL is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "rgmii_txctl_MGIOL";

      tipd_TXDATA0  	: VitalDelayType01 := (0 ns, 0 ns);
      tipd_TXDATA1  	: VitalDelayType01 := (0 ns, 0 ns);
      tipd_CLK  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_CLK_IOLDO	 : VitalDelayType01 := (0 ns, 0 ns);
      ticd_CLK	: VitalDelayType := 0 ns;
      tisd_TXDATA0_CLK	: VitalDelayType := 0 ns;
      tsetup_TXDATA0_CLK_noedge_posedge	: VitalDelayType := 0 ns;
      thold_TXDATA0_CLK_noedge_posedge	: VitalDelayType := 0 ns;
      tisd_TXDATA1_CLK	: VitalDelayType := 0 ns;
      tsetup_TXDATA1_CLK_noedge_posedge	: VitalDelayType := 0 ns;
      thold_TXDATA1_CLK_noedge_posedge	: VitalDelayType := 0 ns;
      tperiod_CLK 	: VitalDelayType := 0 ns;
      tpw_CLK_posedge	: VitalDelayType := 0 ns;
      tpw_CLK_negedge	: VitalDelayType := 0 ns);

    port (IOLDO: out Std_logic; TXDATA0: in Std_logic; TXDATA1: in Std_logic; 
          CLK: in Std_logic);

    ATTRIBUTE Vital_Level0 OF rgmii_txctl_MGIOL : ENTITY IS TRUE;

  end rgmii_txctl_MGIOL;

  architecture Structure of rgmii_txctl_MGIOL is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal IOLDO_out 	: std_logic := 'X';
    signal TXDATA0_ipd 	: std_logic := 'X';
    signal TXDATA0_dly 	: std_logic := 'X';
    signal TXDATA1_ipd 	: std_logic := 'X';
    signal TXDATA1_dly 	: std_logic := 'X';
    signal CLK_ipd 	: std_logic := 'X';
    signal CLK_dly 	: std_logic := 'X';

    signal GNDI: Std_logic;
    component gnd
      port (PWR0: out Std_logic);
    end component;
    component sapoddrx1
      port (D0: in Std_logic; D1: in Std_logic; SCLK: in Std_logic; 
            RST: in Std_logic; Q: out Std_logic);
    end component;
  begin
    dut_rgmii_inst_DDR_TX_Inst4_ODDRX1F4: sapoddrx1
      port map (D0=>TXDATA0_dly, D1=>TXDATA1_dly, SCLK=>CLK_dly, RST=>GNDI, 
                Q=>IOLDO_out);
    DRIVEGND: gnd
      port map (PWR0=>GNDI);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(TXDATA0_ipd, TXDATA0, tipd_TXDATA0);
      VitalWireDelay(TXDATA1_ipd, TXDATA1, tipd_TXDATA1);
      VitalWireDelay(CLK_ipd, CLK, tipd_CLK);
    END BLOCK;

    --  Setup and Hold DELAYs
    SignalDelay : BLOCK
    BEGIN
      VitalSignalDelay(TXDATA0_dly, TXDATA0_ipd, tisd_TXDATA0_CLK);
      VitalSignalDelay(TXDATA1_dly, TXDATA1_ipd, tisd_TXDATA1_CLK);
      VitalSignalDelay(CLK_dly, CLK_ipd, ticd_CLK);
    END BLOCK;

    VitalBehavior : PROCESS (IOLDO_out, TXDATA0_dly, TXDATA1_dly, CLK_dly)
    VARIABLE IOLDO_zd         	: std_logic := 'X';
    VARIABLE IOLDO_GlitchData 	: VitalGlitchDataType;

    VARIABLE tviol_TXDATA0_CLK       	: x01 := '0';
    VARIABLE TXDATA0_CLK_TimingDatash	: VitalTimingDataType;
    VARIABLE tviol_TXDATA1_CLK       	: x01 := '0';
    VARIABLE TXDATA1_CLK_TimingDatash	: VitalTimingDataType;
    VARIABLE tviol_CLK_CLK          	: x01 := '0';
    VARIABLE periodcheckinfo_CLK	: VitalPeriodDataType;

    BEGIN

    IF (TimingChecksOn) THEN
      VitalSetupHoldCheck (
        TestSignal => TXDATA0_dly,
        TestSignalName => "TXDATA0",
        TestDelay => tisd_TXDATA0_CLK,
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_TXDATA0_CLK_noedge_posedge,
        SetupLow => tsetup_TXDATA0_CLK_noedge_posedge,
        HoldHigh => thold_TXDATA0_CLK_noedge_posedge,
        HoldLow => thold_TXDATA0_CLK_noedge_posedge,
        CheckEnabled => TRUE,
        RefTransition => '/',
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        TimingData => TXDATA0_CLK_TimingDatash,
        Violation => tviol_TXDATA0_CLK,
        MsgSeverity => warning);
      VitalSetupHoldCheck (
        TestSignal => TXDATA1_dly,
        TestSignalName => "TXDATA1",
        TestDelay => tisd_TXDATA1_CLK,
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_TXDATA1_CLK_noedge_posedge,
        SetupLow => tsetup_TXDATA1_CLK_noedge_posedge,
        HoldHigh => thold_TXDATA1_CLK_noedge_posedge,
        HoldLow => thold_TXDATA1_CLK_noedge_posedge,
        CheckEnabled => TRUE,
        RefTransition => '/',
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        TimingData => TXDATA1_CLK_TimingDatash,
        Violation => tviol_TXDATA1_CLK,
        MsgSeverity => warning);
      VitalPeriodPulseCheck (
        TestSignal => CLK_ipd,
        TestSignalName => "CLK",
        Period => tperiod_CLK,
        PulseWidthHigh => tpw_CLK_posedge,
        PulseWidthLow => tpw_CLK_negedge,
        PeriodData => periodcheckinfo_CLK,
        Violation => tviol_CLK_CLK,
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        CheckEnabled => TRUE,
        MsgSeverity => warning);

    END IF;

    IOLDO_zd 	:= IOLDO_out;

    VitalPathDelay01 (
      OutSignal => IOLDO, OutSignalName => "IOLDO", OutTemp => IOLDO_zd,
      Paths      => (0 => (InputChangeTime => CLK_dly'last_event,
                           PathDelay => tpd_CLK_IOLDO,
                           PathCondition => TRUE)),
      GlitchData => IOLDO_GlitchData,
      Mode       => ondetect, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity rgmii_txd_3_B
  library IEEE, vital2000, ECP5U;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use ECP5U.COMPONENTS.ALL;

  entity rgmii_txd_3_B is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "rgmii_txd_3_B";

      tipd_IOLDO  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_IOLDO_rgmiitxd3	 : VitalDelayType01 := (0 ns, 0 ns));

    port (IOLDO: in Std_logic; rgmiitxd3: out Std_logic);

    ATTRIBUTE Vital_Level0 OF rgmii_txd_3_B : ENTITY IS TRUE;

  end rgmii_txd_3_B;

  architecture Structure of rgmii_txd_3_B is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal IOLDO_ipd 	: std_logic := 'X';
    signal rgmiitxd3_out 	: std_logic := 'X';

    component sapiobuf
      port (I: in Std_logic; PAD: out Std_logic);
    end component;
  begin
    Inst1_OB3: sapiobuf
      port map (I=>IOLDO_ipd, PAD=>rgmiitxd3_out);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(IOLDO_ipd, IOLDO, tipd_IOLDO);
    END BLOCK;

    VitalBehavior : PROCESS (IOLDO_ipd, rgmiitxd3_out)
    VARIABLE rgmiitxd3_zd         	: std_logic := 'X';
    VARIABLE rgmiitxd3_GlitchData 	: VitalGlitchDataType;


    BEGIN

    IF (TimingChecksOn) THEN

    END IF;

    rgmiitxd3_zd 	:= rgmiitxd3_out;

    VitalPathDelay01 (
      OutSignal => rgmiitxd3, OutSignalName => "rgmiitxd3", OutTemp => rgmiitxd3_zd,
      Paths      => (0 => (InputChangeTime => IOLDO_ipd'last_event,
                           PathDelay => tpd_IOLDO_rgmiitxd3,
                           PathCondition => TRUE)),
      GlitchData => rgmiitxd3_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity rgmii_txd_3_MGIOL
  library IEEE, vital2000, ECP5U;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use ECP5U.COMPONENTS.ALL;

  entity rgmii_txd_3_MGIOL is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "rgmii_txd_3_MGIOL";

      tipd_TXDATA0  	: VitalDelayType01 := (0 ns, 0 ns);
      tipd_TXDATA1  	: VitalDelayType01 := (0 ns, 0 ns);
      tipd_CLK  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_CLK_IOLDO	 : VitalDelayType01 := (0 ns, 0 ns);
      ticd_CLK	: VitalDelayType := 0 ns;
      tisd_TXDATA0_CLK	: VitalDelayType := 0 ns;
      tsetup_TXDATA0_CLK_noedge_posedge	: VitalDelayType := 0 ns;
      thold_TXDATA0_CLK_noedge_posedge	: VitalDelayType := 0 ns;
      tisd_TXDATA1_CLK	: VitalDelayType := 0 ns;
      tsetup_TXDATA1_CLK_noedge_posedge	: VitalDelayType := 0 ns;
      thold_TXDATA1_CLK_noedge_posedge	: VitalDelayType := 0 ns;
      tperiod_CLK 	: VitalDelayType := 0 ns;
      tpw_CLK_posedge	: VitalDelayType := 0 ns;
      tpw_CLK_negedge	: VitalDelayType := 0 ns);

    port (IOLDO: out Std_logic; TXDATA0: in Std_logic; TXDATA1: in Std_logic; 
          CLK: in Std_logic);

    ATTRIBUTE Vital_Level0 OF rgmii_txd_3_MGIOL : ENTITY IS TRUE;

  end rgmii_txd_3_MGIOL;

  architecture Structure of rgmii_txd_3_MGIOL is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal IOLDO_out 	: std_logic := 'X';
    signal TXDATA0_ipd 	: std_logic := 'X';
    signal TXDATA0_dly 	: std_logic := 'X';
    signal TXDATA1_ipd 	: std_logic := 'X';
    signal TXDATA1_dly 	: std_logic := 'X';
    signal CLK_ipd 	: std_logic := 'X';
    signal CLK_dly 	: std_logic := 'X';

    signal GNDI: Std_logic;
    component gnd
      port (PWR0: out Std_logic);
    end component;
    component sapoddrx1
      port (D0: in Std_logic; D1: in Std_logic; SCLK: in Std_logic; 
            RST: in Std_logic; Q: out Std_logic);
    end component;
  begin
    dut_rgmii_inst_DDR_TX_Inst4_ODDRX1F3: sapoddrx1
      port map (D0=>TXDATA0_dly, D1=>TXDATA1_dly, SCLK=>CLK_dly, RST=>GNDI, 
                Q=>IOLDO_out);
    DRIVEGND: gnd
      port map (PWR0=>GNDI);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(TXDATA0_ipd, TXDATA0, tipd_TXDATA0);
      VitalWireDelay(TXDATA1_ipd, TXDATA1, tipd_TXDATA1);
      VitalWireDelay(CLK_ipd, CLK, tipd_CLK);
    END BLOCK;

    --  Setup and Hold DELAYs
    SignalDelay : BLOCK
    BEGIN
      VitalSignalDelay(TXDATA0_dly, TXDATA0_ipd, tisd_TXDATA0_CLK);
      VitalSignalDelay(TXDATA1_dly, TXDATA1_ipd, tisd_TXDATA1_CLK);
      VitalSignalDelay(CLK_dly, CLK_ipd, ticd_CLK);
    END BLOCK;

    VitalBehavior : PROCESS (IOLDO_out, TXDATA0_dly, TXDATA1_dly, CLK_dly)
    VARIABLE IOLDO_zd         	: std_logic := 'X';
    VARIABLE IOLDO_GlitchData 	: VitalGlitchDataType;

    VARIABLE tviol_TXDATA0_CLK       	: x01 := '0';
    VARIABLE TXDATA0_CLK_TimingDatash	: VitalTimingDataType;
    VARIABLE tviol_TXDATA1_CLK       	: x01 := '0';
    VARIABLE TXDATA1_CLK_TimingDatash	: VitalTimingDataType;
    VARIABLE tviol_CLK_CLK          	: x01 := '0';
    VARIABLE periodcheckinfo_CLK	: VitalPeriodDataType;

    BEGIN

    IF (TimingChecksOn) THEN
      VitalSetupHoldCheck (
        TestSignal => TXDATA0_dly,
        TestSignalName => "TXDATA0",
        TestDelay => tisd_TXDATA0_CLK,
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_TXDATA0_CLK_noedge_posedge,
        SetupLow => tsetup_TXDATA0_CLK_noedge_posedge,
        HoldHigh => thold_TXDATA0_CLK_noedge_posedge,
        HoldLow => thold_TXDATA0_CLK_noedge_posedge,
        CheckEnabled => TRUE,
        RefTransition => '/',
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        TimingData => TXDATA0_CLK_TimingDatash,
        Violation => tviol_TXDATA0_CLK,
        MsgSeverity => warning);
      VitalSetupHoldCheck (
        TestSignal => TXDATA1_dly,
        TestSignalName => "TXDATA1",
        TestDelay => tisd_TXDATA1_CLK,
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_TXDATA1_CLK_noedge_posedge,
        SetupLow => tsetup_TXDATA1_CLK_noedge_posedge,
        HoldHigh => thold_TXDATA1_CLK_noedge_posedge,
        HoldLow => thold_TXDATA1_CLK_noedge_posedge,
        CheckEnabled => TRUE,
        RefTransition => '/',
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        TimingData => TXDATA1_CLK_TimingDatash,
        Violation => tviol_TXDATA1_CLK,
        MsgSeverity => warning);
      VitalPeriodPulseCheck (
        TestSignal => CLK_ipd,
        TestSignalName => "CLK",
        Period => tperiod_CLK,
        PulseWidthHigh => tpw_CLK_posedge,
        PulseWidthLow => tpw_CLK_negedge,
        PeriodData => periodcheckinfo_CLK,
        Violation => tviol_CLK_CLK,
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        CheckEnabled => TRUE,
        MsgSeverity => warning);

    END IF;

    IOLDO_zd 	:= IOLDO_out;

    VitalPathDelay01 (
      OutSignal => IOLDO, OutSignalName => "IOLDO", OutTemp => IOLDO_zd,
      Paths      => (0 => (InputChangeTime => CLK_dly'last_event,
                           PathDelay => tpd_CLK_IOLDO,
                           PathCondition => TRUE)),
      GlitchData => IOLDO_GlitchData,
      Mode       => ondetect, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity rgmii_txd_2_B
  library IEEE, vital2000, ECP5U;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use ECP5U.COMPONENTS.ALL;

  entity rgmii_txd_2_B is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "rgmii_txd_2_B";

      tipd_IOLDO  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_IOLDO_rgmiitxd2	 : VitalDelayType01 := (0 ns, 0 ns));

    port (IOLDO: in Std_logic; rgmiitxd2: out Std_logic);

    ATTRIBUTE Vital_Level0 OF rgmii_txd_2_B : ENTITY IS TRUE;

  end rgmii_txd_2_B;

  architecture Structure of rgmii_txd_2_B is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal IOLDO_ipd 	: std_logic := 'X';
    signal rgmiitxd2_out 	: std_logic := 'X';

    component sapiobuf
      port (I: in Std_logic; PAD: out Std_logic);
    end component;
  begin
    Inst1_OB2: sapiobuf
      port map (I=>IOLDO_ipd, PAD=>rgmiitxd2_out);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(IOLDO_ipd, IOLDO, tipd_IOLDO);
    END BLOCK;

    VitalBehavior : PROCESS (IOLDO_ipd, rgmiitxd2_out)
    VARIABLE rgmiitxd2_zd         	: std_logic := 'X';
    VARIABLE rgmiitxd2_GlitchData 	: VitalGlitchDataType;


    BEGIN

    IF (TimingChecksOn) THEN

    END IF;

    rgmiitxd2_zd 	:= rgmiitxd2_out;

    VitalPathDelay01 (
      OutSignal => rgmiitxd2, OutSignalName => "rgmiitxd2", OutTemp => rgmiitxd2_zd,
      Paths      => (0 => (InputChangeTime => IOLDO_ipd'last_event,
                           PathDelay => tpd_IOLDO_rgmiitxd2,
                           PathCondition => TRUE)),
      GlitchData => rgmiitxd2_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity rgmii_txd_2_MGIOL
  library IEEE, vital2000, ECP5U;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use ECP5U.COMPONENTS.ALL;

  entity rgmii_txd_2_MGIOL is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "rgmii_txd_2_MGIOL";

      tipd_TXDATA0  	: VitalDelayType01 := (0 ns, 0 ns);
      tipd_TXDATA1  	: VitalDelayType01 := (0 ns, 0 ns);
      tipd_CLK  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_CLK_IOLDO	 : VitalDelayType01 := (0 ns, 0 ns);
      ticd_CLK	: VitalDelayType := 0 ns;
      tisd_TXDATA0_CLK	: VitalDelayType := 0 ns;
      tsetup_TXDATA0_CLK_noedge_posedge	: VitalDelayType := 0 ns;
      thold_TXDATA0_CLK_noedge_posedge	: VitalDelayType := 0 ns;
      tisd_TXDATA1_CLK	: VitalDelayType := 0 ns;
      tsetup_TXDATA1_CLK_noedge_posedge	: VitalDelayType := 0 ns;
      thold_TXDATA1_CLK_noedge_posedge	: VitalDelayType := 0 ns;
      tperiod_CLK 	: VitalDelayType := 0 ns;
      tpw_CLK_posedge	: VitalDelayType := 0 ns;
      tpw_CLK_negedge	: VitalDelayType := 0 ns);

    port (IOLDO: out Std_logic; TXDATA0: in Std_logic; TXDATA1: in Std_logic; 
          CLK: in Std_logic);

    ATTRIBUTE Vital_Level0 OF rgmii_txd_2_MGIOL : ENTITY IS TRUE;

  end rgmii_txd_2_MGIOL;

  architecture Structure of rgmii_txd_2_MGIOL is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal IOLDO_out 	: std_logic := 'X';
    signal TXDATA0_ipd 	: std_logic := 'X';
    signal TXDATA0_dly 	: std_logic := 'X';
    signal TXDATA1_ipd 	: std_logic := 'X';
    signal TXDATA1_dly 	: std_logic := 'X';
    signal CLK_ipd 	: std_logic := 'X';
    signal CLK_dly 	: std_logic := 'X';

    signal GNDI: Std_logic;
    component gnd
      port (PWR0: out Std_logic);
    end component;
    component sapoddrx1
      port (D0: in Std_logic; D1: in Std_logic; SCLK: in Std_logic; 
            RST: in Std_logic; Q: out Std_logic);
    end component;
  begin
    dut_rgmii_inst_DDR_TX_Inst4_ODDRX1F2: sapoddrx1
      port map (D0=>TXDATA0_dly, D1=>TXDATA1_dly, SCLK=>CLK_dly, RST=>GNDI, 
                Q=>IOLDO_out);
    DRIVEGND: gnd
      port map (PWR0=>GNDI);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(TXDATA0_ipd, TXDATA0, tipd_TXDATA0);
      VitalWireDelay(TXDATA1_ipd, TXDATA1, tipd_TXDATA1);
      VitalWireDelay(CLK_ipd, CLK, tipd_CLK);
    END BLOCK;

    --  Setup and Hold DELAYs
    SignalDelay : BLOCK
    BEGIN
      VitalSignalDelay(TXDATA0_dly, TXDATA0_ipd, tisd_TXDATA0_CLK);
      VitalSignalDelay(TXDATA1_dly, TXDATA1_ipd, tisd_TXDATA1_CLK);
      VitalSignalDelay(CLK_dly, CLK_ipd, ticd_CLK);
    END BLOCK;

    VitalBehavior : PROCESS (IOLDO_out, TXDATA0_dly, TXDATA1_dly, CLK_dly)
    VARIABLE IOLDO_zd         	: std_logic := 'X';
    VARIABLE IOLDO_GlitchData 	: VitalGlitchDataType;

    VARIABLE tviol_TXDATA0_CLK       	: x01 := '0';
    VARIABLE TXDATA0_CLK_TimingDatash	: VitalTimingDataType;
    VARIABLE tviol_TXDATA1_CLK       	: x01 := '0';
    VARIABLE TXDATA1_CLK_TimingDatash	: VitalTimingDataType;
    VARIABLE tviol_CLK_CLK          	: x01 := '0';
    VARIABLE periodcheckinfo_CLK	: VitalPeriodDataType;

    BEGIN

    IF (TimingChecksOn) THEN
      VitalSetupHoldCheck (
        TestSignal => TXDATA0_dly,
        TestSignalName => "TXDATA0",
        TestDelay => tisd_TXDATA0_CLK,
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_TXDATA0_CLK_noedge_posedge,
        SetupLow => tsetup_TXDATA0_CLK_noedge_posedge,
        HoldHigh => thold_TXDATA0_CLK_noedge_posedge,
        HoldLow => thold_TXDATA0_CLK_noedge_posedge,
        CheckEnabled => TRUE,
        RefTransition => '/',
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        TimingData => TXDATA0_CLK_TimingDatash,
        Violation => tviol_TXDATA0_CLK,
        MsgSeverity => warning);
      VitalSetupHoldCheck (
        TestSignal => TXDATA1_dly,
        TestSignalName => "TXDATA1",
        TestDelay => tisd_TXDATA1_CLK,
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_TXDATA1_CLK_noedge_posedge,
        SetupLow => tsetup_TXDATA1_CLK_noedge_posedge,
        HoldHigh => thold_TXDATA1_CLK_noedge_posedge,
        HoldLow => thold_TXDATA1_CLK_noedge_posedge,
        CheckEnabled => TRUE,
        RefTransition => '/',
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        TimingData => TXDATA1_CLK_TimingDatash,
        Violation => tviol_TXDATA1_CLK,
        MsgSeverity => warning);
      VitalPeriodPulseCheck (
        TestSignal => CLK_ipd,
        TestSignalName => "CLK",
        Period => tperiod_CLK,
        PulseWidthHigh => tpw_CLK_posedge,
        PulseWidthLow => tpw_CLK_negedge,
        PeriodData => periodcheckinfo_CLK,
        Violation => tviol_CLK_CLK,
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        CheckEnabled => TRUE,
        MsgSeverity => warning);

    END IF;

    IOLDO_zd 	:= IOLDO_out;

    VitalPathDelay01 (
      OutSignal => IOLDO, OutSignalName => "IOLDO", OutTemp => IOLDO_zd,
      Paths      => (0 => (InputChangeTime => CLK_dly'last_event,
                           PathDelay => tpd_CLK_IOLDO,
                           PathCondition => TRUE)),
      GlitchData => IOLDO_GlitchData,
      Mode       => ondetect, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity rgmii_txd_1_B
  library IEEE, vital2000, ECP5U;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use ECP5U.COMPONENTS.ALL;

  entity rgmii_txd_1_B is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "rgmii_txd_1_B";

      tipd_IOLDO  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_IOLDO_rgmiitxd1	 : VitalDelayType01 := (0 ns, 0 ns));

    port (IOLDO: in Std_logic; rgmiitxd1: out Std_logic);

    ATTRIBUTE Vital_Level0 OF rgmii_txd_1_B : ENTITY IS TRUE;

  end rgmii_txd_1_B;

  architecture Structure of rgmii_txd_1_B is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal IOLDO_ipd 	: std_logic := 'X';
    signal rgmiitxd1_out 	: std_logic := 'X';

    component sapiobuf
      port (I: in Std_logic; PAD: out Std_logic);
    end component;
  begin
    Inst1_OB1: sapiobuf
      port map (I=>IOLDO_ipd, PAD=>rgmiitxd1_out);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(IOLDO_ipd, IOLDO, tipd_IOLDO);
    END BLOCK;

    VitalBehavior : PROCESS (IOLDO_ipd, rgmiitxd1_out)
    VARIABLE rgmiitxd1_zd         	: std_logic := 'X';
    VARIABLE rgmiitxd1_GlitchData 	: VitalGlitchDataType;


    BEGIN

    IF (TimingChecksOn) THEN

    END IF;

    rgmiitxd1_zd 	:= rgmiitxd1_out;

    VitalPathDelay01 (
      OutSignal => rgmiitxd1, OutSignalName => "rgmiitxd1", OutTemp => rgmiitxd1_zd,
      Paths      => (0 => (InputChangeTime => IOLDO_ipd'last_event,
                           PathDelay => tpd_IOLDO_rgmiitxd1,
                           PathCondition => TRUE)),
      GlitchData => rgmiitxd1_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity rgmii_txd_1_MGIOL
  library IEEE, vital2000, ECP5U;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use ECP5U.COMPONENTS.ALL;

  entity rgmii_txd_1_MGIOL is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "rgmii_txd_1_MGIOL";

      tipd_TXDATA0  	: VitalDelayType01 := (0 ns, 0 ns);
      tipd_TXDATA1  	: VitalDelayType01 := (0 ns, 0 ns);
      tipd_CLK  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_CLK_IOLDO	 : VitalDelayType01 := (0 ns, 0 ns);
      ticd_CLK	: VitalDelayType := 0 ns;
      tisd_TXDATA0_CLK	: VitalDelayType := 0 ns;
      tsetup_TXDATA0_CLK_noedge_posedge	: VitalDelayType := 0 ns;
      thold_TXDATA0_CLK_noedge_posedge	: VitalDelayType := 0 ns;
      tisd_TXDATA1_CLK	: VitalDelayType := 0 ns;
      tsetup_TXDATA1_CLK_noedge_posedge	: VitalDelayType := 0 ns;
      thold_TXDATA1_CLK_noedge_posedge	: VitalDelayType := 0 ns;
      tperiod_CLK 	: VitalDelayType := 0 ns;
      tpw_CLK_posedge	: VitalDelayType := 0 ns;
      tpw_CLK_negedge	: VitalDelayType := 0 ns);

    port (IOLDO: out Std_logic; TXDATA0: in Std_logic; TXDATA1: in Std_logic; 
          CLK: in Std_logic);

    ATTRIBUTE Vital_Level0 OF rgmii_txd_1_MGIOL : ENTITY IS TRUE;

  end rgmii_txd_1_MGIOL;

  architecture Structure of rgmii_txd_1_MGIOL is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal IOLDO_out 	: std_logic := 'X';
    signal TXDATA0_ipd 	: std_logic := 'X';
    signal TXDATA0_dly 	: std_logic := 'X';
    signal TXDATA1_ipd 	: std_logic := 'X';
    signal TXDATA1_dly 	: std_logic := 'X';
    signal CLK_ipd 	: std_logic := 'X';
    signal CLK_dly 	: std_logic := 'X';

    signal GNDI: Std_logic;
    component gnd
      port (PWR0: out Std_logic);
    end component;
    component sapoddrx1
      port (D0: in Std_logic; D1: in Std_logic; SCLK: in Std_logic; 
            RST: in Std_logic; Q: out Std_logic);
    end component;
  begin
    dut_rgmii_inst_DDR_TX_Inst4_ODDRX1F1: sapoddrx1
      port map (D0=>TXDATA0_dly, D1=>TXDATA1_dly, SCLK=>CLK_dly, RST=>GNDI, 
                Q=>IOLDO_out);
    DRIVEGND: gnd
      port map (PWR0=>GNDI);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(TXDATA0_ipd, TXDATA0, tipd_TXDATA0);
      VitalWireDelay(TXDATA1_ipd, TXDATA1, tipd_TXDATA1);
      VitalWireDelay(CLK_ipd, CLK, tipd_CLK);
    END BLOCK;

    --  Setup and Hold DELAYs
    SignalDelay : BLOCK
    BEGIN
      VitalSignalDelay(TXDATA0_dly, TXDATA0_ipd, tisd_TXDATA0_CLK);
      VitalSignalDelay(TXDATA1_dly, TXDATA1_ipd, tisd_TXDATA1_CLK);
      VitalSignalDelay(CLK_dly, CLK_ipd, ticd_CLK);
    END BLOCK;

    VitalBehavior : PROCESS (IOLDO_out, TXDATA0_dly, TXDATA1_dly, CLK_dly)
    VARIABLE IOLDO_zd         	: std_logic := 'X';
    VARIABLE IOLDO_GlitchData 	: VitalGlitchDataType;

    VARIABLE tviol_TXDATA0_CLK       	: x01 := '0';
    VARIABLE TXDATA0_CLK_TimingDatash	: VitalTimingDataType;
    VARIABLE tviol_TXDATA1_CLK       	: x01 := '0';
    VARIABLE TXDATA1_CLK_TimingDatash	: VitalTimingDataType;
    VARIABLE tviol_CLK_CLK          	: x01 := '0';
    VARIABLE periodcheckinfo_CLK	: VitalPeriodDataType;

    BEGIN

    IF (TimingChecksOn) THEN
      VitalSetupHoldCheck (
        TestSignal => TXDATA0_dly,
        TestSignalName => "TXDATA0",
        TestDelay => tisd_TXDATA0_CLK,
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_TXDATA0_CLK_noedge_posedge,
        SetupLow => tsetup_TXDATA0_CLK_noedge_posedge,
        HoldHigh => thold_TXDATA0_CLK_noedge_posedge,
        HoldLow => thold_TXDATA0_CLK_noedge_posedge,
        CheckEnabled => TRUE,
        RefTransition => '/',
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        TimingData => TXDATA0_CLK_TimingDatash,
        Violation => tviol_TXDATA0_CLK,
        MsgSeverity => warning);
      VitalSetupHoldCheck (
        TestSignal => TXDATA1_dly,
        TestSignalName => "TXDATA1",
        TestDelay => tisd_TXDATA1_CLK,
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_TXDATA1_CLK_noedge_posedge,
        SetupLow => tsetup_TXDATA1_CLK_noedge_posedge,
        HoldHigh => thold_TXDATA1_CLK_noedge_posedge,
        HoldLow => thold_TXDATA1_CLK_noedge_posedge,
        CheckEnabled => TRUE,
        RefTransition => '/',
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        TimingData => TXDATA1_CLK_TimingDatash,
        Violation => tviol_TXDATA1_CLK,
        MsgSeverity => warning);
      VitalPeriodPulseCheck (
        TestSignal => CLK_ipd,
        TestSignalName => "CLK",
        Period => tperiod_CLK,
        PulseWidthHigh => tpw_CLK_posedge,
        PulseWidthLow => tpw_CLK_negedge,
        PeriodData => periodcheckinfo_CLK,
        Violation => tviol_CLK_CLK,
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        CheckEnabled => TRUE,
        MsgSeverity => warning);

    END IF;

    IOLDO_zd 	:= IOLDO_out;

    VitalPathDelay01 (
      OutSignal => IOLDO, OutSignalName => "IOLDO", OutTemp => IOLDO_zd,
      Paths      => (0 => (InputChangeTime => CLK_dly'last_event,
                           PathDelay => tpd_CLK_IOLDO,
                           PathCondition => TRUE)),
      GlitchData => IOLDO_GlitchData,
      Mode       => ondetect, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity rgmii_txd_0_B
  library IEEE, vital2000, ECP5U;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use ECP5U.COMPONENTS.ALL;

  entity rgmii_txd_0_B is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "rgmii_txd_0_B";

      tipd_IOLDO  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_IOLDO_rgmiitxd0	 : VitalDelayType01 := (0 ns, 0 ns));

    port (IOLDO: in Std_logic; rgmiitxd0: out Std_logic);

    ATTRIBUTE Vital_Level0 OF rgmii_txd_0_B : ENTITY IS TRUE;

  end rgmii_txd_0_B;

  architecture Structure of rgmii_txd_0_B is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal IOLDO_ipd 	: std_logic := 'X';
    signal rgmiitxd0_out 	: std_logic := 'X';

    component sapiobuf
      port (I: in Std_logic; PAD: out Std_logic);
    end component;
  begin
    Inst1_OB0: sapiobuf
      port map (I=>IOLDO_ipd, PAD=>rgmiitxd0_out);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(IOLDO_ipd, IOLDO, tipd_IOLDO);
    END BLOCK;

    VitalBehavior : PROCESS (IOLDO_ipd, rgmiitxd0_out)
    VARIABLE rgmiitxd0_zd         	: std_logic := 'X';
    VARIABLE rgmiitxd0_GlitchData 	: VitalGlitchDataType;


    BEGIN

    IF (TimingChecksOn) THEN

    END IF;

    rgmiitxd0_zd 	:= rgmiitxd0_out;

    VitalPathDelay01 (
      OutSignal => rgmiitxd0, OutSignalName => "rgmiitxd0", OutTemp => rgmiitxd0_zd,
      Paths      => (0 => (InputChangeTime => IOLDO_ipd'last_event,
                           PathDelay => tpd_IOLDO_rgmiitxd0,
                           PathCondition => TRUE)),
      GlitchData => rgmiitxd0_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity rgmii_txd_0_MGIOL
  library IEEE, vital2000, ECP5U;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use ECP5U.COMPONENTS.ALL;

  entity rgmii_txd_0_MGIOL is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "rgmii_txd_0_MGIOL";

      tipd_TXDATA0  	: VitalDelayType01 := (0 ns, 0 ns);
      tipd_TXDATA1  	: VitalDelayType01 := (0 ns, 0 ns);
      tipd_CLK  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_CLK_IOLDO	 : VitalDelayType01 := (0 ns, 0 ns);
      ticd_CLK	: VitalDelayType := 0 ns;
      tisd_TXDATA0_CLK	: VitalDelayType := 0 ns;
      tsetup_TXDATA0_CLK_noedge_posedge	: VitalDelayType := 0 ns;
      thold_TXDATA0_CLK_noedge_posedge	: VitalDelayType := 0 ns;
      tisd_TXDATA1_CLK	: VitalDelayType := 0 ns;
      tsetup_TXDATA1_CLK_noedge_posedge	: VitalDelayType := 0 ns;
      thold_TXDATA1_CLK_noedge_posedge	: VitalDelayType := 0 ns;
      tperiod_CLK 	: VitalDelayType := 0 ns;
      tpw_CLK_posedge	: VitalDelayType := 0 ns;
      tpw_CLK_negedge	: VitalDelayType := 0 ns);

    port (IOLDO: out Std_logic; TXDATA0: in Std_logic; TXDATA1: in Std_logic; 
          CLK: in Std_logic);

    ATTRIBUTE Vital_Level0 OF rgmii_txd_0_MGIOL : ENTITY IS TRUE;

  end rgmii_txd_0_MGIOL;

  architecture Structure of rgmii_txd_0_MGIOL is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal IOLDO_out 	: std_logic := 'X';
    signal TXDATA0_ipd 	: std_logic := 'X';
    signal TXDATA0_dly 	: std_logic := 'X';
    signal TXDATA1_ipd 	: std_logic := 'X';
    signal TXDATA1_dly 	: std_logic := 'X';
    signal CLK_ipd 	: std_logic := 'X';
    signal CLK_dly 	: std_logic := 'X';

    signal GNDI: Std_logic;
    component gnd
      port (PWR0: out Std_logic);
    end component;
    component sapoddrx1
      port (D0: in Std_logic; D1: in Std_logic; SCLK: in Std_logic; 
            RST: in Std_logic; Q: out Std_logic);
    end component;
  begin
    dut_rgmii_inst_DDR_TX_Inst4_ODDRX1F0: sapoddrx1
      port map (D0=>TXDATA0_dly, D1=>TXDATA1_dly, SCLK=>CLK_dly, RST=>GNDI, 
                Q=>IOLDO_out);
    DRIVEGND: gnd
      port map (PWR0=>GNDI);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(TXDATA0_ipd, TXDATA0, tipd_TXDATA0);
      VitalWireDelay(TXDATA1_ipd, TXDATA1, tipd_TXDATA1);
      VitalWireDelay(CLK_ipd, CLK, tipd_CLK);
    END BLOCK;

    --  Setup and Hold DELAYs
    SignalDelay : BLOCK
    BEGIN
      VitalSignalDelay(TXDATA0_dly, TXDATA0_ipd, tisd_TXDATA0_CLK);
      VitalSignalDelay(TXDATA1_dly, TXDATA1_ipd, tisd_TXDATA1_CLK);
      VitalSignalDelay(CLK_dly, CLK_ipd, ticd_CLK);
    END BLOCK;

    VitalBehavior : PROCESS (IOLDO_out, TXDATA0_dly, TXDATA1_dly, CLK_dly)
    VARIABLE IOLDO_zd         	: std_logic := 'X';
    VARIABLE IOLDO_GlitchData 	: VitalGlitchDataType;

    VARIABLE tviol_TXDATA0_CLK       	: x01 := '0';
    VARIABLE TXDATA0_CLK_TimingDatash	: VitalTimingDataType;
    VARIABLE tviol_TXDATA1_CLK       	: x01 := '0';
    VARIABLE TXDATA1_CLK_TimingDatash	: VitalTimingDataType;
    VARIABLE tviol_CLK_CLK          	: x01 := '0';
    VARIABLE periodcheckinfo_CLK	: VitalPeriodDataType;

    BEGIN

    IF (TimingChecksOn) THEN
      VitalSetupHoldCheck (
        TestSignal => TXDATA0_dly,
        TestSignalName => "TXDATA0",
        TestDelay => tisd_TXDATA0_CLK,
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_TXDATA0_CLK_noedge_posedge,
        SetupLow => tsetup_TXDATA0_CLK_noedge_posedge,
        HoldHigh => thold_TXDATA0_CLK_noedge_posedge,
        HoldLow => thold_TXDATA0_CLK_noedge_posedge,
        CheckEnabled => TRUE,
        RefTransition => '/',
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        TimingData => TXDATA0_CLK_TimingDatash,
        Violation => tviol_TXDATA0_CLK,
        MsgSeverity => warning);
      VitalSetupHoldCheck (
        TestSignal => TXDATA1_dly,
        TestSignalName => "TXDATA1",
        TestDelay => tisd_TXDATA1_CLK,
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_TXDATA1_CLK_noedge_posedge,
        SetupLow => tsetup_TXDATA1_CLK_noedge_posedge,
        HoldHigh => thold_TXDATA1_CLK_noedge_posedge,
        HoldLow => thold_TXDATA1_CLK_noedge_posedge,
        CheckEnabled => TRUE,
        RefTransition => '/',
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        TimingData => TXDATA1_CLK_TimingDatash,
        Violation => tviol_TXDATA1_CLK,
        MsgSeverity => warning);
      VitalPeriodPulseCheck (
        TestSignal => CLK_ipd,
        TestSignalName => "CLK",
        Period => tperiod_CLK,
        PulseWidthHigh => tpw_CLK_posedge,
        PulseWidthLow => tpw_CLK_negedge,
        PeriodData => periodcheckinfo_CLK,
        Violation => tviol_CLK_CLK,
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        CheckEnabled => TRUE,
        MsgSeverity => warning);

    END IF;

    IOLDO_zd 	:= IOLDO_out;

    VitalPathDelay01 (
      OutSignal => IOLDO, OutSignalName => "IOLDO", OutTemp => IOLDO_zd,
      Paths      => (0 => (InputChangeTime => CLK_dly'last_event,
                           PathDelay => tpd_CLK_IOLDO,
                           PathCondition => TRUE)),
      GlitchData => IOLDO_GlitchData,
      Mode       => ondetect, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity sapiobuf0001
  library IEEE, vital2000, ECP5U;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use ECP5U.COMPONENTS.ALL;

  entity sapiobuf0001 is
    port (Z: out Std_logic; PAD: in Std_logic);

    ATTRIBUTE Vital_Level0 OF sapiobuf0001 : ENTITY IS TRUE;

  end sapiobuf0001;

  architecture Structure of sapiobuf0001 is
  begin
    INST1: IBPD
      port map (I=>PAD, O=>Z);
  end Structure;

-- entity rstB
  library IEEE, vital2000, ECP5U;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use ECP5U.COMPONENTS.ALL;

  entity rstB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "rstB";

      tipd_rstS  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_rstS_PADDI	 : VitalDelayType01 := (0 ns, 0 ns);
      tperiod_rstS 	: VitalDelayType := 0 ns;
      tpw_rstS_posedge	: VitalDelayType := 0 ns;
      tpw_rstS_negedge	: VitalDelayType := 0 ns);

    port (PADDI: out Std_logic; rstS: in Std_logic);

    ATTRIBUTE Vital_Level0 OF rstB : ENTITY IS TRUE;

  end rstB;

  architecture Structure of rstB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDI_out 	: std_logic := 'X';
    signal rstS_ipd 	: std_logic := 'X';

    component sapiobuf0001
      port (Z: out Std_logic; PAD: in Std_logic);
    end component;
  begin
    rst_pad: sapiobuf0001
      port map (Z=>PADDI_out, PAD=>rstS_ipd);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(rstS_ipd, rstS, tipd_rstS);
    END BLOCK;

    VitalBehavior : PROCESS (PADDI_out, rstS_ipd)
    VARIABLE PADDI_zd         	: std_logic := 'X';
    VARIABLE PADDI_GlitchData 	: VitalGlitchDataType;

    VARIABLE tviol_rstS_rstS          	: x01 := '0';
    VARIABLE periodcheckinfo_rstS	: VitalPeriodDataType;

    BEGIN

    IF (TimingChecksOn) THEN
      VitalPeriodPulseCheck (
        TestSignal => rstS_ipd,
        TestSignalName => "rstS",
        Period => tperiod_rstS,
        PulseWidthHigh => tpw_rstS_posedge,
        PulseWidthLow => tpw_rstS_negedge,
        PeriodData => periodcheckinfo_rstS,
        Violation => tviol_rstS_rstS,
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        CheckEnabled => TRUE,
        MsgSeverity => warning);

    END IF;

    PADDI_zd 	:= PADDI_out;

    VitalPathDelay01 (
      OutSignal => PADDI, OutSignalName => "PADDI", OutTemp => PADDI_zd,
      Paths      => (0 => (InputChangeTime => rstS_ipd'last_event,
                           PathDelay => tpd_rstS_PADDI,
                           PathCondition => TRUE)),
      GlitchData => PADDI_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity sapiobuf0002
  library IEEE, vital2000, ECP5U;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use ECP5U.COMPONENTS.ALL;

  entity sapiobuf0002 is
    port (Z: out Std_logic; PAD: in Std_logic);

    ATTRIBUTE Vital_Level0 OF sapiobuf0002 : ENTITY IS TRUE;

  end sapiobuf0002;

  architecture Structure of sapiobuf0002 is
  begin
    INST1: IBPD
      port map (I=>PAD, O=>Z);
  end Structure;

-- entity clkB
  library IEEE, vital2000, ECP5U;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use ECP5U.COMPONENTS.ALL;

  entity clkB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "clkB";

      tipd_clkS  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_clkS_PADDI	 : VitalDelayType01 := (0 ns, 0 ns);
      tperiod_clkS 	: VitalDelayType := 0 ns;
      tpw_clkS_posedge	: VitalDelayType := 0 ns;
      tpw_clkS_negedge	: VitalDelayType := 0 ns);

    port (PADDI: out Std_logic; clkS: in Std_logic);

    ATTRIBUTE Vital_Level0 OF clkB : ENTITY IS TRUE;

  end clkB;

  architecture Structure of clkB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDI_out 	: std_logic := 'X';
    signal clkS_ipd 	: std_logic := 'X';

    component sapiobuf0002
      port (Z: out Std_logic; PAD: in Std_logic);
    end component;
  begin
    clk_pad: sapiobuf0002
      port map (Z=>PADDI_out, PAD=>clkS_ipd);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(clkS_ipd, clkS, tipd_clkS);
    END BLOCK;

    VitalBehavior : PROCESS (PADDI_out, clkS_ipd)
    VARIABLE PADDI_zd         	: std_logic := 'X';
    VARIABLE PADDI_GlitchData 	: VitalGlitchDataType;

    VARIABLE tviol_clkS_clkS          	: x01 := '0';
    VARIABLE periodcheckinfo_clkS	: VitalPeriodDataType;

    BEGIN

    IF (TimingChecksOn) THEN
      VitalPeriodPulseCheck (
        TestSignal => clkS_ipd,
        TestSignalName => "clkS",
        Period => tperiod_clkS,
        PulseWidthHigh => tpw_clkS_posedge,
        PulseWidthLow => tpw_clkS_negedge,
        PeriodData => periodcheckinfo_clkS,
        Violation => tviol_clkS_clkS,
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        CheckEnabled => TRUE,
        MsgSeverity => warning);

    END IF;

    PADDI_zd 	:= PADDI_out;

    VitalPathDelay01 (
      OutSignal => PADDI, OutSignalName => "PADDI", OutTemp => PADDI_zd,
      Paths      => (0 => (InputChangeTime => clkS_ipd'last_event,
                           PathDelay => tpd_clkS_PADDI,
                           PathCondition => TRUE)),
      GlitchData => PADDI_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity GSR5MODE
  library IEEE, vital2000, ECP5U;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use ECP5U.COMPONENTS.ALL;

  entity GSR5MODE is
    port (GSRP: in Std_logic);

    ATTRIBUTE Vital_Level0 OF GSR5MODE : ENTITY IS TRUE;

  end GSR5MODE;

  architecture Structure of GSR5MODE is
    signal GSRMODE: Std_logic;
  begin
    INST10: INV
      port map (A=>GSRP, Z=>GSRMODE);
    INST20: GSR
      port map (GSR=>GSRMODE);
  end Structure;

-- entity GSR_INSTB
  library IEEE, vital2000, ECP5U;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use ECP5U.COMPONENTS.ALL;

  entity GSR_INSTB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "GSR_INSTB";

      tipd_GSRNET  	: VitalDelayType01 := (0 ns, 0 ns));

    port (GSRNET: in Std_logic);

    ATTRIBUTE Vital_Level0 OF GSR_INSTB : ENTITY IS TRUE;

  end GSR_INSTB;

  architecture Structure of GSR_INSTB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal GSRNET_ipd 	: std_logic := 'X';

    component GSR5MODE
      port (GSRP: in Std_logic);
    end component;
  begin
    GSR_INST_GSRMODE: GSR5MODE
      port map (GSRP=>GSRNET_ipd);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(GSRNET_ipd, GSRNET, tipd_GSRNET);
    END BLOCK;

    VitalBehavior : PROCESS (GSRNET_ipd)


    BEGIN

    IF (TimingChecksOn) THEN

    END IF;



    END PROCESS;

  end Structure;

-- entity top_tb_fpga
  library IEEE, vital2000, ECP5U;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use ECP5U.COMPONENTS.ALL;

  entity top_tb_fpga is
    port (clk: in Std_logic; rst: in Std_logic; 
          rgmii_txd: out Std_logic_vector (3 downto 0); 
          rgmii_txctl: out Std_logic; rgmii_txc: out Std_logic);



  end top_tb_fpga;

  architecture Structure of top_tb_fpga is
    signal lenght_cnt_12: Std_logic;
    signal lenght_cnt_11: Std_logic;
    signal n153: Std_logic;
    signal n154: Std_logic;
    signal n2447: Std_logic;
    signal clk_c: Std_logic;
    signal n4467: Std_logic;
    signal n4468: Std_logic;
    signal dut_mac_inst_n1312: Std_logic;
    signal frame_len_31: Std_logic;
    signal dut_mac_inst_n134: Std_logic;
    signal rst_c: Std_logic;
    signal dut_mac_inst_n4461: Std_logic;
    signal frame_len_30: Std_logic;
    signal frame_len_29: Std_logic;
    signal dut_mac_inst_n135: Std_logic;
    signal dut_mac_inst_n136: Std_logic;
    signal dut_mac_inst_n4460: Std_logic;
    signal frame_len_28: Std_logic;
    signal frame_len_27: Std_logic;
    signal dut_mac_inst_n137: Std_logic;
    signal dut_mac_inst_n138: Std_logic;
    signal dut_mac_inst_n4459: Std_logic;
    signal frame_len_26: Std_logic;
    signal frame_len_25: Std_logic;
    signal dut_mac_inst_n139: Std_logic;
    signal dut_mac_inst_n140: Std_logic;
    signal dut_mac_inst_n4458: Std_logic;
    signal frame_len_24: Std_logic;
    signal frame_len_23: Std_logic;
    signal dut_mac_inst_n141: Std_logic;
    signal dut_mac_inst_n142: Std_logic;
    signal dut_mac_inst_n4457: Std_logic;
    signal frame_len_22: Std_logic;
    signal frame_len_21: Std_logic;
    signal dut_mac_inst_n143: Std_logic;
    signal dut_mac_inst_n144: Std_logic;
    signal dut_mac_inst_n4456: Std_logic;
    signal frame_len_20: Std_logic;
    signal frame_len_19: Std_logic;
    signal dut_mac_inst_n145: Std_logic;
    signal dut_mac_inst_n146: Std_logic;
    signal dut_mac_inst_n4455: Std_logic;
    signal frame_len_18: Std_logic;
    signal frame_len_17: Std_logic;
    signal dut_mac_inst_n147: Std_logic;
    signal dut_mac_inst_n148: Std_logic;
    signal dut_mac_inst_n4454: Std_logic;
    signal frame_len_16: Std_logic;
    signal frame_len_15: Std_logic;
    signal dut_mac_inst_n149: Std_logic;
    signal dut_mac_inst_n150: Std_logic;
    signal dut_mac_inst_n4453: Std_logic;
    signal frame_len_14: Std_logic;
    signal frame_len_13: Std_logic;
    signal dut_mac_inst_n151: Std_logic;
    signal dut_mac_inst_n152: Std_logic;
    signal dut_mac_inst_n4452: Std_logic;
    signal frame_len_12: Std_logic;
    signal frame_len_11: Std_logic;
    signal dut_mac_inst_n153: Std_logic;
    signal dut_mac_inst_n154: Std_logic;
    signal dut_mac_inst_n4451: Std_logic;
    signal frame_len_10: Std_logic;
    signal frame_len_9: Std_logic;
    signal dut_mac_inst_n155: Std_logic;
    signal dut_mac_inst_n156: Std_logic;
    signal dut_mac_inst_n4450: Std_logic;
    signal frame_len_8: Std_logic;
    signal frame_len_7: Std_logic;
    signal dut_mac_inst_n157: Std_logic;
    signal dut_mac_inst_n158: Std_logic;
    signal dut_mac_inst_n4449: Std_logic;
    signal frame_len_6: Std_logic;
    signal frame_len_5: Std_logic;
    signal dut_mac_inst_n159: Std_logic;
    signal dut_mac_inst_n160: Std_logic;
    signal dut_mac_inst_n4448: Std_logic;
    signal frame_len_4: Std_logic;
    signal frame_len_3: Std_logic;
    signal dut_mac_inst_n161: Std_logic;
    signal dut_mac_inst_n162: Std_logic;
    signal dut_mac_inst_n4447: Std_logic;
    signal frame_len_2: Std_logic;
    signal frame_len_1: Std_logic;
    signal dut_mac_inst_n163: Std_logic;
    signal dut_mac_inst_n164: Std_logic;
    signal dut_mac_inst_n4446: Std_logic;
    signal dut_mac_inst_frame_len_0: Std_logic;
    signal dut_n425: Std_logic;
    signal dut_n6493: Std_logic;
    signal dut_n423: Std_logic;
    signal dut_mac_inst_n165: Std_logic;
    signal lenght_cnt_10: Std_logic;
    signal lenght_cnt_9: Std_logic;
    signal n155: Std_logic;
    signal n156: Std_logic;
    signal n4466: Std_logic;
    signal lenght_cnt_8: Std_logic;
    signal lenght_cnt_7: Std_logic;
    signal n157: Std_logic;
    signal n158: Std_logic;
    signal n4465: Std_logic;
    signal lenght_cnt_6: Std_logic;
    signal lenght_cnt_5: Std_logic;
    signal n159: Std_logic;
    signal n160: Std_logic;
    signal n4464: Std_logic;
    signal lenght_cnt_4: Std_logic;
    signal lenght_cnt_3: Std_logic;
    signal n161: Std_logic;
    signal n162: Std_logic;
    signal n4463: Std_logic;
    signal lenght_cnt_2: Std_logic;
    signal lenght_cnt_1: Std_logic;
    signal n163: Std_logic;
    signal n164: Std_logic;
    signal n4462: Std_logic;
    signal lenght_cnt_0: Std_logic;
    signal n165: Std_logic;
    signal n4431: Std_logic;
    signal n4438: Std_logic;
    signal n4439: Std_logic;
    signal n4432: Std_logic;
    signal n4437: Std_logic;
    signal n4436: Std_logic;
    signal n4435: Std_logic;
    signal next_fifo_almostfull: Std_logic;
    signal n4493: Std_logic;
    signal fifo_almostfull: Std_logic;
    signal lenght_cnt_31: Std_logic;
    signal lenght_cnt_30: Std_logic;
    signal n4492: Std_logic;
    signal lenght_cnt_29: Std_logic;
    signal lenght_cnt_28: Std_logic;
    signal n4491: Std_logic;
    signal lenght_cnt_27: Std_logic;
    signal lenght_cnt_26: Std_logic;
    signal n4490: Std_logic;
    signal n4434: Std_logic;
    signal lenght_cnt_25: Std_logic;
    signal lenght_cnt_24: Std_logic;
    signal n4489: Std_logic;
    signal n4433: Std_logic;
    signal lenght_cnt_23: Std_logic;
    signal lenght_cnt_22: Std_logic;
    signal n4488: Std_logic;
    signal lenght_cnt_21: Std_logic;
    signal lenght_cnt_20: Std_logic;
    signal n4487: Std_logic;
    signal lenght_cnt_19: Std_logic;
    signal lenght_cnt_18: Std_logic;
    signal n4486: Std_logic;
    signal lenght_cnt_17: Std_logic;
    signal lenght_cnt_16: Std_logic;
    signal n4485: Std_logic;
    signal lenght_cnt_15: Std_logic;
    signal lenght_cnt_14: Std_logic;
    signal n4484: Std_logic;
    signal lenght_cnt_13: Std_logic;
    signal n4483: Std_logic;
    signal n4482: Std_logic;
    signal n4481: Std_logic;
    signal n4480: Std_logic;
    signal n4479: Std_logic;
    signal n4478: Std_logic;
    signal n134: Std_logic;
    signal n4477: Std_logic;
    signal n135: Std_logic;
    signal n136: Std_logic;
    signal n4476: Std_logic;
    signal n137: Std_logic;
    signal n138: Std_logic;
    signal n4475: Std_logic;
    signal n4445: Std_logic;
    signal n399: Std_logic;
    signal n139: Std_logic;
    signal n140: Std_logic;
    signal n4474: Std_logic;
    signal n141: Std_logic;
    signal n142: Std_logic;
    signal n4473: Std_logic;
    signal n143: Std_logic;
    signal n144: Std_logic;
    signal n4472: Std_logic;
    signal n4444: Std_logic;
    signal n4443: Std_logic;
    signal n145: Std_logic;
    signal n146: Std_logic;
    signal n4471: Std_logic;
    signal n4442: Std_logic;
    signal n4441: Std_logic;
    signal n147: Std_logic;
    signal n148: Std_logic;
    signal n4470: Std_logic;
    signal n149: Std_logic;
    signal n150: Std_logic;
    signal n4469: Std_logic;
    signal n4440: Std_logic;
    signal n151: Std_logic;
    signal n152: Std_logic;
    signal cnt_0: Std_logic;
    signal cnt_1: Std_logic;
    signal n23: Std_logic;
    signal n6504: Std_logic;
    signal cnt_2: Std_logic;
    signal next_cnt_7_N_9_2: Std_logic;
    signal next_cnt_7_N_9_1: Std_logic;
    signal clk_c_enable_16: Std_logic;
    signal cnt_3: Std_logic;
    signal cnt_4: Std_logic;
    signal next_cnt_7_N_9_4: Std_logic;
    signal next_cnt_7_N_9_3: Std_logic;
    signal cnt_5: Std_logic;
    signal cnt_6: Std_logic;
    signal n6475: Std_logic;
    signal n6482: Std_logic;
    signal next_cnt_7_N_9_6: Std_logic;
    signal next_cnt_7_N_9_5: Std_logic;
    signal cnt_7: Std_logic;
    signal n6470: Std_logic;
    signal next_cnt_7_N_9_7: Std_logic;
    signal dut_mac_inst_n5691: Std_logic;
    signal dut_next_crc_reg_31_N_390_12: Std_logic;
    signal dut_mac_inst_n3: Std_logic;
    signal dut_mac_inst_n5749: Std_logic;
    signal dut_next_crc_reg_31_N_390_9: Std_logic;
    signal dut_mac_inst_n3_adj_693: Std_logic;
    signal dut_mac_inst_next_crc_reg_12: Std_logic;
    signal dut_mac_inst_next_crc_reg_9: Std_logic;
    signal dut_crc_reg_9: Std_logic;
    signal dut_crc_reg_12: Std_logic;
    signal dut_crc_reg_31: Std_logic;
    signal dut_crc_next_31: Std_logic;
    signal dut_udp_inst_n315: Std_logic;
    signal dut_udp_inst_n320: Std_logic;
    signal dut_mac_inst_n5757: Std_logic;
    signal dut_next_crc_reg_31_N_390_31: Std_logic;
    signal dut_mac_inst_n3_adj_713: Std_logic;
    signal dut_mac_inst_next_crc_reg_31: Std_logic;
    signal dut_udp_inst_n926: Std_logic;
    signal dut_idx_1: Std_logic;
    signal dut_udp_inst_n4_adj_720: Std_logic;
    signal dut_udp_inst_n5809: Std_logic;
    signal dut_idx_0: Std_logic;
    signal dut_udp_inst_n5095: Std_logic;
    signal dut_udp_inst_n5107: Std_logic;
    signal dut_udp_inst_next_idx_1: Std_logic;
    signal dut_udp_inst_next_idx_0: Std_logic;
    signal dut_idx_3: Std_logic;
    signal dut_udp_inst_n4_adj_719: Std_logic;
    signal dut_udp_inst_n5813: Std_logic;
    signal dut_idx_2: Std_logic;
    signal dut_udp_inst_n4: Std_logic;
    signal dut_udp_inst_n5787: Std_logic;
    signal dut_udp_inst_next_idx_3: Std_logic;
    signal dut_udp_inst_next_idx_2: Std_logic;
    signal dut_n6472: Std_logic;
    signal dut_udp_inst_next_idx_7_N_183_4: Std_logic;
    signal dut_n317: Std_logic;
    signal dut_idx_4: Std_logic;
    signal dut_udp_inst_n4_adj_718: Std_logic;
    signal dut_udp_inst_n5795: Std_logic;
    signal dut_udp_inst_next_idx_4: Std_logic;
    signal dut_mac_inst_n5: Std_logic;
    signal dut_mac_inst_n421: Std_logic;
    signal dut_mac_inst_crc_cnt_1: Std_logic;
    signal dut_mac_inst_crc_cnt_0: Std_logic;
    signal dut_mac_inst_next_crc_cnt_1: Std_logic;
    signal dut_mac_inst_next_crc_cnt_0: Std_logic;
    signal dut_mac_inst_n422: Std_logic;
    signal dut_mac_inst_n5671: Std_logic;
    signal dut_mac_inst_n2_adj_710: Std_logic;
    signal dut_mac_inst_crc_next_1: Std_logic;
    signal dut_mac_inst_n5741: Std_logic;
    signal dut_mac_inst_n2_adj_691: Std_logic;
    signal dut_mac_inst_crc_next_0: Std_logic;
    signal dut_mac_inst_next_crc_reg_1: Std_logic;
    signal dut_mac_inst_next_crc_reg_0: Std_logic;
    signal dut_mac_inst_crc_reg_0: Std_logic;
    signal dut_mac_inst_crc_reg_1: Std_logic;
    signal dut_mac_inst_n5609: Std_logic;
    signal dut_mac_inst_n2_adj_705: Std_logic;
    signal dut_mac_inst_crc_next_3: Std_logic;
    signal dut_mac_inst_n5683: Std_logic;
    signal dut_mac_inst_n2_adj_708: Std_logic;
    signal dut_mac_inst_crc_next_2: Std_logic;
    signal dut_mac_inst_next_crc_reg_3: Std_logic;
    signal dut_mac_inst_next_crc_reg_2: Std_logic;
    signal dut_mac_inst_crc_reg_2: Std_logic;
    signal dut_mac_inst_crc_reg_3: Std_logic;
    signal dut_mac_inst_n5627: Std_logic;
    signal dut_mac_inst_n2_adj_699: Std_logic;
    signal dut_mac_inst_crc_next_5: Std_logic;
    signal dut_mac_inst_n5467: Std_logic;
    signal dut_mac_inst_n2_adj_704: Std_logic;
    signal dut_mac_inst_crc_next_4: Std_logic;
    signal dut_mac_inst_next_crc_reg_5: Std_logic;
    signal dut_mac_inst_next_crc_reg_4: Std_logic;
    signal dut_mac_inst_crc_reg_4: Std_logic;
    signal dut_mac_inst_crc_reg_5: Std_logic;
    signal dut_mac_inst_n5547: Std_logic;
    signal dut_mac_inst_n2_adj_696: Std_logic;
    signal dut_mac_inst_crc_next_7: Std_logic;
    signal dut_mac_inst_n5617: Std_logic;
    signal dut_mac_inst_n2_adj_697: Std_logic;
    signal dut_mac_inst_crc_next_6: Std_logic;
    signal dut_mac_inst_next_crc_reg_7: Std_logic;
    signal dut_mac_inst_next_crc_reg_6: Std_logic;
    signal dut_mac_inst_crc_reg_6: Std_logic;
    signal dut_mac_inst_crc_reg_7: Std_logic;
    signal dut_mac_inst_n5737: Std_logic;
    signal dut_mac_inst_n2_adj_692: Std_logic;
    signal dut_mac_inst_crc_next_10: Std_logic;
    signal dut_mac_inst_n5539: Std_logic;
    signal dut_mac_inst_n2_adj_694: Std_logic;
    signal dut_mac_inst_crc_next_8: Std_logic;
    signal dut_mac_inst_next_crc_reg_10: Std_logic;
    signal dut_mac_inst_next_crc_reg_8: Std_logic;
    signal dut_mac_inst_crc_reg_8: Std_logic;
    signal dut_mac_inst_crc_reg_10: Std_logic;
    signal dut_mac_inst_n5415: Std_logic;
    signal dut_mac_inst_n2_adj_689: Std_logic;
    signal dut_mac_inst_crc_next_13: Std_logic;
    signal dut_mac_inst_n5697: Std_logic;
    signal dut_mac_inst_n2_adj_690: Std_logic;
    signal dut_mac_inst_crc_next_11: Std_logic;
    signal dut_mac_inst_next_crc_reg_13: Std_logic;
    signal dut_mac_inst_next_crc_reg_11: Std_logic;
    signal dut_mac_inst_crc_reg_11: Std_logic;
    signal dut_mac_inst_crc_reg_13: Std_logic;
    signal dut_mac_inst_n5675: Std_logic;
    signal dut_mac_inst_n2_adj_687: Std_logic;
    signal dut_mac_inst_crc_next_15: Std_logic;
    signal dut_mac_inst_n5721: Std_logic;
    signal dut_mac_inst_n2_adj_688: Std_logic;
    signal dut_mac_inst_crc_next_14: Std_logic;
    signal dut_mac_inst_next_crc_reg_15: Std_logic;
    signal dut_mac_inst_next_crc_reg_14: Std_logic;
    signal dut_mac_inst_crc_reg_14: Std_logic;
    signal dut_mac_inst_crc_reg_15: Std_logic;
    signal dut_mac_inst_n5395: Std_logic;
    signal dut_mac_inst_n2_adj_685: Std_logic;
    signal dut_mac_inst_crc_next_17: Std_logic;
    signal dut_mac_inst_n5653: Std_logic;
    signal dut_mac_inst_n2_adj_686: Std_logic;
    signal dut_mac_inst_crc_next_16: Std_logic;
    signal dut_mac_inst_next_crc_reg_17: Std_logic;
    signal dut_mac_inst_next_crc_reg_16: Std_logic;
    signal dut_mac_inst_crc_reg_16: Std_logic;
    signal dut_mac_inst_crc_reg_17: Std_logic;
    signal dut_mac_inst_n5419: Std_logic;
    signal dut_mac_inst_n2_adj_683: Std_logic;
    signal dut_mac_inst_crc_next_19: Std_logic;
    signal dut_mac_inst_n5519: Std_logic;
    signal dut_mac_inst_n2_adj_684: Std_logic;
    signal dut_mac_inst_crc_next_18: Std_logic;
    signal dut_mac_inst_next_crc_reg_19: Std_logic;
    signal dut_mac_inst_next_crc_reg_18: Std_logic;
    signal dut_mac_inst_crc_reg_18: Std_logic;
    signal dut_mac_inst_crc_reg_19: Std_logic;
    signal dut_mac_inst_n5579: Std_logic;
    signal dut_mac_inst_n2_adj_711: Std_logic;
    signal dut_mac_inst_crc_next_21: Std_logic;
    signal dut_mac_inst_n5499: Std_logic;
    signal dut_mac_inst_n2: Std_logic;
    signal dut_mac_inst_crc_next_20: Std_logic;
    signal dut_mac_inst_next_crc_reg_21: Std_logic;
    signal dut_mac_inst_next_crc_reg_20: Std_logic;
    signal dut_mac_inst_crc_reg_20: Std_logic;
    signal dut_mac_inst_crc_reg_21: Std_logic;
    signal dut_mac_inst_n5487: Std_logic;
    signal dut_mac_inst_n2_adj_707: Std_logic;
    signal dut_mac_inst_crc_next_23: Std_logic;
    signal dut_mac_inst_n5439: Std_logic;
    signal dut_mac_inst_n2_adj_709: Std_logic;
    signal dut_mac_inst_crc_next_22: Std_logic;
    signal dut_mac_inst_next_crc_reg_23: Std_logic;
    signal dut_mac_inst_next_crc_reg_22: Std_logic;
    signal dut_mac_inst_crc_reg_22: Std_logic;
    signal dut_mac_inst_crc_reg_23: Std_logic;
    signal dut_mac_inst_n5463: Std_logic;
    signal dut_mac_inst_n2_adj_703: Std_logic;
    signal dut_mac_inst_crc_next_25: Std_logic;
    signal dut_mac_inst_n5575: Std_logic;
    signal dut_mac_inst_n2_adj_706: Std_logic;
    signal dut_mac_inst_crc_next_24: Std_logic;
    signal dut_mac_inst_next_crc_reg_25: Std_logic;
    signal dut_mac_inst_next_crc_reg_24: Std_logic;
    signal dut_mac_inst_crc_reg_24: Std_logic;
    signal dut_mac_inst_crc_reg_25: Std_logic;
    signal dut_mac_inst_n5559: Std_logic;
    signal dut_mac_inst_n2_adj_700: Std_logic;
    signal dut_mac_inst_crc_next_27: Std_logic;
    signal dut_mac_inst_n5391: Std_logic;
    signal dut_mac_inst_n2_adj_701: Std_logic;
    signal dut_mac_inst_crc_next_26: Std_logic;
    signal dut_mac_inst_next_crc_reg_27: Std_logic;
    signal dut_mac_inst_next_crc_reg_26: Std_logic;
    signal dut_mac_inst_crc_reg_26: Std_logic;
    signal dut_mac_inst_crc_reg_27: Std_logic;
    signal dut_mac_inst_n5405: Std_logic;
    signal dut_mac_inst_n2_adj_695: Std_logic;
    signal dut_mac_inst_crc_next_29: Std_logic;
    signal dut_mac_inst_n5543: Std_logic;
    signal dut_mac_inst_n2_adj_698: Std_logic;
    signal dut_mac_inst_crc_next_28: Std_logic;
    signal dut_mac_inst_next_crc_reg_29: Std_logic;
    signal dut_mac_inst_next_crc_reg_28: Std_logic;
    signal dut_mac_inst_crc_reg_28: Std_logic;
    signal dut_mac_inst_crc_reg_29: Std_logic;
    signal dut_mac_inst_crc_next_30: Std_logic;
    signal dut_mac_inst_crc_reg_30: Std_logic;
    signal dut_mac_inst_n5701: Std_logic;
    signal dut_mac_inst_n2_adj_714: Std_logic;
    signal dut_mac_inst_next_crc_reg_30: Std_logic;
    signal dut_mac_inst_n420: Std_logic;
    signal dut_mac_inst_ifg_cnt_0: Std_logic;
    signal dut_mac_inst_n6476: Std_logic;
    signal dut_mac_inst_n3184: Std_logic;
    signal dut_mac_inst_n11_adj_702: Std_logic;
    signal dut_mac_inst_n1334: Std_logic;
    signal dut_mac_inst_ifg_cnt_2: Std_logic;
    signal dut_mac_inst_ifg_cnt_1: Std_logic;
    signal dut_mac_inst_next_ifg_cnt_3_N_513_2: Std_logic;
    signal dut_mac_inst_next_ifg_cnt_3_N_513_1: Std_logic;
    signal dut_mac_inst_clk_c_enable_17: Std_logic;
    signal dut_mac_inst_ifg_cnt_3: Std_logic;
    signal dut_mac_inst_next_ifg_cnt_3_N_513_3: Std_logic;
    signal dut_mac_inst_n5889: Std_logic;
    signal dut_n6479: Std_logic;
    signal dut_mac_inst_n5379: Std_logic;
    signal dut_mac_inst_n1959: Std_logic;
    signal dut_mac_inst_n5287: Std_logic;
    signal dut_mac_inst_n1962: Std_logic;
    signal dut_n316: Std_logic;
    signal dut_reg_fifo_empty: Std_logic;
    signal dut_mac_inst_n11: Std_logic;
    signal dut_mac_inst_n1958: Std_logic;
    signal dut_mac_inst_pad_cnt_1: Std_logic;
    signal dut_mac_inst_pad_cnt_2: Std_logic;
    signal dut_mac_inst_pad_cnt_0: Std_logic;
    signal dut_mac_inst_next_pad_cnt_0: Std_logic;
    signal dut_mac_inst_clk_c_enable_9: Std_logic;
    signal dut_mac_inst_n5865: Std_logic;
    signal dut_mac_inst_n6385: Std_logic;
    signal dut_mac_inst_pad_cnt_3: Std_logic;
    signal dut_mac_inst_n6481: Std_logic;
    signal dut_mac_inst_next_pad_cnt_3: Std_logic;
    signal dut_mac_inst_next_pad_cnt_1: Std_logic;
    signal dut_mac_inst_clk_c_enable_8: Std_logic;
    signal dut_mac_inst_next_pad_cnt_2: Std_logic;
    signal dut_mac_inst_n6332: Std_logic;
    signal dut_mac_inst_pad_cnt_4: Std_logic;
    signal dut_mac_inst_n6474: Std_logic;
    signal dut_mac_inst_next_pad_cnt_4: Std_logic;
    signal dut_mac_inst_pad_cnt_5: Std_logic;
    signal dut_mac_inst_n6500: Std_logic;
    signal dut_mac_inst_next_pad_cnt_5: Std_logic;
    signal dut_mac_inst_pre_cnt_1: Std_logic;
    signal dut_mac_inst_pre_cnt_0: Std_logic;
    signal n424: Std_logic;
    signal dut_mac_inst_n4923: Std_logic;
    signal dut_mac_inst_n4899: Std_logic;
    signal clk_c_enable_19: Std_logic;
    signal dut_mac_inst_pre_cnt_2: Std_logic;
    signal dut_mac_inst_n4907: Std_logic;
    signal n6488: Std_logic;
    signal dut_udp_inst_n6473: Std_logic;
    signal dut_n5334: Std_logic;
    signal dut_udp_inst_n1946: Std_logic;
    signal dut_udp_inst_n1931: Std_logic;
    signal dut_udp_inst_n1947: Std_logic;
    signal dut_n15_adj_721: Std_logic;
    signal dut_udp_inst_n337: Std_logic;
    signal dut_n319: Std_logic;
    signal dut_n15: Std_logic;
    signal dut_n5318: Std_logic;
    signal dut_n318: Std_logic;
    signal dut_udp_inst_n1941: Std_logic;
    signal dut_udp_inst_n1939: Std_logic;
    signal dut_n395: Std_logic;
    signal dut_mac_inst_n1952: Std_logic;
    signal dut_mac_inst_n1956: Std_logic;
    signal dut_reg_fifo_data_0: Std_logic;
    signal dut_reg_fifo_data_1: Std_logic;
    signal dut_reg_fifo_data_2: Std_logic;
    signal dut_reg_fifo_data_3: Std_logic;
    signal dut_reg_fifo_data_4: Std_logic;
    signal dut_reg_fifo_data_5: Std_logic;
    signal dut_reg_fifo_data_6: Std_logic;
    signal dut_reg_fifo_data_7: Std_logic;
    signal dut_udp_inst_next_idx_7_N_142_6: Std_logic;
    signal dut_udp_inst_n5789: Std_logic;
    signal dut_udp_inst_n2_adj_716: Std_logic;
    signal dut_udp_inst_next_idx_7_N_142_5: Std_logic;
    signal dut_udp_inst_n5801: Std_logic;
    signal dut_udp_inst_n2_adj_717: Std_logic;
    signal dut_udp_inst_next_idx_6: Std_logic;
    signal dut_udp_inst_next_idx_5: Std_logic;
    signal dut_udp_inst_idx_5: Std_logic;
    signal dut_udp_inst_idx_6: Std_logic;
    signal dut_udp_inst_next_idx_7_N_161_7: Std_logic;
    signal dut_udp_inst_idx_7: Std_logic;
    signal dut_udp_inst_next_idx_7_N_142_7: Std_logic;
    signal dut_udp_inst_n5781: Std_logic;
    signal dut_udp_inst_n2: Std_logic;
    signal dut_udp_inst_next_idx_7: Std_logic;
    signal dut_reg_fifo_almostfull: Std_logic;
    signal dut_udp_inst_n1943: Std_logic;
    signal dut_n6492: Std_logic;
    signal next_fifo_almostfull_N_83: Std_logic;
    signal fifo_empty: Std_logic;
    signal dut_mac_inst_n1954: Std_logic;
    signal dut_udp_inst_t_data_7_N_100_2: Std_logic;
    signal dut_udp_inst_t_data_7_N_92_2: Std_logic;
    signal dut_udp_inst_n6201: Std_logic;
    signal dut_udp_inst_t_data_7_N_92_4: Std_logic;
    signal dut_udp_inst_n6449: Std_logic;
    signal dut_udp_inst_n2046: Std_logic;
    signal dut_udp_inst_n6: Std_logic;
    signal dut_udp_inst_n2040: Std_logic;
    signal dut_udp_inst_n6130: Std_logic;
    signal dut_udp_inst_n6496: Std_logic;
    signal dut_udp_inst_n1981: Std_logic;
    signal dut_udp_inst_n1218: Std_logic;
    signal dut_udp_inst_n6502: Std_logic;
    signal dut_udp_inst_n6437: Std_logic;
    signal dut_udp_inst_n5951: Std_logic;
    signal dut_udp_inst_n1223: Std_logic;
    signal dut_udp_inst_n6524: Std_logic;
    signal dut_mac_inst_gmii_txd_7_N_202_6: Std_logic;
    signal dut_mac_inst_gmii_txd_7_N_202_7: Std_logic;
    signal dut_mac_inst_gmii_txd_7_N_202_0: Std_logic;
    signal dut_mac_inst_gmii_txd_7_N_202_4: Std_logic;
    signal dut_mac_inst_gmii_txd_7_N_202_2: Std_logic;
    signal dut_mac_inst_gmii_txd_7_N_202_1: Std_logic;
    signal dut_mac_inst_gmii_txd_7_N_202_5: Std_logic;
    signal dut_mac_inst_gmii_txd_7_N_202_3: Std_logic;
    signal dut_udp_inst_n2244: Std_logic;
    signal dut_udp_inst_n6478: Std_logic;
    signal dut_udp_inst_n6510: Std_logic;
    signal dut_udp_inst_next_idx_7_N_183_1: Std_logic;
    signal dut_udp_inst_n6494: Std_logic;
    signal dut_udp_inst_next_idx_7_N_142_2: Std_logic;
    signal dut_mac_inst_crc_inst_n6403: Std_logic;
    signal dut_t_data_7_N_100_3: Std_logic;
    signal dut_mac_inst_crc_inst_n5917: Std_logic;
    signal dut_udp_inst_next_idx_7_N_183_3: Std_logic;
    signal dut_udp_inst_n6485: Std_logic;
    signal dut_udp_inst_n6511: Std_logic;
    signal dut_udp_inst_next_idx_7_N_150_3: Std_logic;
    signal dut_udp_inst_n150: Std_logic;
    signal dut_udp_inst_next_idx_7_N_134_7: Std_logic;
    signal dut_udp_inst_n5845: Std_logic;
    signal dut_udp_inst_n5849: Std_logic;
    signal dut_udp_inst_n151: Std_logic;
    signal dut_udp_inst_next_idx_7_N_134_6: Std_logic;
    signal dut_udp_inst_n5835: Std_logic;
    signal dut_udp_inst_n6508: Std_logic;
    signal dut_udp_inst_n152: Std_logic;
    signal dut_udp_inst_next_idx_7_N_134_5: Std_logic;
    signal dut_udp_inst_n5831: Std_logic;
    signal dut_udp_inst_next_idx_7_N_183_2: Std_logic;
    signal dut_udp_inst_n6486: Std_logic;
    signal dut_mac_inst_n6507: Std_logic;
    signal dut_mac_inst_n6487: Std_logic;
    signal dut_mac_inst_n6509: Std_logic;
    signal dut_udp_inst_next_idx_7_N_150_2: Std_logic;
    signal dut_n6497: Std_logic;
    signal dut_udp_inst_t_data_7_N_84_6: Std_logic;
    signal dut_udp_inst_n6446: Std_logic;
    signal dut_udp_inst_n6490: Std_logic;
    signal dut_udp_inst_n2036: Std_logic;
    signal dut_udp_inst_next_idx_7_N_142_3: Std_logic;
    signal dut_udp_inst_next_idx_7_N_142_4: Std_logic;
    signal dut_udp_inst_next_idx_7_N_150_4: Std_logic;
    signal dut_udp_inst_n6447: Std_logic;
    signal dut_udp_inst_n6152: Std_logic;
    signal dut_udp_inst_n1220: Std_logic;
    signal dut_mac_inst_n5124: Std_logic;
    signal dut_n6484: Std_logic;
    signal dut_udp_tdata_0: Std_logic;
    signal dut_udp_inst_n5625: Std_logic;
    signal dut_n6468: Std_logic;
    signal dut_udp_tdata_4: Std_logic;
    signal dut_mac_inst_crc_inst_n6459: Std_logic;
    signal dut_udp_inst_n6436: Std_logic;
    signal dut_udp_inst_next_idx_7_N_161_6: Std_logic;
    signal dut_udp_inst_next_idx_7_N_161_5: Std_logic;
    signal dut_udp_inst_n6150: Std_logic;
    signal dut_udp_inst_next_idx_7_N_142_1: Std_logic;
    signal dut_udp_inst_next_idx_7_N_150_1: Std_logic;
    signal dut_udp_inst_n2042: Std_logic;
    signal dut_t_data_7_N_84_5: Std_logic;
    signal dut_gmii_txd_7_N_210_3: Std_logic;
    signal dut_mac_inst_n2265: Std_logic;
    signal dut_udp_tdata_2: Std_logic;
    signal dut_mac_inst_n2018: Std_logic;
    signal dut_mac_inst_n2250: Std_logic;
    signal dut_n6464: Std_logic;
    signal dut_mac_inst_n6465: Std_logic;
    signal dut_mac_inst_crc_inst_n5141: Std_logic;
    signal dut_mac_inst_crc_inst_n18: Std_logic;
    signal dut_n6469: Std_logic;
    signal dut_n6463: Std_logic;
    signal dut_n6467: Std_logic;
    signal dut_n6457: Std_logic;
    signal dut_n6461: Std_logic;
    signal dut_udp_inst_n2038: Std_logic;
    signal dut_mac_inst_n9: Std_logic;
    signal dut_n6456: Std_logic;
    signal dut_udp_tdata_1: Std_logic;
    signal dut_mac_inst_crc_inst_n12: Std_logic;
    signal dut_gmii_txd_7_N_210_1: Std_logic;
    signal dut_gmii_txd_1: Std_logic;
    signal dut_mac_inst_crc_inst_n5597: Std_logic;
    signal dut_n6460: Std_logic;
    signal dut_mac_inst_n5777: Std_logic;
    signal dut_gmii_txd_7_N_210_5: Std_logic;
    signal dut_gmii_txd_5: Std_logic;
    signal n6483: Std_logic;
    signal dut_mac_inst_crc_inst_n14: Std_logic;
    signal dut_n6458: Std_logic;
    signal dut_mac_inst_crc_inst_n5431: Std_logic;
    signal dut_n6466: Std_logic;
    signal dut_crc_next_12: Std_logic;
    signal dut_mac_inst_n5705: Std_logic;
    signal dut_mac_inst_n6491: Std_logic;
    signal dut_mac_inst_n6453: Std_logic;
    signal dut_n6462: Std_logic;
    signal dut_mac_inst_n2014: Std_logic;
    signal dut_mac_inst_crc_inst_n5457: Std_logic;
    signal dut_mac_inst_n1965: Std_logic;
    signal dut_gmii_txd_0: Std_logic;
    signal dut_mac_inst_crc_inst_n5429: Std_logic;
    signal dut_mac_inst_n6495: Std_logic;
    signal dut_mac_inst_crc_inst_n5513: Std_logic;
    signal dut_mac_inst_n6455: Std_logic;
    signal dut_mac_inst_crc_inst_n8_adj_682: Std_logic;
    signal dut_mac_inst_crc_inst_n8: Std_logic;
    signal dut_mac_inst_crc_inst_n5635: Std_logic;
    signal dut_mac_inst_crc_inst_n5659: Std_logic;
    signal dut_mac_inst_n5643: Std_logic;
    signal dut_mac_inst_n5567: Std_logic;
    signal dut_mac_inst_crc_inst_n5715: Std_logic;
    signal dut_mac_inst_n5553: Std_logic;
    signal dut_mac_inst_crc_inst_n5533: Std_logic;
    signal dut_mac_inst_n5399: Std_logic;
    signal dut_mac_inst_crc_inst_n5525: Std_logic;
    signal dut_mac_inst_crc_inst_n5445: Std_logic;
    signal dut_mac_inst_n2400: Std_logic;
    signal dut_mac_inst_n5867: Std_logic;
    signal dut_mac_inst_crc_inst_n5587: Std_logic;
    signal dut_mac_inst_n6452: Std_logic;
    signal dut_mac_inst_crc_inst_n5647: Std_logic;
    signal dut_mac_inst_crc_inst_n6489: Std_logic;
    signal dut_mac_inst_crc_inst_n5477: Std_logic;
    signal dut_mac_inst_crc_inst_n5603: Std_logic;
    signal dut_mac_inst_n6454: Std_logic;
    signal dut_mac_inst_n6506: Std_logic;
    signal dut_mac_inst_crc_inst_n5665: Std_logic;
    signal dut_mac_inst_n4: Std_logic;
    signal dut_ctl_reg: Std_logic;
    signal dut_mac_inst_n6477: Std_logic;
    signal dut_mac_inst_n2012: Std_logic;
    signal dut_gmii_txd_7: Std_logic;
    signal dut_mac_inst_n5891: Std_logic;
    signal dut_mac_inst_n5881: Std_logic;
    signal dut_mac_inst_n2016: Std_logic;
    signal dut_gmii_txd_4: Std_logic;
    signal dut_mac_inst_crc_inst_n5423: Std_logic;
    signal dut_mac_inst_crc_inst_n5507: Std_logic;
    signal dut_mac_inst_crc_inst_n6512: Std_logic;
    signal dut_mac_inst_crc_inst_n5471: Std_logic;
    signal dut_gmii_txd_3: Std_logic;
    signal dut_gmii_txd_6: Std_logic;
    signal dut_gmii_txd_2: Std_logic;
    signal buf_clkout: Std_logic;
    signal buf_douto4: Std_logic;
    signal buf_douto3: Std_logic;
    signal buf_douto2: Std_logic;
    signal buf_douto1: Std_logic;
    signal buf_douto0: Std_logic;
    signal VCCI: Std_logic;
    component rgmii_txcB
      port (IOLDO: in Std_logic; rgmiitxc: out Std_logic);
    end component;
    component rgmii_txc_MGIOL
      port (IOLDO: out Std_logic; CLK: in Std_logic);
    end component;
    component rgmii_txctlB
      port (IOLDO: in Std_logic; rgmiitxctl: out Std_logic);
    end component;
    component rgmii_txctl_MGIOL
      port (IOLDO: out Std_logic; TXDATA0: in Std_logic; TXDATA1: in Std_logic; 
            CLK: in Std_logic);
    end component;
    component rgmii_txd_3_B
      port (IOLDO: in Std_logic; rgmiitxd3: out Std_logic);
    end component;
    component rgmii_txd_3_MGIOL
      port (IOLDO: out Std_logic; TXDATA0: in Std_logic; TXDATA1: in Std_logic; 
            CLK: in Std_logic);
    end component;
    component rgmii_txd_2_B
      port (IOLDO: in Std_logic; rgmiitxd2: out Std_logic);
    end component;
    component rgmii_txd_2_MGIOL
      port (IOLDO: out Std_logic; TXDATA0: in Std_logic; TXDATA1: in Std_logic; 
            CLK: in Std_logic);
    end component;
    component rgmii_txd_1_B
      port (IOLDO: in Std_logic; rgmiitxd1: out Std_logic);
    end component;
    component rgmii_txd_1_MGIOL
      port (IOLDO: out Std_logic; TXDATA0: in Std_logic; TXDATA1: in Std_logic; 
            CLK: in Std_logic);
    end component;
    component rgmii_txd_0_B
      port (IOLDO: in Std_logic; rgmiitxd0: out Std_logic);
    end component;
    component rgmii_txd_0_MGIOL
      port (IOLDO: out Std_logic; TXDATA0: in Std_logic; TXDATA1: in Std_logic; 
            CLK: in Std_logic);
    end component;
    component rstB
      port (PADDI: out Std_logic; rstS: in Std_logic);
    end component;
    component clkB
      port (PADDI: out Std_logic; clkS: in Std_logic);
    end component;
    component GSR_INSTB
      port (GSRNET: in Std_logic);
    end component;
  begin
    SLICE_0I: SCCU2C
      generic map (CLKMUX=>"SIG", CEMUX=>"VHI", LSRMUX=>"SIG", 
                   CCU2_INJECT1_0=>"NO", CCU2_INJECT1_1=>"NO", GSR=>"DISABLED", 
                   INIT0_INITVAL=>X"AA00", INIT1_INITVAL=>X"AA00", 
                   REG1_SD=>"VHI", REG0_SD=>"VHI", CHECK_DI1=>TRUE, 
                   CHECK_DI0=>TRUE, CHECK_LSR=>TRUE)
      port map (M1=>'X', A1=>lenght_cnt_12, B1=>'X', C1=>'X', D1=>'1', 
                DI1=>n153, DI0=>n154, A0=>lenght_cnt_11, B0=>'X', C0=>'X', 
                D0=>'1', FCI=>n4467, M0=>'X', CE=>'X', CLK=>clk_c, LSR=>n2447, 
                FCO=>n4468, F1=>n153, Q1=>lenght_cnt_12, F0=>n154, 
                Q0=>lenght_cnt_11);
    dut_mac_inst_SLICE_1I: SCCU2C
      generic map (CLKMUX=>"SIG", CEMUX=>"VHI", LSRMUX=>"SIG", 
                   CCU2_INJECT1_0=>"NO", CCU2_INJECT1_1=>"NO", GSR=>"DISABLED", 
                   INIT0_INITVAL=>X"2222", INIT1_INITVAL=>X"0000", 
                   REG0_SD=>"VHI", CHECK_DI0=>TRUE, CHECK_LSR=>TRUE)
      port map (M1=>'X', A1=>'X', B1=>'X', C1=>'X', D1=>'X', DI1=>'X', 
                DI0=>dut_mac_inst_n134, A0=>frame_len_31, 
                B0=>dut_mac_inst_n1312, C0=>'X', D0=>'1', 
                FCI=>dut_mac_inst_n4461, M0=>'X', CE=>'X', CLK=>clk_c, 
                LSR=>rst_c, FCO=>open, F1=>open, Q1=>open, 
                F0=>dut_mac_inst_n134, Q0=>frame_len_31);
    dut_mac_inst_SLICE_2I: SCCU2C
      generic map (CLKMUX=>"SIG", CEMUX=>"VHI", LSRMUX=>"SIG", 
                   CCU2_INJECT1_0=>"NO", CCU2_INJECT1_1=>"NO", GSR=>"DISABLED", 
                   INIT0_INITVAL=>X"2222", INIT1_INITVAL=>X"2222", 
                   REG1_SD=>"VHI", REG0_SD=>"VHI", CHECK_DI1=>TRUE, 
                   CHECK_DI0=>TRUE, CHECK_LSR=>TRUE)
      port map (M1=>'X', A1=>frame_len_30, B1=>dut_mac_inst_n1312, C1=>'X', 
                D1=>'1', DI1=>dut_mac_inst_n135, DI0=>dut_mac_inst_n136, 
                A0=>frame_len_29, B0=>dut_mac_inst_n1312, C0=>'X', D0=>'1', 
                FCI=>dut_mac_inst_n4460, M0=>'X', CE=>'X', CLK=>clk_c, 
                LSR=>rst_c, FCO=>dut_mac_inst_n4461, F1=>dut_mac_inst_n135, 
                Q1=>frame_len_30, F0=>dut_mac_inst_n136, Q0=>frame_len_29);
    dut_mac_inst_SLICE_3I: SCCU2C
      generic map (CLKMUX=>"SIG", CEMUX=>"VHI", LSRMUX=>"SIG", 
                   CCU2_INJECT1_0=>"NO", CCU2_INJECT1_1=>"NO", GSR=>"DISABLED", 
                   INIT0_INITVAL=>X"2222", INIT1_INITVAL=>X"2222", 
                   REG1_SD=>"VHI", REG0_SD=>"VHI", CHECK_DI1=>TRUE, 
                   CHECK_DI0=>TRUE, CHECK_LSR=>TRUE)
      port map (M1=>'X', A1=>frame_len_28, B1=>dut_mac_inst_n1312, C1=>'X', 
                D1=>'1', DI1=>dut_mac_inst_n137, DI0=>dut_mac_inst_n138, 
                A0=>frame_len_27, B0=>dut_mac_inst_n1312, C0=>'X', D0=>'1', 
                FCI=>dut_mac_inst_n4459, M0=>'X', CE=>'X', CLK=>clk_c, 
                LSR=>rst_c, FCO=>dut_mac_inst_n4460, F1=>dut_mac_inst_n137, 
                Q1=>frame_len_28, F0=>dut_mac_inst_n138, Q0=>frame_len_27);
    dut_mac_inst_SLICE_4I: SCCU2C
      generic map (CLKMUX=>"SIG", CEMUX=>"VHI", LSRMUX=>"SIG", 
                   CCU2_INJECT1_0=>"NO", CCU2_INJECT1_1=>"NO", GSR=>"DISABLED", 
                   INIT0_INITVAL=>X"2222", INIT1_INITVAL=>X"2222", 
                   REG1_SD=>"VHI", REG0_SD=>"VHI", CHECK_DI1=>TRUE, 
                   CHECK_DI0=>TRUE, CHECK_LSR=>TRUE)
      port map (M1=>'X', A1=>frame_len_26, B1=>dut_mac_inst_n1312, C1=>'X', 
                D1=>'1', DI1=>dut_mac_inst_n139, DI0=>dut_mac_inst_n140, 
                A0=>frame_len_25, B0=>dut_mac_inst_n1312, C0=>'X', D0=>'1', 
                FCI=>dut_mac_inst_n4458, M0=>'X', CE=>'X', CLK=>clk_c, 
                LSR=>rst_c, FCO=>dut_mac_inst_n4459, F1=>dut_mac_inst_n139, 
                Q1=>frame_len_26, F0=>dut_mac_inst_n140, Q0=>frame_len_25);
    dut_mac_inst_SLICE_5I: SCCU2C
      generic map (CLKMUX=>"SIG", CEMUX=>"VHI", LSRMUX=>"SIG", 
                   CCU2_INJECT1_0=>"NO", CCU2_INJECT1_1=>"NO", GSR=>"DISABLED", 
                   INIT0_INITVAL=>X"2222", INIT1_INITVAL=>X"2222", 
                   REG1_SD=>"VHI", REG0_SD=>"VHI", CHECK_DI1=>TRUE, 
                   CHECK_DI0=>TRUE, CHECK_LSR=>TRUE)
      port map (M1=>'X', A1=>frame_len_24, B1=>dut_mac_inst_n1312, C1=>'X', 
                D1=>'1', DI1=>dut_mac_inst_n141, DI0=>dut_mac_inst_n142, 
                A0=>frame_len_23, B0=>dut_mac_inst_n1312, C0=>'X', D0=>'1', 
                FCI=>dut_mac_inst_n4457, M0=>'X', CE=>'X', CLK=>clk_c, 
                LSR=>rst_c, FCO=>dut_mac_inst_n4458, F1=>dut_mac_inst_n141, 
                Q1=>frame_len_24, F0=>dut_mac_inst_n142, Q0=>frame_len_23);
    dut_mac_inst_SLICE_6I: SCCU2C
      generic map (CLKMUX=>"SIG", CEMUX=>"VHI", LSRMUX=>"SIG", 
                   CCU2_INJECT1_0=>"NO", CCU2_INJECT1_1=>"NO", GSR=>"DISABLED", 
                   INIT0_INITVAL=>X"2222", INIT1_INITVAL=>X"2222", 
                   REG1_SD=>"VHI", REG0_SD=>"VHI", CHECK_DI1=>TRUE, 
                   CHECK_DI0=>TRUE, CHECK_LSR=>TRUE)
      port map (M1=>'X', A1=>frame_len_22, B1=>dut_mac_inst_n1312, C1=>'X', 
                D1=>'1', DI1=>dut_mac_inst_n143, DI0=>dut_mac_inst_n144, 
                A0=>frame_len_21, B0=>dut_mac_inst_n1312, C0=>'X', D0=>'1', 
                FCI=>dut_mac_inst_n4456, M0=>'X', CE=>'X', CLK=>clk_c, 
                LSR=>rst_c, FCO=>dut_mac_inst_n4457, F1=>dut_mac_inst_n143, 
                Q1=>frame_len_22, F0=>dut_mac_inst_n144, Q0=>frame_len_21);
    dut_mac_inst_SLICE_7I: SCCU2C
      generic map (CLKMUX=>"SIG", CEMUX=>"VHI", LSRMUX=>"SIG", 
                   CCU2_INJECT1_0=>"NO", CCU2_INJECT1_1=>"NO", GSR=>"DISABLED", 
                   INIT0_INITVAL=>X"2222", INIT1_INITVAL=>X"2222", 
                   REG1_SD=>"VHI", REG0_SD=>"VHI", CHECK_DI1=>TRUE, 
                   CHECK_DI0=>TRUE, CHECK_LSR=>TRUE)
      port map (M1=>'X', A1=>frame_len_20, B1=>dut_mac_inst_n1312, C1=>'X', 
                D1=>'1', DI1=>dut_mac_inst_n145, DI0=>dut_mac_inst_n146, 
                A0=>frame_len_19, B0=>dut_mac_inst_n1312, C0=>'X', D0=>'1', 
                FCI=>dut_mac_inst_n4455, M0=>'X', CE=>'X', CLK=>clk_c, 
                LSR=>rst_c, FCO=>dut_mac_inst_n4456, F1=>dut_mac_inst_n145, 
                Q1=>frame_len_20, F0=>dut_mac_inst_n146, Q0=>frame_len_19);
    dut_mac_inst_SLICE_8I: SCCU2C
      generic map (CLKMUX=>"SIG", CEMUX=>"VHI", LSRMUX=>"SIG", 
                   CCU2_INJECT1_0=>"NO", CCU2_INJECT1_1=>"NO", GSR=>"DISABLED", 
                   INIT0_INITVAL=>X"2222", INIT1_INITVAL=>X"2222", 
                   REG1_SD=>"VHI", REG0_SD=>"VHI", CHECK_DI1=>TRUE, 
                   CHECK_DI0=>TRUE, CHECK_LSR=>TRUE)
      port map (M1=>'X', A1=>frame_len_18, B1=>dut_mac_inst_n1312, C1=>'X', 
                D1=>'1', DI1=>dut_mac_inst_n147, DI0=>dut_mac_inst_n148, 
                A0=>frame_len_17, B0=>dut_mac_inst_n1312, C0=>'X', D0=>'1', 
                FCI=>dut_mac_inst_n4454, M0=>'X', CE=>'X', CLK=>clk_c, 
                LSR=>rst_c, FCO=>dut_mac_inst_n4455, F1=>dut_mac_inst_n147, 
                Q1=>frame_len_18, F0=>dut_mac_inst_n148, Q0=>frame_len_17);
    dut_mac_inst_SLICE_9I: SCCU2C
      generic map (CLKMUX=>"SIG", CEMUX=>"VHI", LSRMUX=>"SIG", 
                   CCU2_INJECT1_0=>"NO", CCU2_INJECT1_1=>"NO", GSR=>"DISABLED", 
                   INIT0_INITVAL=>X"2222", INIT1_INITVAL=>X"2222", 
                   REG1_SD=>"VHI", REG0_SD=>"VHI", CHECK_DI1=>TRUE, 
                   CHECK_DI0=>TRUE, CHECK_LSR=>TRUE)
      port map (M1=>'X', A1=>frame_len_16, B1=>dut_mac_inst_n1312, C1=>'X', 
                D1=>'1', DI1=>dut_mac_inst_n149, DI0=>dut_mac_inst_n150, 
                A0=>frame_len_15, B0=>dut_mac_inst_n1312, C0=>'X', D0=>'1', 
                FCI=>dut_mac_inst_n4453, M0=>'X', CE=>'X', CLK=>clk_c, 
                LSR=>rst_c, FCO=>dut_mac_inst_n4454, F1=>dut_mac_inst_n149, 
                Q1=>frame_len_16, F0=>dut_mac_inst_n150, Q0=>frame_len_15);
    dut_mac_inst_SLICE_10I: SCCU2C
      generic map (CLKMUX=>"SIG", CEMUX=>"VHI", LSRMUX=>"SIG", 
                   CCU2_INJECT1_0=>"NO", CCU2_INJECT1_1=>"NO", GSR=>"DISABLED", 
                   INIT0_INITVAL=>X"2222", INIT1_INITVAL=>X"2222", 
                   REG1_SD=>"VHI", REG0_SD=>"VHI", CHECK_DI1=>TRUE, 
                   CHECK_DI0=>TRUE, CHECK_LSR=>TRUE)
      port map (M1=>'X', A1=>frame_len_14, B1=>dut_mac_inst_n1312, C1=>'X', 
                D1=>'1', DI1=>dut_mac_inst_n151, DI0=>dut_mac_inst_n152, 
                A0=>frame_len_13, B0=>dut_mac_inst_n1312, C0=>'X', D0=>'1', 
                FCI=>dut_mac_inst_n4452, M0=>'X', CE=>'X', CLK=>clk_c, 
                LSR=>rst_c, FCO=>dut_mac_inst_n4453, F1=>dut_mac_inst_n151, 
                Q1=>frame_len_14, F0=>dut_mac_inst_n152, Q0=>frame_len_13);
    dut_mac_inst_SLICE_11I: SCCU2C
      generic map (CLKMUX=>"SIG", CEMUX=>"VHI", LSRMUX=>"SIG", 
                   CCU2_INJECT1_0=>"NO", CCU2_INJECT1_1=>"NO", GSR=>"DISABLED", 
                   INIT0_INITVAL=>X"2222", INIT1_INITVAL=>X"2222", 
                   REG1_SD=>"VHI", REG0_SD=>"VHI", CHECK_DI1=>TRUE, 
                   CHECK_DI0=>TRUE, CHECK_LSR=>TRUE)
      port map (M1=>'X', A1=>frame_len_12, B1=>dut_mac_inst_n1312, C1=>'X', 
                D1=>'1', DI1=>dut_mac_inst_n153, DI0=>dut_mac_inst_n154, 
                A0=>frame_len_11, B0=>dut_mac_inst_n1312, C0=>'X', D0=>'1', 
                FCI=>dut_mac_inst_n4451, M0=>'X', CE=>'X', CLK=>clk_c, 
                LSR=>rst_c, FCO=>dut_mac_inst_n4452, F1=>dut_mac_inst_n153, 
                Q1=>frame_len_12, F0=>dut_mac_inst_n154, Q0=>frame_len_11);
    dut_mac_inst_SLICE_12I: SCCU2C
      generic map (CLKMUX=>"SIG", CEMUX=>"VHI", LSRMUX=>"SIG", 
                   CCU2_INJECT1_0=>"NO", CCU2_INJECT1_1=>"NO", GSR=>"DISABLED", 
                   INIT0_INITVAL=>X"2222", INIT1_INITVAL=>X"2222", 
                   REG1_SD=>"VHI", REG0_SD=>"VHI", CHECK_DI1=>TRUE, 
                   CHECK_DI0=>TRUE, CHECK_LSR=>TRUE)
      port map (M1=>'X', A1=>frame_len_10, B1=>dut_mac_inst_n1312, C1=>'X', 
                D1=>'1', DI1=>dut_mac_inst_n155, DI0=>dut_mac_inst_n156, 
                A0=>frame_len_9, B0=>dut_mac_inst_n1312, C0=>'X', D0=>'1', 
                FCI=>dut_mac_inst_n4450, M0=>'X', CE=>'X', CLK=>clk_c, 
                LSR=>rst_c, FCO=>dut_mac_inst_n4451, F1=>dut_mac_inst_n155, 
                Q1=>frame_len_10, F0=>dut_mac_inst_n156, Q0=>frame_len_9);
    dut_mac_inst_SLICE_13I: SCCU2C
      generic map (CLKMUX=>"SIG", CEMUX=>"VHI", LSRMUX=>"SIG", 
                   CCU2_INJECT1_0=>"NO", CCU2_INJECT1_1=>"NO", GSR=>"DISABLED", 
                   INIT0_INITVAL=>X"2222", INIT1_INITVAL=>X"2222", 
                   REG1_SD=>"VHI", REG0_SD=>"VHI", CHECK_DI1=>TRUE, 
                   CHECK_DI0=>TRUE, CHECK_LSR=>TRUE)
      port map (M1=>'X', A1=>frame_len_8, B1=>dut_mac_inst_n1312, C1=>'X', 
                D1=>'1', DI1=>dut_mac_inst_n157, DI0=>dut_mac_inst_n158, 
                A0=>frame_len_7, B0=>dut_mac_inst_n1312, C0=>'X', D0=>'1', 
                FCI=>dut_mac_inst_n4449, M0=>'X', CE=>'X', CLK=>clk_c, 
                LSR=>rst_c, FCO=>dut_mac_inst_n4450, F1=>dut_mac_inst_n157, 
                Q1=>frame_len_8, F0=>dut_mac_inst_n158, Q0=>frame_len_7);
    dut_mac_inst_SLICE_14I: SCCU2C
      generic map (CLKMUX=>"SIG", CEMUX=>"VHI", LSRMUX=>"SIG", 
                   CCU2_INJECT1_0=>"NO", CCU2_INJECT1_1=>"NO", GSR=>"DISABLED", 
                   INIT0_INITVAL=>X"2222", INIT1_INITVAL=>X"2222", 
                   REG1_SD=>"VHI", REG0_SD=>"VHI", CHECK_DI1=>TRUE, 
                   CHECK_DI0=>TRUE, CHECK_LSR=>TRUE)
      port map (M1=>'X', A1=>frame_len_6, B1=>dut_mac_inst_n1312, C1=>'X', 
                D1=>'1', DI1=>dut_mac_inst_n159, DI0=>dut_mac_inst_n160, 
                A0=>frame_len_5, B0=>dut_mac_inst_n1312, C0=>'X', D0=>'1', 
                FCI=>dut_mac_inst_n4448, M0=>'X', CE=>'X', CLK=>clk_c, 
                LSR=>rst_c, FCO=>dut_mac_inst_n4449, F1=>dut_mac_inst_n159, 
                Q1=>frame_len_6, F0=>dut_mac_inst_n160, Q0=>frame_len_5);
    dut_mac_inst_SLICE_15I: SCCU2C
      generic map (CLKMUX=>"SIG", CEMUX=>"VHI", LSRMUX=>"SIG", 
                   CCU2_INJECT1_0=>"NO", CCU2_INJECT1_1=>"NO", GSR=>"DISABLED", 
                   INIT0_INITVAL=>X"2222", INIT1_INITVAL=>X"2222", 
                   REG1_SD=>"VHI", REG0_SD=>"VHI", CHECK_DI1=>TRUE, 
                   CHECK_DI0=>TRUE, CHECK_LSR=>TRUE)
      port map (M1=>'X', A1=>frame_len_4, B1=>dut_mac_inst_n1312, C1=>'X', 
                D1=>'1', DI1=>dut_mac_inst_n161, DI0=>dut_mac_inst_n162, 
                A0=>frame_len_3, B0=>dut_mac_inst_n1312, C0=>'X', D0=>'1', 
                FCI=>dut_mac_inst_n4447, M0=>'X', CE=>'X', CLK=>clk_c, 
                LSR=>rst_c, FCO=>dut_mac_inst_n4448, F1=>dut_mac_inst_n161, 
                Q1=>frame_len_4, F0=>dut_mac_inst_n162, Q0=>frame_len_3);
    dut_mac_inst_SLICE_16I: SCCU2C
      generic map (CLKMUX=>"SIG", CEMUX=>"VHI", LSRMUX=>"SIG", 
                   CCU2_INJECT1_0=>"NO", CCU2_INJECT1_1=>"NO", GSR=>"DISABLED", 
                   INIT0_INITVAL=>X"2222", INIT1_INITVAL=>X"2222", 
                   REG1_SD=>"VHI", REG0_SD=>"VHI", CHECK_DI1=>TRUE, 
                   CHECK_DI0=>TRUE, CHECK_LSR=>TRUE)
      port map (M1=>'X', A1=>frame_len_2, B1=>dut_mac_inst_n1312, C1=>'X', 
                D1=>'1', DI1=>dut_mac_inst_n163, DI0=>dut_mac_inst_n164, 
                A0=>frame_len_1, B0=>dut_mac_inst_n1312, C0=>'X', D0=>'1', 
                FCI=>dut_mac_inst_n4446, M0=>'X', CE=>'X', CLK=>clk_c, 
                LSR=>rst_c, FCO=>dut_mac_inst_n4447, F1=>dut_mac_inst_n163, 
                Q1=>frame_len_2, F0=>dut_mac_inst_n164, Q0=>frame_len_1);
    dut_mac_inst_SLICE_17I: SCCU2C
      generic map (CLKMUX=>"SIG", CEMUX=>"VHI", LSRMUX=>"SIG", 
                   CCU2_INJECT1_0=>"NO", CCU2_INJECT1_1=>"NO", GSR=>"DISABLED", 
                   INIT0_INITVAL=>X"0000", INIT1_INITVAL=>X"8d22", 
                   REG1_SD=>"VHI", CHECK_DI1=>TRUE, CHECK_LSR=>TRUE)
      port map (M1=>'X', A1=>dut_n423, B1=>dut_n6493, C1=>dut_n425, 
                D1=>dut_mac_inst_frame_len_0, DI1=>dut_mac_inst_n165, DI0=>'X', 
                A0=>'X', B0=>'X', C0=>'X', D0=>'1', FCI=>'X', M0=>'X', CE=>'X', 
                CLK=>clk_c, LSR=>rst_c, FCO=>dut_mac_inst_n4446, 
                F1=>dut_mac_inst_n165, Q1=>dut_mac_inst_frame_len_0, F0=>open, 
                Q0=>open);
    SLICE_18I: SCCU2C
      generic map (CLKMUX=>"SIG", CEMUX=>"VHI", LSRMUX=>"SIG", 
                   CCU2_INJECT1_0=>"NO", CCU2_INJECT1_1=>"NO", GSR=>"DISABLED", 
                   INIT0_INITVAL=>X"AA00", INIT1_INITVAL=>X"AA00", 
                   REG1_SD=>"VHI", REG0_SD=>"VHI", CHECK_DI1=>TRUE, 
                   CHECK_DI0=>TRUE, CHECK_LSR=>TRUE)
      port map (M1=>'X', A1=>lenght_cnt_10, B1=>'X', C1=>'X', D1=>'1', 
                DI1=>n155, DI0=>n156, A0=>lenght_cnt_9, B0=>'X', C0=>'X', 
                D0=>'1', FCI=>n4466, M0=>'X', CE=>'X', CLK=>clk_c, LSR=>n2447, 
                FCO=>n4467, F1=>n155, Q1=>lenght_cnt_10, F0=>n156, 
                Q0=>lenght_cnt_9);
    SLICE_19I: SCCU2C
      generic map (CLKMUX=>"SIG", CEMUX=>"VHI", LSRMUX=>"SIG", 
                   CCU2_INJECT1_0=>"NO", CCU2_INJECT1_1=>"NO", GSR=>"DISABLED", 
                   INIT0_INITVAL=>X"AA00", INIT1_INITVAL=>X"AA00", 
                   REG1_SD=>"VHI", REG0_SD=>"VHI", CHECK_DI1=>TRUE, 
                   CHECK_DI0=>TRUE, CHECK_LSR=>TRUE)
      port map (M1=>'X', A1=>lenght_cnt_8, B1=>'X', C1=>'X', D1=>'1', 
                DI1=>n157, DI0=>n158, A0=>lenght_cnt_7, B0=>'X', C0=>'X', 
                D0=>'1', FCI=>n4465, M0=>'X', CE=>'X', CLK=>clk_c, LSR=>n2447, 
                FCO=>n4466, F1=>n157, Q1=>lenght_cnt_8, F0=>n158, 
                Q0=>lenght_cnt_7);
    SLICE_20I: SCCU2C
      generic map (CLKMUX=>"SIG", CEMUX=>"VHI", LSRMUX=>"SIG", 
                   CCU2_INJECT1_0=>"NO", CCU2_INJECT1_1=>"NO", GSR=>"DISABLED", 
                   INIT0_INITVAL=>X"AA00", INIT1_INITVAL=>X"AA00", 
                   REG1_SD=>"VHI", REG0_SD=>"VHI", CHECK_DI1=>TRUE, 
                   CHECK_DI0=>TRUE, CHECK_LSR=>TRUE)
      port map (M1=>'X', A1=>lenght_cnt_6, B1=>'X', C1=>'X', D1=>'1', 
                DI1=>n159, DI0=>n160, A0=>lenght_cnt_5, B0=>'X', C0=>'X', 
                D0=>'1', FCI=>n4464, M0=>'X', CE=>'X', CLK=>clk_c, LSR=>n2447, 
                FCO=>n4465, F1=>n159, Q1=>lenght_cnt_6, F0=>n160, 
                Q0=>lenght_cnt_5);
    SLICE_21I: SCCU2C
      generic map (CLKMUX=>"SIG", CEMUX=>"VHI", LSRMUX=>"SIG", 
                   CCU2_INJECT1_0=>"NO", CCU2_INJECT1_1=>"NO", GSR=>"DISABLED", 
                   INIT0_INITVAL=>X"AA00", INIT1_INITVAL=>X"AA00", 
                   REG1_SD=>"VHI", REG0_SD=>"VHI", CHECK_DI1=>TRUE, 
                   CHECK_DI0=>TRUE, CHECK_LSR=>TRUE)
      port map (M1=>'X', A1=>lenght_cnt_4, B1=>'X', C1=>'X', D1=>'1', 
                DI1=>n161, DI0=>n162, A0=>lenght_cnt_3, B0=>'X', C0=>'X', 
                D0=>'1', FCI=>n4463, M0=>'X', CE=>'X', CLK=>clk_c, LSR=>n2447, 
                FCO=>n4464, F1=>n161, Q1=>lenght_cnt_4, F0=>n162, 
                Q0=>lenght_cnt_3);
    SLICE_22I: SCCU2C
      generic map (CLKMUX=>"SIG", CEMUX=>"VHI", LSRMUX=>"SIG", 
                   CCU2_INJECT1_0=>"NO", CCU2_INJECT1_1=>"NO", GSR=>"DISABLED", 
                   INIT0_INITVAL=>X"AA00", INIT1_INITVAL=>X"AA00", 
                   REG1_SD=>"VHI", REG0_SD=>"VHI", CHECK_DI1=>TRUE, 
                   CHECK_DI0=>TRUE, CHECK_LSR=>TRUE)
      port map (M1=>'X', A1=>lenght_cnt_2, B1=>'X', C1=>'X', D1=>'1', 
                DI1=>n163, DI0=>n164, A0=>lenght_cnt_1, B0=>'X', C0=>'X', 
                D0=>'1', FCI=>n4462, M0=>'X', CE=>'X', CLK=>clk_c, LSR=>n2447, 
                FCO=>n4463, F1=>n163, Q1=>lenght_cnt_2, F0=>n164, 
                Q0=>lenght_cnt_1);
    SLICE_23I: SCCU2C
      generic map (CLKMUX=>"SIG", CEMUX=>"VHI", LSRMUX=>"SIG", 
                   CCU2_INJECT1_0=>"NO", CCU2_INJECT1_1=>"NO", GSR=>"DISABLED", 
                   INIT0_INITVAL=>X"0000", INIT1_INITVAL=>X"55FF", 
                   REG1_SD=>"VHI", CHECK_DI1=>TRUE, CHECK_LSR=>TRUE)
      port map (M1=>'X', A1=>lenght_cnt_0, B1=>'X', C1=>'X', D1=>'1', 
                DI1=>n165, DI0=>'X', A0=>'X', B0=>'X', C0=>'X', D0=>'X', 
                FCI=>'X', M0=>'X', CE=>'X', CLK=>clk_c, LSR=>n2447, FCO=>n4462, 
                F1=>n165, Q1=>lenght_cnt_0, F0=>open, Q0=>open);
    SLICE_24I: SCCU2C
      generic map (CCU2_INJECT1_0=>"NO", CCU2_INJECT1_1=>"NO", 
                   INIT0_INITVAL=>X"00AA", INIT1_INITVAL=>X"55FF")
      port map (M1=>'X', A1=>frame_len_2, B1=>'X', C1=>'X', D1=>'1', DI1=>'X', 
                DI0=>'X', A0=>frame_len_1, B0=>'X', C0=>'X', D0=>'1', FCI=>'X', 
                M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', FCO=>n4431, F1=>open, 
                Q1=>open, F0=>open, Q0=>open);
    SLICE_25I: SCCU2C
      generic map (CCU2_INJECT1_0=>"NO", CCU2_INJECT1_1=>"NO", 
                   INIT0_INITVAL=>X"55FF", INIT1_INITVAL=>X"55FF")
      port map (M1=>'X', A1=>frame_len_18, B1=>'X', C1=>'X', D1=>'1', DI1=>'X', 
                DI0=>'X', A0=>frame_len_17, B0=>'X', C0=>'X', D0=>'1', 
                FCI=>n4438, M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', FCO=>n4439, 
                F1=>open, Q1=>open, F0=>open, Q0=>open);
    SLICE_26I: SCCU2C
      generic map (CCU2_INJECT1_0=>"NO", CCU2_INJECT1_1=>"NO", 
                   INIT0_INITVAL=>X"AA00", INIT1_INITVAL=>X"AA00")
      port map (M1=>'X', A1=>frame_len_4, B1=>'X', C1=>'X', D1=>'1', DI1=>'X', 
                DI0=>'X', A0=>frame_len_3, B0=>'X', C0=>'X', D0=>'1', 
                FCI=>n4431, M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', FCO=>n4432, 
                F1=>open, Q1=>open, F0=>open, Q0=>open);
    SLICE_27I: SCCU2C
      generic map (CCU2_INJECT1_0=>"NO", CCU2_INJECT1_1=>"NO", 
                   INIT0_INITVAL=>X"55FF", INIT1_INITVAL=>X"55FF")
      port map (M1=>'X', A1=>frame_len_16, B1=>'X', C1=>'X', D1=>'1', DI1=>'X', 
                DI0=>'X', A0=>frame_len_15, B0=>'X', C0=>'X', D0=>'1', 
                FCI=>n4437, M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', FCO=>n4438, 
                F1=>open, Q1=>open, F0=>open, Q0=>open);
    SLICE_28I: SCCU2C
      generic map (CCU2_INJECT1_0=>"NO", CCU2_INJECT1_1=>"NO", 
                   INIT0_INITVAL=>X"55FF", INIT1_INITVAL=>X"55FF")
      port map (M1=>'X', A1=>frame_len_14, B1=>'X', C1=>'X', D1=>'1', DI1=>'X', 
                DI0=>'X', A0=>frame_len_13, B0=>'X', C0=>'X', D0=>'1', 
                FCI=>n4436, M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', FCO=>n4437, 
                F1=>open, Q1=>open, F0=>open, Q0=>open);
    SLICE_29I: SCCU2C
      generic map (CCU2_INJECT1_0=>"NO", CCU2_INJECT1_1=>"NO", 
                   INIT0_INITVAL=>X"55FF", INIT1_INITVAL=>X"55FF")
      port map (M1=>'X', A1=>frame_len_12, B1=>'X', C1=>'X', D1=>'1', DI1=>'X', 
                DI0=>'X', A0=>frame_len_11, B0=>'X', C0=>'X', D0=>'1', 
                FCI=>n4435, M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', FCO=>n4436, 
                F1=>open, Q1=>open, F0=>open, Q0=>open);
    SLICE_30I: SCCU2C
      generic map (CLKMUX=>"SIG", CEMUX=>"VHI", LSRMUX=>"SIG", 
                   CCU2_INJECT1_0=>"NO", CCU2_INJECT1_1=>"NO", GSR=>"DISABLED", 
                   INIT0_INITVAL=>X"0000", INIT1_INITVAL=>X"0000", 
                   REG0_SD=>"VHI", CHECK_DI0=>TRUE, CHECK_LSR=>TRUE)
      port map (M1=>'X', A1=>'X', B1=>'X', C1=>'X', D1=>'X', DI1=>'X', 
                DI0=>next_fifo_almostfull, A0=>'X', B0=>'X', C0=>'X', D0=>'X', 
                FCI=>n4493, M0=>'X', CE=>'X', CLK=>clk_c, LSR=>rst_c, 
                FCO=>open, F1=>open, Q1=>open, F0=>next_fifo_almostfull, 
                Q0=>fifo_almostfull);
    SLICE_31I: SCCU2C
      generic map (CCU2_INJECT1_0=>"NO", CCU2_INJECT1_1=>"NO", 
                   INIT0_INITVAL=>X"5555", INIT1_INITVAL=>X"55FF")
      port map (M1=>'X', A1=>lenght_cnt_31, B1=>'X', C1=>'X', D1=>'1', 
                DI1=>'X', DI0=>'X', A0=>lenght_cnt_30, B0=>'X', C0=>'X', 
                D0=>'1', FCI=>n4492, M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', 
                FCO=>n4493, F1=>open, Q1=>open, F0=>open, Q0=>open);
    SLICE_32I: SCCU2C
      generic map (CCU2_INJECT1_0=>"NO", CCU2_INJECT1_1=>"NO", 
                   INIT0_INITVAL=>X"5555", INIT1_INITVAL=>X"5555")
      port map (M1=>'X', A1=>lenght_cnt_29, B1=>'X', C1=>'X', D1=>'1', 
                DI1=>'X', DI0=>'X', A0=>lenght_cnt_28, B0=>'X', C0=>'X', 
                D0=>'1', FCI=>n4491, M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', 
                FCO=>n4492, F1=>open, Q1=>open, F0=>open, Q0=>open);
    SLICE_33I: SCCU2C
      generic map (CCU2_INJECT1_0=>"NO", CCU2_INJECT1_1=>"NO", 
                   INIT0_INITVAL=>X"5555", INIT1_INITVAL=>X"5555")
      port map (M1=>'X', A1=>lenght_cnt_27, B1=>'X', C1=>'X', D1=>'1', 
                DI1=>'X', DI0=>'X', A0=>lenght_cnt_26, B0=>'X', C0=>'X', 
                D0=>'1', FCI=>n4490, M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', 
                FCO=>n4491, F1=>open, Q1=>open, F0=>open, Q0=>open);
    SLICE_34I: SCCU2C
      generic map (CCU2_INJECT1_0=>"NO", CCU2_INJECT1_1=>"NO", 
                   INIT0_INITVAL=>X"55FF", INIT1_INITVAL=>X"55FF")
      port map (M1=>'X', A1=>frame_len_10, B1=>'X', C1=>'X', D1=>'1', DI1=>'X', 
                DI0=>'X', A0=>frame_len_9, B0=>'X', C0=>'X', D0=>'1', 
                FCI=>n4434, M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', FCO=>n4435, 
                F1=>open, Q1=>open, F0=>open, Q0=>open);
    SLICE_35I: SCCU2C
      generic map (CCU2_INJECT1_0=>"NO", CCU2_INJECT1_1=>"NO", 
                   INIT0_INITVAL=>X"5555", INIT1_INITVAL=>X"5555")
      port map (M1=>'X', A1=>lenght_cnt_25, B1=>'X', C1=>'X', D1=>'1', 
                DI1=>'X', DI0=>'X', A0=>lenght_cnt_24, B0=>'X', C0=>'X', 
                D0=>'1', FCI=>n4489, M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', 
                FCO=>n4490, F1=>open, Q1=>open, F0=>open, Q0=>open);
    SLICE_36I: SCCU2C
      generic map (CCU2_INJECT1_0=>"NO", CCU2_INJECT1_1=>"NO", 
                   INIT0_INITVAL=>X"55FF", INIT1_INITVAL=>X"55FF")
      port map (M1=>'X', A1=>frame_len_8, B1=>'X', C1=>'X', D1=>'1', DI1=>'X', 
                DI0=>'X', A0=>frame_len_7, B0=>'X', C0=>'X', D0=>'1', 
                FCI=>n4433, M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', FCO=>n4434, 
                F1=>open, Q1=>open, F0=>open, Q0=>open);
    SLICE_37I: SCCU2C
      generic map (CCU2_INJECT1_0=>"NO", CCU2_INJECT1_1=>"NO", 
                   INIT0_INITVAL=>X"5555", INIT1_INITVAL=>X"5555")
      port map (M1=>'X', A1=>lenght_cnt_23, B1=>'X', C1=>'X', D1=>'1', 
                DI1=>'X', DI0=>'X', A0=>lenght_cnt_22, B0=>'X', C0=>'X', 
                D0=>'1', FCI=>n4488, M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', 
                FCO=>n4489, F1=>open, Q1=>open, F0=>open, Q0=>open);
    SLICE_38I: SCCU2C
      generic map (CCU2_INJECT1_0=>"NO", CCU2_INJECT1_1=>"NO", 
                   INIT0_INITVAL=>X"5555", INIT1_INITVAL=>X"5555")
      port map (M1=>'X', A1=>lenght_cnt_21, B1=>'X', C1=>'X', D1=>'1', 
                DI1=>'X', DI0=>'X', A0=>lenght_cnt_20, B0=>'X', C0=>'X', 
                D0=>'1', FCI=>n4487, M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', 
                FCO=>n4488, F1=>open, Q1=>open, F0=>open, Q0=>open);
    SLICE_39I: SCCU2C
      generic map (CCU2_INJECT1_0=>"NO", CCU2_INJECT1_1=>"NO", 
                   INIT0_INITVAL=>X"5555", INIT1_INITVAL=>X"5555")
      port map (M1=>'X', A1=>lenght_cnt_19, B1=>'X', C1=>'X', D1=>'1', 
                DI1=>'X', DI0=>'X', A0=>lenght_cnt_18, B0=>'X', C0=>'X', 
                D0=>'1', FCI=>n4486, M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', 
                FCO=>n4487, F1=>open, Q1=>open, F0=>open, Q0=>open);
    SLICE_40I: SCCU2C
      generic map (CCU2_INJECT1_0=>"NO", CCU2_INJECT1_1=>"NO", 
                   INIT0_INITVAL=>X"5555", INIT1_INITVAL=>X"5555")
      port map (M1=>'X', A1=>lenght_cnt_17, B1=>'X', C1=>'X', D1=>'1', 
                DI1=>'X', DI0=>'X', A0=>lenght_cnt_16, B0=>'X', C0=>'X', 
                D0=>'1', FCI=>n4485, M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', 
                FCO=>n4486, F1=>open, Q1=>open, F0=>open, Q0=>open);
    SLICE_41I: SCCU2C
      generic map (CCU2_INJECT1_0=>"NO", CCU2_INJECT1_1=>"NO", 
                   INIT0_INITVAL=>X"AA00", INIT1_INITVAL=>X"55FF")
      port map (M1=>'X', A1=>frame_len_6, B1=>'X', C1=>'X', D1=>'1', DI1=>'X', 
                DI0=>'X', A0=>frame_len_5, B0=>'X', C0=>'X', D0=>'1', 
                FCI=>n4432, M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', FCO=>n4433, 
                F1=>open, Q1=>open, F0=>open, Q0=>open);
    SLICE_42I: SCCU2C
      generic map (CCU2_INJECT1_0=>"NO", CCU2_INJECT1_1=>"NO", 
                   INIT0_INITVAL=>X"5555", INIT1_INITVAL=>X"5555")
      port map (M1=>'X', A1=>lenght_cnt_15, B1=>'X', C1=>'X', D1=>'1', 
                DI1=>'X', DI0=>'X', A0=>lenght_cnt_14, B0=>'X', C0=>'X', 
                D0=>'1', FCI=>n4484, M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', 
                FCO=>n4485, F1=>open, Q1=>open, F0=>open, Q0=>open);
    SLICE_43I: SCCU2C
      generic map (CCU2_INJECT1_0=>"NO", CCU2_INJECT1_1=>"NO", 
                   INIT0_INITVAL=>X"5555", INIT1_INITVAL=>X"5555")
      port map (M1=>'X', A1=>lenght_cnt_13, B1=>'X', C1=>'X', D1=>'1', 
                DI1=>'X', DI0=>'X', A0=>lenght_cnt_12, B0=>'X', C0=>'X', 
                D0=>'1', FCI=>n4483, M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', 
                FCO=>n4484, F1=>open, Q1=>open, F0=>open, Q0=>open);
    SLICE_44I: SCCU2C
      generic map (CCU2_INJECT1_0=>"NO", CCU2_INJECT1_1=>"NO", 
                   INIT0_INITVAL=>X"5555", INIT1_INITVAL=>X"5555")
      port map (M1=>'X', A1=>lenght_cnt_11, B1=>'X', C1=>'X', D1=>'1', 
                DI1=>'X', DI0=>'X', A0=>lenght_cnt_10, B0=>'X', C0=>'X', 
                D0=>'1', FCI=>n4482, M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', 
                FCO=>n4483, F1=>open, Q1=>open, F0=>open, Q0=>open);
    SLICE_45I: SCCU2C
      generic map (CCU2_INJECT1_0=>"NO", CCU2_INJECT1_1=>"NO", 
                   INIT0_INITVAL=>X"5555", INIT1_INITVAL=>X"5555")
      port map (M1=>'X', A1=>lenght_cnt_9, B1=>'X', C1=>'X', D1=>'1', DI1=>'X', 
                DI0=>'X', A0=>lenght_cnt_8, B0=>'X', C0=>'X', D0=>'1', 
                FCI=>n4481, M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', FCO=>n4482, 
                F1=>open, Q1=>open, F0=>open, Q0=>open);
    SLICE_46I: SCCU2C
      generic map (CCU2_INJECT1_0=>"NO", CCU2_INJECT1_1=>"NO", 
                   INIT0_INITVAL=>X"AA55", INIT1_INITVAL=>X"5555")
      port map (M1=>'X', A1=>lenght_cnt_7, B1=>'X', C1=>'X', D1=>'1', DI1=>'X', 
                DI0=>'X', A0=>lenght_cnt_6, B0=>'X', C0=>'X', D0=>'1', 
                FCI=>n4480, M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', FCO=>n4481, 
                F1=>open, Q1=>open, F0=>open, Q0=>open);
    SLICE_47I: SCCU2C
      generic map (CCU2_INJECT1_0=>"NO", CCU2_INJECT1_1=>"NO", 
                   INIT0_INITVAL=>X"AA55", INIT1_INITVAL=>X"5555")
      port map (M1=>'X', A1=>lenght_cnt_5, B1=>'X', C1=>'X', D1=>'1', DI1=>'X', 
                DI0=>'X', A0=>lenght_cnt_4, B0=>'X', C0=>'X', D0=>'1', 
                FCI=>n4479, M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', FCO=>n4480, 
                F1=>open, Q1=>open, F0=>open, Q0=>open);
    SLICE_48I: SCCU2C
      generic map (CCU2_INJECT1_0=>"NO", CCU2_INJECT1_1=>"NO", 
                   INIT0_INITVAL=>X"5555", INIT1_INITVAL=>X"5555")
      port map (M1=>'X', A1=>lenght_cnt_3, B1=>'X', C1=>'X', D1=>'1', DI1=>'X', 
                DI0=>'X', A0=>lenght_cnt_2, B0=>'X', C0=>'X', D0=>'1', 
                FCI=>n4478, M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', FCO=>n4479, 
                F1=>open, Q1=>open, F0=>open, Q0=>open);
    SLICE_49I: SCCU2C
      generic map (CCU2_INJECT1_0=>"NO", CCU2_INJECT1_1=>"NO", 
                   INIT0_INITVAL=>X"0000", INIT1_INITVAL=>X"6655")
      port map (M1=>'X', A1=>lenght_cnt_1, B1=>lenght_cnt_0, C1=>'X', D1=>'1', 
                DI1=>'X', DI0=>'X', A0=>'X', B0=>'X', C0=>'X', D0=>'1', 
                FCI=>'X', M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', FCO=>n4478, 
                F1=>open, Q1=>open, F0=>open, Q0=>open);
    SLICE_50I: SCCU2C
      generic map (CLKMUX=>"SIG", CEMUX=>"VHI", LSRMUX=>"SIG", 
                   CCU2_INJECT1_0=>"NO", CCU2_INJECT1_1=>"NO", GSR=>"DISABLED", 
                   INIT0_INITVAL=>X"AA00", INIT1_INITVAL=>X"0000", 
                   REG0_SD=>"VHI", CHECK_DI0=>TRUE, CHECK_LSR=>TRUE)
      port map (M1=>'X', A1=>'X', B1=>'X', C1=>'X', D1=>'X', DI1=>'X', 
                DI0=>n134, A0=>lenght_cnt_31, B0=>'X', C0=>'X', D0=>'1', 
                FCI=>n4477, M0=>'X', CE=>'X', CLK=>clk_c, LSR=>n2447, 
                FCO=>open, F1=>open, Q1=>open, F0=>n134, Q0=>lenght_cnt_31);
    SLICE_51I: SCCU2C
      generic map (CLKMUX=>"SIG", CEMUX=>"VHI", LSRMUX=>"SIG", 
                   CCU2_INJECT1_0=>"NO", CCU2_INJECT1_1=>"NO", GSR=>"DISABLED", 
                   INIT0_INITVAL=>X"AA00", INIT1_INITVAL=>X"AA00", 
                   REG1_SD=>"VHI", REG0_SD=>"VHI", CHECK_DI1=>TRUE, 
                   CHECK_DI0=>TRUE, CHECK_LSR=>TRUE)
      port map (M1=>'X', A1=>lenght_cnt_30, B1=>'X', C1=>'X', D1=>'1', 
                DI1=>n135, DI0=>n136, A0=>lenght_cnt_29, B0=>'X', C0=>'X', 
                D0=>'1', FCI=>n4476, M0=>'X', CE=>'X', CLK=>clk_c, LSR=>n2447, 
                FCO=>n4477, F1=>n135, Q1=>lenght_cnt_30, F0=>n136, 
                Q0=>lenght_cnt_29);
    SLICE_52I: SCCU2C
      generic map (CLKMUX=>"SIG", CEMUX=>"VHI", LSRMUX=>"SIG", 
                   CCU2_INJECT1_0=>"NO", CCU2_INJECT1_1=>"NO", GSR=>"DISABLED", 
                   INIT0_INITVAL=>X"AA00", INIT1_INITVAL=>X"AA00", 
                   REG1_SD=>"VHI", REG0_SD=>"VHI", CHECK_DI1=>TRUE, 
                   CHECK_DI0=>TRUE, CHECK_LSR=>TRUE)
      port map (M1=>'X', A1=>lenght_cnt_28, B1=>'X', C1=>'X', D1=>'1', 
                DI1=>n137, DI0=>n138, A0=>lenght_cnt_27, B0=>'X', C0=>'X', 
                D0=>'1', FCI=>n4475, M0=>'X', CE=>'X', CLK=>clk_c, LSR=>n2447, 
                FCO=>n4476, F1=>n137, Q1=>lenght_cnt_28, F0=>n138, 
                Q0=>lenght_cnt_27);
    SLICE_53I: SCCU2C
      generic map (CCU2_INJECT1_0=>"NO", CCU2_INJECT1_1=>"NO", 
                   INIT0_INITVAL=>X"5555", INIT1_INITVAL=>X"0000")
      port map (M1=>'X', A1=>'X', B1=>'X', C1=>'X', D1=>'X', DI1=>'X', 
                DI0=>'X', A0=>frame_len_31, B0=>'X', C0=>'X', D0=>'1', 
                FCI=>n4445, M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', FCO=>open, 
                F1=>n399, Q1=>open, F0=>open, Q0=>open);
    SLICE_54I: SCCU2C
      generic map (CLKMUX=>"SIG", CEMUX=>"VHI", LSRMUX=>"SIG", 
                   CCU2_INJECT1_0=>"NO", CCU2_INJECT1_1=>"NO", GSR=>"DISABLED", 
                   INIT0_INITVAL=>X"AA00", INIT1_INITVAL=>X"AA00", 
                   REG1_SD=>"VHI", REG0_SD=>"VHI", CHECK_DI1=>TRUE, 
                   CHECK_DI0=>TRUE, CHECK_LSR=>TRUE)
      port map (M1=>'X', A1=>lenght_cnt_26, B1=>'X', C1=>'X', D1=>'1', 
                DI1=>n139, DI0=>n140, A0=>lenght_cnt_25, B0=>'X', C0=>'X', 
                D0=>'1', FCI=>n4474, M0=>'X', CE=>'X', CLK=>clk_c, LSR=>n2447, 
                FCO=>n4475, F1=>n139, Q1=>lenght_cnt_26, F0=>n140, 
                Q0=>lenght_cnt_25);
    SLICE_55I: SCCU2C
      generic map (CLKMUX=>"SIG", CEMUX=>"VHI", LSRMUX=>"SIG", 
                   CCU2_INJECT1_0=>"NO", CCU2_INJECT1_1=>"NO", GSR=>"DISABLED", 
                   INIT0_INITVAL=>X"AA00", INIT1_INITVAL=>X"AA00", 
                   REG1_SD=>"VHI", REG0_SD=>"VHI", CHECK_DI1=>TRUE, 
                   CHECK_DI0=>TRUE, CHECK_LSR=>TRUE)
      port map (M1=>'X', A1=>lenght_cnt_24, B1=>'X', C1=>'X', D1=>'1', 
                DI1=>n141, DI0=>n142, A0=>lenght_cnt_23, B0=>'X', C0=>'X', 
                D0=>'1', FCI=>n4473, M0=>'X', CE=>'X', CLK=>clk_c, LSR=>n2447, 
                FCO=>n4474, F1=>n141, Q1=>lenght_cnt_24, F0=>n142, 
                Q0=>lenght_cnt_23);
    SLICE_56I: SCCU2C
      generic map (CLKMUX=>"SIG", CEMUX=>"VHI", LSRMUX=>"SIG", 
                   CCU2_INJECT1_0=>"NO", CCU2_INJECT1_1=>"NO", GSR=>"DISABLED", 
                   INIT0_INITVAL=>X"AA00", INIT1_INITVAL=>X"AA00", 
                   REG1_SD=>"VHI", REG0_SD=>"VHI", CHECK_DI1=>TRUE, 
                   CHECK_DI0=>TRUE, CHECK_LSR=>TRUE)
      port map (M1=>'X', A1=>lenght_cnt_22, B1=>'X', C1=>'X', D1=>'1', 
                DI1=>n143, DI0=>n144, A0=>lenght_cnt_21, B0=>'X', C0=>'X', 
                D0=>'1', FCI=>n4472, M0=>'X', CE=>'X', CLK=>clk_c, LSR=>n2447, 
                FCO=>n4473, F1=>n143, Q1=>lenght_cnt_22, F0=>n144, 
                Q0=>lenght_cnt_21);
    SLICE_57I: SCCU2C
      generic map (CCU2_INJECT1_0=>"NO", CCU2_INJECT1_1=>"NO", 
                   INIT0_INITVAL=>X"55FF", INIT1_INITVAL=>X"55FF")
      port map (M1=>'X', A1=>frame_len_30, B1=>'X', C1=>'X', D1=>'1', DI1=>'X', 
                DI0=>'X', A0=>frame_len_29, B0=>'X', C0=>'X', D0=>'1', 
                FCI=>n4444, M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', FCO=>n4445, 
                F1=>open, Q1=>open, F0=>open, Q0=>open);
    SLICE_58I: SCCU2C
      generic map (CCU2_INJECT1_0=>"NO", CCU2_INJECT1_1=>"NO", 
                   INIT0_INITVAL=>X"55FF", INIT1_INITVAL=>X"55FF")
      port map (M1=>'X', A1=>frame_len_28, B1=>'X', C1=>'X', D1=>'1', DI1=>'X', 
                DI0=>'X', A0=>frame_len_27, B0=>'X', C0=>'X', D0=>'1', 
                FCI=>n4443, M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', FCO=>n4444, 
                F1=>open, Q1=>open, F0=>open, Q0=>open);
    SLICE_59I: SCCU2C
      generic map (CLKMUX=>"SIG", CEMUX=>"VHI", LSRMUX=>"SIG", 
                   CCU2_INJECT1_0=>"NO", CCU2_INJECT1_1=>"NO", GSR=>"DISABLED", 
                   INIT0_INITVAL=>X"AA00", INIT1_INITVAL=>X"AA00", 
                   REG1_SD=>"VHI", REG0_SD=>"VHI", CHECK_DI1=>TRUE, 
                   CHECK_DI0=>TRUE, CHECK_LSR=>TRUE)
      port map (M1=>'X', A1=>lenght_cnt_20, B1=>'X', C1=>'X', D1=>'1', 
                DI1=>n145, DI0=>n146, A0=>lenght_cnt_19, B0=>'X', C0=>'X', 
                D0=>'1', FCI=>n4471, M0=>'X', CE=>'X', CLK=>clk_c, LSR=>n2447, 
                FCO=>n4472, F1=>n145, Q1=>lenght_cnt_20, F0=>n146, 
                Q0=>lenght_cnt_19);
    SLICE_60I: SCCU2C
      generic map (CCU2_INJECT1_0=>"NO", CCU2_INJECT1_1=>"NO", 
                   INIT0_INITVAL=>X"55FF", INIT1_INITVAL=>X"55FF")
      port map (M1=>'X', A1=>frame_len_26, B1=>'X', C1=>'X', D1=>'1', DI1=>'X', 
                DI0=>'X', A0=>frame_len_25, B0=>'X', C0=>'X', D0=>'1', 
                FCI=>n4442, M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', FCO=>n4443, 
                F1=>open, Q1=>open, F0=>open, Q0=>open);
    SLICE_61I: SCCU2C
      generic map (CCU2_INJECT1_0=>"NO", CCU2_INJECT1_1=>"NO", 
                   INIT0_INITVAL=>X"55FF", INIT1_INITVAL=>X"55FF")
      port map (M1=>'X', A1=>frame_len_24, B1=>'X', C1=>'X', D1=>'1', DI1=>'X', 
                DI0=>'X', A0=>frame_len_23, B0=>'X', C0=>'X', D0=>'1', 
                FCI=>n4441, M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', FCO=>n4442, 
                F1=>open, Q1=>open, F0=>open, Q0=>open);
    SLICE_62I: SCCU2C
      generic map (CLKMUX=>"SIG", CEMUX=>"VHI", LSRMUX=>"SIG", 
                   CCU2_INJECT1_0=>"NO", CCU2_INJECT1_1=>"NO", GSR=>"DISABLED", 
                   INIT0_INITVAL=>X"AA00", INIT1_INITVAL=>X"AA00", 
                   REG1_SD=>"VHI", REG0_SD=>"VHI", CHECK_DI1=>TRUE, 
                   CHECK_DI0=>TRUE, CHECK_LSR=>TRUE)
      port map (M1=>'X', A1=>lenght_cnt_18, B1=>'X', C1=>'X', D1=>'1', 
                DI1=>n147, DI0=>n148, A0=>lenght_cnt_17, B0=>'X', C0=>'X', 
                D0=>'1', FCI=>n4470, M0=>'X', CE=>'X', CLK=>clk_c, LSR=>n2447, 
                FCO=>n4471, F1=>n147, Q1=>lenght_cnt_18, F0=>n148, 
                Q0=>lenght_cnt_17);
    SLICE_63I: SCCU2C
      generic map (CLKMUX=>"SIG", CEMUX=>"VHI", LSRMUX=>"SIG", 
                   CCU2_INJECT1_0=>"NO", CCU2_INJECT1_1=>"NO", GSR=>"DISABLED", 
                   INIT0_INITVAL=>X"AA00", INIT1_INITVAL=>X"AA00", 
                   REG1_SD=>"VHI", REG0_SD=>"VHI", CHECK_DI1=>TRUE, 
                   CHECK_DI0=>TRUE, CHECK_LSR=>TRUE)
      port map (M1=>'X', A1=>lenght_cnt_16, B1=>'X', C1=>'X', D1=>'1', 
                DI1=>n149, DI0=>n150, A0=>lenght_cnt_15, B0=>'X', C0=>'X', 
                D0=>'1', FCI=>n4469, M0=>'X', CE=>'X', CLK=>clk_c, LSR=>n2447, 
                FCO=>n4470, F1=>n149, Q1=>lenght_cnt_16, F0=>n150, 
                Q0=>lenght_cnt_15);
    SLICE_64I: SCCU2C
      generic map (CCU2_INJECT1_0=>"NO", CCU2_INJECT1_1=>"NO", 
                   INIT0_INITVAL=>X"55FF", INIT1_INITVAL=>X"55FF")
      port map (M1=>'X', A1=>frame_len_22, B1=>'X', C1=>'X', D1=>'1', DI1=>'X', 
                DI0=>'X', A0=>frame_len_21, B0=>'X', C0=>'X', D0=>'1', 
                FCI=>n4440, M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', FCO=>n4441, 
                F1=>open, Q1=>open, F0=>open, Q0=>open);
    SLICE_65I: SCCU2C
      generic map (CLKMUX=>"SIG", CEMUX=>"VHI", LSRMUX=>"SIG", 
                   CCU2_INJECT1_0=>"NO", CCU2_INJECT1_1=>"NO", GSR=>"DISABLED", 
                   INIT0_INITVAL=>X"AA00", INIT1_INITVAL=>X"AA00", 
                   REG1_SD=>"VHI", REG0_SD=>"VHI", CHECK_DI1=>TRUE, 
                   CHECK_DI0=>TRUE, CHECK_LSR=>TRUE)
      port map (M1=>'X', A1=>lenght_cnt_14, B1=>'X', C1=>'X', D1=>'1', 
                DI1=>n151, DI0=>n152, A0=>lenght_cnt_13, B0=>'X', C0=>'X', 
                D0=>'1', FCI=>n4468, M0=>'X', CE=>'X', CLK=>clk_c, LSR=>n2447, 
                FCO=>n4469, F1=>n151, Q1=>lenght_cnt_14, F0=>n152, 
                Q0=>lenght_cnt_13);
    SLICE_66I: SCCU2C
      generic map (CCU2_INJECT1_0=>"NO", CCU2_INJECT1_1=>"NO", 
                   INIT0_INITVAL=>X"55FF", INIT1_INITVAL=>X"55FF")
      port map (M1=>'X', A1=>frame_len_20, B1=>'X', C1=>'X', D1=>'1', DI1=>'X', 
                DI0=>'X', A0=>frame_len_19, B0=>'X', C0=>'X', D0=>'1', 
                FCI=>n4439, M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', FCO=>n4440, 
                F1=>open, Q1=>open, F0=>open, Q0=>open);
    SLICE_67I: SLOGICB
      generic map (CLKMUX=>"SIG", CEMUX=>"VHI", LSRMUX=>"SIG", GSR=>"DISABLED", 
                   LUT0_INITVAL=>X"1E1E", LUT1_INITVAL=>X"8888", 
                   REG0_SD=>"VHI", CHECK_DI0=>TRUE, CHECK_LSR=>TRUE)
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>cnt_1, B1=>cnt_0, C1=>'X', 
                D1=>'X', DI1=>'X', DI0=>n23, A0=>next_fifo_almostfull, 
                B0=>rst_c, C0=>cnt_0, D0=>'X', M0=>'X', CE=>'X', CLK=>clk_c, 
                LSR=>rst_c, OFX1=>open, F1=>n6504, Q1=>open, OFX0=>open, 
                F0=>n23, Q0=>cnt_0);
    SLICE_68I: SLOGICB
      generic map (CLKMUX=>"SIG", CEMUX=>"SIG", LSRMUX=>"SIG", GSR=>"DISABLED", 
                   LUT0_INITVAL=>X"6666", LUT1_INITVAL=>X"7878", 
                   REG1_SD=>"VHI", REG0_SD=>"VHI", CHECK_DI1=>TRUE, 
                   CHECK_DI0=>TRUE, CHECK_CE=>TRUE, CHECK_LSR=>TRUE)
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>cnt_1, B1=>cnt_0, C1=>cnt_2, 
                D1=>'X', DI1=>next_cnt_7_N_9_2, DI0=>next_cnt_7_N_9_1, 
                A0=>cnt_1, B0=>cnt_0, C0=>'X', D0=>'X', M0=>'X', 
                CE=>clk_c_enable_16, CLK=>clk_c, LSR=>rst_c, OFX1=>open, 
                F1=>next_cnt_7_N_9_2, Q1=>cnt_2, OFX0=>open, 
                F0=>next_cnt_7_N_9_1, Q0=>cnt_1);
    SLICE_69I: SLOGICB
      generic map (CLKMUX=>"SIG", CEMUX=>"SIG", LSRMUX=>"SIG", GSR=>"DISABLED", 
                   LUT0_INITVAL=>X"78F0", LUT1_INITVAL=>X"78F0", 
                   REG1_SD=>"VHI", REG0_SD=>"VHI", CHECK_DI1=>TRUE, 
                   CHECK_DI0=>TRUE, CHECK_CE=>TRUE, CHECK_LSR=>TRUE)
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>cnt_2, B1=>n6504, C1=>cnt_4, 
                D1=>cnt_3, DI1=>next_cnt_7_N_9_4, DI0=>next_cnt_7_N_9_3, 
                A0=>cnt_1, B0=>cnt_0, C0=>cnt_3, D0=>cnt_2, M0=>'X', 
                CE=>clk_c_enable_16, CLK=>clk_c, LSR=>rst_c, OFX1=>open, 
                F1=>next_cnt_7_N_9_4, Q1=>cnt_4, OFX0=>open, 
                F0=>next_cnt_7_N_9_3, Q0=>cnt_3);
    SLICE_70I: SLOGICB
      generic map (CLKMUX=>"SIG", CEMUX=>"SIG", LSRMUX=>"SIG", GSR=>"DISABLED", 
                   LUT0_INITVAL=>X"78F0", LUT1_INITVAL=>X"78F0", 
                   REG1_SD=>"VHI", REG0_SD=>"VHI", CHECK_DI1=>TRUE, 
                   CHECK_DI0=>TRUE, CHECK_CE=>TRUE, CHECK_LSR=>TRUE)
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>cnt_4, B1=>n6475, C1=>cnt_6, 
                D1=>cnt_5, DI1=>next_cnt_7_N_9_6, DI0=>next_cnt_7_N_9_5, 
                A0=>cnt_3, B0=>n6482, C0=>cnt_5, D0=>cnt_4, M0=>'X', 
                CE=>clk_c_enable_16, CLK=>clk_c, LSR=>rst_c, OFX1=>open, 
                F1=>next_cnt_7_N_9_6, Q1=>cnt_6, OFX0=>open, 
                F0=>next_cnt_7_N_9_5, Q0=>cnt_5);
    SLICE_71I: SLOGICB
      generic map (CLKMUX=>"SIG", CEMUX=>"SIG", LSRMUX=>"SIG", GSR=>"DISABLED", 
                   LUT0_INITVAL=>X"7F80", LUT1_INITVAL=>X"8000", 
                   REG0_SD=>"VHI", CHECK_DI0=>TRUE, CHECK_CE=>TRUE, 
                   CHECK_LSR=>TRUE)
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>cnt_2, B1=>n6504, C1=>cnt_4, 
                D1=>cnt_3, DI1=>'X', DI0=>next_cnt_7_N_9_7, A0=>cnt_5, 
                B0=>n6470, C0=>cnt_6, D0=>cnt_7, M0=>'X', CE=>clk_c_enable_16, 
                CLK=>clk_c, LSR=>rst_c, OFX1=>open, F1=>n6470, Q1=>open, 
                OFX0=>open, F0=>next_cnt_7_N_9_7, Q0=>cnt_7);
    dut_mac_inst_SLICE_72I: SLOGICB
      generic map (CLKMUX=>"SIG", CEMUX=>"VHI", LSRMUX=>"SIG", 
                   REG0_REGSET=>"SET", REG1_REGSET=>"SET", GSR=>"DISABLED", 
                   LUT0_INITVAL=>X"FEFA", LUT1_INITVAL=>X"FEFA", 
                   REG1_SD=>"VHI", REG0_SD=>"VHI", CHECK_DI1=>TRUE, 
                   CHECK_DI0=>TRUE, CHECK_LSR=>TRUE)
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_mac_inst_n3, 
                B1=>dut_next_crc_reg_31_N_390_12, C1=>dut_mac_inst_n5691, 
                D1=>dut_n423, DI1=>dut_mac_inst_next_crc_reg_12, 
                DI0=>dut_mac_inst_next_crc_reg_9, A0=>dut_mac_inst_n3_adj_693, 
                B0=>dut_next_crc_reg_31_N_390_9, C0=>dut_mac_inst_n5749, 
                D0=>dut_n423, M0=>'X', CE=>'X', CLK=>clk_c, LSR=>rst_c, 
                OFX1=>open, F1=>dut_mac_inst_next_crc_reg_12, 
                Q1=>dut_crc_reg_12, OFX0=>open, 
                F0=>dut_mac_inst_next_crc_reg_9, Q0=>dut_crc_reg_9);
    dut_SLICE_73I: SLOGICB
      generic map (CLKMUX=>"SIG", CEMUX=>"VHI", LSRMUX=>"SIG", 
                   REG0_REGSET=>"SET", GSR=>"DISABLED", LUT0_INITVAL=>X"FEFA", 
                   LUT1_INITVAL=>X"FE10", REG0_SD=>"VHI", CHECK_DI0=>TRUE, 
                   CHECK_LSR=>TRUE)
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_udp_inst_n320, 
                B1=>dut_udp_inst_n315, C1=>dut_crc_next_31, D1=>dut_crc_reg_31, 
                DI1=>'X', DI0=>dut_mac_inst_next_crc_reg_31, 
                A0=>dut_mac_inst_n3_adj_713, B0=>dut_next_crc_reg_31_N_390_31, 
                C0=>dut_mac_inst_n5757, D0=>dut_n423, M0=>'X', CE=>'X', 
                CLK=>clk_c, LSR=>rst_c, OFX1=>open, 
                F1=>dut_next_crc_reg_31_N_390_31, Q1=>open, OFX0=>open, 
                F0=>dut_mac_inst_next_crc_reg_31, Q0=>dut_crc_reg_31);
    dut_udp_inst_SLICE_74I: SLOGICB
      generic map (CLKMUX=>"SIG", CEMUX=>"VHI", LSRMUX=>"SIG", GSR=>"DISABLED", 
                   LUT0_INITVAL=>X"FEEE", LUT1_INITVAL=>X"FEEE", 
                   REG1_SD=>"VHI", REG0_SD=>"VHI", CHECK_DI1=>TRUE, 
                   CHECK_DI0=>TRUE, CHECK_LSR=>TRUE)
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_udp_inst_n5809, 
                B1=>dut_udp_inst_n4_adj_720, C1=>dut_idx_1, 
                D1=>dut_udp_inst_n926, DI1=>dut_udp_inst_next_idx_1, 
                DI0=>dut_udp_inst_next_idx_0, A0=>dut_udp_inst_n5107, 
                B0=>dut_udp_inst_n5095, C0=>dut_idx_0, D0=>dut_udp_inst_n926, 
                M0=>'X', CE=>'X', CLK=>clk_c, LSR=>rst_c, OFX1=>open, 
                F1=>dut_udp_inst_next_idx_1, Q1=>dut_idx_1, OFX0=>open, 
                F0=>dut_udp_inst_next_idx_0, Q0=>dut_idx_0);
    dut_udp_inst_SLICE_75I: SLOGICB
      generic map (CLKMUX=>"SIG", CEMUX=>"VHI", LSRMUX=>"SIG", GSR=>"DISABLED", 
                   LUT0_INITVAL=>X"FEEE", LUT1_INITVAL=>X"FEEE", 
                   REG1_SD=>"VHI", REG0_SD=>"VHI", CHECK_DI1=>TRUE, 
                   CHECK_DI0=>TRUE, CHECK_LSR=>TRUE)
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_udp_inst_n5813, 
                B1=>dut_udp_inst_n4_adj_719, C1=>dut_idx_3, 
                D1=>dut_udp_inst_n926, DI1=>dut_udp_inst_next_idx_3, 
                DI0=>dut_udp_inst_next_idx_2, A0=>dut_udp_inst_n5787, 
                B0=>dut_udp_inst_n4, C0=>dut_idx_2, D0=>dut_udp_inst_n926, 
                M0=>'X', CE=>'X', CLK=>clk_c, LSR=>rst_c, OFX1=>open, 
                F1=>dut_udp_inst_next_idx_3, Q1=>dut_idx_3, OFX0=>open, 
                F0=>dut_udp_inst_next_idx_2, Q0=>dut_idx_2);
    dut_udp_inst_SLICE_76I: SLOGICB
      generic map (CLKMUX=>"SIG", CEMUX=>"VHI", LSRMUX=>"SIG", GSR=>"DISABLED", 
                   LUT0_INITVAL=>X"FEEE", LUT1_INITVAL=>X"C088", 
                   REG0_SD=>"VHI", CHECK_DI0=>TRUE, CHECK_LSR=>TRUE)
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_idx_4, B1=>dut_n317, 
                C1=>dut_udp_inst_next_idx_7_N_183_4, D1=>dut_n6472, DI1=>'X', 
                DI0=>dut_udp_inst_next_idx_4, A0=>dut_udp_inst_n5795, 
                B0=>dut_udp_inst_n4_adj_718, C0=>dut_idx_4, 
                D0=>dut_udp_inst_n926, M0=>'X', CE=>'X', CLK=>clk_c, 
                LSR=>rst_c, OFX1=>open, F1=>dut_udp_inst_n4_adj_718, Q1=>open, 
                OFX0=>open, F0=>dut_udp_inst_next_idx_4, Q0=>dut_idx_4);
    dut_mac_inst_SLICE_77I: SLOGICB
      generic map (CLKMUX=>"SIG", CEMUX=>"VHI", LSRMUX=>"SIG", GSR=>"DISABLED", 
                   LUT0_INITVAL=>X"FDA0", LUT1_INITVAL=>X"ECE0", 
                   REG1_SD=>"VHI", REG0_SD=>"VHI", CHECK_DI1=>TRUE, 
                   CHECK_DI0=>TRUE, CHECK_LSR=>TRUE)
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_mac_inst_crc_cnt_0, 
                B1=>dut_mac_inst_crc_cnt_1, C1=>dut_mac_inst_n421, 
                D1=>dut_mac_inst_n5, DI1=>dut_mac_inst_next_crc_cnt_1, 
                DI0=>dut_mac_inst_next_crc_cnt_0, A0=>dut_mac_inst_crc_cnt_0, 
                B0=>dut_mac_inst_crc_cnt_1, C0=>dut_mac_inst_n5, 
                D0=>dut_mac_inst_n421, M0=>'X', CE=>'X', CLK=>clk_c, 
                LSR=>rst_c, OFX1=>open, F1=>dut_mac_inst_next_crc_cnt_1, 
                Q1=>dut_mac_inst_crc_cnt_1, OFX0=>open, 
                F0=>dut_mac_inst_next_crc_cnt_0, Q0=>dut_mac_inst_crc_cnt_0);
    dut_mac_inst_SLICE_78I: SLOGICB
      generic map (CLKMUX=>"SIG", CEMUX=>"VHI", LSRMUX=>"SIG", 
                   REG0_REGSET=>"SET", REG1_REGSET=>"SET", GSR=>"DISABLED", 
                   LUT0_INITVAL=>X"FEFC", LUT1_INITVAL=>X"FEFC", 
                   REG1_SD=>"VHI", REG0_SD=>"VHI", CHECK_DI1=>TRUE, 
                   CHECK_DI0=>TRUE, CHECK_LSR=>TRUE)
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_mac_inst_crc_next_1, 
                B1=>dut_mac_inst_n2_adj_710, C1=>dut_mac_inst_n5671, 
                D1=>dut_mac_inst_n422, DI1=>dut_mac_inst_next_crc_reg_1, 
                DI0=>dut_mac_inst_next_crc_reg_0, A0=>dut_mac_inst_crc_next_0, 
                B0=>dut_mac_inst_n2_adj_691, C0=>dut_mac_inst_n5741, 
                D0=>dut_mac_inst_n422, M0=>'X', CE=>'X', CLK=>clk_c, 
                LSR=>rst_c, OFX1=>open, F1=>dut_mac_inst_next_crc_reg_1, 
                Q1=>dut_mac_inst_crc_reg_1, OFX0=>open, 
                F0=>dut_mac_inst_next_crc_reg_0, Q0=>dut_mac_inst_crc_reg_0);
    dut_mac_inst_SLICE_79I: SLOGICB
      generic map (CLKMUX=>"SIG", CEMUX=>"VHI", LSRMUX=>"SIG", 
                   REG0_REGSET=>"SET", REG1_REGSET=>"SET", GSR=>"DISABLED", 
                   LUT0_INITVAL=>X"FEFC", LUT1_INITVAL=>X"FEFC", 
                   REG1_SD=>"VHI", REG0_SD=>"VHI", CHECK_DI1=>TRUE, 
                   CHECK_DI0=>TRUE, CHECK_LSR=>TRUE)
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_mac_inst_crc_next_3, 
                B1=>dut_mac_inst_n2_adj_705, C1=>dut_mac_inst_n5609, 
                D1=>dut_mac_inst_n422, DI1=>dut_mac_inst_next_crc_reg_3, 
                DI0=>dut_mac_inst_next_crc_reg_2, A0=>dut_mac_inst_crc_next_2, 
                B0=>dut_mac_inst_n2_adj_708, C0=>dut_mac_inst_n5683, 
                D0=>dut_mac_inst_n422, M0=>'X', CE=>'X', CLK=>clk_c, 
                LSR=>rst_c, OFX1=>open, F1=>dut_mac_inst_next_crc_reg_3, 
                Q1=>dut_mac_inst_crc_reg_3, OFX0=>open, 
                F0=>dut_mac_inst_next_crc_reg_2, Q0=>dut_mac_inst_crc_reg_2);
    dut_mac_inst_SLICE_80I: SLOGICB
      generic map (CLKMUX=>"SIG", CEMUX=>"VHI", LSRMUX=>"SIG", 
                   REG0_REGSET=>"SET", REG1_REGSET=>"SET", GSR=>"DISABLED", 
                   LUT0_INITVAL=>X"FEFC", LUT1_INITVAL=>X"FEFC", 
                   REG1_SD=>"VHI", REG0_SD=>"VHI", CHECK_DI1=>TRUE, 
                   CHECK_DI0=>TRUE, CHECK_LSR=>TRUE)
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_mac_inst_crc_next_5, 
                B1=>dut_mac_inst_n2_adj_699, C1=>dut_mac_inst_n5627, 
                D1=>dut_mac_inst_n422, DI1=>dut_mac_inst_next_crc_reg_5, 
                DI0=>dut_mac_inst_next_crc_reg_4, A0=>dut_mac_inst_crc_next_4, 
                B0=>dut_mac_inst_n2_adj_704, C0=>dut_mac_inst_n5467, 
                D0=>dut_mac_inst_n422, M0=>'X', CE=>'X', CLK=>clk_c, 
                LSR=>rst_c, OFX1=>open, F1=>dut_mac_inst_next_crc_reg_5, 
                Q1=>dut_mac_inst_crc_reg_5, OFX0=>open, 
                F0=>dut_mac_inst_next_crc_reg_4, Q0=>dut_mac_inst_crc_reg_4);
    dut_mac_inst_SLICE_81I: SLOGICB
      generic map (CLKMUX=>"SIG", CEMUX=>"VHI", LSRMUX=>"SIG", 
                   REG0_REGSET=>"SET", REG1_REGSET=>"SET", GSR=>"DISABLED", 
                   LUT0_INITVAL=>X"FEFC", LUT1_INITVAL=>X"FEFC", 
                   REG1_SD=>"VHI", REG0_SD=>"VHI", CHECK_DI1=>TRUE, 
                   CHECK_DI0=>TRUE, CHECK_LSR=>TRUE)
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_mac_inst_crc_next_7, 
                B1=>dut_mac_inst_n2_adj_696, C1=>dut_mac_inst_n5547, 
                D1=>dut_mac_inst_n422, DI1=>dut_mac_inst_next_crc_reg_7, 
                DI0=>dut_mac_inst_next_crc_reg_6, A0=>dut_mac_inst_crc_next_6, 
                B0=>dut_mac_inst_n2_adj_697, C0=>dut_mac_inst_n5617, 
                D0=>dut_mac_inst_n422, M0=>'X', CE=>'X', CLK=>clk_c, 
                LSR=>rst_c, OFX1=>open, F1=>dut_mac_inst_next_crc_reg_7, 
                Q1=>dut_mac_inst_crc_reg_7, OFX0=>open, 
                F0=>dut_mac_inst_next_crc_reg_6, Q0=>dut_mac_inst_crc_reg_6);
    dut_mac_inst_SLICE_82I: SLOGICB
      generic map (CLKMUX=>"SIG", CEMUX=>"VHI", LSRMUX=>"SIG", 
                   REG0_REGSET=>"SET", REG1_REGSET=>"SET", GSR=>"DISABLED", 
                   LUT0_INITVAL=>X"FEFC", LUT1_INITVAL=>X"FEFC", 
                   REG1_SD=>"VHI", REG0_SD=>"VHI", CHECK_DI1=>TRUE, 
                   CHECK_DI0=>TRUE, CHECK_LSR=>TRUE)
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_mac_inst_crc_next_10, 
                B1=>dut_mac_inst_n2_adj_692, C1=>dut_mac_inst_n5737, 
                D1=>dut_mac_inst_n422, DI1=>dut_mac_inst_next_crc_reg_10, 
                DI0=>dut_mac_inst_next_crc_reg_8, A0=>dut_mac_inst_crc_next_8, 
                B0=>dut_mac_inst_n2_adj_694, C0=>dut_mac_inst_n5539, 
                D0=>dut_mac_inst_n422, M0=>'X', CE=>'X', CLK=>clk_c, 
                LSR=>rst_c, OFX1=>open, F1=>dut_mac_inst_next_crc_reg_10, 
                Q1=>dut_mac_inst_crc_reg_10, OFX0=>open, 
                F0=>dut_mac_inst_next_crc_reg_8, Q0=>dut_mac_inst_crc_reg_8);
    dut_mac_inst_SLICE_83I: SLOGICB
      generic map (CLKMUX=>"SIG", CEMUX=>"VHI", LSRMUX=>"SIG", 
                   REG0_REGSET=>"SET", REG1_REGSET=>"SET", GSR=>"DISABLED", 
                   LUT0_INITVAL=>X"FEFC", LUT1_INITVAL=>X"FEFC", 
                   REG1_SD=>"VHI", REG0_SD=>"VHI", CHECK_DI1=>TRUE, 
                   CHECK_DI0=>TRUE, CHECK_LSR=>TRUE)
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_mac_inst_crc_next_13, 
                B1=>dut_mac_inst_n2_adj_689, C1=>dut_mac_inst_n5415, 
                D1=>dut_mac_inst_n422, DI1=>dut_mac_inst_next_crc_reg_13, 
                DI0=>dut_mac_inst_next_crc_reg_11, 
                A0=>dut_mac_inst_crc_next_11, B0=>dut_mac_inst_n2_adj_690, 
                C0=>dut_mac_inst_n5697, D0=>dut_mac_inst_n422, M0=>'X', 
                CE=>'X', CLK=>clk_c, LSR=>rst_c, OFX1=>open, 
                F1=>dut_mac_inst_next_crc_reg_13, Q1=>dut_mac_inst_crc_reg_13, 
                OFX0=>open, F0=>dut_mac_inst_next_crc_reg_11, 
                Q0=>dut_mac_inst_crc_reg_11);
    dut_mac_inst_SLICE_84I: SLOGICB
      generic map (CLKMUX=>"SIG", CEMUX=>"VHI", LSRMUX=>"SIG", 
                   REG0_REGSET=>"SET", REG1_REGSET=>"SET", GSR=>"DISABLED", 
                   LUT0_INITVAL=>X"FEFC", LUT1_INITVAL=>X"FEFC", 
                   REG1_SD=>"VHI", REG0_SD=>"VHI", CHECK_DI1=>TRUE, 
                   CHECK_DI0=>TRUE, CHECK_LSR=>TRUE)
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_mac_inst_crc_next_15, 
                B1=>dut_mac_inst_n2_adj_687, C1=>dut_mac_inst_n5675, 
                D1=>dut_mac_inst_n422, DI1=>dut_mac_inst_next_crc_reg_15, 
                DI0=>dut_mac_inst_next_crc_reg_14, 
                A0=>dut_mac_inst_crc_next_14, B0=>dut_mac_inst_n2_adj_688, 
                C0=>dut_mac_inst_n5721, D0=>dut_mac_inst_n422, M0=>'X', 
                CE=>'X', CLK=>clk_c, LSR=>rst_c, OFX1=>open, 
                F1=>dut_mac_inst_next_crc_reg_15, Q1=>dut_mac_inst_crc_reg_15, 
                OFX0=>open, F0=>dut_mac_inst_next_crc_reg_14, 
                Q0=>dut_mac_inst_crc_reg_14);
    dut_mac_inst_SLICE_85I: SLOGICB
      generic map (CLKMUX=>"SIG", CEMUX=>"VHI", LSRMUX=>"SIG", 
                   REG0_REGSET=>"SET", REG1_REGSET=>"SET", GSR=>"DISABLED", 
                   LUT0_INITVAL=>X"FEFC", LUT1_INITVAL=>X"FEFC", 
                   REG1_SD=>"VHI", REG0_SD=>"VHI", CHECK_DI1=>TRUE, 
                   CHECK_DI0=>TRUE, CHECK_LSR=>TRUE)
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_mac_inst_crc_next_17, 
                B1=>dut_mac_inst_n2_adj_685, C1=>dut_mac_inst_n5395, 
                D1=>dut_mac_inst_n422, DI1=>dut_mac_inst_next_crc_reg_17, 
                DI0=>dut_mac_inst_next_crc_reg_16, 
                A0=>dut_mac_inst_crc_next_16, B0=>dut_mac_inst_n2_adj_686, 
                C0=>dut_mac_inst_n5653, D0=>dut_mac_inst_n422, M0=>'X', 
                CE=>'X', CLK=>clk_c, LSR=>rst_c, OFX1=>open, 
                F1=>dut_mac_inst_next_crc_reg_17, Q1=>dut_mac_inst_crc_reg_17, 
                OFX0=>open, F0=>dut_mac_inst_next_crc_reg_16, 
                Q0=>dut_mac_inst_crc_reg_16);
    dut_mac_inst_SLICE_86I: SLOGICB
      generic map (CLKMUX=>"SIG", CEMUX=>"VHI", LSRMUX=>"SIG", 
                   REG0_REGSET=>"SET", REG1_REGSET=>"SET", GSR=>"DISABLED", 
                   LUT0_INITVAL=>X"FEFC", LUT1_INITVAL=>X"FEFC", 
                   REG1_SD=>"VHI", REG0_SD=>"VHI", CHECK_DI1=>TRUE, 
                   CHECK_DI0=>TRUE, CHECK_LSR=>TRUE)
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_mac_inst_crc_next_19, 
                B1=>dut_mac_inst_n2_adj_683, C1=>dut_mac_inst_n5419, 
                D1=>dut_mac_inst_n422, DI1=>dut_mac_inst_next_crc_reg_19, 
                DI0=>dut_mac_inst_next_crc_reg_18, 
                A0=>dut_mac_inst_crc_next_18, B0=>dut_mac_inst_n2_adj_684, 
                C0=>dut_mac_inst_n5519, D0=>dut_mac_inst_n422, M0=>'X', 
                CE=>'X', CLK=>clk_c, LSR=>rst_c, OFX1=>open, 
                F1=>dut_mac_inst_next_crc_reg_19, Q1=>dut_mac_inst_crc_reg_19, 
                OFX0=>open, F0=>dut_mac_inst_next_crc_reg_18, 
                Q0=>dut_mac_inst_crc_reg_18);
    dut_mac_inst_SLICE_87I: SLOGICB
      generic map (CLKMUX=>"SIG", CEMUX=>"VHI", LSRMUX=>"SIG", 
                   REG0_REGSET=>"SET", REG1_REGSET=>"SET", GSR=>"DISABLED", 
                   LUT0_INITVAL=>X"FEFC", LUT1_INITVAL=>X"FEFC", 
                   REG1_SD=>"VHI", REG0_SD=>"VHI", CHECK_DI1=>TRUE, 
                   CHECK_DI0=>TRUE, CHECK_LSR=>TRUE)
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_mac_inst_crc_next_21, 
                B1=>dut_mac_inst_n2_adj_711, C1=>dut_mac_inst_n5579, 
                D1=>dut_mac_inst_n422, DI1=>dut_mac_inst_next_crc_reg_21, 
                DI0=>dut_mac_inst_next_crc_reg_20, 
                A0=>dut_mac_inst_crc_next_20, B0=>dut_mac_inst_n2, 
                C0=>dut_mac_inst_n5499, D0=>dut_mac_inst_n422, M0=>'X', 
                CE=>'X', CLK=>clk_c, LSR=>rst_c, OFX1=>open, 
                F1=>dut_mac_inst_next_crc_reg_21, Q1=>dut_mac_inst_crc_reg_21, 
                OFX0=>open, F0=>dut_mac_inst_next_crc_reg_20, 
                Q0=>dut_mac_inst_crc_reg_20);
    dut_mac_inst_SLICE_88I: SLOGICB
      generic map (CLKMUX=>"SIG", CEMUX=>"VHI", LSRMUX=>"SIG", 
                   REG0_REGSET=>"SET", REG1_REGSET=>"SET", GSR=>"DISABLED", 
                   LUT0_INITVAL=>X"FEFC", LUT1_INITVAL=>X"FEFC", 
                   REG1_SD=>"VHI", REG0_SD=>"VHI", CHECK_DI1=>TRUE, 
                   CHECK_DI0=>TRUE, CHECK_LSR=>TRUE)
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_mac_inst_crc_next_23, 
                B1=>dut_mac_inst_n2_adj_707, C1=>dut_mac_inst_n5487, 
                D1=>dut_mac_inst_n422, DI1=>dut_mac_inst_next_crc_reg_23, 
                DI0=>dut_mac_inst_next_crc_reg_22, 
                A0=>dut_mac_inst_crc_next_22, B0=>dut_mac_inst_n2_adj_709, 
                C0=>dut_mac_inst_n5439, D0=>dut_mac_inst_n422, M0=>'X', 
                CE=>'X', CLK=>clk_c, LSR=>rst_c, OFX1=>open, 
                F1=>dut_mac_inst_next_crc_reg_23, Q1=>dut_mac_inst_crc_reg_23, 
                OFX0=>open, F0=>dut_mac_inst_next_crc_reg_22, 
                Q0=>dut_mac_inst_crc_reg_22);
    dut_mac_inst_SLICE_89I: SLOGICB
      generic map (CLKMUX=>"SIG", CEMUX=>"VHI", LSRMUX=>"SIG", 
                   REG0_REGSET=>"SET", REG1_REGSET=>"SET", GSR=>"DISABLED", 
                   LUT0_INITVAL=>X"FEFC", LUT1_INITVAL=>X"FEFC", 
                   REG1_SD=>"VHI", REG0_SD=>"VHI", CHECK_DI1=>TRUE, 
                   CHECK_DI0=>TRUE, CHECK_LSR=>TRUE)
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_mac_inst_crc_next_25, 
                B1=>dut_mac_inst_n2_adj_703, C1=>dut_mac_inst_n5463, 
                D1=>dut_mac_inst_n422, DI1=>dut_mac_inst_next_crc_reg_25, 
                DI0=>dut_mac_inst_next_crc_reg_24, 
                A0=>dut_mac_inst_crc_next_24, B0=>dut_mac_inst_n2_adj_706, 
                C0=>dut_mac_inst_n5575, D0=>dut_mac_inst_n422, M0=>'X', 
                CE=>'X', CLK=>clk_c, LSR=>rst_c, OFX1=>open, 
                F1=>dut_mac_inst_next_crc_reg_25, Q1=>dut_mac_inst_crc_reg_25, 
                OFX0=>open, F0=>dut_mac_inst_next_crc_reg_24, 
                Q0=>dut_mac_inst_crc_reg_24);
    dut_mac_inst_SLICE_90I: SLOGICB
      generic map (CLKMUX=>"SIG", CEMUX=>"VHI", LSRMUX=>"SIG", 
                   REG0_REGSET=>"SET", REG1_REGSET=>"SET", GSR=>"DISABLED", 
                   LUT0_INITVAL=>X"FEFC", LUT1_INITVAL=>X"FEFC", 
                   REG1_SD=>"VHI", REG0_SD=>"VHI", CHECK_DI1=>TRUE, 
                   CHECK_DI0=>TRUE, CHECK_LSR=>TRUE)
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_mac_inst_crc_next_27, 
                B1=>dut_mac_inst_n2_adj_700, C1=>dut_mac_inst_n5559, 
                D1=>dut_mac_inst_n422, DI1=>dut_mac_inst_next_crc_reg_27, 
                DI0=>dut_mac_inst_next_crc_reg_26, 
                A0=>dut_mac_inst_crc_next_26, B0=>dut_mac_inst_n2_adj_701, 
                C0=>dut_mac_inst_n5391, D0=>dut_mac_inst_n422, M0=>'X', 
                CE=>'X', CLK=>clk_c, LSR=>rst_c, OFX1=>open, 
                F1=>dut_mac_inst_next_crc_reg_27, Q1=>dut_mac_inst_crc_reg_27, 
                OFX0=>open, F0=>dut_mac_inst_next_crc_reg_26, 
                Q0=>dut_mac_inst_crc_reg_26);
    dut_mac_inst_SLICE_91I: SLOGICB
      generic map (CLKMUX=>"SIG", CEMUX=>"VHI", LSRMUX=>"SIG", 
                   REG0_REGSET=>"SET", REG1_REGSET=>"SET", GSR=>"DISABLED", 
                   LUT0_INITVAL=>X"FEFC", LUT1_INITVAL=>X"FEFC", 
                   REG1_SD=>"VHI", REG0_SD=>"VHI", CHECK_DI1=>TRUE, 
                   CHECK_DI0=>TRUE, CHECK_LSR=>TRUE)
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_mac_inst_crc_next_29, 
                B1=>dut_mac_inst_n2_adj_695, C1=>dut_mac_inst_n5405, 
                D1=>dut_mac_inst_n422, DI1=>dut_mac_inst_next_crc_reg_29, 
                DI0=>dut_mac_inst_next_crc_reg_28, 
                A0=>dut_mac_inst_crc_next_28, B0=>dut_mac_inst_n2_adj_698, 
                C0=>dut_mac_inst_n5543, D0=>dut_mac_inst_n422, M0=>'X', 
                CE=>'X', CLK=>clk_c, LSR=>rst_c, OFX1=>open, 
                F1=>dut_mac_inst_next_crc_reg_29, Q1=>dut_mac_inst_crc_reg_29, 
                OFX0=>open, F0=>dut_mac_inst_next_crc_reg_28, 
                Q0=>dut_mac_inst_crc_reg_28);
    dut_mac_inst_SLICE_92I: SLOGICB
      generic map (CLKMUX=>"SIG", CEMUX=>"VHI", LSRMUX=>"SIG", 
                   REG0_REGSET=>"SET", GSR=>"DISABLED", LUT0_INITVAL=>X"FEFC", 
                   LUT1_INITVAL=>X"88C0", REG0_SD=>"VHI", CHECK_DI0=>TRUE, 
                   CHECK_LSR=>TRUE)
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_mac_inst_crc_reg_30, 
                B1=>dut_n423, C1=>dut_mac_inst_crc_next_30, D1=>dut_n6493, 
                DI1=>'X', DI0=>dut_mac_inst_next_crc_reg_30, 
                A0=>dut_mac_inst_crc_next_30, B0=>dut_mac_inst_n2_adj_714, 
                C0=>dut_mac_inst_n5701, D0=>dut_mac_inst_n422, M0=>'X', 
                CE=>'X', CLK=>clk_c, LSR=>rst_c, OFX1=>open, 
                F1=>dut_mac_inst_n2_adj_714, Q1=>open, OFX0=>open, 
                F0=>dut_mac_inst_next_crc_reg_30, Q0=>dut_mac_inst_crc_reg_30);
    dut_mac_inst_SLICE_93I: SLOGICB
      generic map (CLKMUX=>"SIG", CEMUX=>"VHI", LSRMUX=>"SIG", GSR=>"DISABLED", 
                   LUT0_INITVAL=>X"01FE", LUT1_INITVAL=>X"0800", 
                   REG0_SD=>"VHI", CHECK_DI0=>TRUE, CHECK_LSR=>TRUE)
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_mac_inst_crc_cnt_0, 
                B1=>dut_mac_inst_crc_cnt_1, C1=>dut_mac_inst_n420, 
                D1=>dut_mac_inst_n421, DI1=>'X', DI0=>dut_mac_inst_n11_adj_702, 
                A0=>dut_mac_inst_n3184, B0=>dut_mac_inst_n6476, C0=>rst_c, 
                D0=>dut_mac_inst_ifg_cnt_0, M0=>'X', CE=>'X', CLK=>clk_c, 
                LSR=>dut_mac_inst_n1334, OFX1=>open, F1=>dut_mac_inst_n6476, 
                Q1=>open, OFX0=>open, F0=>dut_mac_inst_n11_adj_702, 
                Q0=>dut_mac_inst_ifg_cnt_0);
    dut_mac_inst_SLICE_94I: SLOGICB
      generic map (CLKMUX=>"SIG", CEMUX=>"SIG", LSRMUX=>"SIG", GSR=>"DISABLED", 
                   LUT0_INITVAL=>X"6666", LUT1_INITVAL=>X"7878", 
                   REG1_SD=>"VHI", REG0_SD=>"VHI", CHECK_DI1=>TRUE, 
                   CHECK_DI0=>TRUE, CHECK_CE=>TRUE, CHECK_LSR=>TRUE)
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_mac_inst_ifg_cnt_1, 
                B1=>dut_mac_inst_ifg_cnt_0, C1=>dut_mac_inst_ifg_cnt_2, 
                D1=>'X', DI1=>dut_mac_inst_next_ifg_cnt_3_N_513_2, 
                DI0=>dut_mac_inst_next_ifg_cnt_3_N_513_1, 
                A0=>dut_mac_inst_ifg_cnt_1, B0=>dut_mac_inst_ifg_cnt_0, 
                C0=>'X', D0=>'X', M0=>'X', CE=>dut_mac_inst_clk_c_enable_17, 
                CLK=>clk_c, LSR=>dut_mac_inst_n1334, OFX1=>open, 
                F1=>dut_mac_inst_next_ifg_cnt_3_N_513_2, 
                Q1=>dut_mac_inst_ifg_cnt_2, OFX0=>open, 
                F0=>dut_mac_inst_next_ifg_cnt_3_N_513_1, 
                Q0=>dut_mac_inst_ifg_cnt_1);
    dut_mac_inst_SLICE_95I: SLOGICB
      generic map (CLKMUX=>"SIG", CEMUX=>"SIG", LSRMUX=>"SIG", GSR=>"DISABLED", 
                   LUT0_INITVAL=>X"7F80", LUT1_INITVAL=>X"8000", 
                   REG0_SD=>"VHI", CHECK_DI0=>TRUE, CHECK_CE=>TRUE, 
                   CHECK_LSR=>TRUE)
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_mac_inst_ifg_cnt_0, 
                B1=>dut_mac_inst_ifg_cnt_1, C1=>dut_mac_inst_n420, 
                D1=>dut_mac_inst_ifg_cnt_3, DI1=>'X', 
                DI0=>dut_mac_inst_next_ifg_cnt_3_N_513_3, 
                A0=>dut_mac_inst_ifg_cnt_1, B0=>dut_mac_inst_ifg_cnt_0, 
                C0=>dut_mac_inst_ifg_cnt_2, D0=>dut_mac_inst_ifg_cnt_3, 
                M0=>'X', CE=>dut_mac_inst_clk_c_enable_17, CLK=>clk_c, 
                LSR=>dut_mac_inst_n1334, OFX1=>open, F1=>dut_mac_inst_n5889, 
                Q1=>open, OFX0=>open, F0=>dut_mac_inst_next_ifg_cnt_3_N_513_3, 
                Q0=>dut_mac_inst_ifg_cnt_3);
    dut_mac_inst_SLICE_96I: SLOGICB
      generic map (CLKMUX=>"SIG", CEMUX=>"VHI", LSRMUX=>"SIG", GSR=>"DISABLED", 
                   LUT0_INITVAL=>X"F8F0", LUT1_INITVAL=>X"FEFA", 
                   REG1_SD=>"VHI", REG0_SD=>"VHI", CHECK_DI1=>TRUE, 
                   CHECK_DI0=>TRUE, CHECK_LSR=>TRUE)
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_mac_inst_n1959, B1=>n399, 
                C1=>dut_mac_inst_n5379, D1=>dut_n6479, DI1=>dut_mac_inst_n5287, 
                DI0=>dut_mac_inst_n1962, A0=>dut_mac_inst_crc_cnt_0, 
                B0=>dut_mac_inst_crc_cnt_1, C0=>dut_mac_inst_n3184, 
                D0=>dut_mac_inst_n421, M0=>'X', CE=>'X', CLK=>clk_c, 
                LSR=>rst_c, OFX1=>open, F1=>dut_mac_inst_n5287, 
                Q1=>dut_mac_inst_n421, OFX0=>open, F0=>dut_mac_inst_n1962, 
                Q0=>dut_mac_inst_n420);
    dut_SLICE_97I: SLOGICB
      generic map (CLKMUX=>"SIG", CEMUX=>"VHI", LSRMUX=>"SIG", GSR=>"DISABLED", 
                   LUT0_INITVAL=>X"88F8", LUT1_INITVAL=>X"0080", 
                   REG0_SD=>"VHI", CHECK_DI0=>TRUE, CHECK_LSR=>TRUE)
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_reg_fifo_empty, 
                B1=>dut_n316, C1=>dut_n423, D1=>dut_n6493, DI1=>'X', 
                DI0=>dut_mac_inst_n1958, A0=>dut_mac_inst_n422, 
                B0=>dut_mac_inst_n11, C0=>dut_n6479, D0=>n399, M0=>'X', 
                CE=>'X', CLK=>clk_c, LSR=>rst_c, OFX1=>open, F1=>dut_n6479, 
                Q1=>open, OFX0=>open, F0=>dut_mac_inst_n1958, 
                Q0=>dut_mac_inst_n422);
    dut_mac_inst_SLICE_98I: SLOGICB
      generic map (CLKMUX=>"SIG", CEMUX=>"SIG", LSRMUX=>"SIG", GSR=>"DISABLED", 
                   LUT0_INITVAL=>X"35C5", LUT1_INITVAL=>X"EEEE", 
                   REG0_SD=>"VHI", CHECK_DI0=>TRUE, CHECK_CE=>TRUE, 
                   CHECK_LSR=>TRUE)
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_mac_inst_pad_cnt_2, 
                B1=>dut_mac_inst_pad_cnt_1, C1=>'X', D1=>'X', DI1=>'X', 
                DI0=>dut_mac_inst_next_pad_cnt_0, A0=>dut_mac_inst_frame_len_0, 
                B0=>dut_mac_inst_pad_cnt_0, C0=>dut_mac_inst_n422, 
                D0=>dut_mac_inst_n11, M0=>'X', CE=>dut_mac_inst_clk_c_enable_9, 
                CLK=>clk_c, LSR=>rst_c, OFX1=>open, F1=>dut_mac_inst_n5865, 
                Q1=>open, OFX0=>open, F0=>dut_mac_inst_next_pad_cnt_0, 
                Q0=>dut_mac_inst_pad_cnt_0);
    dut_mac_inst_SLICE_99I: SLOGICB
      generic map (CLKMUX=>"SIG", CEMUX=>"SIG", LSRMUX=>"SIG", GSR=>"DISABLED", 
                   LUT0_INITVAL=>X"CA3A", LUT1_INITVAL=>X"99F0", 
                   REG1_SD=>"VHI", REG0_SD=>"VHI", CHECK_DI1=>TRUE, 
                   CHECK_DI0=>TRUE, CHECK_CE=>TRUE, CHECK_LSR=>TRUE)
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_mac_inst_n6481, 
                B1=>dut_mac_inst_pad_cnt_3, C1=>dut_mac_inst_n6385, 
                D1=>dut_mac_inst_n422, DI1=>dut_mac_inst_next_pad_cnt_3, 
                DI0=>dut_mac_inst_next_pad_cnt_1, A0=>frame_len_1, 
                B0=>dut_mac_inst_pad_cnt_1, C0=>dut_mac_inst_n422, 
                D0=>dut_mac_inst_pad_cnt_0, M0=>'X', 
                CE=>dut_mac_inst_clk_c_enable_8, CLK=>clk_c, LSR=>rst_c, 
                OFX1=>open, F1=>dut_mac_inst_next_pad_cnt_3, 
                Q1=>dut_mac_inst_pad_cnt_3, OFX0=>open, 
                F0=>dut_mac_inst_next_pad_cnt_1, Q0=>dut_mac_inst_pad_cnt_1);
    dut_mac_inst_SLICE_100I: SLOGICB
      generic map (M0MUX=>"SIG", CLKMUX=>"SIG", CEMUX=>"SIG", LSRMUX=>"SIG", 
                   GSR=>"DISABLED", LUT0_INITVAL=>X"6666", 
                   LUT1_INITVAL=>X"A9A9", REG0_SD=>"VHI", CHECK_DI0=>TRUE, 
                   CHECK_CE=>TRUE, CHECK_LSR=>TRUE)
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_mac_inst_pad_cnt_2, 
                B1=>dut_mac_inst_pad_cnt_0, C1=>dut_mac_inst_pad_cnt_1, 
                D1=>'X', DI1=>'X', DI0=>dut_mac_inst_next_pad_cnt_2, 
                A0=>frame_len_1, B0=>frame_len_2, C0=>'X', D0=>'X', 
                M0=>dut_mac_inst_n422, CE=>dut_mac_inst_clk_c_enable_8, 
                CLK=>clk_c, LSR=>rst_c, OFX1=>open, F1=>open, Q1=>open, 
                OFX0=>dut_mac_inst_next_pad_cnt_2, F0=>open, 
                Q0=>dut_mac_inst_pad_cnt_2);
    dut_mac_inst_SLICE_101I: SLOGICB
      generic map (CLKMUX=>"SIG", CEMUX=>"SIG", LSRMUX=>"SIG", GSR=>"DISABLED", 
                   LUT0_INITVAL=>X"99F0", LUT1_INITVAL=>X"E10F", 
                   REG0_SD=>"VHI", CHECK_DI0=>TRUE, CHECK_CE=>TRUE, 
                   CHECK_LSR=>TRUE)
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>frame_len_2, B1=>frame_len_1, 
                C1=>frame_len_4, D1=>frame_len_3, DI1=>'X', 
                DI0=>dut_mac_inst_next_pad_cnt_4, A0=>dut_mac_inst_n6474, 
                B0=>dut_mac_inst_pad_cnt_4, C0=>dut_mac_inst_n6332, 
                D0=>dut_mac_inst_n422, M0=>'X', 
                CE=>dut_mac_inst_clk_c_enable_8, CLK=>clk_c, LSR=>rst_c, 
                OFX1=>open, F1=>dut_mac_inst_n6332, Q1=>open, OFX0=>open, 
                F0=>dut_mac_inst_next_pad_cnt_4, Q0=>dut_mac_inst_pad_cnt_4);
    dut_mac_inst_SLICE_102I: SLOGICB
      generic map (M0MUX=>"SIG", CLKMUX=>"SIG", CEMUX=>"SIG", LSRMUX=>"SIG", 
                   GSR=>"DISABLED", LUT0_INITVAL=>X"807F", 
                   LUT1_INITVAL=>X"FE01", REG0_SD=>"VHI", CHECK_DI0=>TRUE, 
                   CHECK_CE=>TRUE, CHECK_LSR=>TRUE)
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_mac_inst_pad_cnt_3, 
                B1=>dut_mac_inst_n6481, C1=>dut_mac_inst_pad_cnt_4, 
                D1=>dut_mac_inst_pad_cnt_5, DI1=>'X', 
                DI0=>dut_mac_inst_next_pad_cnt_5, A0=>frame_len_3, 
                B0=>dut_mac_inst_n6500, C0=>frame_len_4, D0=>frame_len_5, 
                M0=>dut_mac_inst_n422, CE=>dut_mac_inst_clk_c_enable_8, 
                CLK=>clk_c, LSR=>rst_c, OFX1=>open, F1=>open, Q1=>open, 
                OFX0=>dut_mac_inst_next_pad_cnt_5, F0=>open, 
                Q0=>dut_mac_inst_pad_cnt_5);
    dut_mac_inst_SLICE_103I: SLOGICB
      generic map (CLKMUX=>"SIG", CEMUX=>"SIG", LSRMUX=>"SIG", GSR=>"DISABLED", 
                   LUT0_INITVAL=>X"4444", LUT1_INITVAL=>X"2828", 
                   REG1_SD=>"VHI", REG0_SD=>"VHI", CHECK_DI1=>TRUE, 
                   CHECK_DI0=>TRUE, CHECK_CE=>TRUE, CHECK_LSR=>TRUE)
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>n424, 
                B1=>dut_mac_inst_pre_cnt_0, C1=>dut_mac_inst_pre_cnt_1, 
                D1=>'X', DI1=>dut_mac_inst_n4923, DI0=>dut_mac_inst_n4899, 
                A0=>dut_mac_inst_pre_cnt_0, B0=>n424, C0=>'X', D0=>'X', 
                M0=>'X', CE=>clk_c_enable_19, CLK=>clk_c, LSR=>rst_c, 
                OFX1=>open, F1=>dut_mac_inst_n4923, Q1=>dut_mac_inst_pre_cnt_1, 
                OFX0=>open, F0=>dut_mac_inst_n4899, Q0=>dut_mac_inst_pre_cnt_0);
    dut_mac_inst_SLICE_104I: SLOGICB
      generic map (CLKMUX=>"SIG", CEMUX=>"SIG", LSRMUX=>"SIG", GSR=>"DISABLED", 
                   LUT0_INITVAL=>X"7800", LUT1_INITVAL=>X"8080", 
                   REG0_SD=>"VHI", CHECK_DI0=>TRUE, CHECK_CE=>TRUE, 
                   CHECK_LSR=>TRUE)
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_mac_inst_pre_cnt_1, 
                B1=>dut_mac_inst_pre_cnt_0, C1=>dut_mac_inst_pre_cnt_2, 
                D1=>'X', DI1=>'X', DI0=>dut_mac_inst_n4907, 
                A0=>dut_mac_inst_pre_cnt_1, B0=>dut_mac_inst_pre_cnt_0, 
                C0=>dut_mac_inst_pre_cnt_2, D0=>n424, M0=>'X', 
                CE=>clk_c_enable_19, CLK=>clk_c, LSR=>rst_c, OFX1=>open, 
                F1=>n6488, Q1=>open, OFX0=>open, F0=>dut_mac_inst_n4907, 
                Q0=>dut_mac_inst_pre_cnt_2);
    dut_udp_inst_SLICE_105I: SLOGICB
      generic map (CLKMUX=>"SIG", CEMUX=>"VHI", LSRMUX=>"SIG", GSR=>"DISABLED", 
                   LUT0_INITVAL=>X"AEAA", LUT1_INITVAL=>X"EECE", 
                   REG1_SD=>"VHI", REG0_SD=>"VHI", CHECK_DI1=>TRUE, 
                   CHECK_DI0=>TRUE, CHECK_LSR=>TRUE)
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_n317, B1=>dut_n5334, 
                C1=>dut_n6472, D1=>dut_udp_inst_n6473, DI1=>dut_udp_inst_n1931, 
                DI0=>dut_udp_inst_n1947, A0=>dut_udp_inst_n1946, B0=>dut_n6472, 
                C0=>dut_udp_inst_n6473, D0=>dut_n317, M0=>'X', CE=>'X', 
                CLK=>clk_c, LSR=>rst_c, OFX1=>open, F1=>dut_udp_inst_n1931, 
                Q1=>dut_n317, OFX0=>open, F0=>dut_udp_inst_n1947, Q0=>dut_n316);
    dut_udp_inst_SLICE_106I: SLOGICB
      generic map (CLKMUX=>"SIG", CEMUX=>"VHI", LSRMUX=>"SIG", GSR=>"DISABLED", 
                   LUT0_INITVAL=>X"EECE", LUT1_INITVAL=>X"EECE", 
                   REG1_SD=>"VHI", REG0_SD=>"VHI", CHECK_DI1=>TRUE, 
                   CHECK_DI0=>TRUE, CHECK_LSR=>TRUE)
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_n319, 
                B1=>dut_udp_inst_n337, C1=>dut_n6472, D1=>dut_n15_adj_721, 
                DI1=>dut_udp_inst_n1941, DI0=>dut_udp_inst_n1939, A0=>dut_n318, 
                B0=>dut_n5318, C0=>dut_n6472, D0=>dut_n15, M0=>'X', CE=>'X', 
                CLK=>clk_c, LSR=>rst_c, OFX1=>open, F1=>dut_udp_inst_n1941, 
                Q1=>dut_n319, OFX0=>open, F0=>dut_udp_inst_n1939, Q0=>dut_n318);
    dut_mac_inst_SLICE_107I: SLOGICB
      generic map (CLKMUX=>"SIG", CEMUX=>"VHI", LSRMUX=>"SIG", 
                   REG1_REGSET=>"SET", GSR=>"DISABLED", LUT0_INITVAL=>X"F888", 
                   LUT1_INITVAL=>X"A0EC", REG1_SD=>"VHI", REG0_SD=>"VHI", 
                   CHECK_DI1=>TRUE, CHECK_DI0=>TRUE, CHECK_LSR=>TRUE)
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_n425, 
                B1=>dut_mac_inst_n5889, C1=>dut_n6493, 
                D1=>dut_mac_inst_ifg_cnt_2, DI1=>dut_mac_inst_n1952, 
                DI0=>dut_mac_inst_n1956, A0=>n6488, B0=>n424, C0=>dut_n395, 
                D0=>dut_n423, M0=>'X', CE=>'X', CLK=>clk_c, LSR=>rst_c, 
                OFX1=>open, F1=>dut_mac_inst_n1952, Q1=>dut_n425, OFX0=>open, 
                F0=>dut_mac_inst_n1956, Q0=>dut_n423);
    dut_reg_inst_SLICE_109I: SLOGICB
      generic map (M0MUX=>"SIG", M1MUX=>"SIG", CLKMUX=>"SIG", CEMUX=>"VHI", 
                   SRMODE=>"ASYNC", CHECK_M1=>TRUE, CHECK_M0=>TRUE)
      port map (M1=>cnt_1, FXA=>'X', FXB=>'X', A1=>'X', B1=>'X', C1=>'X', 
                D1=>'X', DI1=>'X', DI0=>'X', A0=>'X', B0=>'X', C0=>'X', 
                D0=>'X', M0=>cnt_0, CE=>'X', CLK=>clk_c, LSR=>'X', OFX1=>open, 
                F1=>open, Q1=>dut_reg_fifo_data_1, OFX0=>open, F0=>open, 
                Q0=>dut_reg_fifo_data_0);
    dut_reg_inst_SLICE_110I: SLOGICB
      generic map (M0MUX=>"SIG", M1MUX=>"SIG", CLKMUX=>"SIG", CEMUX=>"VHI", 
                   SRMODE=>"ASYNC", CHECK_M1=>TRUE, CHECK_M0=>TRUE)
      port map (M1=>cnt_3, FXA=>'X', FXB=>'X', A1=>'X', B1=>'X', C1=>'X', 
                D1=>'X', DI1=>'X', DI0=>'X', A0=>'X', B0=>'X', C0=>'X', 
                D0=>'X', M0=>cnt_2, CE=>'X', CLK=>clk_c, LSR=>'X', OFX1=>open, 
                F1=>open, Q1=>dut_reg_fifo_data_3, OFX0=>open, F0=>open, 
                Q0=>dut_reg_fifo_data_2);
    dut_reg_inst_SLICE_111I: SLOGICB
      generic map (M0MUX=>"SIG", M1MUX=>"SIG", CLKMUX=>"SIG", CEMUX=>"VHI", 
                   SRMODE=>"ASYNC", CHECK_M1=>TRUE, CHECK_M0=>TRUE)
      port map (M1=>cnt_5, FXA=>'X', FXB=>'X', A1=>'X', B1=>'X', C1=>'X', 
                D1=>'X', DI1=>'X', DI0=>'X', A0=>'X', B0=>'X', C0=>'X', 
                D0=>'X', M0=>cnt_4, CE=>'X', CLK=>clk_c, LSR=>'X', OFX1=>open, 
                F1=>open, Q1=>dut_reg_fifo_data_5, OFX0=>open, F0=>open, 
                Q0=>dut_reg_fifo_data_4);
    dut_reg_inst_SLICE_112I: SLOGICB
      generic map (M0MUX=>"SIG", M1MUX=>"SIG", CLKMUX=>"SIG", CEMUX=>"VHI", 
                   SRMODE=>"ASYNC", CHECK_M1=>TRUE, CHECK_M0=>TRUE)
      port map (M1=>cnt_7, FXA=>'X', FXB=>'X', A1=>'X', B1=>'X', C1=>'X', 
                D1=>'X', DI1=>'X', DI0=>'X', A0=>'X', B0=>'X', C0=>'X', 
                D0=>'X', M0=>cnt_6, CE=>'X', CLK=>clk_c, LSR=>'X', OFX1=>open, 
                F1=>open, Q1=>dut_reg_fifo_data_7, OFX0=>open, F0=>open, 
                Q0=>dut_reg_fifo_data_6);
    dut_udp_inst_SLICE_114I: SLOGICB
      generic map (CLKMUX=>"SIG", CEMUX=>"VHI", LSRMUX=>"SIG", GSR=>"DISABLED", 
                   LUT0_INITVAL=>X"FEEE", LUT1_INITVAL=>X"FEEE", 
                   REG1_SD=>"VHI", REG0_SD=>"VHI", CHECK_DI1=>TRUE, 
                   CHECK_DI0=>TRUE, CHECK_LSR=>TRUE)
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_udp_inst_n2_adj_716, 
                B1=>dut_udp_inst_n5789, C1=>dut_udp_inst_next_idx_7_N_142_6, 
                D1=>dut_n318, DI1=>dut_udp_inst_next_idx_6, 
                DI0=>dut_udp_inst_next_idx_5, A0=>dut_udp_inst_n2_adj_717, 
                B0=>dut_udp_inst_n5801, C0=>dut_udp_inst_next_idx_7_N_142_5, 
                D0=>dut_n318, M0=>'X', CE=>'X', CLK=>clk_c, LSR=>rst_c, 
                OFX1=>open, F1=>dut_udp_inst_next_idx_6, 
                Q1=>dut_udp_inst_idx_6, OFX0=>open, 
                F0=>dut_udp_inst_next_idx_5, Q0=>dut_udp_inst_idx_5);
    dut_udp_inst_SLICE_115I: SLOGICB
      generic map (CLKMUX=>"SIG", CEMUX=>"VHI", LSRMUX=>"SIG", GSR=>"DISABLED", 
                   LUT0_INITVAL=>X"FEEE", LUT1_INITVAL=>X"C088", 
                   REG0_SD=>"VHI", CHECK_DI0=>TRUE, CHECK_LSR=>TRUE)
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_udp_inst_idx_7, 
                B1=>dut_n319, C1=>dut_udp_inst_next_idx_7_N_161_7, 
                D1=>dut_n6472, DI1=>'X', DI0=>dut_udp_inst_next_idx_7, 
                A0=>dut_udp_inst_n2, B0=>dut_udp_inst_n5781, 
                C0=>dut_udp_inst_next_idx_7_N_142_7, D0=>dut_n318, M0=>'X', 
                CE=>'X', CLK=>clk_c, LSR=>rst_c, OFX1=>open, 
                F1=>dut_udp_inst_n2, Q1=>open, OFX0=>open, 
                F0=>dut_udp_inst_next_idx_7, Q0=>dut_udp_inst_idx_7);
    dut_udp_inst_SLICE_116I: SLOGICB
      generic map (CLKMUX=>"SIG", CEMUX=>"VHI", LSRMUX=>"SIG", 
                   REG1_REGSET=>"SET", GSR=>"DISABLED", LUT0_INITVAL=>X"8888", 
                   LUT1_INITVAL=>X"CECE", REG1_SD=>"VHI", REG0_SD=>"VHI", 
                   CHECK_DI1=>TRUE, CHECK_DI0=>TRUE, CHECK_LSR=>TRUE)
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_udp_inst_n320, 
                B1=>dut_udp_inst_n315, C1=>dut_reg_fifo_almostfull, D1=>'X', 
                DI1=>dut_udp_inst_n1943, DI0=>dut_n6492, 
                A0=>dut_reg_fifo_empty, B0=>dut_n316, C0=>'X', D0=>'X', 
                M0=>'X', CE=>'X', CLK=>clk_c, LSR=>rst_c, OFX1=>open, 
                F1=>dut_udp_inst_n1943, Q1=>dut_udp_inst_n320, OFX0=>open, 
                F0=>dut_n6492, Q0=>dut_udp_inst_n315);
    SLICE_117I: SLOGICB
      generic map (CLKMUX=>"SIG", CEMUX=>"VHI", LSRMUX=>"SIG", 
                   REG0_REGSET=>"SET", GSR=>"DISABLED", LUT0_INITVAL=>X"5555", 
                   REG0_SD=>"VHI", CHECK_DI0=>TRUE, CHECK_LSR=>TRUE)
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>'X', B1=>'X', C1=>'X', 
                D1=>'X', DI1=>'X', DI0=>next_fifo_almostfull_N_83, 
                A0=>next_fifo_almostfull, B0=>'X', C0=>'X', D0=>'X', M0=>'X', 
                CE=>'X', CLK=>clk_c, LSR=>rst_c, OFX1=>open, F1=>open, 
                Q1=>open, OFX0=>open, F0=>next_fifo_almostfull_N_83, 
                Q0=>fifo_empty);
    dut_SLICE_118I: SLOGICB
      generic map (CLKMUX=>"SIG", CEMUX=>"VHI", LSRMUX=>"SIG", GSR=>"DISABLED", 
                   LUT0_INITVAL=>X"4F44", LUT1_INITVAL=>X"EEEE", 
                   REG0_SD=>"VHI", CHECK_DI0=>TRUE, CHECK_LSR=>TRUE)
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_udp_inst_n320, 
                B1=>dut_udp_inst_n315, C1=>'X', D1=>'X', DI1=>'X', 
                DI0=>dut_mac_inst_n1954, A0=>dut_n6493, B0=>dut_n425, 
                C0=>n6488, D0=>n424, M0=>'X', CE=>'X', CLK=>clk_c, LSR=>rst_c, 
                OFX1=>open, F1=>dut_n6493, Q1=>open, OFX0=>open, 
                F0=>dut_mac_inst_n1954, Q0=>n424);
    dut_udp_inst_i4884_SLICE_119I: SLOGICB
      generic map (M0MUX=>"SIG", LUT0_INITVAL=>X"E2C0", LUT1_INITVAL=>X"0D0D")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_idx_0, B1=>dut_idx_1, 
                C1=>dut_idx_2, D1=>'X', DI1=>'X', DI0=>'X', A0=>dut_n319, 
                B0=>dut_n318, C0=>dut_udp_inst_t_data_7_N_92_2, 
                D0=>dut_udp_inst_t_data_7_N_100_2, M0=>dut_n317, CE=>'X', 
                CLK=>'X', LSR=>'X', OFX1=>open, F1=>open, Q1=>open, 
                OFX0=>dut_udp_inst_n6201, F0=>open, Q0=>open);
    dut_udp_inst_i5030_SLICE_120I: SLOGICB
      generic map (M0MUX=>"SIG", LUT0_INITVAL=>X"1000", LUT1_INITVAL=>X"0100")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_idx_4, B1=>dut_idx_2, 
                C1=>dut_idx_3, D1=>dut_idx_0, DI1=>'X', DI0=>'X', 
                A0=>dut_idx_4, B0=>dut_idx_2, C0=>dut_idx_3, D0=>dut_idx_0, 
                M0=>dut_idx_1, CE=>'X', CLK=>'X', LSR=>'X', OFX1=>open, 
                F1=>open, Q1=>open, OFX0=>dut_udp_inst_t_data_7_N_92_4, 
                F0=>open, Q0=>open);
    dut_udp_inst_i924_SLICE_121I: SLOGICB
      generic map (M0MUX=>"SIG", LUT0_INITVAL=>X"E0E0", LUT1_INITVAL=>X"5454")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_idx_2, B1=>dut_idx_1, 
                C1=>dut_idx_0, D1=>'X', DI1=>'X', DI0=>'X', A0=>dut_n319, 
                B0=>dut_n318, C0=>dut_udp_inst_n6449, D0=>'X', M0=>dut_n317, 
                CE=>'X', CLK=>'X', LSR=>'X', OFX1=>open, F1=>open, Q1=>open, 
                OFX0=>dut_udp_inst_n2046, F0=>open, Q0=>open);
    dut_udp_inst_i918_SLICE_122I: SLOGICB
      generic map (M0MUX=>"SIG", LUT0_INITVAL=>X"C0E2", LUT1_INITVAL=>X"0606")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_idx_1, B1=>dut_idx_0, 
                C1=>dut_idx_2, D1=>'X', DI1=>'X', DI0=>'X', A0=>dut_n319, 
                B0=>dut_n318, C0=>dut_udp_inst_t_data_7_N_92_4, 
                D0=>dut_udp_inst_n6, M0=>dut_n317, CE=>'X', CLK=>'X', LSR=>'X', 
                OFX1=>open, F1=>open, Q1=>open, OFX0=>dut_udp_inst_n2040, 
                F0=>open, Q0=>open);
    dut_udp_inst_i4844_SLICE_123I: SLOGICB
      generic map (M0MUX=>"SIG", LUT0_INITVAL=>X"1391", LUT1_INITVAL=>X"1111")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_n318, B1=>dut_idx_2, 
                C1=>'X', D1=>'X', DI1=>'X', DI0=>'X', A0=>dut_n318, 
                B0=>dut_idx_3, C0=>dut_idx_2, D0=>dut_idx_4, M0=>dut_idx_1, 
                CE=>'X', CLK=>'X', LSR=>'X', OFX1=>open, F1=>open, Q1=>open, 
                OFX0=>dut_udp_inst_n6130, F0=>open, Q0=>open);
    dut_udp_inst_mux_383_i6_SLICE_124I: SLOGICB
      generic map (M0MUX=>"SIG", LUT0_INITVAL=>X"7173", LUT1_INITVAL=>X"A088")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_idx_0, 
                B1=>dut_udp_inst_n1981, C1=>dut_udp_inst_n6496, D1=>dut_idx_4, 
                DI1=>'X', DI0=>'X', A0=>dut_idx_2, B0=>dut_idx_3, 
                C0=>dut_idx_0, D0=>dut_idx_1, M0=>dut_n318, CE=>'X', CLK=>'X', 
                LSR=>'X', OFX1=>open, F1=>open, Q1=>open, 
                OFX0=>dut_udp_inst_n1218, F0=>open, Q0=>open);
    dut_udp_inst_mux_383_i1_SLICE_125I: SLOGICB
      generic map (M0MUX=>"SIG", LUT0_INITVAL=>X"4242", LUT1_INITVAL=>X"A0A3")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_udp_inst_n6437, 
                B1=>dut_udp_inst_n6502, C1=>dut_n318, D1=>dut_idx_3, DI1=>'X', 
                DI0=>'X', A0=>dut_idx_0, B0=>dut_idx_1, C0=>dut_idx_2, D0=>'X', 
                M0=>dut_udp_inst_n5951, CE=>'X', CLK=>'X', LSR=>'X', 
                OFX1=>open, F1=>open, Q1=>open, OFX0=>dut_udp_inst_n1223, 
                F0=>open, Q0=>open);
    dut_udp_inst_i5036_SLICE_126I: SLOGICB
      generic map (M0MUX=>"SIG", LUT0_INITVAL=>X"FFAC", LUT1_INITVAL=>X"FDFF")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_idx_4, B1=>dut_idx_2, 
                C1=>dut_idx_3, D1=>dut_idx_1, DI1=>'X', DI0=>'X', 
                A0=>dut_idx_4, B0=>dut_idx_2, C0=>dut_idx_3, D0=>dut_idx_1, 
                M0=>dut_idx_0, CE=>'X', CLK=>'X', LSR=>'X', OFX1=>open, 
                F1=>open, Q1=>open, OFX0=>dut_udp_inst_n6524, F0=>open, 
                Q0=>open);
    dut_udp_inst_i5032_SLICE_127I: SLOGICB
      generic map (M0MUX=>"SIG", LUT0_INITVAL=>X"1001", LUT1_INITVAL=>X"1000")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_idx_2, B1=>dut_idx_3, 
                C1=>dut_idx_0, D1=>dut_idx_1, DI1=>'X', DI0=>'X', 
                A0=>dut_idx_2, B0=>dut_idx_3, C0=>dut_idx_0, D0=>dut_idx_1, 
                M0=>dut_idx_4, CE=>'X', CLK=>'X', LSR=>'X', OFX1=>open, 
                F1=>open, Q1=>open, OFX0=>dut_udp_inst_t_data_7_N_92_2, 
                F0=>open, Q0=>open);
    dut_mac_inst_i4895_SLICE_128I: SLOGICB
      generic map (M0MUX=>"SIG", LUT0_INITVAL=>X"3535", LUT1_INITVAL=>X"1B1B")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_mac_inst_crc_cnt_0, 
                B1=>dut_mac_inst_crc_reg_22, C1=>dut_mac_inst_crc_reg_30, 
                D1=>'X', DI1=>'X', DI0=>'X', A0=>dut_mac_inst_crc_reg_6, 
                B0=>dut_mac_inst_crc_reg_14, C0=>dut_mac_inst_crc_cnt_0, 
                D0=>'X', M0=>dut_mac_inst_crc_cnt_1, CE=>'X', CLK=>'X', 
                LSR=>'X', OFX1=>open, F1=>open, Q1=>open, 
                OFX0=>dut_mac_inst_gmii_txd_7_N_202_6, F0=>open, Q0=>open);
    dut_mac_inst_i5026_SLICE_129I: SLOGICB
      generic map (M0MUX=>"SIG", LUT0_INITVAL=>X"3535", LUT1_INITVAL=>X"1B1B")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_mac_inst_crc_cnt_0, 
                B1=>dut_mac_inst_crc_reg_23, C1=>dut_crc_reg_31, D1=>'X', 
                DI1=>'X', DI0=>'X', A0=>dut_mac_inst_crc_reg_7, 
                B0=>dut_mac_inst_crc_reg_15, C0=>dut_mac_inst_crc_cnt_0, 
                D0=>'X', M0=>dut_mac_inst_crc_cnt_1, CE=>'X', CLK=>'X', 
                LSR=>'X', OFX1=>open, F1=>open, Q1=>open, 
                OFX0=>dut_mac_inst_gmii_txd_7_N_202_7, F0=>open, Q0=>open);
    dut_mac_inst_i4995_SLICE_130I: SLOGICB
      generic map (M0MUX=>"SIG", LUT0_INITVAL=>X"3535", LUT1_INITVAL=>X"1B1B")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_mac_inst_crc_cnt_0, 
                B1=>dut_mac_inst_crc_reg_16, C1=>dut_mac_inst_crc_reg_24, 
                D1=>'X', DI1=>'X', DI0=>'X', A0=>dut_mac_inst_crc_reg_0, 
                B0=>dut_mac_inst_crc_reg_8, C0=>dut_mac_inst_crc_cnt_0, 
                D0=>'X', M0=>dut_mac_inst_crc_cnt_1, CE=>'X', CLK=>'X', 
                LSR=>'X', OFX1=>open, F1=>open, Q1=>open, 
                OFX0=>dut_mac_inst_gmii_txd_7_N_202_0, F0=>open, Q0=>open);
    dut_mac_inst_i4985_SLICE_131I: SLOGICB
      generic map (M0MUX=>"SIG", LUT0_INITVAL=>X"3535", LUT1_INITVAL=>X"1B1B")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_mac_inst_crc_cnt_0, 
                B1=>dut_mac_inst_crc_reg_20, C1=>dut_mac_inst_crc_reg_28, 
                D1=>'X', DI1=>'X', DI0=>'X', A0=>dut_mac_inst_crc_reg_4, 
                B0=>dut_crc_reg_12, C0=>dut_mac_inst_crc_cnt_0, D0=>'X', 
                M0=>dut_mac_inst_crc_cnt_1, CE=>'X', CLK=>'X', LSR=>'X', 
                OFX1=>open, F1=>open, Q1=>open, 
                OFX0=>dut_mac_inst_gmii_txd_7_N_202_4, F0=>open, Q0=>open);
    dut_mac_inst_i4840_SLICE_132I: SLOGICB
      generic map (M0MUX=>"SIG", LUT0_INITVAL=>X"3535", LUT1_INITVAL=>X"1B1B")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_mac_inst_crc_cnt_0, 
                B1=>dut_mac_inst_crc_reg_18, C1=>dut_mac_inst_crc_reg_26, 
                D1=>'X', DI1=>'X', DI0=>'X', A0=>dut_mac_inst_crc_reg_2, 
                B0=>dut_mac_inst_crc_reg_10, C0=>dut_mac_inst_crc_cnt_0, 
                D0=>'X', M0=>dut_mac_inst_crc_cnt_1, CE=>'X', CLK=>'X', 
                LSR=>'X', OFX1=>open, F1=>open, Q1=>open, 
                OFX0=>dut_mac_inst_gmii_txd_7_N_202_2, F0=>open, Q0=>open);
    dut_mac_inst_i4972_SLICE_133I: SLOGICB
      generic map (M0MUX=>"SIG", LUT0_INITVAL=>X"3535", LUT1_INITVAL=>X"1B1B")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_mac_inst_crc_cnt_0, 
                B1=>dut_mac_inst_crc_reg_17, C1=>dut_mac_inst_crc_reg_25, 
                D1=>'X', DI1=>'X', DI0=>'X', A0=>dut_mac_inst_crc_reg_1, 
                B0=>dut_crc_reg_9, C0=>dut_mac_inst_crc_cnt_0, D0=>'X', 
                M0=>dut_mac_inst_crc_cnt_1, CE=>'X', CLK=>'X', LSR=>'X', 
                OFX1=>open, F1=>open, Q1=>open, 
                OFX0=>dut_mac_inst_gmii_txd_7_N_202_1, F0=>open, Q0=>open);
    dut_mac_inst_i4969_SLICE_134I: SLOGICB
      generic map (M0MUX=>"SIG", LUT0_INITVAL=>X"3535", LUT1_INITVAL=>X"1B1B")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_mac_inst_crc_cnt_0, 
                B1=>dut_mac_inst_crc_reg_21, C1=>dut_mac_inst_crc_reg_29, 
                D1=>'X', DI1=>'X', DI0=>'X', A0=>dut_mac_inst_crc_reg_5, 
                B0=>dut_mac_inst_crc_reg_13, C0=>dut_mac_inst_crc_cnt_0, 
                D0=>'X', M0=>dut_mac_inst_crc_cnt_1, CE=>'X', CLK=>'X', 
                LSR=>'X', OFX1=>open, F1=>open, Q1=>open, 
                OFX0=>dut_mac_inst_gmii_txd_7_N_202_5, F0=>open, Q0=>open);
    dut_mac_inst_i4962_SLICE_135I: SLOGICB
      generic map (M0MUX=>"SIG", LUT0_INITVAL=>X"3535", LUT1_INITVAL=>X"1B1B")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_mac_inst_crc_cnt_0, 
                B1=>dut_mac_inst_crc_reg_19, C1=>dut_mac_inst_crc_reg_27, 
                D1=>'X', DI1=>'X', DI0=>'X', A0=>dut_mac_inst_crc_reg_3, 
                B0=>dut_mac_inst_crc_reg_11, C0=>dut_mac_inst_crc_cnt_0, 
                D0=>'X', M0=>dut_mac_inst_crc_cnt_1, CE=>'X', CLK=>'X', 
                LSR=>'X', OFX1=>open, F1=>open, Q1=>open, 
                OFX0=>dut_mac_inst_gmii_txd_7_N_202_3, F0=>open, Q0=>open);
    dut_udp_inst_SLICE_136I: SLOGICB
      generic map (LUT0_INITVAL=>X"6660", LUT1_INITVAL=>X"FFF7")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_idx_1, B1=>dut_idx_0, 
                C1=>dut_idx_3, D1=>dut_udp_inst_n2244, DI1=>'X', DI0=>'X', 
                A0=>dut_idx_1, B0=>dut_idx_0, C0=>dut_udp_inst_n6510, 
                D0=>dut_udp_inst_n6478, M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', 
                OFX1=>open, F1=>dut_udp_inst_n6478, Q1=>open, OFX0=>open, 
                F0=>dut_udp_inst_next_idx_7_N_183_1, Q0=>open);
    dut_udp_inst_SLICE_137I: SLOGICB
      generic map (LUT0_INITVAL=>X"60AA", LUT1_INITVAL=>X"FDFD")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_idx_4, 
                B1=>dut_udp_inst_n6478, C1=>dut_idx_2, D1=>'X', DI1=>'X', 
                DI0=>'X', A0=>dut_idx_2, B0=>dut_udp_inst_n6494, C0=>dut_n15, 
                D0=>dut_n6472, M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', 
                OFX1=>open, F1=>dut_n15, Q1=>open, OFX0=>open, 
                F0=>dut_udp_inst_next_idx_7_N_142_2, Q0=>open);
    dut_SLICE_138I: SLOGICB
      generic map (LUT0_INITVAL=>X"3767", LUT1_INITVAL=>X"CA0A")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_t_data_7_N_100_3, 
                B1=>dut_idx_0, C1=>dut_n318, D1=>dut_mac_inst_crc_inst_n6403, 
                DI1=>'X', DI0=>'X', A0=>dut_idx_1, B0=>dut_idx_2, 
                C0=>dut_idx_3, D0=>dut_idx_0, M0=>'X', CE=>'X', CLK=>'X', 
                LSR=>'X', OFX1=>open, F1=>dut_mac_inst_crc_inst_n5917, 
                Q1=>open, OFX0=>open, F0=>dut_t_data_7_N_100_3, Q0=>open);
    dut_udp_inst_SLICE_139I: SLOGICB
      generic map (LUT0_INITVAL=>X"6660", LUT1_INITVAL=>X"C088")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_idx_3, B1=>dut_n317, 
                C1=>dut_udp_inst_next_idx_7_N_183_3, D1=>dut_n6472, DI1=>'X', 
                DI0=>'X', A0=>dut_idx_3, B0=>dut_udp_inst_n6485, 
                C0=>dut_udp_inst_n6510, D0=>dut_udp_inst_n6478, M0=>'X', 
                CE=>'X', CLK=>'X', LSR=>'X', OFX1=>open, 
                F1=>dut_udp_inst_n4_adj_719, Q1=>open, OFX0=>open, 
                F0=>dut_udp_inst_next_idx_7_N_183_3, Q0=>open);
    dut_udp_inst_SLICE_140I: SLOGICB
      generic map (LUT0_INITVAL=>X"60AA", LUT1_INITVAL=>X"FFEF")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_udp_inst_n6511, 
                B1=>dut_udp_inst_n6510, C1=>dut_idx_3, D1=>dut_udp_inst_n2244, 
                DI1=>'X', DI0=>'X', A0=>dut_idx_3, B0=>dut_udp_inst_n6485, 
                C0=>dut_n15_adj_721, D0=>dut_n6472, M0=>'X', CE=>'X', CLK=>'X', 
                LSR=>'X', OFX1=>open, F1=>dut_n15_adj_721, Q1=>open, 
                OFX0=>open, F0=>dut_udp_inst_next_idx_7_N_150_3, Q0=>open);
    dut_udp_inst_SLICE_141I: SLOGICB
      generic map (LUT0_INITVAL=>X"ECA0", LUT1_INITVAL=>X"CA0A")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_udp_inst_idx_7, 
                B1=>dut_udp_inst_n150, C1=>dut_n6472, D1=>dut_udp_inst_n6473, 
                DI1=>'X', DI0=>'X', A0=>dut_udp_inst_next_idx_7_N_134_7, 
                B0=>dut_udp_inst_idx_7, C0=>dut_n317, D0=>dut_udp_inst_n926, 
                M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', OFX1=>open, 
                F1=>dut_udp_inst_next_idx_7_N_134_7, Q1=>open, OFX0=>open, 
                F0=>dut_udp_inst_n5781, Q0=>open);
    dut_udp_inst_SLICE_142I: SLOGICB
      generic map (LUT0_INITVAL=>X"CA0A", LUT1_INITVAL=>X"6AAA")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_udp_inst_idx_7, 
                B1=>dut_udp_inst_n6494, C1=>dut_udp_inst_n5849, 
                D1=>dut_udp_inst_n5845, DI1=>'X', DI0=>'X', 
                A0=>dut_udp_inst_idx_7, B0=>dut_udp_inst_n150, C0=>dut_n6472, 
                D0=>dut_n15, M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', OFX1=>open, 
                F1=>dut_udp_inst_n150, Q1=>open, OFX0=>open, 
                F0=>dut_udp_inst_next_idx_7_N_142_7, Q0=>open);
    dut_udp_inst_SLICE_143I: SLOGICB
      generic map (LUT0_INITVAL=>X"ECA0", LUT1_INITVAL=>X"CA0A")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_udp_inst_idx_6, 
                B1=>dut_udp_inst_n151, C1=>dut_n6472, D1=>dut_udp_inst_n6473, 
                DI1=>'X', DI0=>'X', A0=>dut_udp_inst_next_idx_7_N_134_6, 
                B0=>dut_udp_inst_idx_6, C0=>dut_n317, D0=>dut_udp_inst_n926, 
                M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', OFX1=>open, 
                F1=>dut_udp_inst_next_idx_7_N_134_6, Q1=>open, OFX0=>open, 
                F0=>dut_udp_inst_n5789, Q0=>open);
    dut_udp_inst_SLICE_144I: SLOGICB
      generic map (LUT0_INITVAL=>X"CA0A", LUT1_INITVAL=>X"6AAA")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_udp_inst_idx_6, 
                B1=>dut_udp_inst_n6508, C1=>dut_udp_inst_n6502, 
                D1=>dut_udp_inst_n5835, DI1=>'X', DI0=>'X', 
                A0=>dut_udp_inst_idx_6, B0=>dut_udp_inst_n151, C0=>dut_n6472, 
                D0=>dut_n15, M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', OFX1=>open, 
                F1=>dut_udp_inst_n151, Q1=>open, OFX0=>open, 
                F0=>dut_udp_inst_next_idx_7_N_142_6, Q0=>open);
    dut_udp_inst_SLICE_145I: SLOGICB
      generic map (LUT0_INITVAL=>X"ECA0", LUT1_INITVAL=>X"CA0A")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_udp_inst_idx_5, 
                B1=>dut_udp_inst_n152, C1=>dut_n6472, D1=>dut_udp_inst_n6473, 
                DI1=>'X', DI0=>'X', A0=>dut_udp_inst_next_idx_7_N_134_5, 
                B0=>dut_udp_inst_idx_5, C0=>dut_n317, D0=>dut_udp_inst_n926, 
                M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', OFX1=>open, 
                F1=>dut_udp_inst_next_idx_7_N_134_5, Q1=>open, OFX0=>open, 
                F0=>dut_udp_inst_n5801, Q0=>open);
    dut_udp_inst_SLICE_146I: SLOGICB
      generic map (LUT0_INITVAL=>X"CA0A", LUT1_INITVAL=>X"6AAA")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_udp_inst_idx_5, 
                B1=>dut_udp_inst_n5845, C1=>dut_udp_inst_n5831, D1=>dut_idx_1, 
                DI1=>'X', DI0=>'X', A0=>dut_udp_inst_idx_5, 
                B0=>dut_udp_inst_n152, C0=>dut_n6472, D0=>dut_n15, M0=>'X', 
                CE=>'X', CLK=>'X', LSR=>'X', OFX1=>open, F1=>dut_udp_inst_n152, 
                Q1=>open, OFX0=>open, F0=>dut_udp_inst_next_idx_7_N_142_5, 
                Q0=>open);
    dut_udp_inst_SLICE_147I: SLOGICB
      generic map (LUT0_INITVAL=>X"C088", LUT1_INITVAL=>X"33C8")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_idx_4, B1=>dut_idx_2, 
                C1=>dut_udp_inst_n6478, D1=>dut_udp_inst_n6494, DI1=>'X', 
                DI0=>'X', A0=>dut_idx_2, B0=>dut_n317, 
                C0=>dut_udp_inst_next_idx_7_N_183_2, D0=>dut_n6472, M0=>'X', 
                CE=>'X', CLK=>'X', LSR=>'X', OFX1=>open, 
                F1=>dut_udp_inst_next_idx_7_N_183_2, Q1=>open, OFX0=>open, 
                F0=>dut_udp_inst_n4, Q0=>open);
    dut_udp_inst_SLICE_148I: SLOGICB
      generic map (LUT0_INITVAL=>X"8000", LUT1_INITVAL=>X"51AA")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_idx_4, B1=>dut_idx_2, 
                C1=>dut_udp_inst_n6478, D1=>dut_udp_inst_n6486, DI1=>'X', 
                DI0=>'X', A0=>dut_idx_3, B0=>dut_idx_0, C0=>dut_idx_2, 
                D0=>dut_idx_1, M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', 
                OFX1=>open, F1=>dut_udp_inst_next_idx_7_N_183_4, Q1=>open, 
                OFX0=>open, F0=>dut_udp_inst_n6486, Q0=>open);
    dut_mac_inst_SLICE_149I: SLOGICB
      generic map (LUT0_INITVAL=>X"FFF2", LUT1_INITVAL=>X"CC4C")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_mac_inst_n6507, 
                B1=>dut_mac_inst_n420, C1=>dut_mac_inst_ifg_cnt_3, 
                D1=>dut_mac_inst_ifg_cnt_2, DI1=>'X', DI0=>'X', 
                A0=>dut_mac_inst_n6487, B0=>dut_mac_inst_n420, C0=>rst_c, 
                D0=>dut_mac_inst_n3184, M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', 
                OFX1=>open, F1=>dut_mac_inst_n3184, Q1=>open, OFX0=>open, 
                F0=>dut_mac_inst_clk_c_enable_17, Q0=>open);
    dut_udp_inst_SLICE_150I: SLOGICB
      generic map (LUT0_INITVAL=>X"FEFE", LUT1_INITVAL=>X"FFFD")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_udp_inst_n6494, 
                B1=>dut_udp_inst_n2244, C1=>dut_idx_3, D1=>dut_udp_inst_n6510, 
                DI1=>'X', DI0=>'X', A0=>dut_udp_inst_idx_6, 
                B0=>dut_udp_inst_idx_5, C0=>dut_udp_inst_idx_7, D0=>'X', 
                M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', OFX1=>open, 
                F1=>dut_udp_inst_n6473, Q1=>open, OFX0=>open, 
                F0=>dut_udp_inst_n2244, Q0=>open);
    dut_SLICE_151I: SLOGICB
      generic map (LUT0_INITVAL=>X"60AA", LUT1_INITVAL=>X"F8F0")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_mac_inst_pre_cnt_2, 
                B1=>dut_mac_inst_n6509, C1=>dut_n423, D1=>n424, DI1=>'X', 
                DI0=>'X', A0=>dut_idx_2, B0=>dut_udp_inst_n6494, 
                C0=>dut_n15_adj_721, D0=>dut_n6472, M0=>'X', CE=>'X', CLK=>'X', 
                LSR=>'X', OFX1=>open, F1=>dut_n6472, Q1=>open, OFX0=>open, 
                F0=>dut_udp_inst_next_idx_7_N_150_2, Q0=>open);
    dut_udp_inst_SLICE_152I: SLOGICB
      generic map (LUT0_INITVAL=>X"1D1D", LUT1_INITVAL=>X"CAC0")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_udp_inst_n6446, 
                B1=>dut_udp_inst_t_data_7_N_84_6, C1=>dut_n317, D1=>dut_n6497, 
                DI1=>'X', DI0=>'X', A0=>dut_udp_inst_n6490, B0=>dut_n318, 
                C0=>dut_udp_inst_n6524, D0=>'X', M0=>'X', CE=>'X', CLK=>'X', 
                LSR=>'X', OFX1=>open, F1=>dut_udp_inst_n2036, Q1=>open, 
                OFX0=>open, F0=>dut_udp_inst_n6446, Q0=>open);
    dut_udp_inst_SLICE_153I: SLOGICB
      generic map (LUT0_INITVAL=>X"60AA", LUT1_INITVAL=>X"8080")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_idx_1, B1=>dut_idx_0, 
                C1=>dut_idx_2, D1=>'X', DI1=>'X', DI0=>'X', A0=>dut_idx_3, 
                B0=>dut_udp_inst_n6485, C0=>dut_n15, D0=>dut_n6472, M0=>'X', 
                CE=>'X', CLK=>'X', LSR=>'X', OFX1=>open, 
                F1=>dut_udp_inst_n6485, Q1=>open, OFX0=>open, 
                F0=>dut_udp_inst_next_idx_7_N_142_3, Q0=>open);
    dut_udp_inst_SLICE_154I: SLOGICB
      generic map (LUT0_INITVAL=>X"60AA", LUT1_INITVAL=>X"ECA0")
      port map (M1=>'X', FXA=>'X', FXB=>'X', 
                A1=>dut_udp_inst_next_idx_7_N_150_4, 
                B1=>dut_udp_inst_next_idx_7_N_142_4, C1=>dut_n319, 
                D1=>dut_n318, DI1=>'X', DI0=>'X', A0=>dut_idx_4, 
                B0=>dut_udp_inst_n6486, C0=>dut_n15, D0=>dut_n6472, M0=>'X', 
                CE=>'X', CLK=>'X', LSR=>'X', OFX1=>open, 
                F1=>dut_udp_inst_n5795, Q1=>open, OFX0=>open, 
                F0=>dut_udp_inst_next_idx_7_N_142_4, Q0=>open);
    dut_udp_inst_SLICE_155I: SLOGICB
      generic map (LUT0_INITVAL=>X"F088", LUT1_INITVAL=>X"EEEE")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_n319, B1=>dut_n318, 
                C1=>'X', D1=>'X', DI1=>'X', DI0=>'X', A0=>dut_udp_inst_n6130, 
                B0=>dut_n6497, C0=>dut_udp_inst_t_data_7_N_84_6, D0=>dut_n317, 
                M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', OFX1=>open, 
                F1=>dut_n6497, Q1=>open, OFX0=>open, F0=>dut_udp_inst_n6447, 
                Q0=>open);
    dut_udp_inst_SLICE_156I: SLOGICB
      generic map (LUT0_INITVAL=>X"4142", LUT1_INITVAL=>X"CA0A")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_t_data_7_N_100_3, 
                B1=>dut_idx_0, C1=>dut_n318, D1=>dut_udp_inst_n6152, DI1=>'X', 
                DI0=>'X', A0=>dut_idx_4, B0=>dut_idx_2, C0=>dut_idx_3, 
                D0=>dut_idx_1, M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', 
                OFX1=>open, F1=>dut_udp_inst_n1220, Q1=>open, OFX0=>open, 
                F0=>dut_udp_inst_n6152, Q0=>open);
    dut_SLICE_157I: SLOGICB
      generic map (LUT0_INITVAL=>X"CAC0", LUT1_INITVAL=>X"2DD2")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_udp_tdata_0, 
                B1=>dut_n6484, C1=>dut_mac_inst_crc_reg_21, 
                D1=>dut_mac_inst_n5124, DI1=>'X', DI0=>'X', 
                A0=>dut_udp_inst_n5625, B0=>dut_reg_fifo_data_0, C0=>dut_n316, 
                D0=>dut_udp_inst_n1223, M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', 
                OFX1=>open, F1=>dut_mac_inst_crc_next_13, Q1=>open, OFX0=>open, 
                F0=>dut_udp_tdata_0, Q0=>open);
    dut_SLICE_158I: SLOGICB
      generic map (LUT0_INITVAL=>X"CACA", LUT1_INITVAL=>X"A9A6")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_mac_inst_crc_reg_4, 
                B1=>dut_udp_tdata_4, C1=>dut_n6484, D1=>dut_n6468, DI1=>'X', 
                DI0=>'X', A0=>dut_udp_inst_n2040, B0=>dut_reg_fifo_data_4, 
                C0=>dut_n316, D0=>'X', M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', 
                OFX1=>open, F1=>dut_mac_inst_crc_inst_n6459, Q1=>open, 
                OFX0=>open, F0=>dut_udp_tdata_4, Q0=>open);
    dut_udp_inst_SLICE_159I: SLOGICB
      generic map (LUT0_INITVAL=>X"0121", LUT1_INITVAL=>X"2222")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_udp_inst_n6436, 
                B1=>dut_idx_2, C1=>'X', D1=>'X', DI1=>'X', DI0=>'X', 
                A0=>dut_idx_4, B0=>dut_idx_0, C0=>dut_idx_1, D0=>dut_idx_3, 
                M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', OFX1=>open, 
                F1=>dut_udp_inst_n6437, Q1=>open, OFX0=>open, 
                F0=>dut_udp_inst_n6436, Q0=>open);
    dut_udp_inst_SLICE_160I: SLOGICB
      generic map (LUT0_INITVAL=>X"C088", LUT1_INITVAL=>X"8888")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_udp_inst_n151, 
                B1=>dut_n15_adj_721, C1=>'X', D1=>'X', DI1=>'X', DI0=>'X', 
                A0=>dut_udp_inst_idx_6, B0=>dut_n319, 
                C0=>dut_udp_inst_next_idx_7_N_161_6, D0=>dut_n6472, M0=>'X', 
                CE=>'X', CLK=>'X', LSR=>'X', OFX1=>open, 
                F1=>dut_udp_inst_next_idx_7_N_161_6, Q1=>open, OFX0=>open, 
                F0=>dut_udp_inst_n2_adj_716, Q0=>open);
    dut_udp_inst_SLICE_161I: SLOGICB
      generic map (LUT0_INITVAL=>X"C088", LUT1_INITVAL=>X"8888")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_udp_inst_n152, 
                B1=>dut_n15_adj_721, C1=>'X', D1=>'X', DI1=>'X', DI0=>'X', 
                A0=>dut_udp_inst_idx_5, B0=>dut_n319, 
                C0=>dut_udp_inst_next_idx_7_N_161_5, D0=>dut_n6472, M0=>'X', 
                CE=>'X', CLK=>'X', LSR=>'X', OFX1=>open, 
                F1=>dut_udp_inst_next_idx_7_N_161_5, Q1=>open, OFX0=>open, 
                F0=>dut_udp_inst_n2_adj_717, Q0=>open);
    dut_udp_inst_SLICE_162I: SLOGICB
      generic map (LUT0_INITVAL=>X"075F", LUT1_INITVAL=>X"7430")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_idx_4, B1=>dut_n318, 
                C1=>dut_udp_inst_n6150, D1=>dut_udp_inst_n6486, DI1=>'X', 
                DI0=>'X', A0=>dut_idx_0, B0=>dut_idx_1, C0=>dut_idx_3, 
                D0=>dut_idx_2, M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', 
                OFX1=>open, F1=>dut_udp_inst_n6449, Q1=>open, OFX0=>open, 
                F0=>dut_udp_inst_n6150, Q0=>open);
    dut_udp_inst_SLICE_163I: SLOGICB
      generic map (LUT0_INITVAL=>X"ECA0", LUT1_INITVAL=>X"60AA")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_idx_1, B1=>dut_idx_0, 
                C1=>dut_n15_adj_721, D1=>dut_n6472, DI1=>'X', DI0=>'X', 
                A0=>dut_udp_inst_next_idx_7_N_150_1, 
                B0=>dut_udp_inst_next_idx_7_N_142_1, C0=>dut_n319, 
                D0=>dut_n318, M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', OFX1=>open, 
                F1=>dut_udp_inst_next_idx_7_N_150_1, Q1=>open, OFX0=>open, 
                F0=>dut_udp_inst_n5809, Q0=>open);
    dut_udp_inst_SLICE_164I: SLOGICB
      generic map (LUT0_INITVAL=>X"CAC0", LUT1_INITVAL=>X"00CA")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_udp_inst_n2042, 
                B1=>dut_reg_fifo_data_3, C1=>dut_n316, D1=>dut_n6493, DI1=>'X', 
                DI0=>'X', A0=>dut_udp_inst_n1220, B0=>dut_t_data_7_N_84_5, 
                C0=>dut_n317, D0=>dut_n6497, M0=>'X', CE=>'X', CLK=>'X', 
                LSR=>'X', OFX1=>open, F1=>dut_gmii_txd_7_N_210_3, Q1=>open, 
                OFX0=>open, F0=>dut_udp_inst_n2042, Q0=>open);
    dut_SLICE_165I: SLOGICB
      generic map (LUT0_INITVAL=>X"CACA", LUT1_INITVAL=>X"B4F0")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_n6493, B1=>dut_n423, 
                C1=>dut_mac_inst_crc_reg_3, D1=>dut_n6468, DI1=>'X', DI0=>'X', 
                A0=>dut_udp_inst_n2042, B0=>dut_reg_fifo_data_3, C0=>dut_n316, 
                D0=>'X', M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', OFX1=>open, 
                F1=>dut_mac_inst_n2265, Q1=>open, OFX0=>open, F0=>dut_n6468, 
                Q0=>open);
    dut_SLICE_166I: SLOGICB
      generic map (LUT0_INITVAL=>X"CACA", LUT1_INITVAL=>X"0ACA")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>n424, B1=>dut_udp_tdata_2, 
                C1=>dut_n423, D1=>dut_n6493, DI1=>'X', DI0=>'X', 
                A0=>dut_udp_inst_n6201, B0=>dut_reg_fifo_data_2, C0=>dut_n316, 
                D0=>'X', M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', OFX1=>open, 
                F1=>dut_mac_inst_n2018, Q1=>open, OFX0=>open, 
                F0=>dut_udp_tdata_2, Q0=>open);
    dut_SLICE_167I: SLOGICB
      generic map (LUT0_INITVAL=>X"00CA", LUT1_INITVAL=>X"6996")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_mac_inst_n6465, 
                B1=>dut_n6464, C1=>dut_mac_inst_crc_reg_3, 
                D1=>dut_mac_inst_n2250, DI1=>'X', DI0=>'X', 
                A0=>dut_udp_inst_n2042, B0=>dut_reg_fifo_data_3, C0=>dut_n316, 
                D0=>dut_n6484, M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', 
                OFX1=>open, F1=>dut_mac_inst_crc_inst_n5141, Q1=>open, 
                OFX0=>open, F0=>dut_n6464, Q0=>open);
    dut_SLICE_168I: SLOGICB
      generic map (LUT0_INITVAL=>X"2828", LUT1_INITVAL=>X"CAC0")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_n6497, 
                B1=>dut_t_data_7_N_84_5, C1=>dut_n317, 
                D1=>dut_mac_inst_crc_inst_n5917, DI1=>'X', DI0=>'X', 
                A0=>dut_idx_0, B0=>dut_idx_2, C0=>dut_idx_1, D0=>'X', M0=>'X', 
                CE=>'X', CLK=>'X', LSR=>'X', OFX1=>open, 
                F1=>dut_mac_inst_crc_inst_n18, Q1=>open, OFX0=>open, 
                F0=>dut_t_data_7_N_84_5, Q0=>open);
    dut_SLICE_169I: SLOGICB
      generic map (LUT0_INITVAL=>X"CACA", LUT1_INITVAL=>X"2DD2")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_n6469, B1=>dut_n6484, 
                C1=>dut_mac_inst_crc_reg_17, D1=>dut_mac_inst_crc_reg_7, 
                DI1=>'X', DI0=>'X', A0=>dut_udp_inst_n6447, 
                B0=>dut_reg_fifo_data_7, C0=>dut_n316, D0=>'X', M0=>'X', 
                CE=>'X', CLK=>'X', LSR=>'X', OFX1=>open, F1=>dut_n6463, 
                Q1=>open, OFX0=>open, F0=>dut_n6469, Q0=>open);
    dut_SLICE_170I: SLOGICB
      generic map (LUT0_INITVAL=>X"00CA", LUT1_INITVAL=>X"6996")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_n6457, B1=>dut_n6467, 
                C1=>dut_mac_inst_crc_reg_1, D1=>dut_mac_inst_crc_reg_7, 
                DI1=>'X', DI0=>'X', A0=>dut_udp_inst_n6447, 
                B0=>dut_reg_fifo_data_7, C0=>dut_n316, D0=>dut_n6484, M0=>'X', 
                CE=>'X', CLK=>'X', LSR=>'X', OFX1=>open, F1=>dut_crc_next_31, 
                Q1=>open, OFX0=>open, F0=>dut_n6467, Q0=>open);
    dut_SLICE_171I: SLOGICB
      generic map (LUT0_INITVAL=>X"CACA", LUT1_INITVAL=>X"B4F0")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_n6493, B1=>dut_n423, 
                C1=>dut_mac_inst_crc_reg_5, D1=>dut_n6461, DI1=>'X', DI0=>'X', 
                A0=>dut_udp_inst_n2038, B0=>dut_reg_fifo_data_5, C0=>dut_n316, 
                D0=>'X', M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', OFX1=>open, 
                F1=>dut_mac_inst_n9, Q1=>open, OFX0=>open, F0=>dut_n6461, 
                Q0=>open);
    dut_SLICE_172I: SLOGICB
      generic map (LUT0_INITVAL=>X"1000", LUT1_INITVAL=>X"6996")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_mac_inst_crc_reg_6, 
                B1=>dut_n6456, C1=>dut_mac_inst_n2250, D1=>dut_n6457, DI1=>'X', 
                DI0=>'X', A0=>dut_udp_inst_n320, B0=>dut_udp_inst_n315, 
                C0=>dut_udp_tdata_1, D0=>dut_n423, M0=>'X', CE=>'X', CLK=>'X', 
                LSR=>'X', OFX1=>open, F1=>dut_mac_inst_crc_inst_n12, Q1=>open, 
                OFX0=>open, F0=>dut_n6457, Q0=>open);
    dut_SLICE_173I: SLOGICB
      generic map (LUT0_INITVAL=>X"1010", LUT1_INITVAL=>X"E2C0")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_n423, 
                B1=>dut_mac_inst_n421, C1=>dut_mac_inst_gmii_txd_7_N_202_1, 
                D1=>dut_gmii_txd_7_N_210_1, DI1=>'X', DI0=>'X', 
                A0=>dut_udp_inst_n320, B0=>dut_udp_inst_n315, 
                C0=>dut_udp_tdata_1, D0=>'X', M0=>'X', CE=>'X', CLK=>'X', 
                LSR=>'X', OFX1=>open, F1=>dut_gmii_txd_1, Q1=>open, OFX0=>open, 
                F0=>dut_gmii_txd_7_N_210_1, Q0=>open);
    dut_SLICE_174I: SLOGICB
      generic map (LUT0_INITVAL=>X"00CA", LUT1_INITVAL=>X"6996")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_mac_inst_n2250, 
                B1=>dut_n6460, C1=>dut_mac_inst_n6465, 
                D1=>dut_mac_inst_crc_inst_n5597, DI1=>'X', DI0=>'X', 
                A0=>dut_udp_inst_n2038, B0=>dut_reg_fifo_data_5, C0=>dut_n316, 
                D0=>dut_n6484, M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', 
                OFX1=>open, F1=>dut_mac_inst_crc_next_21, Q1=>open, OFX0=>open, 
                F0=>dut_n6460, Q0=>open);
    dut_SLICE_175I: SLOGICB
      generic map (M0MUX=>"SIG", CLKMUX=>"SIG", CEMUX=>"VHI", 
                   REG0_REGSET=>"SET", SRMODE=>"ASYNC", LUT0_INITVAL=>X"EFFF", 
                   LUT1_INITVAL=>X"EAEE", CHECK_M0=>TRUE)
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_mac_inst_n5777, 
                B1=>dut_n423, C1=>dut_n395, D1=>n399, DI1=>'X', DI0=>'X', 
                A0=>dut_udp_inst_n320, B0=>dut_udp_inst_n315, C0=>dut_n316, 
                D0=>dut_reg_fifo_empty, M0=>fifo_empty, CE=>'X', CLK=>clk_c, 
                LSR=>'X', OFX1=>open, F1=>dut_mac_inst_n5, Q1=>open, 
                OFX0=>open, F0=>dut_n395, Q0=>dut_reg_fifo_empty);
    dut_SLICE_176I: SLOGICB
      generic map (LUT0_INITVAL=>X"00CA", LUT1_INITVAL=>X"E2C0")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_n423, 
                B1=>dut_mac_inst_n421, C1=>dut_mac_inst_gmii_txd_7_N_202_5, 
                D1=>dut_gmii_txd_7_N_210_5, DI1=>'X', DI0=>'X', 
                A0=>dut_udp_inst_n2038, B0=>dut_reg_fifo_data_5, C0=>dut_n316, 
                D0=>dut_n6493, M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', 
                OFX1=>open, F1=>dut_gmii_txd_5, Q1=>open, OFX0=>open, 
                F0=>dut_gmii_txd_7_N_210_5, Q0=>open);
    SLICE_177I: SLOGICB
      generic map (LUT0_INITVAL=>X"1010", LUT1_INITVAL=>X"AFEE")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>rst_c, B1=>n6483, C1=>n6488, 
                D1=>n424, DI1=>'X', DI0=>'X', A0=>dut_udp_inst_n320, 
                B0=>dut_udp_inst_n315, C0=>dut_n425, D0=>'X', M0=>'X', CE=>'X', 
                CLK=>'X', LSR=>'X', OFX1=>open, F1=>clk_c_enable_19, Q1=>open, 
                OFX0=>open, F0=>n6483, Q0=>open);
    dut_SLICE_178I: SLOGICB
      generic map (LUT0_INITVAL=>X"EFEF", LUT1_INITVAL=>X"5044")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_n6484, 
                B1=>dut_mac_inst_crc_inst_n18, C1=>dut_reg_fifo_data_3, 
                D1=>dut_n316, DI1=>'X', DI0=>'X', A0=>dut_udp_inst_n320, 
                B0=>dut_udp_inst_n315, C0=>dut_n423, D0=>'X', M0=>'X', CE=>'X', 
                CLK=>'X', LSR=>'X', OFX1=>open, F1=>dut_mac_inst_crc_inst_n14, 
                Q1=>open, OFX0=>open, F0=>dut_n6484, Q0=>open);
    dut_SLICE_179I: SLOGICB
      generic map (LUT0_INITVAL=>X"1000", LUT1_INITVAL=>X"6996")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_mac_inst_crc_reg_2, 
                B1=>dut_n6458, C1=>dut_mac_inst_crc_reg_1, 
                D1=>dut_mac_inst_n2250, DI1=>'X', DI0=>'X', 
                A0=>dut_udp_inst_n320, B0=>dut_udp_inst_n315, 
                C0=>dut_udp_tdata_2, D0=>dut_n423, M0=>'X', CE=>'X', CLK=>'X', 
                LSR=>'X', OFX1=>open, F1=>dut_mac_inst_crc_inst_n5431, 
                Q1=>open, OFX0=>open, F0=>dut_n6458, Q0=>open);
    dut_SLICE_180I: SLOGICB
      generic map (LUT0_INITVAL=>X"FE10", LUT1_INITVAL=>X"6996")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_n6466, 
                B1=>dut_mac_inst_n6465, C1=>dut_mac_inst_crc_reg_0, 
                D1=>dut_mac_inst_crc_reg_20, DI1=>'X', DI0=>'X', 
                A0=>dut_udp_inst_n320, B0=>dut_udp_inst_n315, 
                C0=>dut_crc_next_12, D0=>dut_crc_reg_12, M0=>'X', CE=>'X', 
                CLK=>'X', LSR=>'X', OFX1=>open, F1=>dut_crc_next_12, Q1=>open, 
                OFX0=>open, F0=>dut_next_crc_reg_31_N_390_12, Q0=>open);
    dut_SLICE_181I: SLOGICB
      generic map (LUT0_INITVAL=>X"1000", LUT1_INITVAL=>X"6996")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_n6456, 
                B1=>dut_mac_inst_n2250, C1=>dut_mac_inst_n5705, D1=>dut_n6466, 
                DI1=>'X', DI0=>'X', A0=>dut_udp_inst_n320, 
                B0=>dut_udp_inst_n315, C0=>dut_udp_tdata_0, D0=>dut_n423, 
                M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', OFX1=>open, 
                F1=>dut_mac_inst_crc_next_30, Q1=>open, OFX0=>open, 
                F0=>dut_n6466, Q0=>open);
    dut_SLICE_182I: SLOGICB
      generic map (LUT0_INITVAL=>X"CACA", LUT1_INITVAL=>X"B4F0")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_n6493, B1=>dut_n423, 
                C1=>dut_mac_inst_n6491, D1=>dut_udp_tdata_1, DI1=>'X', 
                DI0=>'X', A0=>dut_udp_inst_n2046, B0=>dut_reg_fifo_data_1, 
                C0=>dut_n316, D0=>'X', M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', 
                OFX1=>open, F1=>dut_mac_inst_n6453, Q1=>open, OFX0=>open, 
                F0=>dut_udp_tdata_1, Q0=>open);
    dut_SLICE_183I: SLOGICB
      generic map (LUT0_INITVAL=>X"CACA", LUT1_INITVAL=>X"0ACA")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>n424, B1=>dut_n6462, 
                C1=>dut_n423, D1=>dut_n6493, DI1=>'X', DI0=>'X', 
                A0=>dut_udp_inst_n2036, B0=>dut_reg_fifo_data_6, C0=>dut_n316, 
                D0=>'X', M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', OFX1=>open, 
                F1=>dut_mac_inst_n2014, Q1=>open, OFX0=>open, F0=>dut_n6462, 
                Q0=>open);
    dut_SLICE_184I: SLOGICB
      generic map (LUT0_INITVAL=>X"00CA", LUT1_INITVAL=>X"6996")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_n6460, 
                B1=>dut_mac_inst_n2265, C1=>dut_n6456, 
                D1=>dut_mac_inst_crc_inst_n5457, DI1=>'X', DI0=>'X', 
                A0=>dut_udp_inst_n2036, B0=>dut_reg_fifo_data_6, C0=>dut_n316, 
                D0=>dut_n6484, M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', 
                OFX1=>open, F1=>dut_mac_inst_crc_next_22, Q1=>open, OFX0=>open, 
                F0=>dut_n6456, Q0=>open);
    dut_mac_inst_SLICE_185I: SLOGICB
      generic map (LUT0_INITVAL=>X"0ACA", LUT1_INITVAL=>X"CACA")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_mac_inst_n1965, 
                B1=>dut_mac_inst_gmii_txd_7_N_202_0, C1=>dut_mac_inst_n421, 
                D1=>'X', DI1=>'X', DI0=>'X', A0=>n424, B0=>dut_udp_tdata_0, 
                C0=>dut_n423, D0=>dut_n6493, M0=>'X', CE=>'X', CLK=>'X', 
                LSR=>'X', OFX1=>open, F1=>dut_gmii_txd_0, Q1=>open, OFX0=>open, 
                F0=>dut_mac_inst_n1965, Q0=>open);
    dut_mac_inst_SLICE_186I: SLOGICB
      generic map (LUT0_INITVAL=>X"88C0", LUT1_INITVAL=>X"6996")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_n6456, 
                B1=>dut_mac_inst_crc_inst_n5141, C1=>dut_mac_inst_crc_reg_6, 
                D1=>dut_mac_inst_crc_reg_28, DI1=>'X', DI0=>'X', 
                A0=>dut_mac_inst_crc_reg_20, B0=>dut_n423, 
                C0=>dut_mac_inst_crc_next_20, D0=>dut_n6493, M0=>'X', CE=>'X', 
                CLK=>'X', LSR=>'X', OFX1=>open, F1=>dut_mac_inst_crc_next_20, 
                Q1=>open, OFX0=>open, F0=>dut_mac_inst_n2, Q0=>open);
    dut_mac_inst_SLICE_187I: SLOGICB
      generic map (LUT0_INITVAL=>X"88C0", LUT1_INITVAL=>X"6996")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_n6460, 
                B1=>dut_mac_inst_n2265, C1=>dut_mac_inst_crc_inst_n5431, 
                D1=>dut_mac_inst_crc_inst_n5429, DI1=>'X', DI0=>'X', 
                A0=>dut_mac_inst_crc_reg_19, B0=>dut_n423, 
                C0=>dut_mac_inst_crc_next_19, D0=>dut_n6493, M0=>'X', CE=>'X', 
                CLK=>'X', LSR=>'X', OFX1=>open, F1=>dut_mac_inst_crc_next_19, 
                Q1=>open, OFX0=>open, F0=>dut_mac_inst_n2_adj_683, Q0=>open);
    dut_mac_inst_SLICE_188I: SLOGICB
      generic map (LUT0_INITVAL=>X"FEF0", LUT1_INITVAL=>X"EEEE")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>n424, B1=>dut_mac_inst_n420, 
                C1=>'X', D1=>'X', DI1=>'X', DI0=>'X', A0=>dut_mac_inst_n421, 
                B0=>dut_mac_inst_n6495, C0=>dut_n425, 
                D0=>dut_mac_inst_crc_reg_22, M0=>'X', CE=>'X', CLK=>'X', 
                LSR=>'X', OFX1=>open, F1=>dut_mac_inst_n6495, Q1=>open, 
                OFX0=>open, F0=>dut_mac_inst_n5439, Q0=>open);
    dut_mac_inst_SLICE_189I: SLOGICB
      generic map (LUT0_INITVAL=>X"88C0", LUT1_INITVAL=>X"6996")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_n6460, 
                B1=>dut_mac_inst_n6455, C1=>dut_mac_inst_n6465, 
                D1=>dut_mac_inst_crc_inst_n5513, DI1=>'X', DI0=>'X', 
                A0=>dut_mac_inst_crc_reg_18, B0=>dut_n423, 
                C0=>dut_mac_inst_crc_next_18, D0=>dut_n6493, M0=>'X', CE=>'X', 
                CLK=>'X', LSR=>'X', OFX1=>open, F1=>dut_mac_inst_crc_next_18, 
                Q1=>open, OFX0=>open, F0=>dut_mac_inst_n2_adj_684, Q0=>open);
    dut_mac_inst_SLICE_190I: SLOGICB
      generic map (LUT0_INITVAL=>X"2DD2", LUT1_INITVAL=>X"6666")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_mac_inst_crc_reg_0, 
                B1=>dut_mac_inst_crc_reg_1, C1=>'X', D1=>'X', DI1=>'X', 
                DI0=>'X', A0=>dut_udp_tdata_1, B0=>dut_n6484, 
                C0=>dut_mac_inst_crc_reg_6, D0=>dut_mac_inst_n6491, M0=>'X', 
                CE=>'X', CLK=>'X', LSR=>'X', OFX1=>open, 
                F1=>dut_mac_inst_n6491, Q1=>open, OFX0=>open, 
                F0=>dut_mac_inst_n5705, Q0=>open);
    dut_mac_inst_SLICE_191I: SLOGICB
      generic map (LUT0_INITVAL=>X"88C0", LUT1_INITVAL=>X"6996")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_mac_inst_n9, 
                B1=>dut_mac_inst_crc_inst_n8, C1=>dut_n6457, 
                D1=>dut_mac_inst_crc_inst_n8_adj_682, DI1=>'X', DI0=>'X', 
                A0=>dut_mac_inst_crc_reg_17, B0=>dut_n423, 
                C0=>dut_mac_inst_crc_next_17, D0=>dut_n6493, M0=>'X', CE=>'X', 
                CLK=>'X', LSR=>'X', OFX1=>open, F1=>dut_mac_inst_crc_next_17, 
                Q1=>open, OFX0=>open, F0=>dut_mac_inst_n2_adj_685, Q0=>open);
    dut_mac_inst_SLICE_192I: SLOGICB
      generic map (LUT0_INITVAL=>X"88C0", LUT1_INITVAL=>X"6996")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_n6464, 
                B1=>dut_mac_inst_n6465, C1=>dut_mac_inst_crc_inst_n5635, 
                D1=>dut_n6466, DI1=>'X', DI0=>'X', A0=>dut_mac_inst_crc_reg_16, 
                B0=>dut_n423, C0=>dut_mac_inst_crc_next_16, D0=>dut_n6493, 
                M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', OFX1=>open, 
                F1=>dut_mac_inst_crc_next_16, Q1=>open, OFX0=>open, 
                F0=>dut_mac_inst_n2_adj_686, Q0=>open);
    dut_mac_inst_SLICE_193I: SLOGICB
      generic map (LUT0_INITVAL=>X"88C0", LUT1_INITVAL=>X"6996")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_mac_inst_n2250, 
                B1=>dut_n6464, C1=>dut_n6458, D1=>dut_mac_inst_crc_inst_n5659, 
                DI1=>'X', DI0=>'X', A0=>dut_mac_inst_crc_reg_15, B0=>dut_n423, 
                C0=>dut_mac_inst_crc_next_15, D0=>dut_n6493, M0=>'X', CE=>'X', 
                CLK=>'X', LSR=>'X', OFX1=>open, F1=>dut_mac_inst_crc_next_15, 
                Q1=>open, OFX0=>open, F0=>dut_mac_inst_n2_adj_687, Q0=>open);
    dut_mac_inst_SLICE_194I: SLOGICB
      generic map (LUT0_INITVAL=>X"2DD2", LUT1_INITVAL=>X"6666")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_mac_inst_crc_reg_3, 
                B1=>dut_mac_inst_crc_reg_1, C1=>'X', D1=>'X', DI1=>'X', 
                DI0=>'X', A0=>dut_udp_tdata_1, B0=>dut_n6484, 
                C0=>dut_mac_inst_crc_reg_5, D0=>dut_mac_inst_n5643, M0=>'X', 
                CE=>'X', CLK=>'X', LSR=>'X', OFX1=>open, 
                F1=>dut_mac_inst_n5643, Q1=>open, OFX0=>open, 
                F0=>dut_mac_inst_n5567, Q0=>open);
    dut_mac_inst_SLICE_195I: SLOGICB
      generic map (LUT0_INITVAL=>X"88C0", LUT1_INITVAL=>X"6996")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_n6458, B1=>dut_n6456, 
                C1=>dut_n6457, D1=>dut_mac_inst_crc_inst_n5715, DI1=>'X', 
                DI0=>'X', A0=>dut_mac_inst_crc_reg_14, B0=>dut_n423, 
                C0=>dut_mac_inst_crc_next_14, D0=>dut_n6493, M0=>'X', CE=>'X', 
                CLK=>'X', LSR=>'X', OFX1=>open, F1=>dut_mac_inst_crc_next_14, 
                Q1=>open, OFX0=>open, F0=>dut_mac_inst_n2_adj_688, Q0=>open);
    dut_mac_inst_SLICE_196I: SLOGICB
      generic map (LUT0_INITVAL=>X"2DD2", LUT1_INITVAL=>X"88C0")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_mac_inst_crc_reg_11, 
                B1=>dut_n423, C1=>dut_mac_inst_crc_next_11, D1=>dut_n6493, 
                DI1=>'X', DI0=>'X', A0=>dut_n6468, B0=>dut_n6484, 
                C0=>dut_mac_inst_crc_reg_19, D0=>dut_mac_inst_crc_reg_3, 
                M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', OFX1=>open, 
                F1=>dut_mac_inst_n2_adj_690, Q1=>open, OFX0=>open, 
                F0=>dut_mac_inst_crc_next_11, Q0=>open);
    dut_mac_inst_SLICE_197I: SLOGICB
      generic map (LUT0_INITVAL=>X"B4F0", LUT1_INITVAL=>X"6996")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_n6460, 
                B1=>dut_mac_inst_n6455, C1=>dut_mac_inst_n6465, 
                D1=>dut_mac_inst_n5553, DI1=>'X', DI0=>'X', A0=>dut_n6493, 
                B0=>dut_n423, C0=>dut_mac_inst_crc_reg_6, D0=>dut_n6462, 
                M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', OFX1=>open, 
                F1=>dut_mac_inst_crc_next_28, Q1=>open, OFX0=>open, 
                F0=>dut_mac_inst_n6455, Q0=>open);
    dut_mac_inst_SLICE_198I: SLOGICB
      generic map (LUT0_INITVAL=>X"88C0", LUT1_INITVAL=>X"2DD2")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_udp_tdata_2, 
                B1=>dut_n6484, C1=>dut_mac_inst_crc_reg_18, 
                D1=>dut_mac_inst_crc_reg_2, DI1=>'X', DI0=>'X', 
                A0=>dut_mac_inst_crc_reg_10, B0=>dut_n423, 
                C0=>dut_mac_inst_crc_next_10, D0=>dut_n6493, M0=>'X', CE=>'X', 
                CLK=>'X', LSR=>'X', OFX1=>open, F1=>dut_mac_inst_crc_next_10, 
                Q1=>open, OFX0=>open, F0=>dut_mac_inst_n2_adj_692, Q0=>open);
    dut_mac_inst_SLICE_199I: SLOGICB
      generic map (LUT0_INITVAL=>X"88C0", LUT1_INITVAL=>X"2DD2")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_udp_tdata_2, 
                B1=>dut_n6484, C1=>dut_mac_inst_crc_reg_8, 
                D1=>dut_mac_inst_crc_reg_2, DI1=>'X', DI0=>'X', 
                A0=>dut_mac_inst_crc_reg_0, B0=>dut_n423, 
                C0=>dut_mac_inst_crc_next_0, D0=>dut_n6493, M0=>'X', CE=>'X', 
                CLK=>'X', LSR=>'X', OFX1=>open, F1=>dut_mac_inst_crc_next_0, 
                Q1=>open, OFX0=>open, F0=>dut_mac_inst_n2_adj_691, Q0=>open);
    dut_mac_inst_SLICE_200I: SLOGICB
      generic map (LUT0_INITVAL=>X"88C0", LUT1_INITVAL=>X"6996")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_n6467, 
                B1=>dut_mac_inst_n6455, C1=>dut_n6457, 
                D1=>dut_mac_inst_crc_inst_n5533, DI1=>'X', DI0=>'X', 
                A0=>dut_mac_inst_crc_reg_8, B0=>dut_n423, 
                C0=>dut_mac_inst_crc_next_8, D0=>dut_n6493, M0=>'X', CE=>'X', 
                CLK=>'X', LSR=>'X', OFX1=>open, F1=>dut_mac_inst_crc_next_8, 
                Q1=>open, OFX0=>open, F0=>dut_mac_inst_n2_adj_694, Q0=>open);
    dut_mac_inst_SLICE_201I: SLOGICB
      generic map (LUT0_INITVAL=>X"88C0", LUT1_INITVAL=>X"6996")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_n6456, 
                B1=>dut_mac_inst_n5124, C1=>dut_mac_inst_n2250, 
                D1=>dut_mac_inst_n5399, DI1=>'X', DI0=>'X', 
                A0=>dut_mac_inst_crc_reg_29, B0=>dut_n423, 
                C0=>dut_mac_inst_crc_next_29, D0=>dut_n6493, M0=>'X', CE=>'X', 
                CLK=>'X', LSR=>'X', OFX1=>open, F1=>dut_mac_inst_crc_next_29, 
                Q1=>open, OFX0=>open, F0=>dut_mac_inst_n2_adj_695, Q0=>open);
    dut_mac_inst_SLICE_202I: SLOGICB
      generic map (LUT0_INITVAL=>X"88C0", LUT1_INITVAL=>X"6996")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_n6460, 
                B1=>dut_mac_inst_n6455, C1=>dut_n6466, 
                D1=>dut_mac_inst_crc_inst_n5525, DI1=>'X', DI0=>'X', 
                A0=>dut_mac_inst_crc_reg_7, B0=>dut_n423, 
                C0=>dut_mac_inst_crc_next_7, D0=>dut_n6493, M0=>'X', CE=>'X', 
                CLK=>'X', LSR=>'X', OFX1=>open, F1=>dut_mac_inst_crc_next_7, 
                Q1=>open, OFX0=>open, F0=>dut_mac_inst_n2_adj_696, Q0=>open);
    dut_mac_inst_SLICE_203I: SLOGICB
      generic map (LUT0_INITVAL=>X"0440", LUT1_INITVAL=>X"6996")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_mac_inst_n2400, 
                B1=>dut_mac_inst_n2265, C1=>dut_n6456, 
                D1=>dut_mac_inst_crc_inst_n5445, DI1=>'X', DI0=>'X', 
                A0=>dut_n6493, B0=>dut_n423, C0=>dut_udp_tdata_0, 
                D0=>dut_udp_tdata_2, M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', 
                OFX1=>open, F1=>dut_mac_inst_crc_next_4, Q1=>open, OFX0=>open, 
                F0=>dut_mac_inst_n2400, Q0=>open);
    dut_mac_inst_SLICE_204I: SLOGICB
      generic map (LUT0_INITVAL=>X"88C0", LUT1_INITVAL=>X"6996")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_mac_inst_n6465, 
                B1=>dut_n6460, C1=>dut_mac_inst_crc_reg_5, 
                D1=>dut_mac_inst_crc_reg_14, DI1=>'X', DI0=>'X', 
                A0=>dut_mac_inst_crc_reg_6, B0=>dut_n423, 
                C0=>dut_mac_inst_crc_next_6, D0=>dut_n6493, M0=>'X', CE=>'X', 
                CLK=>'X', LSR=>'X', OFX1=>open, F1=>dut_mac_inst_crc_next_6, 
                Q1=>open, OFX0=>open, F0=>dut_mac_inst_n2_adj_697, Q0=>open);
    dut_mac_inst_SLICE_205I: SLOGICB
      generic map (LUT0_INITVAL=>X"FFF8", LUT1_INITVAL=>X"FFFE")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_mac_inst_pad_cnt_4, 
                B1=>dut_mac_inst_n5867, C1=>dut_mac_inst_n5865, 
                D1=>dut_mac_inst_pad_cnt_5, DI1=>'X', DI0=>'X', 
                A0=>dut_mac_inst_n422, B0=>dut_mac_inst_n11, C0=>dut_n425, 
                D0=>dut_mac_inst_n6495, M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', 
                OFX1=>open, F1=>dut_mac_inst_n11, Q1=>open, OFX0=>open, 
                F0=>dut_mac_inst_n5777, Q0=>open);
    dut_mac_inst_SLICE_206I: SLOGICB
      generic map (LUT0_INITVAL=>X"BF40", LUT1_INITVAL=>X"6996")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_mac_inst_n6453, 
                B1=>dut_mac_inst_n6465, C1=>dut_n6466, 
                D1=>dut_mac_inst_crc_reg_10, DI1=>'X', DI0=>'X', A0=>dut_n6493, 
                B0=>dut_n423, C0=>dut_udp_tdata_4, D0=>dut_mac_inst_crc_reg_4, 
                M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', OFX1=>open, 
                F1=>dut_mac_inst_crc_next_2, Q1=>open, OFX0=>open, 
                F0=>dut_mac_inst_n6465, Q0=>open);
    dut_mac_inst_SLICE_207I: SLOGICB
      generic map (LUT0_INITVAL=>X"B4F0", LUT1_INITVAL=>X"6996")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_mac_inst_n2250, 
                B1=>dut_n6460, C1=>dut_mac_inst_n6465, 
                D1=>dut_mac_inst_crc_inst_n5587, DI1=>'X', DI0=>'X', 
                A0=>dut_n6493, B0=>dut_n423, C0=>dut_mac_inst_crc_reg_7, 
                D0=>dut_n6469, M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', 
                OFX1=>open, F1=>dut_mac_inst_crc_next_24, Q1=>open, OFX0=>open, 
                F0=>dut_mac_inst_n2250, Q0=>open);
    dut_mac_inst_SLICE_208I: SLOGICB
      generic map (LUT0_INITVAL=>X"FFE2", LUT1_INITVAL=>X"0020")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_n6492, B1=>dut_n6493, 
                C1=>dut_n423, D1=>n399, DI1=>'X', DI0=>'X', 
                A0=>dut_mac_inst_n6452, B0=>dut_mac_inst_n422, 
                C0=>dut_mac_inst_n11, D0=>rst_c, M0=>'X', CE=>'X', CLK=>'X', 
                LSR=>'X', OFX1=>open, F1=>dut_mac_inst_n6452, Q1=>open, 
                OFX0=>open, F0=>dut_mac_inst_clk_c_enable_8, Q0=>open);
    dut_mac_inst_SLICE_209I: SLOGICB
      generic map (LUT0_INITVAL=>X"88C0", LUT1_INITVAL=>X"6996")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_n6464, 
                B1=>dut_mac_inst_n6465, C1=>dut_n6467, 
                D1=>dut_mac_inst_crc_inst_n5647, DI1=>'X', DI0=>'X', 
                A0=>dut_mac_inst_crc_reg_5, B0=>dut_n423, 
                C0=>dut_mac_inst_crc_next_5, D0=>dut_n6493, M0=>'X', CE=>'X', 
                CLK=>'X', LSR=>'X', OFX1=>open, F1=>dut_mac_inst_crc_next_5, 
                Q1=>open, OFX0=>open, F0=>dut_mac_inst_n2_adj_699, Q0=>open);
    dut_mac_inst_SLICE_210I: SLOGICB
      generic map (LUT0_INITVAL=>X"88C0", LUT1_INITVAL=>X"6996")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_mac_inst_crc_inst_n6459, 
                B1=>dut_n6460, C1=>dut_mac_inst_n2250, D1=>dut_mac_inst_n5567, 
                DI1=>'X', DI0=>'X', A0=>dut_mac_inst_crc_reg_27, B0=>dut_n423, 
                C0=>dut_mac_inst_crc_next_27, D0=>dut_n6493, M0=>'X', CE=>'X', 
                CLK=>'X', LSR=>'X', OFX1=>open, F1=>dut_mac_inst_crc_next_27, 
                Q1=>open, OFX0=>open, F0=>dut_mac_inst_n2_adj_700, Q0=>open);
    dut_mac_inst_SLICE_211I: SLOGICB
      generic map (LUT0_INITVAL=>X"88C0", LUT1_INITVAL=>X"6996")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_mac_inst_crc_inst_n12, 
                B1=>dut_n6458, C1=>dut_mac_inst_crc_inst_n6489, 
                D1=>dut_mac_inst_crc_inst_n8_adj_682, DI1=>'X', DI0=>'X', 
                A0=>dut_mac_inst_crc_reg_26, B0=>dut_n423, 
                C0=>dut_mac_inst_crc_next_26, D0=>dut_n6493, M0=>'X', CE=>'X', 
                CLK=>'X', LSR=>'X', OFX1=>open, F1=>dut_mac_inst_crc_next_26, 
                Q1=>open, OFX0=>open, F0=>dut_mac_inst_n2_adj_701, Q0=>open);
    dut_mac_inst_SLICE_212I: SLOGICB
      generic map (LUT0_INITVAL=>X"88C0", LUT1_INITVAL=>X"6996")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_n6460, 
                B1=>dut_mac_inst_n2265, C1=>dut_mac_inst_crc_inst_n5477, 
                D1=>dut_n6456, DI1=>'X', DI0=>'X', A0=>dut_mac_inst_crc_reg_25, 
                B0=>dut_n423, C0=>dut_mac_inst_crc_next_25, D0=>dut_n6493, 
                M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', OFX1=>open, 
                F1=>dut_mac_inst_crc_next_25, Q1=>open, OFX0=>open, 
                F0=>dut_mac_inst_n2_adj_703, Q0=>open);
    dut_mac_inst_SLICE_213I: SLOGICB
      generic map (LUT0_INITVAL=>X"2DD2", LUT1_INITVAL=>X"6996")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_mac_inst_n6454, 
                B1=>dut_n6460, C1=>dut_n6457, D1=>dut_mac_inst_crc_inst_n5603, 
                DI1=>'X', DI0=>'X', A0=>dut_udp_tdata_2, B0=>dut_n6484, 
                C0=>dut_mac_inst_crc_reg_1, D0=>dut_mac_inst_crc_reg_2, 
                M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', OFX1=>open, 
                F1=>dut_mac_inst_crc_next_3, Q1=>open, OFX0=>open, 
                F0=>dut_mac_inst_n6454, Q0=>open);
    dut_mac_inst_SLICE_214I: SLOGICB
      generic map (LUT0_INITVAL=>X"88C0", LUT1_INITVAL=>X"6996")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_n6456, 
                B1=>dut_mac_inst_crc_inst_n5141, C1=>dut_mac_inst_crc_reg_6, 
                D1=>dut_crc_reg_31, DI1=>'X', DI0=>'X', 
                A0=>dut_mac_inst_crc_reg_23, B0=>dut_n423, 
                C0=>dut_mac_inst_crc_next_23, D0=>dut_n6493, M0=>'X', CE=>'X', 
                CLK=>'X', LSR=>'X', OFX1=>open, F1=>dut_mac_inst_crc_next_23, 
                Q1=>open, OFX0=>open, F0=>dut_mac_inst_n2_adj_707, Q0=>open);
    dut_mac_inst_SLICE_215I: SLOGICB
      generic map (LUT0_INITVAL=>X"F0F8", LUT1_INITVAL=>X"8888")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_mac_inst_crc_cnt_0, 
                B1=>dut_mac_inst_crc_cnt_1, C1=>'X', D1=>'X', DI1=>'X', 
                DI0=>'X', A0=>dut_mac_inst_n6506, B0=>dut_mac_inst_n421, 
                C0=>rst_c, D0=>dut_mac_inst_n420, M0=>'X', CE=>'X', CLK=>'X', 
                LSR=>'X', OFX1=>open, F1=>dut_mac_inst_n6506, Q1=>open, 
                OFX0=>open, F0=>dut_mac_inst_n1334, Q0=>open);
    dut_mac_inst_SLICE_216I: SLOGICB
      generic map (LUT0_INITVAL=>X"88C0", LUT1_INITVAL=>X"6996")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_n6466, B1=>dut_n6464, 
                C1=>dut_mac_inst_crc_inst_n5665, D1=>dut_mac_inst_crc_reg_3, 
                DI1=>'X', DI0=>'X', A0=>dut_mac_inst_crc_reg_1, B0=>dut_n423, 
                C0=>dut_mac_inst_crc_next_1, D0=>dut_n6493, M0=>'X', CE=>'X', 
                CLK=>'X', LSR=>'X', OFX1=>open, F1=>dut_mac_inst_crc_next_1, 
                Q1=>open, OFX0=>open, F0=>dut_mac_inst_n2_adj_710, Q0=>open);
    dut_mac_inst_SLICE_217I: SLOGICB
      generic map (LUT0_INITVAL=>X"3F3A", LUT1_INITVAL=>X"EEEE")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>n424, B1=>dut_mac_inst_n422, 
                C1=>'X', D1=>'X', DI1=>'X', DI0=>'X', A0=>dut_mac_inst_n421, 
                B0=>dut_n6493, C0=>dut_n423, D0=>dut_mac_inst_n4, M0=>'X', 
                CE=>'X', CLK=>'X', LSR=>'X', OFX1=>open, F1=>dut_mac_inst_n4, 
                Q1=>open, OFX0=>open, F0=>dut_ctl_reg, Q0=>open);
    dut_mac_inst_SLICE_218I: SLOGICB
      generic map (LUT0_INITVAL=>X"CACA", LUT1_INITVAL=>X"0ACA")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_mac_inst_n6477, 
                B1=>dut_n6469, C1=>dut_n423, D1=>dut_n6493, DI1=>'X', DI0=>'X', 
                A0=>dut_mac_inst_n2012, B0=>dut_mac_inst_gmii_txd_7_N_202_7, 
                C0=>dut_mac_inst_n421, D0=>'X', M0=>'X', CE=>'X', CLK=>'X', 
                LSR=>'X', OFX1=>open, F1=>dut_mac_inst_n2012, Q1=>open, 
                OFX0=>open, F0=>dut_gmii_txd_7, Q0=>open);
    dut_mac_inst_SLICE_219I: SLOGICB
      generic map (LUT0_INITVAL=>X"8000", LUT1_INITVAL=>X"00E0")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_mac_inst_n6477, 
                B1=>dut_n423, C1=>dut_n318, D1=>dut_n15, DI1=>'X', DI0=>'X', 
                A0=>dut_mac_inst_pre_cnt_1, B0=>dut_mac_inst_pre_cnt_0, 
                C0=>n424, D0=>dut_mac_inst_pre_cnt_2, M0=>'X', CE=>'X', 
                CLK=>'X', LSR=>'X', OFX1=>open, F1=>dut_n5334, Q1=>open, 
                OFX0=>open, F0=>dut_mac_inst_n6477, Q0=>open);
    dut_mac_inst_SLICE_220I: SLOGICB
      generic map (LUT0_INITVAL=>X"0004", LUT1_INITVAL=>X"EEEE")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_mac_inst_pad_cnt_1, 
                B1=>dut_mac_inst_pad_cnt_4, C1=>'X', D1=>'X', DI1=>'X', 
                DI0=>'X', A0=>dut_mac_inst_pad_cnt_3, B0=>dut_mac_inst_n5881, 
                C0=>dut_mac_inst_n5891, D0=>dut_mac_inst_pad_cnt_2, M0=>'X', 
                CE=>'X', CLK=>'X', LSR=>'X', OFX1=>open, 
                F1=>dut_mac_inst_n5891, Q1=>open, OFX0=>open, 
                F0=>dut_mac_inst_n5379, Q0=>open);
    dut_mac_inst_SLICE_221I: SLOGICB
      generic map (LUT0_INITVAL=>X"CACA", LUT1_INITVAL=>X"0ACA")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>n424, B1=>dut_udp_tdata_4, 
                C1=>dut_n423, D1=>dut_n6493, DI1=>'X', DI0=>'X', 
                A0=>dut_mac_inst_n2016, B0=>dut_mac_inst_gmii_txd_7_N_202_4, 
                C0=>dut_mac_inst_n421, D0=>'X', M0=>'X', CE=>'X', CLK=>'X', 
                LSR=>'X', OFX1=>open, F1=>dut_mac_inst_n2016, Q1=>open, 
                OFX0=>open, F0=>dut_gmii_txd_4, Q0=>open);
    dut_mac_inst_crc_inst_SLICE_222I: SLOGICB
      generic map (LUT0_INITVAL=>X"6996", LUT1_INITVAL=>X"6666")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_mac_inst_crc_reg_6, 
                B1=>dut_mac_inst_crc_reg_27, C1=>'X', D1=>'X', DI1=>'X', 
                DI0=>'X', A0=>dut_n6456, B0=>dut_n6457, 
                C0=>dut_mac_inst_crc_inst_n5423, D0=>dut_mac_inst_crc_reg_5, 
                M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', OFX1=>open, 
                F1=>dut_mac_inst_crc_inst_n5423, Q1=>open, OFX0=>open, 
                F0=>dut_mac_inst_crc_inst_n5429, Q0=>open);
    dut_mac_inst_crc_inst_SLICE_223I: SLOGICB
      generic map (LUT0_INITVAL=>X"6996", LUT1_INITVAL=>X"6996")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_mac_inst_n6491, 
                B1=>dut_mac_inst_crc_reg_2, C1=>dut_mac_inst_crc_reg_26, 
                D1=>dut_mac_inst_crc_reg_5, DI1=>'X', DI0=>'X', A0=>dut_n6458, 
                B0=>dut_n6466, C0=>dut_n6457, D0=>dut_mac_inst_crc_inst_n5507, 
                M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', OFX1=>open, 
                F1=>dut_mac_inst_crc_inst_n5507, Q1=>open, OFX0=>open, 
                F0=>dut_mac_inst_crc_inst_n5513, Q0=>open);
    dut_mac_inst_crc_inst_SLICE_224I: SLOGICB
      generic map (LUT0_INITVAL=>X"6996", LUT1_INITVAL=>X"6666")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_mac_inst_crc_reg_0, 
                B1=>dut_mac_inst_crc_reg_2, C1=>'X', D1=>'X', DI1=>'X', 
                DI0=>'X', A0=>dut_n6458, B0=>dut_mac_inst_crc_inst_n6512, 
                C0=>dut_mac_inst_crc_reg_3, D0=>dut_mac_inst_crc_reg_24, 
                M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', OFX1=>open, 
                F1=>dut_mac_inst_crc_inst_n6512, Q1=>open, OFX0=>open, 
                F0=>dut_mac_inst_crc_inst_n5635, Q0=>open);
    dut_mac_inst_crc_inst_SLICE_225I: SLOGICB
      generic map (LUT0_INITVAL=>X"6996", LUT1_INITVAL=>X"9696")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_mac_inst_crc_reg_0, 
                B1=>dut_mac_inst_crc_reg_1, C1=>dut_mac_inst_crc_reg_2, 
                D1=>'X', DI1=>'X', DI0=>'X', A0=>dut_mac_inst_n2400, 
                B0=>dut_n6457, C0=>dut_mac_inst_crc_inst_n6489, 
                D0=>dut_mac_inst_crc_inst_n5471, M0=>'X', CE=>'X', CLK=>'X', 
                LSR=>'X', OFX1=>open, F1=>dut_mac_inst_crc_inst_n6489, 
                Q1=>open, OFX0=>open, F0=>dut_mac_inst_crc_inst_n5477, 
                Q0=>open);
    dut_mac_inst_crc_inst_SLICE_226I: SLOGICB
      generic map (LUT0_INITVAL=>X"6666", LUT1_INITVAL=>X"6996")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_n6458, 
                B1=>dut_mac_inst_crc_inst_n5471, C1=>dut_mac_inst_crc_reg_2, 
                D1=>dut_mac_inst_crc_reg_30, DI1=>'X', DI0=>'X', 
                A0=>dut_mac_inst_crc_reg_5, B0=>dut_mac_inst_crc_reg_6, 
                C0=>'X', D0=>'X', M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', 
                OFX1=>open, F1=>dut_mac_inst_crc_inst_n5457, Q1=>open, 
                OFX0=>open, F0=>dut_mac_inst_crc_inst_n5471, Q0=>open);
    dut_SLICE_227I: SLOGICB
      generic map (LUT0_INITVAL=>X"41DF", LUT1_INITVAL=>X"4142")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_idx_4, B1=>dut_idx_3, 
                C1=>dut_idx_2, D1=>dut_idx_1, DI1=>'X', DI0=>'X', 
                A0=>dut_idx_2, B0=>dut_idx_0, C0=>dut_idx_1, D0=>dut_idx_3, 
                M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', OFX1=>open, 
                F1=>dut_mac_inst_crc_inst_n6403, Q1=>open, OFX0=>open, 
                F0=>dut_udp_inst_t_data_7_N_100_2, Q0=>open);
    dut_udp_inst_SLICE_228I: SLOGICB
      generic map (LUT0_INITVAL=>X"1818", LUT1_INITVAL=>X"E8E8")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_idx_1, B1=>dut_idx_2, 
                C1=>dut_idx_3, D1=>'X', DI1=>'X', DI0=>'X', A0=>dut_idx_2, 
                B0=>dut_idx_3, C0=>dut_idx_1, D0=>'X', M0=>'X', CE=>'X', 
                CLK=>'X', LSR=>'X', OFX1=>open, F1=>dut_udp_inst_n6490, 
                Q1=>open, OFX0=>open, F0=>dut_udp_inst_n1981, Q0=>open);
    dut_mac_inst_SLICE_229I: SLOGICB
      generic map (LUT0_INITVAL=>X"FEF0", LUT1_INITVAL=>X"FEF0")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_mac_inst_n421, 
                B1=>dut_mac_inst_n6495, C1=>dut_n425, 
                D1=>dut_mac_inst_crc_reg_1, DI1=>'X', DI0=>'X', 
                A0=>dut_mac_inst_n421, B0=>dut_mac_inst_n6495, C0=>dut_n425, 
                D0=>dut_mac_inst_crc_reg_20, M0=>'X', CE=>'X', CLK=>'X', 
                LSR=>'X', OFX1=>open, F1=>dut_mac_inst_n5671, Q1=>open, 
                OFX0=>open, F0=>dut_mac_inst_n5499, Q0=>open);
    dut_mac_inst_SLICE_230I: SLOGICB
      generic map (LUT0_INITVAL=>X"FEF0", LUT1_INITVAL=>X"FEF0")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_mac_inst_n421, 
                B1=>dut_mac_inst_n6495, C1=>dut_n425, 
                D1=>dut_mac_inst_crc_reg_2, DI1=>'X', DI0=>'X', 
                A0=>dut_mac_inst_n421, B0=>dut_mac_inst_n6495, C0=>dut_n425, 
                D0=>dut_mac_inst_crc_reg_26, M0=>'X', CE=>'X', CLK=>'X', 
                LSR=>'X', OFX1=>open, F1=>dut_mac_inst_n5683, Q1=>open, 
                OFX0=>open, F0=>dut_mac_inst_n5391, Q0=>open);
    dut_mac_inst_SLICE_231I: SLOGICB
      generic map (LUT0_INITVAL=>X"FEF0", LUT1_INITVAL=>X"FEF0")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_mac_inst_n421, 
                B1=>dut_mac_inst_n6495, C1=>dut_n425, 
                D1=>dut_mac_inst_crc_reg_3, DI1=>'X', DI0=>'X', 
                A0=>dut_mac_inst_n421, B0=>dut_mac_inst_n6495, C0=>dut_n425, 
                D0=>dut_crc_reg_12, M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', 
                OFX1=>open, F1=>dut_mac_inst_n5609, Q1=>open, OFX0=>open, 
                F0=>dut_mac_inst_n5691, Q0=>open);
    dut_mac_inst_SLICE_232I: SLOGICB
      generic map (LUT0_INITVAL=>X"FEF0", LUT1_INITVAL=>X"FEF0")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_mac_inst_n421, 
                B1=>dut_mac_inst_n6495, C1=>dut_n425, 
                D1=>dut_mac_inst_crc_reg_4, DI1=>'X', DI0=>'X', 
                A0=>dut_mac_inst_n421, B0=>dut_mac_inst_n6495, C0=>dut_n425, 
                D0=>dut_mac_inst_crc_reg_8, M0=>'X', CE=>'X', CLK=>'X', 
                LSR=>'X', OFX1=>open, F1=>dut_mac_inst_n5467, Q1=>open, 
                OFX0=>open, F0=>dut_mac_inst_n5539, Q0=>open);
    dut_mac_inst_SLICE_233I: SLOGICB
      generic map (LUT0_INITVAL=>X"FEF0", LUT1_INITVAL=>X"FEF0")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_mac_inst_n421, 
                B1=>dut_mac_inst_n6495, C1=>dut_n425, 
                D1=>dut_mac_inst_crc_reg_0, DI1=>'X', DI0=>'X', 
                A0=>dut_mac_inst_n421, B0=>dut_mac_inst_n6495, C0=>dut_n425, 
                D0=>dut_mac_inst_crc_reg_6, M0=>'X', CE=>'X', CLK=>'X', 
                LSR=>'X', OFX1=>open, F1=>dut_mac_inst_n5741, Q1=>open, 
                OFX0=>open, F0=>dut_mac_inst_n5617, Q0=>open);
    dut_mac_inst_SLICE_234I: SLOGICB
      generic map (LUT0_INITVAL=>X"FEF0", LUT1_INITVAL=>X"FEF0")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_mac_inst_n421, 
                B1=>dut_mac_inst_n6495, C1=>dut_n425, 
                D1=>dut_mac_inst_crc_reg_7, DI1=>'X', DI0=>'X', 
                A0=>dut_mac_inst_n421, B0=>dut_mac_inst_n6495, C0=>dut_n425, 
                D0=>dut_mac_inst_crc_reg_5, M0=>'X', CE=>'X', CLK=>'X', 
                LSR=>'X', OFX1=>open, F1=>dut_mac_inst_n5547, Q1=>open, 
                OFX0=>open, F0=>dut_mac_inst_n5627, Q0=>open);
    dut_mac_inst_SLICE_235I: SLOGICB
      generic map (LUT0_INITVAL=>X"FEF0", LUT1_INITVAL=>X"FEF0")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_mac_inst_n421, 
                B1=>dut_mac_inst_n6495, C1=>dut_n425, 
                D1=>dut_mac_inst_crc_reg_10, DI1=>'X', DI0=>'X', 
                A0=>dut_mac_inst_n421, B0=>dut_mac_inst_n6495, C0=>dut_n425, 
                D0=>dut_mac_inst_crc_reg_19, M0=>'X', CE=>'X', CLK=>'X', 
                LSR=>'X', OFX1=>open, F1=>dut_mac_inst_n5737, Q1=>open, 
                OFX0=>open, F0=>dut_mac_inst_n5419, Q0=>open);
    dut_mac_inst_SLICE_236I: SLOGICB
      generic map (LUT0_INITVAL=>X"FEF0", LUT1_INITVAL=>X"FEF0")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_mac_inst_n421, 
                B1=>dut_mac_inst_n6495, C1=>dut_n425, 
                D1=>dut_mac_inst_crc_reg_14, DI1=>'X', DI0=>'X', 
                A0=>dut_mac_inst_n421, B0=>dut_mac_inst_n6495, C0=>dut_n425, 
                D0=>dut_mac_inst_crc_reg_27, M0=>'X', CE=>'X', CLK=>'X', 
                LSR=>'X', OFX1=>open, F1=>dut_mac_inst_n5721, Q1=>open, 
                OFX0=>open, F0=>dut_mac_inst_n5559, Q0=>open);
    dut_mac_inst_SLICE_237I: SLOGICB
      generic map (LUT0_INITVAL=>X"FEF0", LUT1_INITVAL=>X"FEF0")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_mac_inst_n421, 
                B1=>dut_mac_inst_n6495, C1=>dut_n425, 
                D1=>dut_mac_inst_crc_reg_29, DI1=>'X', DI0=>'X', 
                A0=>dut_mac_inst_n421, B0=>dut_mac_inst_n6495, C0=>dut_n425, 
                D0=>dut_mac_inst_crc_reg_15, M0=>'X', CE=>'X', CLK=>'X', 
                LSR=>'X', OFX1=>open, F1=>dut_mac_inst_n5405, Q1=>open, 
                OFX0=>open, F0=>dut_mac_inst_n5675, Q0=>open);
    dut_mac_inst_SLICE_238I: SLOGICB
      generic map (LUT0_INITVAL=>X"FEF0", LUT1_INITVAL=>X"FEF0")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_mac_inst_n421, 
                B1=>dut_mac_inst_n6495, C1=>dut_n425, 
                D1=>dut_mac_inst_crc_reg_16, DI1=>'X', DI0=>'X', 
                A0=>dut_mac_inst_n421, B0=>dut_mac_inst_n6495, C0=>dut_n425, 
                D0=>dut_mac_inst_crc_reg_11, M0=>'X', CE=>'X', CLK=>'X', 
                LSR=>'X', OFX1=>open, F1=>dut_mac_inst_n5653, Q1=>open, 
                OFX0=>open, F0=>dut_mac_inst_n5697, Q0=>open);
    dut_mac_inst_SLICE_239I: SLOGICB
      generic map (LUT0_INITVAL=>X"FEF0", LUT1_INITVAL=>X"FEF0")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_mac_inst_n421, 
                B1=>dut_mac_inst_n6495, C1=>dut_n425, 
                D1=>dut_mac_inst_crc_reg_24, DI1=>'X', DI0=>'X', 
                A0=>dut_mac_inst_n421, B0=>dut_mac_inst_n6495, C0=>dut_n425, 
                D0=>dut_mac_inst_crc_reg_30, M0=>'X', CE=>'X', CLK=>'X', 
                LSR=>'X', OFX1=>open, F1=>dut_mac_inst_n5575, Q1=>open, 
                OFX0=>open, F0=>dut_mac_inst_n5701, Q0=>open);
    dut_mac_inst_SLICE_240I: SLOGICB
      generic map (LUT0_INITVAL=>X"FEF0", LUT1_INITVAL=>X"FEF0")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_mac_inst_n421, 
                B1=>dut_mac_inst_n6495, C1=>dut_n425, D1=>dut_crc_reg_31, 
                DI1=>'X', DI0=>'X', A0=>dut_mac_inst_n421, 
                B0=>dut_mac_inst_n6495, C0=>dut_n425, 
                D0=>dut_mac_inst_crc_reg_28, M0=>'X', CE=>'X', CLK=>'X', 
                LSR=>'X', OFX1=>open, F1=>dut_mac_inst_n5757, Q1=>open, 
                OFX0=>open, F0=>dut_mac_inst_n5543, Q0=>open);
    dut_mac_inst_SLICE_241I: SLOGICB
      generic map (LUT0_INITVAL=>X"FEF0", LUT1_INITVAL=>X"FEF0")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_mac_inst_n421, 
                B1=>dut_mac_inst_n6495, C1=>dut_n425, 
                D1=>dut_mac_inst_crc_reg_25, DI1=>'X', DI0=>'X', 
                A0=>dut_mac_inst_n421, B0=>dut_mac_inst_n6495, C0=>dut_n425, 
                D0=>dut_mac_inst_crc_reg_23, M0=>'X', CE=>'X', CLK=>'X', 
                LSR=>'X', OFX1=>open, F1=>dut_mac_inst_n5463, Q1=>open, 
                OFX0=>open, F0=>dut_mac_inst_n5487, Q0=>open);
    dut_mac_inst_SLICE_242I: SLOGICB
      generic map (LUT0_INITVAL=>X"FEF0", LUT1_INITVAL=>X"FEF0")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_mac_inst_n421, 
                B1=>dut_mac_inst_n6495, C1=>dut_n425, D1=>dut_crc_reg_9, 
                DI1=>'X', DI0=>'X', A0=>dut_mac_inst_n421, 
                B0=>dut_mac_inst_n6495, C0=>dut_n425, 
                D0=>dut_mac_inst_crc_reg_21, M0=>'X', CE=>'X', CLK=>'X', 
                LSR=>'X', OFX1=>open, F1=>dut_mac_inst_n5749, Q1=>open, 
                OFX0=>open, F0=>dut_mac_inst_n5579, Q0=>open);
    dut_mac_inst_SLICE_243I: SLOGICB
      generic map (LUT0_INITVAL=>X"FEF0", LUT1_INITVAL=>X"FEF0")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_mac_inst_n421, 
                B1=>dut_mac_inst_n6495, C1=>dut_n425, 
                D1=>dut_mac_inst_crc_reg_13, DI1=>'X', DI0=>'X', 
                A0=>dut_mac_inst_n421, B0=>dut_mac_inst_n6495, C0=>dut_n425, 
                D0=>dut_mac_inst_crc_reg_18, M0=>'X', CE=>'X', CLK=>'X', 
                LSR=>'X', OFX1=>open, F1=>dut_mac_inst_n5415, Q1=>open, 
                OFX0=>open, F0=>dut_mac_inst_n5519, Q0=>open);
    dut_mac_inst_SLICE_244I: SLOGICB
      generic map (LUT0_INITVAL=>X"7070", LUT1_INITVAL=>X"8080")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_mac_inst_crc_cnt_0, 
                B1=>dut_mac_inst_crc_cnt_1, C1=>dut_mac_inst_n421, D1=>'X', 
                DI1=>'X', DI0=>'X', A0=>dut_mac_inst_crc_cnt_0, 
                B0=>dut_mac_inst_crc_cnt_1, C0=>dut_mac_inst_n421, D0=>'X', 
                M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', OFX1=>open, 
                F1=>dut_mac_inst_n6487, Q1=>open, OFX0=>open, 
                F0=>dut_mac_inst_n1959, Q0=>open);
    dut_mac_inst_SLICE_245I: SLOGICB
      generic map (LUT0_INITVAL=>X"FEFE", LUT1_INITVAL=>X"FFFE")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_mac_inst_pad_cnt_1, 
                B1=>dut_mac_inst_pad_cnt_0, C1=>dut_mac_inst_pad_cnt_3, 
                D1=>dut_mac_inst_pad_cnt_2, DI1=>'X', DI0=>'X', 
                A0=>dut_mac_inst_pad_cnt_1, B0=>dut_mac_inst_pad_cnt_0, 
                C0=>dut_mac_inst_pad_cnt_2, D0=>'X', M0=>'X', CE=>'X', 
                CLK=>'X', LSR=>'X', OFX1=>open, F1=>dut_mac_inst_n6474, 
                Q1=>open, OFX0=>open, F0=>dut_mac_inst_n6481, Q0=>open);
    SLICE_246I: SLOGICB
      generic map (LUT0_INITVAL=>X"8080", LUT1_INITVAL=>X"8000")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>cnt_1, B1=>cnt_0, C1=>cnt_3, 
                D1=>cnt_2, DI1=>'X', DI0=>'X', A0=>cnt_1, B0=>cnt_0, C0=>cnt_2, 
                D0=>'X', M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', OFX1=>open, 
                F1=>n6475, Q1=>open, OFX0=>open, F0=>n6482, Q0=>open);
    dut_SLICE_247I: SLOGICB
      generic map (LUT0_INITVAL=>X"8888", LUT1_INITVAL=>X"60AA")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_idx_1, B1=>dut_idx_0, 
                C1=>dut_n15, D1=>dut_n6472, DI1=>'X', DI0=>'X', 
                A0=>dut_mac_inst_pre_cnt_1, B0=>dut_mac_inst_pre_cnt_0, 
                C0=>'X', D0=>'X', M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', 
                OFX1=>open, F1=>dut_udp_inst_next_idx_7_N_142_1, Q1=>open, 
                OFX0=>open, F0=>dut_mac_inst_n6509, Q0=>open);
    SLICE_248I: SLOGICB
      generic map (LUT0_INITVAL=>X"8888", LUT1_INITVAL=>X"DDDD")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>next_fifo_almostfull, 
                B1=>rst_c, C1=>'X', D1=>'X', DI1=>'X', DI0=>'X', 
                A0=>dut_mac_inst_ifg_cnt_1, B0=>dut_mac_inst_ifg_cnt_0, 
                C0=>'X', D0=>'X', M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', 
                OFX1=>open, F1=>n2447, Q1=>open, OFX0=>open, 
                F0=>dut_mac_inst_n6507, Q0=>open);
    dut_udp_inst_SLICE_249I: SLOGICB
      generic map (LUT0_INITVAL=>X"CAC0", LUT1_INITVAL=>X"ECA0")
      port map (M1=>'X', FXA=>'X', FXB=>'X', 
                A1=>dut_udp_inst_next_idx_7_N_150_3, 
                B1=>dut_udp_inst_next_idx_7_N_142_3, C1=>dut_n319, 
                D1=>dut_n318, DI1=>'X', DI0=>'X', A0=>dut_udp_inst_n1218, 
                B0=>dut_t_data_7_N_84_5, C0=>dut_n317, D0=>dut_n6497, M0=>'X', 
                CE=>'X', CLK=>'X', LSR=>'X', OFX1=>open, 
                F1=>dut_udp_inst_n5813, Q1=>open, OFX0=>open, 
                F0=>dut_udp_inst_n2038, Q0=>open);
    dut_udp_inst_SLICE_250I: SLOGICB
      generic map (LUT0_INITVAL=>X"8888", LUT1_INITVAL=>X"4808")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_idx_0, B1=>dut_n319, 
                C1=>dut_n6472, D1=>dut_n15_adj_721, DI1=>'X', DI0=>'X', 
                A0=>dut_udp_inst_n150, B0=>dut_n15_adj_721, C0=>'X', D0=>'X', 
                M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', OFX1=>open, 
                F1=>dut_udp_inst_n5095, Q1=>open, OFX0=>open, 
                F0=>dut_udp_inst_next_idx_7_N_161_7, Q0=>open);
    dut_mac_inst_crc_inst_SLICE_251I: SLOGICB
      generic map (LUT0_INITVAL=>X"6996", LUT1_INITVAL=>X"6996")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_n6458, 
                B1=>dut_mac_inst_crc_reg_2, C1=>dut_mac_inst_crc_reg_5, 
                D1=>dut_mac_inst_crc_reg_29, DI1=>'X', DI0=>'X', 
                A0=>dut_mac_inst_n6465, B0=>dut_n6466, 
                C0=>dut_mac_inst_crc_reg_3, D0=>dut_mac_inst_crc_inst_n14, 
                M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', OFX1=>open, 
                F1=>dut_mac_inst_crc_inst_n5597, Q1=>open, OFX0=>open, 
                F0=>dut_mac_inst_crc_inst_n8_adj_682, Q0=>open);
    dut_mac_inst_SLICE_252I: SLOGICB
      generic map (LUT0_INITVAL=>X"EEEE", LUT1_INITVAL=>X"1010")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_mac_inst_pad_cnt_5, 
                B1=>dut_mac_inst_pad_cnt_0, C1=>dut_mac_inst_n422, D1=>'X', 
                DI1=>'X', DI0=>'X', A0=>dut_mac_inst_pad_cnt_0, 
                B0=>dut_mac_inst_pad_cnt_3, C0=>'X', D0=>'X', M0=>'X', CE=>'X', 
                CLK=>'X', LSR=>'X', OFX1=>open, F1=>dut_mac_inst_n5881, 
                Q1=>open, OFX0=>open, F0=>dut_mac_inst_n5867, Q0=>open);
    dut_mac_inst_SLICE_253I: SLOGICB
      generic map (LUT0_INITVAL=>X"E1E1", LUT1_INITVAL=>X"EEEE")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>frame_len_2, B1=>frame_len_1, 
                C1=>'X', D1=>'X', DI1=>'X', DI0=>'X', A0=>frame_len_2, 
                B0=>frame_len_1, C0=>frame_len_3, D0=>'X', M0=>'X', CE=>'X', 
                CLK=>'X', LSR=>'X', OFX1=>open, F1=>dut_mac_inst_n6500, 
                Q1=>open, OFX0=>open, F0=>dut_mac_inst_n6385, Q0=>open);
    dut_udp_inst_SLICE_254I: SLOGICB
      generic map (LUT0_INITVAL=>X"8888", LUT1_INITVAL=>X"BBBB")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>dut_idx_4, B1=>dut_idx_2, 
                C1=>'X', D1=>'X', DI1=>'X', DI0=>'X', A0=>dut_idx_1, 
                B0=>dut_idx_0, C0=>'X', D0=>'X', M0=>'X', CE=>'X', CLK=>'X', 
                LSR=>'X', OFX1=>open, F1=>dut_udp_inst_n6510, Q1=>open, 
                OFX0=>open, F0=>dut_udp_inst_n6494, Q0=>open);
    dut_udp_inst_SLICE_255I: SLOGICB
      generic map (LUT0_INITVAL=>X"EEEE")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>'X', B1=>'X', C1=>'X', 
                D1=>'X', DI1=>'X', DI0=>'X', A0=>dut_udp_inst_n315, 
                B0=>dut_n316, C0=>'X', D0=>'X', M0=>'X', CE=>'X', CLK=>'X', 
                LSR=>'X', OFX1=>open, F1=>open, Q1=>open, OFX0=>open, 
                F0=>dut_udp_inst_n926, Q0=>open);
    dut_udp_inst_SLICE_256I: SLOGICB
      generic map (LUT0_INITVAL=>X"60AA")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>'X', B1=>'X', C1=>'X', 
                D1=>'X', DI1=>'X', DI0=>'X', A0=>dut_idx_4, 
                B0=>dut_udp_inst_n6486, C0=>dut_n15_adj_721, D0=>dut_n6472, 
                M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', OFX1=>open, F1=>open, 
                Q1=>open, OFX0=>open, F0=>dut_udp_inst_next_idx_7_N_150_4, 
                Q0=>open);
    dut_udp_inst_SLICE_257I: SLOGICB
      generic map (LUT0_INITVAL=>X"32C8")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>'X', B1=>'X', C1=>'X', 
                D1=>'X', DI1=>'X', DI0=>'X', A0=>dut_n317, B0=>dut_n6472, 
                C0=>dut_n318, D0=>dut_idx_0, M0=>'X', CE=>'X', CLK=>'X', 
                LSR=>'X', OFX1=>open, F1=>open, Q1=>open, OFX0=>open, 
                F0=>dut_udp_inst_n5107, Q0=>open);
    dut_udp_inst_SLICE_258I: SLOGICB
      generic map (LUT0_INITVAL=>X"8080")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>'X', B1=>'X', C1=>'X', 
                D1=>'X', DI1=>'X', DI0=>'X', A0=>dut_udp_inst_idx_5, 
                B0=>dut_idx_2, C0=>dut_udp_inst_idx_6, D0=>'X', M0=>'X', 
                CE=>'X', CLK=>'X', LSR=>'X', OFX1=>open, F1=>open, Q1=>open, 
                OFX0=>open, F0=>dut_udp_inst_n5849, Q0=>open);
    dut_udp_inst_SLICE_259I: SLOGICB
      generic map (LUT0_INITVAL=>X"8888")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>'X', B1=>'X', C1=>'X', 
                D1=>'X', DI1=>'X', DI0=>'X', A0=>dut_idx_3, B0=>dut_idx_4, 
                C0=>'X', D0=>'X', M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', 
                OFX1=>open, F1=>open, Q1=>open, OFX0=>open, 
                F0=>dut_udp_inst_n5845, Q0=>open);
    dut_udp_inst_SLICE_260I: SLOGICB
      generic map (LUT0_INITVAL=>X"8888")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>'X', B1=>'X', C1=>'X', 
                D1=>'X', DI1=>'X', DI0=>'X', A0=>dut_idx_4, 
                B0=>dut_udp_inst_idx_5, C0=>'X', D0=>'X', M0=>'X', CE=>'X', 
                CLK=>'X', LSR=>'X', OFX1=>open, F1=>open, Q1=>open, OFX0=>open, 
                F0=>dut_udp_inst_n5835, Q0=>open);
    dut_udp_inst_SLICE_261I: SLOGICB
      generic map (LUT0_INITVAL=>X"8888")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>'X', B1=>'X', C1=>'X', 
                D1=>'X', DI1=>'X', DI0=>'X', A0=>dut_idx_2, B0=>dut_idx_0, 
                C0=>'X', D0=>'X', M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', 
                OFX1=>open, F1=>open, Q1=>open, OFX0=>open, 
                F0=>dut_udp_inst_n5831, Q0=>open);
    dut_udp_inst_SLICE_262I: SLOGICB
      generic map (LUT0_INITVAL=>X"ECA0")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>'X', B1=>'X', C1=>'X', 
                D1=>'X', DI1=>'X', DI0=>'X', 
                A0=>dut_udp_inst_next_idx_7_N_150_2, 
                B0=>dut_udp_inst_next_idx_7_N_142_2, C0=>dut_n319, 
                D0=>dut_n318, M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', OFX1=>open, 
                F1=>open, Q1=>open, OFX0=>open, F0=>dut_udp_inst_n5787, 
                Q0=>open);
    dut_udp_inst_SLICE_263I: SLOGICB
      generic map (LUT0_INITVAL=>X"8888")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>'X', B1=>'X', C1=>'X', 
                D1=>'X', DI1=>'X', DI0=>'X', A0=>dut_idx_1, B0=>dut_idx_2, 
                C0=>'X', D0=>'X', M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', 
                OFX1=>open, F1=>open, Q1=>open, OFX0=>open, 
                F0=>dut_udp_inst_n6502, Q0=>open);
    dut_udp_inst_SLICE_264I: SLOGICB
      generic map (LUT0_INITVAL=>X"C088")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>'X', B1=>'X', C1=>'X', 
                D1=>'X', DI1=>'X', DI0=>'X', A0=>dut_idx_1, B0=>dut_n317, 
                C0=>dut_udp_inst_next_idx_7_N_183_1, D0=>dut_n6472, M0=>'X', 
                CE=>'X', CLK=>'X', LSR=>'X', OFX1=>open, F1=>open, Q1=>open, 
                OFX0=>open, F0=>dut_udp_inst_n4_adj_720, Q0=>open);
    dut_udp_inst_SLICE_265I: SLOGICB
      generic map (LUT0_INITVAL=>X"8888")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>'X', B1=>'X', C1=>'X', 
                D1=>'X', DI1=>'X', DI0=>'X', A0=>dut_idx_3, B0=>dut_idx_0, 
                C0=>'X', D0=>'X', M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', 
                OFX1=>open, F1=>open, Q1=>open, OFX0=>open, 
                F0=>dut_udp_inst_n6508, Q0=>open);
    dut_udp_inst_SLICE_266I: SLOGICB
      generic map (LUT0_INITVAL=>X"8888")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>'X', B1=>'X', C1=>'X', 
                D1=>'X', DI1=>'X', DI0=>'X', A0=>dut_idx_3, B0=>dut_idx_2, 
                C0=>'X', D0=>'X', M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', 
                OFX1=>open, F1=>open, Q1=>open, OFX0=>open, 
                F0=>dut_udp_inst_n6, Q0=>open);
    dut_udp_inst_SLICE_267I: SLOGICB
      generic map (LUT0_INITVAL=>X"DDDD")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>'X', B1=>'X', C1=>'X', 
                D1=>'X', DI1=>'X', DI0=>'X', A0=>dut_idx_0, B0=>dut_idx_1, 
                C0=>'X', D0=>'X', M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', 
                OFX1=>open, F1=>open, Q1=>open, OFX0=>open, 
                F0=>dut_udp_inst_n6511, Q0=>open);
    dut_udp_inst_SLICE_268I: SLOGICB
      generic map (LUT0_INITVAL=>X"DFDF")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>'X', B1=>'X', C1=>'X', 
                D1=>'X', DI1=>'X', DI0=>'X', A0=>dut_n318, B0=>dut_idx_4, 
                C0=>dut_idx_3, D0=>'X', M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', 
                OFX1=>open, F1=>open, Q1=>open, OFX0=>open, 
                F0=>dut_udp_inst_n5951, Q0=>open);
    dut_udp_inst_SLICE_269I: SLOGICB
      generic map (LUT0_INITVAL=>X"2222")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>'X', B1=>'X', C1=>'X', 
                D1=>'X', DI1=>'X', DI0=>'X', A0=>dut_n316, 
                B0=>dut_reg_fifo_empty, C0=>'X', D0=>'X', M0=>'X', CE=>'X', 
                CLK=>'X', LSR=>'X', OFX1=>open, F1=>open, Q1=>open, OFX0=>open, 
                F0=>dut_udp_inst_n1946, Q0=>open);
    dut_SLICE_270I: SLOGICB
      generic map (M0MUX=>"SIG", CLKMUX=>"SIG", CEMUX=>"VHI", SRMODE=>"ASYNC", 
                   LUT0_INITVAL=>X"8888", CHECK_M0=>TRUE)
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>'X', B1=>'X', C1=>'X', 
                D1=>'X', DI1=>'X', DI0=>'X', A0=>dut_reg_fifo_almostfull, 
                B0=>dut_udp_inst_n320, C0=>'X', D0=>'X', M0=>fifo_almostfull, 
                CE=>'X', CLK=>clk_c, LSR=>'X', OFX1=>open, F1=>open, Q1=>open, 
                OFX0=>open, F0=>dut_udp_inst_n337, Q0=>dut_reg_fifo_almostfull);
    dut_udp_inst_SLICE_271I: SLOGICB
      generic map (LUT0_INITVAL=>X"FE10")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>'X', B1=>'X', C1=>'X', 
                D1=>'X', DI1=>'X', DI0=>'X', A0=>dut_udp_inst_n320, 
                B0=>dut_udp_inst_n315, C0=>dut_n6463, D0=>dut_crc_reg_9, 
                M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', OFX1=>open, F1=>open, 
                Q1=>open, OFX0=>open, F0=>dut_next_crc_reg_31_N_390_9, 
                Q0=>open);
    dut_udp_inst_SLICE_272I: SLOGICB
      generic map (LUT0_INITVAL=>X"1111")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>'X', B1=>'X', C1=>'X', 
                D1=>'X', DI1=>'X', DI0=>'X', A0=>dut_idx_2, B0=>dut_idx_3, 
                C0=>'X', D0=>'X', M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', 
                OFX1=>open, F1=>open, Q1=>open, OFX0=>open, 
                F0=>dut_udp_inst_n6496, Q0=>open);
    dut_udp_inst_SLICE_273I: SLOGICB
      generic map (LUT0_INITVAL=>X"0202")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>'X', B1=>'X', C1=>'X', 
                D1=>'X', DI1=>'X', DI0=>'X', A0=>dut_idx_0, B0=>dut_idx_1, 
                C0=>dut_idx_2, D0=>'X', M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', 
                OFX1=>open, F1=>open, Q1=>open, OFX0=>open, 
                F0=>dut_udp_inst_t_data_7_N_84_6, Q0=>open);
    dut_udp_inst_SLICE_274I: SLOGICB
      generic map (LUT0_INITVAL=>X"0E0E")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>'X', B1=>'X', C1=>'X', 
                D1=>'X', DI1=>'X', DI0=>'X', A0=>dut_n319, B0=>dut_n318, 
                C0=>dut_n317, D0=>'X', M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', 
                OFX1=>open, F1=>open, Q1=>open, OFX0=>open, 
                F0=>dut_udp_inst_n5625, Q0=>open);
    dut_mac_inst_SLICE_275I: SLOGICB
      generic map (LUT0_INITVAL=>X"88C0")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>'X', B1=>'X', C1=>'X', 
                D1=>'X', DI1=>'X', DI0=>'X', A0=>dut_mac_inst_crc_reg_13, 
                B0=>dut_n423, C0=>dut_mac_inst_crc_next_13, D0=>dut_n6493, 
                M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', OFX1=>open, F1=>open, 
                Q1=>open, OFX0=>open, F0=>dut_mac_inst_n2_adj_689, Q0=>open);
    dut_mac_inst_SLICE_276I: SLOGICB
      generic map (LUT0_INITVAL=>X"8888")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>'X', B1=>'X', C1=>'X', 
                D1=>'X', DI1=>'X', DI0=>'X', A0=>dut_crc_next_12, 
                B0=>dut_mac_inst_n422, C0=>'X', D0=>'X', M0=>'X', CE=>'X', 
                CLK=>'X', LSR=>'X', OFX1=>open, F1=>open, Q1=>open, OFX0=>open, 
                F0=>dut_mac_inst_n3, Q0=>open);
    dut_mac_inst_SLICE_277I: SLOGICB
      generic map (LUT0_INITVAL=>X"88C0")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>'X', B1=>'X', C1=>'X', 
                D1=>'X', DI1=>'X', DI0=>'X', A0=>dut_mac_inst_crc_reg_28, 
                B0=>dut_n423, C0=>dut_mac_inst_crc_next_28, D0=>dut_n6493, 
                M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', OFX1=>open, F1=>open, 
                Q1=>open, OFX0=>open, F0=>dut_mac_inst_n2_adj_698, Q0=>open);
    dut_mac_inst_SLICE_278I: SLOGICB
      generic map (LUT0_INITVAL=>X"B4F0")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>'X', B1=>'X', C1=>'X', 
                D1=>'X', DI1=>'X', DI0=>'X', A0=>dut_n6493, B0=>dut_n423, 
                C0=>dut_mac_inst_crc_reg_6, D0=>dut_udp_tdata_0, M0=>'X', 
                CE=>'X', CLK=>'X', LSR=>'X', OFX1=>open, F1=>open, Q1=>open, 
                OFX0=>open, F0=>dut_mac_inst_n5399, Q0=>open);
    dut_mac_inst_SLICE_279I: SLOGICB
      generic map (LUT0_INITVAL=>X"88C0")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>'X', B1=>'X', C1=>'X', 
                D1=>'X', DI1=>'X', DI0=>'X', A0=>dut_mac_inst_crc_reg_4, 
                B0=>dut_n423, C0=>dut_mac_inst_crc_next_4, D0=>dut_n6493, 
                M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', OFX1=>open, F1=>open, 
                Q1=>open, OFX0=>open, F0=>dut_mac_inst_n2_adj_704, Q0=>open);
    dut_mac_inst_SLICE_280I: SLOGICB
      generic map (LUT0_INITVAL=>X"88C0")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>'X', B1=>'X', C1=>'X', 
                D1=>'X', DI1=>'X', DI0=>'X', A0=>dut_mac_inst_crc_reg_24, 
                B0=>dut_n423, C0=>dut_mac_inst_crc_next_24, D0=>dut_n6493, 
                M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', OFX1=>open, F1=>open, 
                Q1=>open, OFX0=>open, F0=>dut_mac_inst_n2_adj_706, Q0=>open);
    dut_mac_inst_SLICE_281I: SLOGICB
      generic map (LUT0_INITVAL=>X"88C0")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>'X', B1=>'X', C1=>'X', 
                D1=>'X', DI1=>'X', DI0=>'X', A0=>dut_mac_inst_crc_reg_3, 
                B0=>dut_n423, C0=>dut_mac_inst_crc_next_3, D0=>dut_n6493, 
                M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', OFX1=>open, F1=>open, 
                Q1=>open, OFX0=>open, F0=>dut_mac_inst_n2_adj_705, Q0=>open);
    dut_mac_inst_SLICE_282I: SLOGICB
      generic map (LUT0_INITVAL=>X"88C0")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>'X', B1=>'X', C1=>'X', 
                D1=>'X', DI1=>'X', DI0=>'X', A0=>dut_mac_inst_crc_reg_22, 
                B0=>dut_n423, C0=>dut_mac_inst_crc_next_22, D0=>dut_n6493, 
                M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', OFX1=>open, F1=>open, 
                Q1=>open, OFX0=>open, F0=>dut_mac_inst_n2_adj_709, Q0=>open);
    dut_mac_inst_SLICE_283I: SLOGICB
      generic map (LUT0_INITVAL=>X"88C0")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>'X', B1=>'X', C1=>'X', 
                D1=>'X', DI1=>'X', DI0=>'X', A0=>dut_mac_inst_crc_reg_2, 
                B0=>dut_n423, C0=>dut_mac_inst_crc_next_2, D0=>dut_n6493, 
                M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', OFX1=>open, F1=>open, 
                Q1=>open, OFX0=>open, F0=>dut_mac_inst_n2_adj_708, Q0=>open);
    dut_mac_inst_SLICE_284I: SLOGICB
      generic map (LUT0_INITVAL=>X"88C0")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>'X', B1=>'X', C1=>'X', 
                D1=>'X', DI1=>'X', DI0=>'X', A0=>dut_mac_inst_crc_reg_21, 
                B0=>dut_n423, C0=>dut_mac_inst_crc_next_21, D0=>dut_n6493, 
                M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', OFX1=>open, F1=>open, 
                Q1=>open, OFX0=>open, F0=>dut_mac_inst_n2_adj_711, Q0=>open);
    dut_mac_inst_SLICE_285I: SLOGICB
      generic map (LUT0_INITVAL=>X"FEF0")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>'X', B1=>'X', C1=>'X', 
                D1=>'X', DI1=>'X', DI0=>'X', A0=>dut_mac_inst_n421, 
                B0=>dut_mac_inst_n6495, C0=>dut_n425, 
                D0=>dut_mac_inst_crc_reg_17, M0=>'X', CE=>'X', CLK=>'X', 
                LSR=>'X', OFX1=>open, F1=>open, Q1=>open, OFX0=>open, 
                F0=>dut_mac_inst_n5395, Q0=>open);
    dut_mac_inst_SLICE_286I: SLOGICB
      generic map (LUT0_INITVAL=>X"E2C0")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>'X', B1=>'X', C1=>'X', 
                D1=>'X', DI1=>'X', DI0=>'X', A0=>dut_n423, 
                B0=>dut_mac_inst_n421, C0=>dut_mac_inst_gmii_txd_7_N_202_3, 
                D0=>dut_gmii_txd_7_N_210_3, M0=>'X', CE=>'X', CLK=>'X', 
                LSR=>'X', OFX1=>open, F1=>open, Q1=>open, OFX0=>open, 
                F0=>dut_gmii_txd_3, Q0=>open);
    dut_mac_inst_SLICE_287I: SLOGICB
      generic map (LUT0_INITVAL=>X"2222")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>'X', B1=>'X', C1=>'X', 
                D1=>'X', DI1=>'X', DI0=>'X', A0=>dut_n425, B0=>dut_n423, 
                C0=>'X', D0=>'X', M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', 
                OFX1=>open, F1=>open, Q1=>open, OFX0=>open, 
                F0=>dut_mac_inst_n1312, Q0=>open);
    dut_mac_inst_SLICE_288I: SLOGICB
      generic map (LUT0_INITVAL=>X"2DD2")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>'X', B1=>'X', C1=>'X', 
                D1=>'X', DI1=>'X', DI0=>'X', A0=>dut_udp_tdata_0, 
                B0=>dut_n6484, C0=>dut_mac_inst_crc_reg_0, 
                D0=>dut_mac_inst_crc_reg_5, M0=>'X', CE=>'X', CLK=>'X', 
                LSR=>'X', OFX1=>open, F1=>open, Q1=>open, OFX0=>open, 
                F0=>dut_mac_inst_n5553, Q0=>open);
    dut_mac_inst_SLICE_289I: SLOGICB
      generic map (LUT0_INITVAL=>X"CACA")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>'X', B1=>'X', C1=>'X', 
                D1=>'X', DI1=>'X', DI0=>'X', A0=>dut_mac_inst_n2014, 
                B0=>dut_mac_inst_gmii_txd_7_N_202_6, C0=>dut_mac_inst_n421, 
                D0=>'X', M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', OFX1=>open, 
                F1=>open, Q1=>open, OFX0=>open, F0=>dut_gmii_txd_6, Q0=>open);
    dut_mac_inst_SLICE_290I: SLOGICB
      generic map (LUT0_INITVAL=>X"00E0")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>'X', B1=>'X', C1=>'X', 
                D1=>'X', DI1=>'X', DI0=>'X', A0=>dut_mac_inst_n6477, 
                B0=>dut_n423, C0=>dut_n319, D0=>dut_n15_adj_721, M0=>'X', 
                CE=>'X', CLK=>'X', LSR=>'X', OFX1=>open, F1=>open, Q1=>open, 
                OFX0=>open, F0=>dut_n5318, Q0=>open);
    dut_mac_inst_SLICE_291I: SLOGICB
      generic map (LUT0_INITVAL=>X"CACA")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>'X', B1=>'X', C1=>'X', 
                D1=>'X', DI1=>'X', DI0=>'X', A0=>dut_mac_inst_n2018, 
                B0=>dut_mac_inst_gmii_txd_7_N_202_2, C0=>dut_mac_inst_n421, 
                D0=>'X', M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', OFX1=>open, 
                F1=>open, Q1=>open, OFX0=>open, F0=>dut_gmii_txd_2, Q0=>open);
    dut_mac_inst_SLICE_292I: SLOGICB
      generic map (LUT0_INITVAL=>X"8888")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>'X', B1=>'X', C1=>'X', 
                D1=>'X', DI1=>'X', DI0=>'X', A0=>dut_crc_next_31, 
                B0=>dut_mac_inst_n422, C0=>'X', D0=>'X', M0=>'X', CE=>'X', 
                CLK=>'X', LSR=>'X', OFX1=>open, F1=>open, Q1=>open, OFX0=>open, 
                F0=>dut_mac_inst_n3_adj_713, Q0=>open);
    dut_mac_inst_SLICE_293I: SLOGICB
      generic map (LUT0_INITVAL=>X"FFF4")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>'X', B1=>'X', C1=>'X', 
                D1=>'X', DI1=>'X', DI0=>'X', A0=>n399, B0=>dut_n6479, 
                C0=>rst_c, D0=>dut_mac_inst_n422, M0=>'X', CE=>'X', CLK=>'X', 
                LSR=>'X', OFX1=>open, F1=>open, Q1=>open, OFX0=>open, 
                F0=>dut_mac_inst_clk_c_enable_9, Q0=>open);
    dut_mac_inst_crc_inst_SLICE_294I: SLOGICB
      generic map (LUT0_INITVAL=>X"9696")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>'X', B1=>'X', C1=>'X', 
                D1=>'X', DI1=>'X', DI0=>'X', A0=>dut_mac_inst_crc_reg_3, 
                B0=>dut_mac_inst_crc_reg_2, C0=>dut_mac_inst_crc_reg_23, 
                D0=>'X', M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', OFX1=>open, 
                F1=>open, Q1=>open, OFX0=>open, 
                F0=>dut_mac_inst_crc_inst_n5659, Q0=>open);
    dut_mac_inst_crc_inst_SLICE_295I: SLOGICB
      generic map (LUT0_INITVAL=>X"6996")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>'X', B1=>'X', C1=>'X', 
                D1=>'X', DI1=>'X', DI0=>'X', A0=>dut_mac_inst_crc_reg_6, 
                B0=>dut_mac_inst_crc_reg_1, C0=>dut_mac_inst_crc_reg_2, 
                D0=>dut_mac_inst_crc_reg_22, M0=>'X', CE=>'X', CLK=>'X', 
                LSR=>'X', OFX1=>open, F1=>open, Q1=>open, OFX0=>open, 
                F0=>dut_mac_inst_crc_inst_n5715, Q0=>open);
    dut_mac_inst_crc_inst_SLICE_296I: SLOGICB
      generic map (LUT0_INITVAL=>X"9696")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>'X', B1=>'X', C1=>'X', 
                D1=>'X', DI1=>'X', DI0=>'X', A0=>dut_mac_inst_crc_reg_7, 
                B0=>dut_mac_inst_crc_reg_1, C0=>dut_mac_inst_crc_reg_16, 
                D0=>'X', M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', OFX1=>open, 
                F1=>open, Q1=>open, OFX0=>open, 
                F0=>dut_mac_inst_crc_inst_n5533, Q0=>open);
    dut_mac_inst_crc_inst_SLICE_297I: SLOGICB
      generic map (LUT0_INITVAL=>X"6996")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>'X', B1=>'X', C1=>'X', 
                D1=>'X', DI1=>'X', DI0=>'X', A0=>dut_n6457, B0=>dut_n6460, 
                C0=>dut_mac_inst_n6491, D0=>dut_mac_inst_crc_reg_5, M0=>'X', 
                CE=>'X', CLK=>'X', LSR=>'X', OFX1=>open, F1=>open, Q1=>open, 
                OFX0=>open, F0=>dut_mac_inst_n5124, Q0=>open);
    dut_mac_inst_crc_inst_SLICE_298I: SLOGICB
      generic map (LUT0_INITVAL=>X"9696")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>'X', B1=>'X', C1=>'X', 
                D1=>'X', DI1=>'X', DI0=>'X', A0=>dut_mac_inst_crc_reg_0, 
                B0=>dut_mac_inst_crc_reg_5, C0=>dut_mac_inst_crc_reg_15, 
                D0=>'X', M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', OFX1=>open, 
                F1=>open, Q1=>open, OFX0=>open, 
                F0=>dut_mac_inst_crc_inst_n5525, Q0=>open);
    dut_mac_inst_crc_inst_SLICE_299I: SLOGICB
      generic map (LUT0_INITVAL=>X"9600")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>'X', B1=>'X', C1=>'X', 
                D1=>'X', DI1=>'X', DI0=>'X', A0=>dut_mac_inst_crc_reg_7, 
                B0=>dut_n6467, C0=>dut_mac_inst_crc_reg_17, 
                D0=>dut_mac_inst_n422, M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', 
                OFX1=>open, F1=>open, Q1=>open, OFX0=>open, 
                F0=>dut_mac_inst_n3_adj_693, Q0=>open);
    dut_mac_inst_crc_inst_SLICE_300I: SLOGICB
      generic map (LUT0_INITVAL=>X"6996")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>'X', B1=>'X', C1=>'X', 
                D1=>'X', DI1=>'X', DI0=>'X', A0=>dut_n6457, 
                B0=>dut_mac_inst_n5643, C0=>dut_mac_inst_crc_reg_7, 
                D0=>dut_mac_inst_crc_reg_13, M0=>'X', CE=>'X', CLK=>'X', 
                LSR=>'X', OFX1=>open, F1=>open, Q1=>open, OFX0=>open, 
                F0=>dut_mac_inst_crc_inst_n5647, Q0=>open);
    dut_mac_inst_crc_inst_SLICE_301I: SLOGICB
      generic map (LUT0_INITVAL=>X"6666")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>'X', B1=>'X', C1=>'X', 
                D1=>'X', DI1=>'X', DI0=>'X', A0=>dut_mac_inst_crc_reg_5, 
                B0=>dut_mac_inst_crc_reg_11, C0=>'X', D0=>'X', M0=>'X', 
                CE=>'X', CLK=>'X', LSR=>'X', OFX1=>open, F1=>open, Q1=>open, 
                OFX0=>open, F0=>dut_mac_inst_crc_inst_n5603, Q0=>open);
    dut_mac_inst_crc_inst_SLICE_302I: SLOGICB
      generic map (LUT0_INITVAL=>X"6996")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>'X', B1=>'X', C1=>'X', 
                D1=>'X', DI1=>'X', DI0=>'X', A0=>dut_n6458, B0=>dut_n6466, 
                C0=>dut_mac_inst_crc_inst_n6512, D0=>dut_mac_inst_crc_reg_5, 
                M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', OFX1=>open, F1=>open, 
                Q1=>open, OFX0=>open, F0=>dut_mac_inst_crc_inst_n5587, 
                Q0=>open);
    dut_mac_inst_crc_inst_SLICE_303I: SLOGICB
      generic map (LUT0_INITVAL=>X"6666")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>'X', B1=>'X', C1=>'X', 
                D1=>'X', DI1=>'X', DI0=>'X', A0=>dut_mac_inst_crc_reg_0, 
                B0=>dut_crc_reg_9, C0=>'X', D0=>'X', M0=>'X', CE=>'X', 
                CLK=>'X', LSR=>'X', OFX1=>open, F1=>open, Q1=>open, OFX0=>open, 
                F0=>dut_mac_inst_crc_inst_n5665, Q0=>open);
    dut_mac_inst_crc_inst_SLICE_304I: SLOGICB
      generic map (LUT0_INITVAL=>X"6996")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>'X', B1=>'X', C1=>'X', 
                D1=>'X', DI1=>'X', DI0=>'X', A0=>dut_mac_inst_crc_reg_0, 
                B0=>dut_mac_inst_crc_reg_2, C0=>dut_crc_reg_12, 
                D0=>dut_mac_inst_crc_reg_6, M0=>'X', CE=>'X', CLK=>'X', 
                LSR=>'X', OFX1=>open, F1=>open, Q1=>open, OFX0=>open, 
                F0=>dut_mac_inst_crc_inst_n5445, Q0=>open);
    dut_mac_inst_crc_inst_SLICE_305I: SLOGICB
      generic map (LUT0_INITVAL=>X"9696")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>'X', B1=>'X', C1=>'X', 
                D1=>'X', DI1=>'X', DI0=>'X', A0=>dut_mac_inst_crc_reg_0, 
                B0=>dut_mac_inst_crc_reg_1, C0=>dut_mac_inst_crc_reg_25, 
                D0=>'X', M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', OFX1=>open, 
                F1=>open, Q1=>open, OFX0=>open, F0=>dut_mac_inst_crc_inst_n8, 
                Q0=>open);
    SLICE_306I: SLOGICB
      generic map (LUT0_INITVAL=>X"EEEE")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>'X', B1=>'X', C1=>'X', 
                D1=>'X', DI1=>'X', DI0=>'X', A0=>next_fifo_almostfull, 
                B0=>rst_c, C0=>'X', D0=>'X', M0=>'X', CE=>'X', CLK=>'X', 
                LSR=>'X', OFX1=>open, F1=>open, Q1=>open, OFX0=>open, 
                F0=>clk_c_enable_16, Q0=>open);
    rgmii_txcI: rgmii_txcB
      port map (IOLDO=>buf_clkout, rgmiitxc=>rgmii_txc);
    rgmii_txc_MGIOLI: rgmii_txc_MGIOL
      port map (IOLDO=>buf_clkout, CLK=>clk_c);
    rgmii_txctlI: rgmii_txctlB
      port map (IOLDO=>buf_douto4, rgmiitxctl=>rgmii_txctl);
    rgmii_txctl_MGIOLI: rgmii_txctl_MGIOL
      port map (IOLDO=>buf_douto4, TXDATA0=>dut_ctl_reg, TXDATA1=>dut_ctl_reg, 
                CLK=>clk_c);
    rgmii_txd_3_I: rgmii_txd_3_B
      port map (IOLDO=>buf_douto3, rgmiitxd3=>rgmii_txd(3));
    rgmii_txd_3_MGIOLI: rgmii_txd_3_MGIOL
      port map (IOLDO=>buf_douto3, TXDATA0=>dut_gmii_txd_3, 
                TXDATA1=>dut_gmii_txd_7, CLK=>clk_c);
    rgmii_txd_2_I: rgmii_txd_2_B
      port map (IOLDO=>buf_douto2, rgmiitxd2=>rgmii_txd(2));
    rgmii_txd_2_MGIOLI: rgmii_txd_2_MGIOL
      port map (IOLDO=>buf_douto2, TXDATA0=>dut_gmii_txd_2, 
                TXDATA1=>dut_gmii_txd_6, CLK=>clk_c);
    rgmii_txd_1_I: rgmii_txd_1_B
      port map (IOLDO=>buf_douto1, rgmiitxd1=>rgmii_txd(1));
    rgmii_txd_1_MGIOLI: rgmii_txd_1_MGIOL
      port map (IOLDO=>buf_douto1, TXDATA0=>dut_gmii_txd_1, 
                TXDATA1=>dut_gmii_txd_5, CLK=>clk_c);
    rgmii_txd_0_I: rgmii_txd_0_B
      port map (IOLDO=>buf_douto0, rgmiitxd0=>rgmii_txd(0));
    rgmii_txd_0_MGIOLI: rgmii_txd_0_MGIOL
      port map (IOLDO=>buf_douto0, TXDATA0=>dut_gmii_txd_0, 
                TXDATA1=>dut_gmii_txd_4, CLK=>clk_c);
    rstI: rstB
      port map (PADDI=>rst_c, rstS=>rst);
    clkI: clkB
      port map (PADDI=>clk_c, clkS=>clk);
    GSR_INST: GSR_INSTB
      port map (GSRNET=>rst_c);
    VHI_INST: VHI
      port map (Z=>VCCI);
    PUR_INST: PUR
      port map (PUR=>VCCI);
  end Structure;



  library IEEE, vital2000, ECP5U;
  configuration Structure_CON of top_tb_fpga is
    for Structure
    end for;
  end Structure_CON;


