within MoistureTransport.BaseClasses;
function dXiDrydT_Twphi
  "Computes temperature derivative of absolute humidity"
  extends Modelica.Icons.Function;
  input Modelica.SIunits.Temperature T "Dry bulb temperature";
  Modelica.Blocks.Interfaces.RealInput w(final quantity = "GravimetricWaterContent", final unit = "1",
    min = 0.0) "Water content";
  Modelica.Blocks.Interfaces.RealInput phi(final quantity = "Relativehumidity", final unit = "1", min = 0.0, max = 100.0)
    "Relative humidity";
  Modelica.Blocks.Interfaces.Realoutput dXiDrydT "Temperature derivative of absolute humidity";
  parameter Modelica.SIunits.AbsolutePressure p = 101325 "Absolute pressure of the medium";
  parameter Modelica.SIunits.Temperature dT = 0.01 "Temperature variation";
protected
  Modelica.SIunits.MassFraction XiDry1 "Water mass fraction per mass of dry air";
  Modelica.SIunits.MassFraction XiDry2 "Water mass fraction per mass of dry air";

algorithm
  XiDry1 := MoistureTransport.BaseClasses.XiDry_pTphi(
          p=p,
          T=T,
          phi=phi);
  XiDry2 := MoistureTransport.BaseClasses.XiDry_pTphi(
          p=p,
          T=T+dT,
          phi=phi);
  dXiDrydT := (XiDry2-XiDry1)/dT;
end dXiDrydT_Twphi;
