within MoistureTransport.BaseClasses;
function property_data
  "Computes a value by extrapolating or interpolating the data"
  extends Modelica.Icons.Function;
  input Real x "value on the abscissa as condition";
  input Real xd[:]
    "Value on the abscissa at the support points";
  input Real yd[:]
    "Value on the ordinate at the support points";
  input Real dy_dx[:]
    "Derivatives dy/dx at the support points";
  output Real y "Resulting property";
protected
  Integer i "Integer to select data interval";

algorithm
  // i is a counter that is used to pick the derivative
  // that corresponds to the interval that contains x
  i := 1;
  for j in 1:size(xd,1) - 1 loop
    if x > xd[j] then
      i := j;
    end if;
  end for;

  // Extrapolate or interpolate the data
  y :=  Buildings.Utilities.Math.Functions.cubicHermiteLinearExtrapolation(
     x=x,
     x1=xd[i],
     x2=xd[i + 1],
     y1=yd[i],
     y2=yd[i + 1],
     y1d=dy_dx[i],
     y2d=dy_dx[i + 1]);

end property_data;
