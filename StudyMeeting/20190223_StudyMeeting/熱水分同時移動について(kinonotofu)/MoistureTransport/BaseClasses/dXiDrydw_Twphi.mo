within MoistureTransport.BaseClasses;
function dXiDrydw_Twphi
  "Computes water content derivative of absolute humidity"
  extends Modelica.Icons.Function;
  input Modelica.SIunits.Temperature T "Dry bulb temperature";
  Modelica.Blocks.Interfaces.RealInput w(final quantity = "GravimetricWaterContent", final unit = "1",
    min = 0.0) "Water content";
  input Real phid[:](final quantity = "Relativehumidity", final unit = "1", min = 0.0, max = 100.0)
    "Relative humidity at the support points";
  input Real wd_phid[:](final quantity = "GravimetricWaterContent", final unit = "1", min = 0.0)
    "Water content at the support points";
  input Real dphi_dw[:] "Support points for derivatives";
  Modelica.Blocks.Interfaces.Realoutput dXiDrydw "Water content derivative of absolute humidity";
  parameter Modelica.SIunits.AbsolutePressure p = 101325 "Absolute pressure of the medium";
  parameter Real dw(final quantity = "GravimetricWaterContent", final unit = "1")
    = 0.01 "Water content variation";

protected
  Real phi1(final quantity = "Relativehumidity", final unit = "1", min = 0.0, max = 100.0)
    "Relative humidity";
  Real phi2(final quantity = "Relativehumidity", final unit = "1", min = 0.0, max = 100.0)
    "Relative humidity";
  Modelica.SIunits.MassFraction XiDry1 "Water mass fraction per mass of dry air";
  Modelica.SIunits.MassFraction XiDry2 "Water mass fraction per mass of dry air";

algorithm
  phi1 := MoistureTransport.BaseClasses.property_data(
     x=w,
     xd=wd_phid,
     yd=phid,
     dy_dx=dphi_dw);
  phi2 := MoistureTransport.BaseClasses.property_data(
     x=w+dw,
     xd=wd_phid,
     yd=phid,
     dy_dx=dphi_dw);
  XiDry1 := MoistureTransport.BaseClasses.XiDry_pTphi(
          p=p,
          T=T,
          phi=phi1);
  XiDry2 := MoistureTransport.BaseClasses.XiDry_pTphi(
          p=p,
          T=T,
          phi=phi2);
  dXiDrydw := (XiDry2-XiDry1)/dw;
end dXiDrydw_Twphi;
