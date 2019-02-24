within MoistureTransport.Sources;
model PrescribedAbsoluteHumidity "Variable absolute humidity boundary condition in kg/kg(dry air)"
  MoisturePort.Interfaces.MoisturePort_b port;
  Modelica.Blocks.Interfaces.RealInput XiDry(final quantity = "AbsoluteHumidity", final unit = "1",
    min = 0.0) "Water mass fraction per mass of dry air";
equation
  port.XiDry = XiDry;
  annotation (defaultComponentName="preHum");
end PrescribedAbsoluteHumidity;
