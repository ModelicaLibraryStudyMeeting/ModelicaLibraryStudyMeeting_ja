package FluidReaction_v008
  import Modelica.Media;
  import Modelica.Media.IdealGases.Common;
  
  type VolumeFlowRate = Real (final quantity="VolumeFlowRate", final unit="m3/s");

//物性値データリスト"SingleGasesData"、"FluidData"。Media以下を直接読むと遅くなるので、必要な化学種だけ抜粋してコピー

  package SingleGasesData "Ideal gas data based on the NASA Glenn coefficients"
    extends Modelica.Icons.Package;
    import Modelica.Media.IdealGases;
    constant IdealGases.Common.DataRecord CO2(
      name="CO2",
      MM=0.0440095,
      Hf=-8941478.544405185,
      H0=212805.6215135368,
      Tlimit=1000,
      alow={49436.5054,-626.411601,5.30172524,0.002503813816,-2.127308728e-007,-7.68998878e-010,
          2.849677801e-013},
      blow={-45281.9846,-7.04827944},
      ahigh={117696.2419,-1788.791477,8.29152319,-9.22315678e-005,4.86367688e-009,
          -1.891053312e-012,6.330036589999999e-016},
      bhigh={-39083.5059,-26.52669281},
      R=188.9244822140674);
    constant IdealGases.Common.DataRecord H2O(
      name="H2O",
      MM=0.01801528,
      Hf=-13423382.81725291,
      H0=549760.6476280135,
      Tlimit=1000,
      alow={-39479.6083,575.573102,0.931782653,0.00722271286,-7.34255737e-006,
          4.95504349e-009,-1.336933246e-012},
      blow={-33039.7431,17.24205775},
      ahigh={1034972.096,-2412.698562,4.64611078,0.002291998307,-6.836830479999999e-007,
          9.426468930000001e-011,-4.82238053e-015},
      bhigh={-13842.86509,-7.97814851},
      R=461.5233290850878);
    constant IdealGases.Common.DataRecord O2(
      name="O2",
      MM=0.0319988,
      Hf=0,
      H0=271263.4223783392,
      Tlimit=1000,
      alow={-34255.6342,484.700097,1.119010961,0.00429388924,-6.83630052e-007,-2.0233727e-009,
          1.039040018e-012},
      blow={-3391.45487,18.4969947},
      ahigh={-1037939.022,2344.830282,1.819732036,0.001267847582,-2.188067988e-007,
          2.053719572e-011,-8.193467050000001e-016},
      bhigh={-16890.10929,17.38716506},
      R=259.8369938872708);
    constant IdealGases.Common.DataRecord N2(
      name="N2",
      MM=0.0280134,
      Hf=0,
      H0=309498.4543111511,
      Tlimit=1000,
      alow={22103.71497,-381.846182,6.08273836,-0.00853091441,1.384646189e-005,-9.62579362e-009,
          2.519705809e-012},
      blow={710.846086,-10.76003744},
      ahigh={587712.406,-2239.249073,6.06694922,-0.00061396855,1.491806679e-007,-1.923105485e-011,
          1.061954386e-015},
      bhigh={12832.10415,-15.86640027},
      R=296.8033869505308);
    constant IdealGases.Common.DataRecord CO(
      name="CO",
      MM=0.0280101,
      Hf=-3946262.098314536,
      H0=309570.6191695138,
      Tlimit=1000,
      alow={14890.45326,-292.2285939,5.72452717,-0.008176235030000001,
          1.456903469e-005,-1.087746302e-008,3.027941827e-012},
      blow={-13031.31878,-7.85924135},
      ahigh={461919.725,-1944.704863,5.91671418,-0.0005664282830000001,
          1.39881454e-007,-1.787680361e-011,9.62093557e-016},
      bhigh={-2466.261084,-13.87413108},
      R=296.8383547363272);
    constant IdealGases.Common.DataRecord H2(
      name="H2",
      MM=0.00201588,
      Hf=0,
      H0=4200697.462150524,
      Tlimit=1000,
      alow={40783.2321,-800.918604,8.21470201,-0.01269714457,1.753605076e-005,-1.20286027e-008,
          3.36809349e-012},
      blow={2682.484665,-30.43788844},
      ahigh={560812.801,-837.150474,2.975364532,0.001252249124,-3.74071619e-007,
          5.936625200000001e-011,-3.6069941e-015},
      bhigh={5339.82441,-2.202774769},
      R=4124.487568704486);
    constant IdealGases.Common.DataRecord SO2(
      name="SO2",
      MM=0.0640638,
      Hf=-4633037.690552231,
      H0=164650.3485587805,
      Tlimit=1000,
      alow={-53108.4214,909.031167,-2.356891244,0.02204449885,-2.510781471e-005,
          1.446300484e-008,-3.36907094e-012},
      blow={-41137.52080000001,40.45512519},
      ahigh={-112764.0116,-825.226138,7.61617863,-0.000199932761,5.65563143e-008,
          -5.45431661e-012,2.918294102e-016},
      bhigh={-33513.0869,-16.55776085},
      R=129.7842463294403);
    constant IdealGases.Common.DataRecord OH(
      name="OH",
      MM=0.01700734,
      Hf=2191889.266634288,
      H0=518194.2620068747,
      Tlimit=1000,
      alow={-1998.85899,93.0013616,3.050854229,0.001529529288,-3.157890998e-006,
          3.31544618e-009,-1.138762683e-012},
      blow={2991.214235,4.67411079},
      ahigh={1017393.379,-2509.957276,5.11654786,0.000130529993,-8.284322259999999e-008,
          2.006475941e-011,-1.556993656e-015},
      bhigh={20196.40206,-11.01282337},
      R=488.8755090449183);
    constant IdealGases.Common.DataRecord O(
      name="O",
      MM=0.0159994,
      Hf=15574021.71331425,
      H0=420353.4507544033,
      Tlimit=1000,
      alow={-7953.611300000001,160.7177787,1.966226438,0.00101367031,-1.110415423e-006,
          6.5175075e-010,-1.584779251e-013},
      blow={28403.62437,8.404241819999999},
      ahigh={261902.0262,-729.872203,3.31717727,-0.000428133436,1.036104594e-007,
          -9.438304329999999e-012,2.725038297e-016},
      bhigh={33924.2806,-0.667958535},
      R=519.6739877745415);
    constant IdealGases.Common.DataRecord H(
      name="H",
      MM=0.00100794,
      Hf=216281552.4733615,
      H0=6148608.052066591,
      Tlimit=1000,
      alow={0,0,2.5,0,0,0,0},
      blow={25473.70801,-0.446682853},
      ahigh={60.78774250000001,-0.1819354417,2.500211817,-1.226512864e-007,
          3.73287633e-011,-5.68774456e-015,3.410210197e-019},
      bhigh={25474.86398,-0.448191777},
      R=8248.975137408972);
    constant IdealGases.Common.DataRecord CH4(
      name="CH4",
      MM=0.01604246,
      Hf=-4650159.63885838,
      H0=624355.7409524474,
      Tlimit=1000,
      alow={-176685.0998,2786.18102,-12.0257785,0.0391761929,-3.61905443e-005,
          2.026853043e-008,-4.976705489999999e-012},
      blow={-23313.1436,89.0432275},
      ahigh={3730042.76,-13835.01485,20.49107091,-0.001961974759,4.72731304e-007,
          -3.72881469e-011,1.623737207e-015},
      bhigh={75320.6691,-121.9124889},
      R=518.2791167938085);
    constant IdealGases.Common.DataRecord C2H6(
      name="C2H6",
      MM=0.03006904,
      Hf=-2788633.890539904,
      H0=395476.3437741943,
      Tlimit=1000,
      alow={-186204.4161,3406.19186,-19.51705092,0.0756583559,-8.20417322e-005,
          5.0611358e-008,-1.319281992e-011},
      blow={-27029.3289,129.8140496},
      ahigh={5025782.13,-20330.22397,33.2255293,-0.00383670341,7.23840586e-007,-7.3191825e-011,
          3.065468699e-015},
      bhigh={111596.395,-203.9410584},
      R=276.5127187299628);
    constant IdealGases.Common.DataRecord C3H8(
      name="C3H8",
      MM=0.04409562,
      Hf=-2373931.923397381,
      H0=334301.1845620949,
      Tlimit=1000,
      alow={-243314.4337,4656.27081,-29.39466091,0.1188952745,-0.0001376308269,
          8.814823909999999e-008,-2.342987994e-011},
      blow={-35403.3527,184.1749277},
      ahigh={6420731.680000001,-26597.91134,45.3435684,-0.00502066392,
          9.471216939999999e-007,-9.57540523e-011,4.00967288e-015},
      bhigh={145558.2459,-281.8374734},
      R=188.5555073270316);
    constant IdealGases.Common.DataRecord C4H10_n_butane(
      name="C4H10_n_butane",
      MM=0.0581222,
      Hf=-2164233.28779709,
      H0=330832.0228759407,
      Tlimit=1000,
      alow={-317587.254,6176.331819999999,-38.9156212,0.1584654284,-0.0001860050159,
          1.199676349e-007,-3.20167055e-011},
      blow={-45403.63390000001,237.9488665},
      ahigh={7682322.45,-32560.5151,57.3673275,-0.00619791681,1.180186048e-006,-1.221893698e-010,
          5.250635250000001e-015},
      bhigh={177452.656,-358.791876},
      R=143.0515706563069);
  end SingleGasesData;
  
  package FluidData "Critical data, dipole moments and related data"
    extends Modelica.Icons.Package;
    import Modelica.Media.Interfaces.PartialMixtureMedium;
    import SingleGasesData;
    constant Modelica.Media.Interfaces.Types.IdealGas.FluidConstants CO2(
                         chemicalFormula =        "CO2",
                         iupacName =              "unknown",
                         structureFormula =       "unknown",
                         casRegistryNumber =      "124-38-9",
                         meltingPoint =           216.58,
                         normalBoilingPoint =     -1.0,
                         criticalTemperature =    304.12,
                         criticalPressure =        73.74e5,
                         criticalMolarVolume =     94.07e-6,
                         acentricFactor =           0.225,
                         dipoleMoment =             0.0,
                         molarMass =              SingleGasesData.CO2.MM,
                         hasDipoleMoment =       true,
                         hasIdealGasHeatCapacity=true,
                         hasCriticalData =       true,
                         hasAcentricFactor =     true);                                 // does not exist!
    constant Modelica.Media.Interfaces.Types.IdealGas.FluidConstants H2O(
                         chemicalFormula =        "H2O",
                         iupacName =              "oxidane",
                         structureFormula =       "H2O",
                         casRegistryNumber =      "7732-18-5",
                         meltingPoint =           273.15,
                         normalBoilingPoint =     373.124,
                         criticalTemperature =    647.096,
                         criticalPressure =       220.64e5,
                         criticalMolarVolume =     55.95e-6,
                         acentricFactor =           0.344,
                         dipoleMoment =             1.8,
                         molarMass =              SingleGasesData.H2O.MM,
                         hasDipoleMoment =       true,
                         hasIdealGasHeatCapacity=true,
                         hasCriticalData =       true,
                         hasAcentricFactor =     true);
    constant Modelica.Media.Interfaces.Types.IdealGas.FluidConstants O2(
                         chemicalFormula =        "O2",
                         iupacName =              "unknown",
                         structureFormula =       "unknown",
                         casRegistryNumber =      "7782-44-7",
                         meltingPoint =            54.36,
                         normalBoilingPoint =      90.17,
                         criticalTemperature =    154.58,
                         criticalPressure =        50.43e5,
                         criticalMolarVolume =     73.37e-6,
                         acentricFactor =         0.022,
                         dipoleMoment =           0.0,
                         molarMass =              SingleGasesData.O2.MM,
                         hasDipoleMoment =       true,
                         hasIdealGasHeatCapacity=true,
                         hasCriticalData =       true,
                         hasAcentricFactor =     true);
    constant Modelica.Media.Interfaces.Types.IdealGas.FluidConstants N2(
                         chemicalFormula =        "N2",
                         iupacName =              "unknown",
                         structureFormula =       "unknown",
                         casRegistryNumber =      "7727-37-9",
                         meltingPoint =            63.15,
                         normalBoilingPoint =      77.35,
                         criticalTemperature =    126.20,
                         criticalPressure =        33.98e5,
                         criticalMolarVolume =     90.10e-6,
                         acentricFactor =           0.037,
                         dipoleMoment =             0.0,
                         molarMass =              SingleGasesData.N2.MM,
                         hasDipoleMoment =       true,
                         hasIdealGasHeatCapacity=true,
                         hasCriticalData =       true,
                         hasAcentricFactor =     true);
    constant Modelica.Media.Interfaces.Types.IdealGas.FluidConstants CO(
                         chemicalFormula =        "CO",
                         iupacName =              "unknown",
                         structureFormula =       "unknown",
                         casRegistryNumber =      "630-08-0",
                         meltingPoint =            68.15,
                         normalBoilingPoint =      81.66,
                         criticalTemperature =    132.85,
                         criticalPressure =        34.94e5,
                         criticalMolarVolume =     93.10e-6,
                         acentricFactor =           0.045,
                         dipoleMoment =             0.1,
                         molarMass =              SingleGasesData.CO.MM,
                         hasDipoleMoment =       true,
                         hasIdealGasHeatCapacity=true,
                         hasCriticalData =       true,
                         hasAcentricFactor =     true);
    constant Modelica.Media.Interfaces.Types.IdealGas.FluidConstants H2(
                         chemicalFormula =        "H2",
                         iupacName =              "unknown",
                         structureFormula =       "unknown",
                         casRegistryNumber =      "800000-51-5",
                         meltingPoint =            13.56,
                         normalBoilingPoint =      20.38,
                         criticalTemperature =     33.25,
                         criticalPressure =        12.97e5,
                         criticalMolarVolume =     65.00e-6,
                         acentricFactor =          -0.216,
                         dipoleMoment =             0.0,
                         molarMass =              SingleGasesData.H2.MM,
                         hasDipoleMoment =       true,
                         hasIdealGasHeatCapacity=true,
                         hasCriticalData =       true,
                         hasAcentricFactor =     true);
    constant Modelica.Media.Interfaces.Types.IdealGas.FluidConstants SO2(
                         chemicalFormula =        "SO2",
                         iupacName =              "unknown",
                         structureFormula =       "unknown",
                         casRegistryNumber =      "7446-09-5",
                         meltingPoint =           197.67,
                         normalBoilingPoint =     263.13,
                         criticalTemperature =    430.80,
                         criticalPressure =        78.84e5,
                         criticalMolarVolume =    122.00e-6,
                         acentricFactor =         0.245,
                         dipoleMoment =           1.6,
                         molarMass =              SingleGasesData.SO2.MM,
                         hasDipoleMoment =       true,
                         hasIdealGasHeatCapacity=true,
                         hasCriticalData =       true,
                         hasAcentricFactor =     true);
    constant Modelica.Media.Interfaces.Types.IdealGas.FluidConstants CH4(
                         chemicalFormula =        "CH4",
                         iupacName =              "unknown",
                         structureFormula =       "unknown",
                         casRegistryNumber =      "74-82-8",
                         meltingPoint =            90.69,
                         normalBoilingPoint =     111.66,
                         criticalTemperature =    190.56,
                         criticalPressure =        45.99e5,
                         criticalMolarVolume =     98.60e-6,
                         acentricFactor =           0.011,
                         dipoleMoment =             0.0,
                         molarMass =              SingleGasesData.CH4.MM,
                         hasDipoleMoment =       true,
                         hasIdealGasHeatCapacity=true,
                         hasCriticalData =       true,
                         hasAcentricFactor =     true);
    constant Modelica.Media.Interfaces.Types.IdealGas.FluidConstants C2H6(
                         chemicalFormula =        "C2H6",
                         iupacName =              "unknown",
                         structureFormula =       "unknown",
                         casRegistryNumber =      "74-84-0",
                         meltingPoint =            90.35,
                         normalBoilingPoint =     184.55,
                         criticalTemperature =    305.32,
                         criticalPressure =        48.72e5,
                         criticalMolarVolume =    145.50e-6,
                         acentricFactor =           0.099,
                         dipoleMoment =             0.0,
                         molarMass =              SingleGasesData.C2H6.MM,
                         hasDipoleMoment =       true,
                         hasIdealGasHeatCapacity=true,
                         hasCriticalData =       true,
                         hasAcentricFactor =     true);
    constant Modelica.Media.Interfaces.Types.IdealGas.FluidConstants C3H8(
                         chemicalFormula =        "C3H8",
                         iupacName =              "unknown",
                         structureFormula =       "unknown",
                         casRegistryNumber =      "74-98-6",
                         meltingPoint =            91.45,
                         normalBoilingPoint =     231.02,
                         criticalTemperature =    369.83,
                         criticalPressure =        42.48e5,
                         criticalMolarVolume =    200.00e-6,
                         acentricFactor =           0.152,
                         dipoleMoment =             0.0,
                         molarMass =              SingleGasesData.C3H8.MM,
                         hasDipoleMoment =       true,
                         hasIdealGasHeatCapacity=true,
                         hasCriticalData =       true,
                         hasAcentricFactor =     true);
    constant Modelica.Media.Interfaces.Types.IdealGas.FluidConstants C4H10_n_butane(
                         chemicalFormula =        "C4H10",
                         iupacName =              "unknown",
                         structureFormula =       "unknown",
                         casRegistryNumber =      "106-97-8",
                         meltingPoint =           134.79,
                         normalBoilingPoint =     272.66,
                         criticalTemperature =    425.12,
                         criticalPressure =        37.96e5,
                         criticalMolarVolume =    255.00e-6,
                         acentricFactor =           0.20,
                         dipoleMoment =             0.0,
                         molarMass =              SingleGasesData.C4H10_n_butane.MM,
                         hasDipoleMoment =       true,
                         hasIdealGasHeatCapacity=true,
                         hasCriticalData =       true,
                         hasAcentricFactor =     true);
  end FluidData;
  
  
  model MassFractionsTwoPort1 "Ideal two port sensor for mass fraction"
    extends Modelica.Fluid.Sensors.BaseClasses.PartialFlowSensor;
    extends Modelica.Icons.RotationalSensor;
    Modelica.Blocks.Interfaces.RealOutput Xi "Mass fraction in port medium" annotation(
      Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {0, 110}), iconTransformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {0, 110})));
    parameter String substanceName = "water" "Name of mass fraction";
  protected
    parameter Integer ind(fixed = false) "Index of species in vector of independent mass fractions";
  initial algorithm
    ind := -1;
    for i in 1:Medium.nX loop
      if Modelica.Utilities.Strings.isEqual(Medium.substanceNames[i], substanceName) then
        ind := i;
      end if;
    end for;
    assert(ind > 0, "Mass fraction '" + substanceName + "' is not present in medium '" + Medium.mediumName + "'.\n" + "Check sensor parameter and medium model.");
  equation
    if allowFlowReversal then
      Xi = Modelica.Fluid.Utilities.regStep(port_a.m_flow, port_b.Xi_outflow[ind], port_a.Xi_outflow[ind], m_flow_small);
    else
      Xi = port_b.Xi_outflow[ind];
    end if;
    annotation(
      defaultComponentName = "massFraction",
      Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Text(extent = {{82, 122}, {0, 92}}, lineColor = {0, 0, 0}, textString = "Xi"), Line(points = {{0, 100}, {0, 70}}, color = {0, 0, 127}), Line(points = {{-100, 0}, {-70, 0}}, color = {0, 128, 255}), Line(points = {{70, 0}, {100, 0}}, color = {0, 128, 255})}),
      Documentation(info = "<html>
<p>
This component monitors the mass fraction of the passing fluid.
The sensor is ideal, i.e., it does not influence the fluid.
</p> </html>", revisions = "<html>
<ul>
<li>2011-12-14: Stefan Wischhusen: Initial Release.</li>
</ul>
</html>"));
  end MassFractionsTwoPort1;


  model simpleCombustor "simple combustor"
    extends Modelica.Fluid.Interfaces.PartialTwoPort(allowFlowReversal = false);
    Medium.MassFlowRate mXi_a[Medium.nXi];
    Medium.MassFlowRate mXi_b[Medium.nXi];
  equation
    0 = port_a.m_flow + port_b.m_flow;
    port_b.p = port_a.p;
    -mXi_b[1]/Medium.data[1].MM = mXi_a[1]/Medium.data[1].MM + mXi_a[3]/Medium.data[3].MM;//H2O
    -mXi_b[2] / Medium.data[2].MM = mXi_a[2] / Medium.data[2].MM - 0.5 * mXi_a[3] / Medium.data[3].MM;//O2
    -mXi_b[3] / Medium.data[3].MM = 0.0;//H2
    port_b.Xi_outflow[:] = mXi_b[:] / port_b.m_flow;
    port_b.h_outflow = inStream(port_a.h_outflow);
    port_b.C_outflow = inStream(port_a.C_outflow);
    
    port_a.Xi_outflow[:] = inStream(port_b.Xi_outflow[:]);
    mXi_a[:] = port_a.m_flow*inStream(port_a.Xi_outflow[:]);
    port_a.h_outflow = inStream(port_b.h_outflow);
    port_a.C_outflow = inStream(port_b.C_outflow);
  
    annotation(
      Diagram,
      Icon(graphics = {Polygon(fillColor = {255, 85, 0}, fillPattern = FillPattern.HorizontalCylinder, points = {{-100, -60}, {-20, -60}, {20, -30}, {100, -30}, {100, 30}, {20, 30}, {-20, 60}, {-100, 60}, {-100, -60}, {-100, -60}})}));
  end simpleCombustor;


  package MyGas "H2,O2,H2O"
    extends Common.MixtureGasNasa(
      mediumName = "MyGas", data = {SingleGasesData.H2O, SingleGasesData.O2, SingleGasesData.H2},
      fluidConstants = {FluidData.H2O, FluidData.O2, FluidData.H2},
      substanceNames = {"H2O", "O2", "H2"}, 
      reference_X = {0.4, 0.2, 0.4}, 
      excludeEnthalpyOfFormation = false, 
      referenceChoice = Modelica.Media.Interfaces.Choices.ReferenceEnthalpy.ZeroAt25C);
    annotation(
      Documentation(info = "<html>

</html>"));
  end MyGas;

model GasMix1
  replaceable package Medium = MyGas;
  inner Modelica.Fluid.System system(allowFlowReversal = false) annotation(
    Placement(visible = true, transformation(origin = {30, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T Hydrogen(redeclare package Medium = Medium, T = 293.15, X = {0.0, 0.0, 1.0}, m_flow = 0.001, nPorts = 1, use_m_flow_in = false) annotation(
    Placement(visible = true, transformation(origin = {-40, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T Oxygen(redeclare package Medium = Medium, T = 293.15, X = {0.0, 1.0, 0.0}, m_flow = 0.009, nPorts = 1, use_m_flow_in = false) annotation(
    Placement(visible = true, transformation(origin = {-40, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.FixedBoundary ambient(redeclare package Medium = Medium, nPorts = 1, p = 101325) annotation(
    Placement(visible = true, transformation(origin = {80, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  MassFractionsTwoPort1 massFraction(redeclare package Medium = Medium, substanceName = Medium.substanceNames[3]) annotation(
    Placement(visible = true, transformation(origin = {50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe1(redeclare package Medium = Medium, diameter = 0.01, length = 1) annotation(
    Placement(visible = true, transformation(origin = {-10, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe2(redeclare package Medium = Medium, diameter = 0.01, length = 1) annotation(
    Placement(visible = true, transformation(origin = {-10, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe3(redeclare package Medium = Medium, diameter = 0.01414, length = 1) annotation(
    Placement(visible = true, transformation(origin = {18, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(massFraction.port_b, ambient.ports[1]) annotation(
      Line(points = {{60, 0}, {70, 0}}, color = {0, 127, 255}));
    connect(pipe3.port_b, massFraction.port_a) annotation(
      Line(points = {{28, 0}, {40, 0}}, color = {0, 127, 255}));
    connect(pipe2.port_b, pipe3.port_a) annotation(
      Line(points = {{0, -20}, {2, -20}, {2, 0}, {8, 0}, {8, 0}}, color = {0, 127, 255}));
    connect(pipe1.port_b, pipe3.port_a) annotation(
      Line(points = {{0, 20}, {2, 20}, {2, 0}, {6, 0}, {6, 0}, {8, 0}}, color = {0, 127, 255}));
    connect(Hydrogen.ports[1], pipe1.port_a) annotation(
      Line(points = {{-30, 20}, {-20, 20}, {-20, 20}, {-20, 20}}, color = {0, 127, 255}, thickness = 0.5));
    connect(Oxygen.ports[1], pipe2.port_a) annotation(
      Line(points = {{-30, -20}, {-20, -20}, {-20, -20}, {-20, -20}}, color = {0, 127, 255}, thickness = 0.5));
    annotation(
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.02),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end GasMix1;



  model GasMix2
    replaceable package Medium = MyGas;
    Modelica.Fluid.Sources.MassFlowSource_T H2_O2_Mix(redeclare package Medium = Medium, T = 298.15, X = {0.0, 0.9, 0.1}, m_flow = 0.01, nPorts = 1, use_m_flow_in = false) annotation(
      Placement(visible = true, transformation(origin = {-40, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Fluid.Sources.FixedBoundary ambient(redeclare package Medium = Medium, nPorts = 1, p = 101325) annotation(
      Placement(visible = true, transformation(origin = {86, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
      Placement(visible = true, transformation(origin = {42, 62}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  simpleCombustor simpleCombustor1(redeclare package Medium = Medium) annotation(
      Placement(visible = true, transformation(origin = {6, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature temperature(redeclare package Medium = Medium) annotation(
      Placement(visible = true, transformation(origin = {38, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(H2_O2_Mix.ports[1], simpleCombustor1.port_a) annotation(
      Line(points = {{-30, 20}, {-4, 20}}, color = {0, 127, 255}, thickness = 0.5));
    connect(simpleCombustor1.port_b, temperature.port) annotation(
      Line(points = {{16, 20}, {38, 20}}, color = {0, 127, 255}));
    connect(temperature.port, ambient.ports[1]) annotation(
      Line(points = {{38, 20}, {74, 20}, {74, 20}, {76, 20}}, color = {0, 127, 255}));
    annotation(
      experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.02),
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
  end GasMix2;




  model Gascomb1
    replaceable package Medium = MyGas;
    Modelica.Fluid.Sources.MassFlowSource_T H2(redeclare package Medium = Medium, T = 298.15, X = {0.0, 0.0, 1.0}, m_flow = 0.001, nPorts = 1, use_m_flow_in = false) annotation(
      Placement(visible = true, transformation(origin = {-40, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Fluid.Sources.FixedBoundary ambient(redeclare package Medium = Medium, nPorts = 1, p = 101325) annotation(
      Placement(visible = true, transformation(origin = {80, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    inner Modelica.Fluid.System system annotation(
      Placement(visible = true, transformation(origin = {40, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    simpleCombustor simpleCombustor1(redeclare package Medium = Medium) annotation(
      Placement(visible = true, transformation(origin = {8, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature temperature(redeclare package Medium = Medium) annotation(
      Placement(visible = true, transformation(origin = {40, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T O2(redeclare package Medium = Medium,T = 298.15, X = {0.0, 1.0, 0.0}, m_flow = 0.009, nPorts = 1)  annotation(
      Placement(visible = true, transformation(origin = {-40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
  connect(H2.ports[1], simpleCombustor1.port_a) annotation(
      Line(points = {{-30, 40}, {-20, 40}, {-20, 20}, {-2, 20}}, color = {0, 127, 255}, thickness = 0.5));
  connect(O2.ports[1], simpleCombustor1.port_a) annotation(
      Line(points = {{-30, 0}, {-20, 0}, {-20, 20}, {-2, 20}}, color = {0, 127, 255}, thickness = 0.5));
  connect(simpleCombustor1.port_b, temperature.port) annotation(
      Line(points = {{18, 20}, {40, 20}}, color = {0, 127, 255}));
    connect(temperature.port, ambient.ports[1]) annotation(
      Line(points = {{40, 20}, {70, 20}}, color = {0, 127, 255}));
    annotation(
      experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.02),
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
  end Gascomb1;



  model Gascomb2
    replaceable package Medium = MyGas;
    Modelica.Fluid.Sources.MassFlowSource_T H2(redeclare package Medium = Medium, T = 298.15, X = {0.0, 0.0, 1.0}, m_flow = 0.001, nPorts = 1, use_m_flow_in = false) annotation(
      Placement(visible = true, transformation(origin = {-80, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Fluid.Sources.FixedBoundary ambient(redeclare package Medium = Medium, nPorts = 1, p = 101325) annotation(
      Placement(visible = true, transformation(origin = {80, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    inner Modelica.Fluid.System system annotation(
      Placement(visible = true, transformation(origin = {40, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    simpleCombustor simpleCombustor1(redeclare package Medium = Medium) annotation(
      Placement(visible = true, transformation(origin = {-10, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Fluid.Sensors.Temperature temperature(redeclare package Medium = Medium) annotation(
      Placement(visible = true, transformation(origin = {50, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Fluid.Sources.MassFlowSource_T O2(redeclare package Medium = Medium, T = 298.15, X = {0.0, 1.0, 0.0}, m_flow = 0.009, nPorts = 1) annotation(
      Placement(visible = true, transformation(origin = {-80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipeH2(redeclare package Medium = Medium,allowFlowReversal = false, diameter = 0.01, length = 1)  annotation(
      Placement(visible = true, transformation(origin = {-50, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipeO2(redeclare package Medium = Medium,allowFlowReversal = false, diameter = 0.01, length = 1)  annotation(
      Placement(visible = true, transformation(origin = {-50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipeout(redeclare package Medium = Medium,allowFlowReversal = false, diameter = 0.01, length = 1)  annotation(
      Placement(visible = true, transformation(origin = {20, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(pipeO2.port_b, simpleCombustor1.port_a) annotation(
      Line(points = {{-40, 0}, {-30, 0}, {-30, 20}, {-20, 20}}, color = {0, 127, 255}));
    connect(pipeH2.port_b, simpleCombustor1.port_a) annotation(
      Line(points = {{-40, 40}, {-30, 40}, {-30, 20}, {-20, 20}}, color = {0, 127, 255}));
    connect(H2.ports[1], pipeH2.port_a) annotation(
      Line(points = {{-70, 40}, {-60, 40}}, color = {0, 127, 255}, thickness = 0.5));
    connect(O2.ports[1], pipeO2.port_a) annotation(
      Line(points = {{-70, 0}, {-60, 0}}, color = {0, 127, 255}, thickness = 0.5));
    connect(temperature.port, ambient.ports[1]) annotation(
      Line(points = {{50, 20}, {70, 20}}, color = {0, 127, 255}));
    connect(pipeout.port_b, temperature.port) annotation(
      Line(points = {{30, 20}, {50, 20}}, color = {0, 127, 255}));
    connect(simpleCombustor1.port_b, pipeout.port_a) annotation(
      Line(points = {{0, 20}, {10, 20}, {10, 20}, {10, 20}}, color = {0, 127, 255}));
    annotation(
      experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.02),
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
  end Gascomb2;


  model Gascomb3
    replaceable package Medium = MyGas;
    Modelica.Fluid.Sources.MassFlowSource_T H2(redeclare package Medium = Medium, T = 298.15, X = {0.0, 0.0, 1.0}, m_flow = 0.001, nPorts = 1, use_m_flow_in = false) annotation(
      Placement(visible = true, transformation(origin = {-80, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Fluid.Sources.FixedBoundary ambient(redeclare package Medium = Medium, nPorts = 1, p = 101325) annotation(
      Placement(visible = true, transformation(origin = {88, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    inner Modelica.Fluid.System system annotation(
      Placement(visible = true, transformation(origin = {40, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    FluidReaction_v008.simpleCombustor simpleCombustor1(redeclare package Medium = Medium) annotation(
      Placement(visible = true, transformation(origin = {-10, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Fluid.Sensors.Temperature temperature(redeclare package Medium = Medium) annotation(
      Placement(visible = true, transformation(origin = {68, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Fluid.Sources.MassFlowSource_T O2(redeclare package Medium = Medium, T = 298.15, X = {0.0, 1.0, 0.0}, m_flow = 0.009, nPorts = 1) annotation(
      Placement(visible = true, transformation(origin = {-80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipeH2(redeclare package Medium = Medium,allowFlowReversal = false, diameter = 0.01, length = 1)  annotation(
      Placement(visible = true, transformation(origin = {-50, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipeO2(redeclare package Medium = Medium,allowFlowReversal = false, diameter = 0.01, length = 1)  annotation(
      Placement(visible = true, transformation(origin = {-50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipeout(redeclare package Medium = Medium,allowFlowReversal = false, diameter = 0.01, length = 1)  annotation(
      Placement(visible = true, transformation(origin = {46, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Fittings.TeeJunctionIdeal teeJunctionIdeal1 annotation(
      Placement(visible = true, transformation(origin = {18, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(teeJunctionIdeal1.port_3, simpleCombustor1.port_a) annotation(
      Line(points = {{18, 30}, {18, 42}, {-30, 42}, {-30, 20}, {-20, 20}}, color = {0, 127, 255}));
    connect(simpleCombustor1.port_b, teeJunctionIdeal1.port_1) annotation(
      Line(points = {{0, 20}, {8, 20}}, color = {0, 127, 255}));
    connect(pipeH2.port_b, simpleCombustor1.port_a) annotation(
      Line(points = {{-40, 40}, {-36, 40}, {-36, 20}, {-20, 20}}, color = {0, 127, 255}));
    connect(pipeO2.port_b, simpleCombustor1.port_a) annotation(
      Line(points = {{-40, 0}, {-36, 0}, {-36, 20}, {-20, 20}}, color = {0, 127, 255}));
    connect(pipeout.port_b, temperature.port) annotation(
      Line(points = {{56, 20}, {68, 20}}, color = {0, 127, 255}));
    connect(temperature.port, ambient.ports[1]) annotation(
      Line(points = {{68, 20}, {78, 20}}, color = {0, 127, 255}));
    connect(H2.ports[1], pipeH2.port_a) annotation(
      Line(points = {{-70, 40}, {-60, 40}}, color = {0, 127, 255}, thickness = 0.5));
    connect(O2.ports[1], pipeO2.port_a) annotation(
      Line(points = {{-70, 0}, {-60, 0}}, color = {0, 127, 255}, thickness = 0.5));
    annotation(
      experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.02),
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
  Diagram);
  end Gascomb3;

  
  annotation(
    uses(Modelica(version = "3.2.2")));
end FluidReaction_v008;
