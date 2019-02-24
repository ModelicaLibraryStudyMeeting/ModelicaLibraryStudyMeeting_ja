within MoistureTransport.Interfaces;
partial connector MoisturePort "Moisture port for 1-dim."
  extends Modelica.Icons.InterfacesPackage;
  Modelica.SIunits.MassFraction XiDry "Port Water mass fraction per mass of dry air";
  flow Modelica.SIunits.MassFlowRate M_flow
    "Moisture flow rate (positive if flowing from outside into the component)";
end MoisturePort;
