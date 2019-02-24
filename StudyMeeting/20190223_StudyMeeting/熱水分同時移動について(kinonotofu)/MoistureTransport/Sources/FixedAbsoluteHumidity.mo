within MoistureTransport.Sources;
model FixedAbsoluteHumidity "Fixed absolute humidity boundary condition in kg/kg(dry air)"
  parameter Modelica.SIunits.MassFraction XiDry "Fixed Water mass fraction per mass of dry air at port";
  MoisturePort.Interfaces.MoisturePort_b port;
equation
  port.XiDry = XiDry;
  annotation (defaultComponentName="fixHum");
end FixedAbsoluteHumidity;
