within MoistureTransport.Examples;
model CheckMoistureProperty "Test model for moisture property"
  extends Modelica.Icons.Example;
  parameter MoistureTransport.Data.SolidsMoisture.Fiberboard datSolMoi(x = 0.008)  annotation(
    Placement(visible = true, transformation(origin = {30, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MoistureTransport.MoistureProperty proMoi(material = datSolMoi)  annotation(
    Placement(visible = true, transformation(origin = {30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp1(duration = 200, height = 200)  annotation(
    Placement(visible = true, transformation(origin = {-30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ramp1.y, proMoi.w) annotation(
    Line(points = {{-19, 0}, {22, 0}}, color = {0, 0, 127}));
end CheckMoistureProperty;
