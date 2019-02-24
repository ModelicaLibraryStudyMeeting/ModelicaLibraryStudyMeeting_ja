within MoistureTransport.BaseClasses;
function XiDry_pTphi
  "Water mass fraction per mass of dry air for given pressure, dry bulb temperature and relative humidity"
  extends Modelica.Icons.Function;
  input Modelica.SIunits.AbsolutePressure p "Absolute pressure of the medium";
  input Modelica.SIunits.Temperature T "Dry bulb temperature";
  input Real phi(unit="1") "Relative humidity";
  output Modelica.SIunits.MassFraction XiDry(nominal=0.01) "Water mass fraction per mass of dry air";
protected
  Modelica.SIunits.AbsolutePressure pSat(displayUnit="Pa", nominal=1000) "Saturation pressure";
  Modelica.SIunits.AbsolutePressure p_w(displayUnit="Pa", min=100) "Water vapor partial pressure";
algorithm
//Saturation pressure is calculated by the Wagner equation(223.16<=T<=373.16)
  pSat := Buildings.Utilities.Psychrometrics.Functions.saturationPressure(T);
  p_w := phi / 100.0 * pSat;
  XiDry := 0.62198 * p_w / (p - p_w);
end XiDry_pTphi;
