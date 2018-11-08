package CoffeeTemperature
  package Test
    model CoffeeTest2
      parameter Real R = 70 / 1000 "radius of cup";
      parameter Real L = 85 / 1000 "height of cup";
      parameter Real level_start = 40 / 1000 "初期水位";
      parameter Real cup_thick = 3 / 1000 "thichness of cup";
      parameter Real rho = 2200 "陶器密度　https://www.hakko.co.jp/qa/qakit/html/h01010.htm";
      parameter Real V = ((R + cup_thick) ^ 2 - R ^ 2) * 3.14 * L "volume of cup";
      parameter Real cp = 1050;
      replaceable package Medium = Modelica.Media.Water.StandardWater;
      Modelica.Fluid.Vessels.OpenTank tank(redeclare package Medium = Medium, T_start = 273.15 + 90, crossArea = R ^ 2 * 3.14, height = L, level_start = level_start, nPorts = 0, use_HeatTransfer = true, use_portsData = false) annotation(
        Placement(visible = true, transformation(origin = {50, -30}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      inner Modelica.Fluid.System system annotation(
        Placement(visible = true, transformation(origin = {-140, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Thermal.HeatTransfer.Components.Convection convection1 annotation(
        Placement(visible = true, transformation(origin = {-2, 8}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.Constant const(k = 10 * R ^ 2 * 3.14) annotation(
        Placement(visible = true, transformation(origin = {-4, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor1(G = 1.3 * 2 * (R + cup_thick) * 3.14 / cup_thick / 2) annotation(
        Placement(visible = true, transformation(origin = {-30, -76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Thermal.HeatTransfer.Components.Convection convection2 annotation(
        Placement(visible = true, transformation(origin = {-94, -76}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.Constant const1(k = 10 * 2 * R * 3.14 * L) annotation(
        Placement(visible = true, transformation(origin = {-94, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature2(T = 296.15) annotation(
        Placement(visible = true, transformation(origin = {-140, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor2(G = 1.3 * 2 * (R + cup_thick) * 3.14 / cup_thick / 2) annotation(
        Placement(visible = true, transformation(origin = {-58, -76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor1(C = cp * V * rho, T(fixed = true, start = 363.15)) annotation(
        Placement(visible = true, transformation(origin = {-44, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Thermal.HeatTransfer.Components.Convection convection3 annotation(
        Placement(visible = true, transformation(origin = {-96, -120}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));
      Modelica.Blocks.Sources.Constant const2(k = 1000 * R ^ 2 * 3.14) annotation(
        Placement(visible = true, transformation(origin = {-98, -158}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      connect(const2.y, convection3.Gc) annotation(
        Line(points = {{-86, -158}, {-96, -158}, {-96, -130}, {-96, -130}}, color = {0, 0, 127}));
      connect(convection3.fluid, fixedTemperature2.port) annotation(
        Line(points = {{-106, -120}, {-130, -120}, {-130, -10}, {-130, -10}}, color = {191, 0, 0}));
      connect(thermalConductor2.port_a, convection3.solid) annotation(
        Line(points = {{-68, -76}, {-76, -76}, {-76, -120}, {-86, -120}, {-86, -120}}, color = {191, 0, 0}));
      connect(convection1.solid, tank.heatPort) annotation(
        Line(points = {{8, 8}, {17, 8}, {17, -30}, {30, -30}}, color = {191, 0, 0}));
      connect(thermalConductor1.port_b, tank.heatPort) annotation(
        Line(points = {{-20, -76}, {16, -76}, {16, -30}, {30, -30}}, color = {191, 0, 0}));
      connect(const1.y, convection2.Gc) annotation(
        Line(points = {{-83, -38}, {-84.5, -38}, {-84.5, -38}, {-88, -38}, {-88, -36}, {-97, -36}, {-97, -64}, {-95, -64}, {-95, -66}, {-95, -66}, {-95, -66}, {-95, -66}}, color = {0, 0, 127}));
      connect(convection2.fluid, fixedTemperature2.port) annotation(
        Line(points = {{-104, -76}, {-130, -76}, {-130, -10}}, color = {191, 0, 0}));
      connect(thermalConductor2.port_a, convection2.solid) annotation(
        Line(points = {{-68, -76}, {-84, -76}}, color = {191, 0, 0}));
      connect(heatCapacitor1.port, thermalConductor1.port_a) annotation(
        Line(points = {{-44, -56}, {-44, -56}, {-44, -56}, {-44, -56}, {-44, -76}, {-40, -76}, {-40, -76}, {-40, -76}, {-40, -76}}, color = {191, 0, 0}));
      connect(thermalConductor2.port_b, heatCapacitor1.port) annotation(
        Line(points = {{-48, -76}, {-44, -76}, {-44, -56}, {-44, -56}}, color = {191, 0, 0}));
      connect(fixedTemperature2.port, convection1.fluid) annotation(
        Line(points = {{-130, -10}, {-128, -10}, {-128, 8}, {-12, 8}, {-12, 8}}, color = {191, 0, 0}));
      connect(const.y, convection1.Gc) annotation(
        Line(points = {{7, 48}, {2.5, 48}, {2.5, 50}, {-2, 50}, {-2, 33}, {-2, 33}, {-2, 18}}, color = {0, 0, 127}));
      annotation(
        Documentation(info = "<html>
<p>
熱伝導率
http://japan-miyabi.com/thermal_light/data/03/conductivity.htm
</p>
</html>"),
        uses(Modelica(version = "3.2.2")),
        Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}})),
        Icon(coordinateSystem(extent = {{-200, -200}, {200, 200}})),
        version = "",
        __OpenModelica_commandLineOptions = "");
    end CoffeeTest2;

    model CoffeeTest3
      import pi = Modelica.Constants.pi;
      //cup parameter
      parameter Real R = 70 / 1000 "radius of cup";
      parameter Real L = 85 / 1000 "height of cup";
      parameter Real level_start = 40 / 1000 "初期水位";
      parameter Real cup_thick = 3 / 1000 "thichness of cup";
      parameter Real rho = 2200 "陶器密度　https://www.hakko.co.jp/qa/qakit/html/h01010.htm";
      parameter Real V = ((R + cup_thick) ^ 2 - R ^ 2) * 3.14 * L "volume of cup";
      parameter Real cp = 1050;
      //dripper parameter
      parameter Real drip_D = 5 / 1000 "ドリッパーの直径";
      parameter Real drip_L = 10 / 1000 "ドリッパーの長さ";
      replaceable package Medium = Modelica.Media.Water.StandardWater;
      Modelica.Fluid.Vessels.OpenTank cup(redeclare package Medium = Medium, T_start = 273.15 + 90, crossArea = R ^ 2 * 3.14, height = L, level_start = 0, nPorts = 1, portsData = {Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 5 / 1000, height = 70 / 1000)}, use_HeatTransfer = true, use_portsData = true) annotation(
        Placement(visible = true, transformation(origin = {50, -30}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      inner Modelica.Fluid.System system annotation(
        Placement(visible = true, transformation(origin = {-140, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Thermal.HeatTransfer.Components.Convection convection1 annotation(
        Placement(visible = true, transformation(origin = {-2, 8}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.Constant const(k = 10 * R ^ 2 * 3.14) annotation(
        Placement(visible = true, transformation(origin = {-4, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor1(G = 1.3 * 2 * (R + cup_thick) * 3.14 / cup_thick / 2) annotation(
        Placement(visible = true, transformation(origin = {-30, -76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Thermal.HeatTransfer.Components.Convection convection2 annotation(
        Placement(visible = true, transformation(origin = {-94, -76}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.Constant const1(k = 10 * 2 * R * 3.14 * L) annotation(
        Placement(visible = true, transformation(origin = {-94, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature2(T = 296.15) annotation(
        Placement(visible = true, transformation(origin = {-140, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor2(G = 1.3 * 2 * (R + cup_thick) * 3.14 / cup_thick / 2) annotation(
        Placement(visible = true, transformation(origin = {-58, -76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor1(C = cp * V * rho, T(fixed = true, start = 363.15)) annotation(
        Placement(visible = true, transformation(origin = {-44, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Thermal.HeatTransfer.Components.Convection convection3 annotation(
        Placement(visible = true, transformation(origin = {-96, -120}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));
      Modelica.Blocks.Sources.Constant const2(k = 1000 * R ^ 2 * 3.14) annotation(
        Placement(visible = true, transformation(origin = {-98, -158}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Fluid.Vessels.OpenTank tank1(redeclare package Medium = Medium, T_start = 273.15 + 90, crossArea = R ^ 2 * 3.14, height = L, level_start = level_start, nPorts = 1, portsData = {Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 5 / 1000)}, use_HeatTransfer = false, use_portsData = true) annotation(
        Placement(visible = true, transformation(origin = {50, 98}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      Modelica.Fluid.Pipes.DynamicPipe pipe(redeclare package Medium = Medium, crossArea = pi * drip_D ^ 2 / 4, diameter = drip_D, length = drip_L, perimeter = pi * drip_D) annotation(
        Placement(visible = true, transformation(origin = {50, 34}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    equation
      connect(pipe.port_b, cup.ports[1]) annotation(
        Line(points = {{50, 24}, {50, 24}, {50, -50}, {50, -50}}, color = {0, 127, 255}));
      connect(tank1.ports[1], pipe.port_a) annotation(
        Line(points = {{50, 78}, {50, 78}, {50, 44}, {50, 44}}, color = {0, 127, 255}, thickness = 0.5));
      connect(const2.y, convection3.Gc) annotation(
        Line(points = {{-86, -158}, {-96, -158}, {-96, -130}, {-96, -130}}, color = {0, 0, 127}));
      connect(convection3.fluid, fixedTemperature2.port) annotation(
        Line(points = {{-106, -120}, {-130, -120}, {-130, -10}, {-130, -10}}, color = {191, 0, 0}));
      connect(thermalConductor2.port_a, convection3.solid) annotation(
        Line(points = {{-68, -76}, {-76, -76}, {-76, -120}, {-86, -120}, {-86, -120}}, color = {191, 0, 0}));
      connect(convection1.solid, cup.heatPort) annotation(
        Line(points = {{8, 8}, {17, 8}, {17, -30}, {30, -30}}, color = {191, 0, 0}));
      connect(thermalConductor1.port_b, cup.heatPort) annotation(
        Line(points = {{-20, -76}, {16, -76}, {16, -30}, {30, -30}}, color = {191, 0, 0}));
      connect(const1.y, convection2.Gc) annotation(
        Line(points = {{-83, -38}, {-84.5, -38}, {-84.5, -38}, {-88, -38}, {-88, -36}, {-97, -36}, {-97, -64}, {-95, -64}, {-95, -66}, {-95, -66}, {-95, -66}, {-95, -66}}, color = {0, 0, 127}));
      connect(convection2.fluid, fixedTemperature2.port) annotation(
        Line(points = {{-104, -76}, {-130, -76}, {-130, -10}}, color = {191, 0, 0}));
      connect(thermalConductor2.port_a, convection2.solid) annotation(
        Line(points = {{-68, -76}, {-84, -76}}, color = {191, 0, 0}));
      connect(heatCapacitor1.port, thermalConductor1.port_a) annotation(
        Line(points = {{-44, -56}, {-44, -56}, {-44, -56}, {-44, -56}, {-44, -76}, {-40, -76}, {-40, -76}, {-40, -76}, {-40, -76}}, color = {191, 0, 0}));
      connect(thermalConductor2.port_b, heatCapacitor1.port) annotation(
        Line(points = {{-48, -76}, {-44, -76}, {-44, -56}, {-44, -56}}, color = {191, 0, 0}));
      connect(fixedTemperature2.port, convection1.fluid) annotation(
        Line(points = {{-130, -10}, {-128, -10}, {-128, 8}, {-12, 8}, {-12, 8}}, color = {191, 0, 0}));
      connect(const.y, convection1.Gc) annotation(
        Line(points = {{7, 48}, {2.5, 48}, {2.5, 50}, {-2, 50}, {-2, 33}, {-2, 33}, {-2, 18}}, color = {0, 0, 127}));
      annotation(
        Documentation(info = "<html>
<p>
熱伝導率
http://japan-miyabi.com/thermal_light/data/03/conductivity.htm
</p>
</html>"),
        uses(Modelica(version = "3.2.2")),
        Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}})),
        Icon(coordinateSystem(extent = {{-200, -200}, {200, 200}})),
        version = "",
        __OpenModelica_commandLineOptions = "");
    end CoffeeTest3;

    model CoffeeTest4
      import pi = Modelica.Constants.pi;
      //cup parameter
      parameter Real R = 70 / 1000 "radius of cup";
      parameter Real L = 85 / 1000 "height of cup";
      parameter Real level_start = 40 / 1000 "初期水位";
      parameter Real cup_thick = 3 / 1000 "thichness of cup";
      parameter Real rho = 2200 "陶器密度　https://www.hakko.co.jp/qa/qakit/html/h01010.htm";
      parameter Real V = ((R + cup_thick) ^ 2 - R ^ 2) * 3.14 * L "volume of cup";
      parameter Real cp = 1050;
      //dripper parameter
      parameter Real drip_D = 5 / 1000 "ドリッパーの直径";
      parameter Real drip_L = 10 / 1000 "ドリッパーの長さ";
      replaceable package Medium = Modelica.Media.Water.StandardWater;
      Modelica.Fluid.Vessels.OpenTank cup(redeclare package Medium = Medium, T_start = 273.15 + 90, crossArea = R ^ 2 * 3.14, height = L, level_start = 0, nPorts = 1, portsData = {Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 5 / 1000, height = 70 / 1000)}, use_HeatTransfer = true, use_portsData = true) annotation(
        Placement(visible = true, transformation(origin = {50, -30}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      inner Modelica.Fluid.System system annotation(
        Placement(visible = true, transformation(origin = {-140, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Thermal.HeatTransfer.Components.Convection convection1 annotation(
        Placement(visible = true, transformation(origin = {-2, 8}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.Constant const(k = 10 * R ^ 2 * 3.14) annotation(
        Placement(visible = true, transformation(origin = {-4, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor1(G = 1.3 * 2 * (R + cup_thick) * 3.14 / cup_thick / 2) annotation(
        Placement(visible = true, transformation(origin = {-30, -76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Thermal.HeatTransfer.Components.Convection convection2 annotation(
        Placement(visible = true, transformation(origin = {-94, -76}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.Constant const1(k = 10 * 2 * R * 3.14 * L) annotation(
        Placement(visible = true, transformation(origin = {-94, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature2(T = 296.15) annotation(
        Placement(visible = true, transformation(origin = {-140, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor2(G = 1.3 * 2 * (R + cup_thick) * 3.14 / cup_thick / 2) annotation(
        Placement(visible = true, transformation(origin = {-58, -76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor1(C = cp * V * rho, T(fixed = true, start = 363.15)) annotation(
        Placement(visible = true, transformation(origin = {-44, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Thermal.HeatTransfer.Components.Convection convection3 annotation(
        Placement(visible = true, transformation(origin = {-96, -120}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));
      Modelica.Blocks.Sources.Constant const2(k = 1000 * R ^ 2 * 3.14) annotation(
        Placement(visible = true, transformation(origin = {-98, -158}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Fluid.Vessels.OpenTank tank1(redeclare package Medium = Medium, T_start = 273.15 + 90, crossArea = R ^ 2 * 3.14, height = L, level_start = level_start, nPorts = 1, portsData = {Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 5 / 1000)}, use_HeatTransfer = false, use_portsData = true) annotation(
        Placement(visible = true, transformation(origin = {50, 98}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      Modelica.Fluid.Pipes.DynamicPipe pipe(redeclare package Medium = Medium, crossArea = pi * drip_D ^ 2 / 4, diameter = drip_D, length = drip_L, perimeter = pi * drip_D) annotation(
        Placement(visible = true, transformation(origin = {50, 34}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    equation
      connect(pipe.port_b, cup.ports[1]) annotation(
        Line(points = {{50, 24}, {50, 24}, {50, -50}, {50, -50}}, color = {0, 127, 255}));
      connect(tank1.ports[1], pipe.port_a) annotation(
        Line(points = {{50, 78}, {50, 78}, {50, 44}, {50, 44}}, color = {0, 127, 255}, thickness = 0.5));
      connect(const2.y, convection3.Gc) annotation(
        Line(points = {{-86, -158}, {-96, -158}, {-96, -130}, {-96, -130}}, color = {0, 0, 127}));
      connect(convection3.fluid, fixedTemperature2.port) annotation(
        Line(points = {{-106, -120}, {-130, -120}, {-130, -10}, {-130, -10}}, color = {191, 0, 0}));
      connect(thermalConductor2.port_a, convection3.solid) annotation(
        Line(points = {{-68, -76}, {-76, -76}, {-76, -120}, {-86, -120}, {-86, -120}}, color = {191, 0, 0}));
      connect(convection1.solid, cup.heatPort) annotation(
        Line(points = {{8, 8}, {17, 8}, {17, -30}, {30, -30}}, color = {191, 0, 0}));
      connect(thermalConductor1.port_b, cup.heatPort) annotation(
        Line(points = {{-20, -76}, {16, -76}, {16, -30}, {30, -30}}, color = {191, 0, 0}));
      connect(const1.y, convection2.Gc) annotation(
        Line(points = {{-83, -38}, {-84.5, -38}, {-84.5, -38}, {-88, -38}, {-88, -36}, {-97, -36}, {-97, -64}, {-95, -64}, {-95, -66}, {-95, -66}, {-95, -66}, {-95, -66}}, color = {0, 0, 127}));
      connect(convection2.fluid, fixedTemperature2.port) annotation(
        Line(points = {{-104, -76}, {-130, -76}, {-130, -10}}, color = {191, 0, 0}));
      connect(thermalConductor2.port_a, convection2.solid) annotation(
        Line(points = {{-68, -76}, {-84, -76}}, color = {191, 0, 0}));
      connect(heatCapacitor1.port, thermalConductor1.port_a) annotation(
        Line(points = {{-44, -56}, {-44, -56}, {-44, -56}, {-44, -56}, {-44, -76}, {-40, -76}, {-40, -76}, {-40, -76}, {-40, -76}}, color = {191, 0, 0}));
      connect(thermalConductor2.port_b, heatCapacitor1.port) annotation(
        Line(points = {{-48, -76}, {-44, -76}, {-44, -56}, {-44, -56}}, color = {191, 0, 0}));
      connect(fixedTemperature2.port, convection1.fluid) annotation(
        Line(points = {{-130, -10}, {-128, -10}, {-128, 8}, {-12, 8}, {-12, 8}}, color = {191, 0, 0}));
      connect(const.y, convection1.Gc) annotation(
        Line(points = {{7, 48}, {2.5, 48}, {2.5, 50}, {-2, 50}, {-2, 33}, {-2, 33}, {-2, 18}}, color = {0, 0, 127}));
      annotation(
        Documentation(info = "<html>
<p>
熱伝導率
http://japan-miyabi.com/thermal_light/data/03/conductivity.htm
</p>
</html>"),
        uses(Modelica(version = "3.2.2")),
        Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}})),
        Icon(coordinateSystem(extent = {{-200, -200}, {200, 200}})),
        version = "",
        __OpenModelica_commandLineOptions = "");
    end CoffeeTest4;

    model CoffeeTest5
      import pi = Modelica.Constants.pi;
      //cup parameter
      parameter Real R = 70 / 1000 "radius of cup";
      parameter Real L = 85 / 1000 "height of cup";
      parameter Real level_start = 40 / 1000 "初期水位";
      parameter Real cup_thick = 3 / 1000 "thichness of cup";
      parameter Real rho = 2200 "陶器密度　https://www.hakko.co.jp/qa/qakit/html/h01010.htm";
      parameter Real V = ((R + cup_thick) ^ 2 - R ^ 2) * 3.14 * L "volume of cup";
      parameter Real cp = 1050;
      //dripper parameter
      parameter Real drip_D = 5 / 1000 "ドリッパーの直径";
      parameter Real drip_L = 10 / 1000 "ドリッパーの長さ";
      replaceable package Medium = Modelica.Media.Water.StandardWater;
      Modelica.Fluid.Vessels.OpenTank cup(redeclare package Medium = Medium, T_start = 273.15 + 90, crossArea = R ^ 2 * 3.14, height = L, level_start = 0, nPorts = 1, portsData = {Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 5 / 1000, height = 70 / 1000)}, use_HeatTransfer = true, use_portsData = true) annotation(
        Placement(visible = true, transformation(origin = {50, -30}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      inner Modelica.Fluid.System system annotation(
        Placement(visible = true, transformation(origin = {-140, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Thermal.HeatTransfer.Components.Convection convection1 annotation(
        Placement(visible = true, transformation(origin = {-2, 8}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.Constant const(k = 10 * R ^ 2 * 3.14) annotation(
        Placement(visible = true, transformation(origin = {-4, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor1(G = 1.3 * 2 * (R + cup_thick) * 3.14 / cup_thick / 2) annotation(
        Placement(visible = true, transformation(origin = {-30, -76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Thermal.HeatTransfer.Components.Convection convection2 annotation(
        Placement(visible = true, transformation(origin = {-94, -76}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.Constant const1(k = 10 * 2 * R * 3.14 * L) annotation(
        Placement(visible = true, transformation(origin = {-94, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature2(T = 296.15) annotation(
        Placement(visible = true, transformation(origin = {-140, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor2(G = 1.3 * 2 * (R + cup_thick) * 3.14 / cup_thick / 2) annotation(
        Placement(visible = true, transformation(origin = {-58, -76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor1(C = cp * V * rho, T(fixed = true, start = 363.15)) annotation(
        Placement(visible = true, transformation(origin = {-44, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Thermal.HeatTransfer.Components.Convection convection3 annotation(
        Placement(visible = true, transformation(origin = {-96, -120}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));
      Modelica.Blocks.Sources.Constant const2(k = 1000 * R ^ 2 * 3.14) annotation(
        Placement(visible = true, transformation(origin = {-98, -158}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Fluid.Vessels.OpenTank tank1(redeclare package Medium = Medium, T_start = 273.15 + 90, crossArea = R ^ 2 * 3.14, height = L, level_start = level_start, nPorts = 1, portsData = {Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 5 / 1000)}, use_HeatTransfer = false, use_portsData = true) annotation(
        Placement(visible = true, transformation(origin = {50, 98}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    equation
      connect(tank1.ports[1], cup.ports[1]) annotation(
        Line(points = {{50, 78}, {50, 78}, {50, -50}, {50, -50}}, color = {0, 127, 255}, thickness = 0.5));
      connect(const2.y, convection3.Gc) annotation(
        Line(points = {{-86, -158}, {-96, -158}, {-96, -130}, {-96, -130}}, color = {0, 0, 127}));
      connect(convection3.fluid, fixedTemperature2.port) annotation(
        Line(points = {{-106, -120}, {-130, -120}, {-130, -10}, {-130, -10}}, color = {191, 0, 0}));
      connect(thermalConductor2.port_a, convection3.solid) annotation(
        Line(points = {{-68, -76}, {-76, -76}, {-76, -120}, {-86, -120}, {-86, -120}}, color = {191, 0, 0}));
      connect(convection1.solid, cup.heatPort) annotation(
        Line(points = {{8, 8}, {17, 8}, {17, -30}, {30, -30}}, color = {191, 0, 0}));
      connect(thermalConductor1.port_b, cup.heatPort) annotation(
        Line(points = {{-20, -76}, {16, -76}, {16, -30}, {30, -30}}, color = {191, 0, 0}));
      connect(const1.y, convection2.Gc) annotation(
        Line(points = {{-83, -38}, {-84.5, -38}, {-84.5, -38}, {-88, -38}, {-88, -36}, {-97, -36}, {-97, -64}, {-95, -64}, {-95, -66}, {-95, -66}, {-95, -66}, {-95, -66}}, color = {0, 0, 127}));
      connect(convection2.fluid, fixedTemperature2.port) annotation(
        Line(points = {{-104, -76}, {-130, -76}, {-130, -10}}, color = {191, 0, 0}));
      connect(thermalConductor2.port_a, convection2.solid) annotation(
        Line(points = {{-68, -76}, {-84, -76}}, color = {191, 0, 0}));
      connect(heatCapacitor1.port, thermalConductor1.port_a) annotation(
        Line(points = {{-44, -56}, {-44, -56}, {-44, -56}, {-44, -56}, {-44, -76}, {-40, -76}, {-40, -76}, {-40, -76}, {-40, -76}}, color = {191, 0, 0}));
      connect(thermalConductor2.port_b, heatCapacitor1.port) annotation(
        Line(points = {{-48, -76}, {-44, -76}, {-44, -56}, {-44, -56}}, color = {191, 0, 0}));
      connect(fixedTemperature2.port, convection1.fluid) annotation(
        Line(points = {{-130, -10}, {-128, -10}, {-128, 8}, {-12, 8}, {-12, 8}}, color = {191, 0, 0}));
      connect(const.y, convection1.Gc) annotation(
        Line(points = {{7, 48}, {2.5, 48}, {2.5, 50}, {-2, 50}, {-2, 33}, {-2, 33}, {-2, 18}}, color = {0, 0, 127}));
      annotation(
        Documentation(info = "<html>
<p>
熱伝導率
http://japan-miyabi.com/thermal_light/data/03/conductivity.htm
</p>
</html>"),
        uses(Modelica(version = "3.2.2")),
        Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}})),
        Icon(coordinateSystem(extent = {{-200, -200}, {200, 200}})),
        version = "",
        __OpenModelica_commandLineOptions = "");
    end CoffeeTest5;

    model CoffeeTest6
      import pi = Modelica.Constants.pi;
      //cup parameter
      parameter Real R = 73 / 1000 "radius of cup";
      parameter Real L = 96 / 1000 "height of cup";
      parameter Real level_start = 60 / 1000 "初期水位";
      parameter Real cup_t = 4 / 1000 "thichness of cup";
      parameter Real cup_t_bottom = 4 / 1000 "thichness of cup";
      parameter Real rho = 2200 "陶器密度　https://www.hakko.co.jp/qa/qakit/html/h01010.htm";
      parameter Real V = ((R + cup_t) ^ 2 - R ^ 2) * 3.14 * L "volume of cup";
      parameter Real cp = 1050;
      //dripper parameter
      parameter Real drip_D = 5 / 1000 "ドリッパーの直径";
      parameter Real drip_L = 10 / 1000 "ドリッパーの長さ";
      replaceable package Medium = Modelica.Media.Water.StandardWater;
      Modelica.Fluid.Vessels.OpenTank cup(redeclare package Medium = Medium, T_start = 273.15 + 23, crossArea = R ^ 2 * 3.14, height = L, level_start = 0, nPorts = 1, portsData = {Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 15 / 1000, height = 70 / 1000)}, use_HeatTransfer = true, use_portsData = true) annotation(
        Placement(visible = true, transformation(origin = {50, -30}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      inner Modelica.Fluid.System system annotation(
        Placement(visible = true, transformation(origin = {-140, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Thermal.HeatTransfer.Components.Convection convection1 annotation(
        Placement(visible = true, transformation(origin = {-2, 8}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.Constant const(k = 10 * R ^ 2 * 3.14) annotation(
        Placement(visible = true, transformation(origin = {-4, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor1(G = 1.3 * 2 * (R + cup_t) * 3.14 / cup_t / 2) annotation(
        Placement(visible = true, transformation(origin = {-30, -76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Thermal.HeatTransfer.Components.Convection convection2 annotation(
        Placement(visible = true, transformation(origin = {-94, -76}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.Constant const1(k = 10 * 2 * R * 3.14 * L) annotation(
        Placement(visible = true, transformation(origin = {-94, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature2(T = 296.15) annotation(
        Placement(visible = true, transformation(origin = {-140, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor2(G = 1.3 * 2 * (R + cup_t) * 3.14 / cup_t / 2) annotation(
        Placement(visible = true, transformation(origin = {-58, -76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor1(C = cp * V * rho, T(fixed = true, start = 296.15)) annotation(
        Placement(visible = true, transformation(origin = {-44, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Thermal.HeatTransfer.Components.Convection convection3 annotation(
        Placement(visible = true, transformation(origin = {-96, -120}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));
      Modelica.Blocks.Sources.Constant const2(k = 1000 * R ^ 2 * 3.14) annotation(
        Placement(visible = true, transformation(origin = {-98, -158}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Fluid.Vessels.OpenTank tank1(redeclare package Medium = Medium, T_start = 273.15 + 90, crossArea = R ^ 2 * 3.14, height = L, level_start = level_start, nPorts = 1, portsData = {Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 5 / 1000)}, use_HeatTransfer = false, use_portsData = true) annotation(
        Placement(visible = true, transformation(origin = {50, 162}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      Modelica.Fluid.Pipes.StaticPipe pipe(redeclare package Medium = Medium, diameter = 15 / 1000, height_ab = -50 / 1000, length = 50 / 1000) annotation(
        Placement(visible = true, transformation(origin = {50, 92}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
      Modelica.Fluid.Valves.ValveIncompressible valveIncompressible1(redeclare package Medium = Medium, dp_nominal = 100000, filteredOpening = true, m_flow_nominal = 1) annotation(
        Placement(visible = true, transformation(origin = {50, 48}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
      Modelica.Blocks.Sources.Ramp ramp1(duration = 5, offset = 1e-6, startTime = 5) annotation(
        Placement(visible = true, transformation(origin = {90, 50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    equation
      connect(valveIncompressible1.port_b, cup.ports[1]) annotation(
        Line(points = {{50, 38}, {50, 38}, {50, -50}, {50, -50}}, color = {0, 127, 255}));
      connect(pipe.port_b, valveIncompressible1.port_a) annotation(
        Line(points = {{50, 82}, {50, 82}, {50, 58}, {50, 58}}, color = {0, 127, 255}));
      connect(tank1.ports[1], pipe.port_a) annotation(
        Line(points = {{50, 142}, {50, 142}, {50, 102}, {50, 102}}, color = {0, 127, 255}, thickness = 0.5));
      connect(valveIncompressible1.opening, ramp1.y) annotation(
        Line(points = {{58, 48}, {80, 48}, {80, 50}}, color = {0, 0, 127}));
      connect(const2.y, convection3.Gc) annotation(
        Line(points = {{-86, -158}, {-96, -158}, {-96, -130}, {-96, -130}}, color = {0, 0, 127}));
      connect(convection3.fluid, fixedTemperature2.port) annotation(
        Line(points = {{-106, -120}, {-130, -120}, {-130, -10}, {-130, -10}}, color = {191, 0, 0}));
      connect(thermalConductor2.port_a, convection3.solid) annotation(
        Line(points = {{-68, -76}, {-76, -76}, {-76, -120}, {-86, -120}, {-86, -120}}, color = {191, 0, 0}));
      connect(convection1.solid, cup.heatPort) annotation(
        Line(points = {{8, 8}, {17, 8}, {17, -30}, {30, -30}}, color = {191, 0, 0}));
      connect(thermalConductor1.port_b, cup.heatPort) annotation(
        Line(points = {{-20, -76}, {16, -76}, {16, -30}, {30, -30}}, color = {191, 0, 0}));
      connect(const1.y, convection2.Gc) annotation(
        Line(points = {{-83, -38}, {-84.5, -38}, {-84.5, -38}, {-88, -38}, {-88, -36}, {-97, -36}, {-97, -64}, {-95, -64}, {-95, -66}, {-95, -66}, {-95, -66}, {-95, -66}}, color = {0, 0, 127}));
      connect(convection2.fluid, fixedTemperature2.port) annotation(
        Line(points = {{-104, -76}, {-130, -76}, {-130, -10}}, color = {191, 0, 0}));
      connect(thermalConductor2.port_a, convection2.solid) annotation(
        Line(points = {{-68, -76}, {-84, -76}}, color = {191, 0, 0}));
      connect(heatCapacitor1.port, thermalConductor1.port_a) annotation(
        Line(points = {{-44, -56}, {-44, -56}, {-44, -56}, {-44, -56}, {-44, -76}, {-40, -76}, {-40, -76}, {-40, -76}, {-40, -76}}, color = {191, 0, 0}));
      connect(thermalConductor2.port_b, heatCapacitor1.port) annotation(
        Line(points = {{-48, -76}, {-44, -76}, {-44, -56}, {-44, -56}}, color = {191, 0, 0}));
      connect(fixedTemperature2.port, convection1.fluid) annotation(
        Line(points = {{-130, -10}, {-128, -10}, {-128, 8}, {-12, 8}, {-12, 8}}, color = {191, 0, 0}));
      connect(const.y, convection1.Gc) annotation(
        Line(points = {{7, 48}, {2.5, 48}, {2.5, 50}, {-2, 50}, {-2, 33}, {-2, 33}, {-2, 18}}, color = {0, 0, 127}));
      annotation(
        Documentation(info = "<html>
<p>
熱伝導率
http://japan-miyabi.com/thermal_light/data/03/conductivity.htm
</p>
</html>"),
        uses(Modelica(version = "3.2.2")),
        Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}})),
        Icon(coordinateSystem(extent = {{-200, -200}, {200, 200}})),
        version = "",
        __OpenModelica_commandLineOptions = "",
        experiment(StartTime = 0, StopTime = 1200, Tolerance = 1e-6, Interval = 1.2));
    end CoffeeTest6;

    model CoffeeTest7
      import pi = Modelica.Constants.pi;
      
      //ambient
       parameter Real Tamb = 273.15+24.8 "radius of cup";
      //cup parameter
      parameter Real R = 73 / 1000 /2 "radius of cup";
      parameter Real L = 96 / 1000 "height of cup";
      parameter Real level_start = 60 / 1000 "初期水位";
      parameter Real cup_t = 4 / 1000 "thichness of cup";
      parameter Real cup_t_bottom = 4 / 1000 "thichness of cup";
      parameter Real rho = 2200 "陶器密度　https://www.hakko.co.jp/qa/qakit/html/h01010.htm";
      parameter Real V = ((R + cup_t) ^ 2 - R ^ 2) * pi * L "volume of cup";
      parameter Real cp = 1050;
      parameter Real h = 15 "カップ-外気の熱伝達率";
      //dripper parameter
      parameter Real drip_D = 5 / 1000 "ドリッパーの直径";
      parameter Real drip_L = 10 / 1000 "ドリッパーの長さ";
      replaceable package Medium = Modelica.Media.Water.StandardWater;
      Modelica.Fluid.Vessels.OpenTank cup(redeclare package Medium = Medium, T_start = Tamb, crossArea = R ^ 2 * pi, height = L, level_start = 0, nPorts = 1, portsData = {Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = R, height = 70 / 1000)}, use_HeatTransfer = true, use_portsData = true) annotation(
        Placement(visible = true, transformation(origin = {50, -30}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      inner Modelica.Fluid.System system annotation(
        Placement(visible = true, transformation(origin = {-114, 136}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Thermal.HeatTransfer.Components.Convection convection1 annotation(
        Placement(visible = true, transformation(origin = {-2, 8}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.Constant const(k = 30 * R ^ 2 * pi) annotation(
        Placement(visible = true, transformation(origin = {-4, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor1(G = 1.3 * 2 * (R + cup_t) * pi / cup_t / 2) annotation(
        Placement(visible = true, transformation(origin = {-2, -76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Thermal.HeatTransfer.Components.Convection convection2 annotation(
        Placement(visible = true, transformation(origin = {-94, -76}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.Constant const1(k = h * 2 * (R + cup_t) * pi * L) annotation(
        Placement(visible = true, transformation(origin = {-94, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature2(T = Tamb) annotation(
        Placement(visible = true, transformation(origin = {-140, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor2(G = 1.3 * 2 * (R + cup_t) * pi / cup_t / 2) annotation(
        Placement(visible = true, transformation(origin = {-58, -76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor1(C = cp * V * rho, T(fixed = true, start = Tamb)) annotation(
        Placement(visible = true, transformation(origin = {-44, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Thermal.HeatTransfer.Components.Convection convection3 annotation(
        Placement(visible = true, transformation(origin = {-96, -120}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));
      Modelica.Blocks.Sources.Constant const2(k = h * (R + cup_t) ^ 2 * pi) annotation(
        Placement(visible = true, transformation(origin = {-98, -158}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Fluid.Vessels.OpenTank yakan(redeclare package Medium = Medium, T_start = 273.15 + 98, crossArea = R ^ 2 * pi, height = L, level_start = level_start, nPorts = 1, portsData = {Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 5 / 1000)}, use_HeatTransfer = false, use_portsData = true) annotation(
        Placement(visible = true, transformation(origin = {50, 162}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      Modelica.Fluid.Pipes.StaticPipe pipe(redeclare package Medium = Medium, diameter = 15 / 1000, height_ab = -50 / 1000, length = 50 / 1000) annotation(
        Placement(visible = true, transformation(origin = {50, 92}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
      Modelica.Fluid.Valves.ValveIncompressible valveIncompressible1(redeclare package Medium = Medium, dp_nominal = 100000, filteredOpening = true, m_flow_nominal = 1) annotation(
        Placement(visible = true, transformation(origin = {50, 48}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
      Modelica.Blocks.Sources.Ramp ramp1(duration = 1, offset = 1e-6, startTime = 0) annotation(
        Placement(visible = true, transformation(origin = {166, 50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.CombiTimeTable combiTimeTable1(columns = 2:2, fileName = "C:/Work/2018/Coffee/Experiment/WaterTemp_1.txt", tableName = "Tab1", tableOnFile = true)  annotation(
        Placement(visible = true, transformation(origin = {176, -180}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const3(k = 1)  annotation(
        Placement(visible = true, transformation(origin = {92, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      connect(const3.y, valveIncompressible1.opening) annotation(
        Line(points = {{103, 48}, {58, 48}}, color = {0, 0, 127}));
      connect(heatCapacitor1.port, thermalConductor1.port_a) annotation(
        Line(points = {{-44, -56}, {-44, -76}, {-12, -76}}, color = {191, 0, 0}));
      connect(thermalConductor1.port_b, cup.heatPort) annotation(
        Line(points = {{8, -76}, {16, -76}, {16, -30}, {30, -30}}, color = {191, 0, 0}));
      connect(valveIncompressible1.port_b, cup.ports[1]) annotation(
        Line(points = {{50, 38}, {50, 38}, {50, -50}, {50, -50}}, color = {0, 127, 255}));
      connect(pipe.port_b, valveIncompressible1.port_a) annotation(
        Line(points = {{50, 82}, {50, 82}, {50, 58}, {50, 58}}, color = {0, 127, 255}));
      connect(yakan.ports[1], pipe.port_a) annotation(
        Line(points = {{50, 142}, {50, 142}, {50, 102}, {50, 102}}, color = {0, 127, 255}, thickness = 0.5));
      connect(const2.y, convection3.Gc) annotation(
        Line(points = {{-86, -158}, {-96, -158}, {-96, -130}, {-96, -130}}, color = {0, 0, 127}));
      connect(convection3.fluid, fixedTemperature2.port) annotation(
        Line(points = {{-106, -120}, {-130, -120}, {-130, -10}, {-130, -10}}, color = {191, 0, 0}));
      connect(thermalConductor2.port_a, convection3.solid) annotation(
        Line(points = {{-68, -76}, {-76, -76}, {-76, -120}, {-86, -120}, {-86, -120}}, color = {191, 0, 0}));
      connect(convection1.solid, cup.heatPort) annotation(
        Line(points = {{8, 8}, {17, 8}, {17, -30}, {30, -30}}, color = {191, 0, 0}));
      connect(const1.y, convection2.Gc) annotation(
        Line(points = {{-83, -38}, {-84.5, -38}, {-84.5, -38}, {-88, -38}, {-88, -36}, {-97, -36}, {-97, -64}, {-95, -64}, {-95, -66}, {-95, -66}, {-95, -66}, {-95, -66}}, color = {0, 0, 127}));
      connect(convection2.fluid, fixedTemperature2.port) annotation(
        Line(points = {{-104, -76}, {-130, -76}, {-130, -10}}, color = {191, 0, 0}));
      connect(thermalConductor2.port_a, convection2.solid) annotation(
        Line(points = {{-68, -76}, {-84, -76}}, color = {191, 0, 0}));
      connect(thermalConductor2.port_b, heatCapacitor1.port) annotation(
        Line(points = {{-48, -76}, {-44, -76}, {-44, -56}, {-44, -56}}, color = {191, 0, 0}));
      connect(fixedTemperature2.port, convection1.fluid) annotation(
        Line(points = {{-130, -10}, {-128, -10}, {-128, 8}, {-12, 8}, {-12, 8}}, color = {191, 0, 0}));
      connect(const.y, convection1.Gc) annotation(
        Line(points = {{7, 48}, {2.5, 48}, {2.5, 50}, {-2, 50}, {-2, 33}, {-2, 33}, {-2, 18}}, color = {0, 0, 127}));
      annotation(
        Documentation(info = "<html>
<p>
熱伝導率
http://japan-miyabi.com/thermal_light/data/03/conductivity.htm
</p>
</html>"),
        uses(Modelica(version = "3.2.2")),
        Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}})),
        Icon(coordinateSystem(extent = {{-200, -200}, {200, 200}})),
        version = "",
        __OpenModelica_commandLineOptions = "",
        experiment(StartTime = 0, StopTime = 2400, Tolerance = 1e-06, Interval = 2.4));
    end CoffeeTest7;




















  end Test;

  package UnitTest
    model valveTest1
      import pi = Modelica.Constants.pi;
      //cup parameter
      parameter Real R = 70 / 1000 "radius of cup";
      parameter Real L = 85 / 1000 "height of cup";
      parameter Real level_start = 40 / 1000 "初期水位";
      parameter Real cup_thick = 3 / 1000 "thichness of cup";
      parameter Real rho = 2200 "陶器密度　https://www.hakko.co.jp/qa/qakit/html/h01010.htm";
      parameter Real V = ((R + cup_thick) ^ 2 - R ^ 2) * 3.14 * L "volume of cup";
      parameter Real cp = 1050;
      //dripper parameter
      parameter Real drip_D = 5 / 1000 "ドリッパーの直径";
      parameter Real drip_L = 10 / 1000 "ドリッパーの長さ";
      replaceable package Medium = Modelica.Media.Water.StandardWater;
      Modelica.Fluid.Vessels.OpenTank cup(redeclare package Medium = Medium, T_start = 273.15 + 90, crossArea = R ^ 2 * 3.14, height = L, level_start = 0, nPorts = 1, portsData = {Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 5 / 1000, height = 70 / 1000)}, use_HeatTransfer = true, use_portsData = true) annotation(
        Placement(visible = true, transformation(origin = {50, -30}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      inner Modelica.Fluid.System system annotation(
        Placement(visible = true, transformation(origin = {-16, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Fluid.Vessels.OpenTank tank1(redeclare package Medium = Medium, T_start = 273.15 + 90, crossArea = R ^ 2 * 3.14, height = L, level_start = level_start, nPorts = 1, portsData = {Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 5 / 1000)}, use_HeatTransfer = false, use_portsData = true) annotation(
        Placement(visible = true, transformation(origin = {50, 98}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      Modelica.Fluid.Pipes.StaticPipe pipe(redeclare package Medium = Medium, diameter = 15 / 1000, height_ab = -50 / 1000, length = 50 / 1000) annotation(
        Placement(visible = true, transformation(origin = {50, 36}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    equation
      connect(pipe.port_b, cup.ports[1]) annotation(
        Line(points = {{50, 26}, {52, 26}, {52, -50}, {50, -50}}, color = {0, 127, 255}));
      connect(tank1.ports[1], pipe.port_a) annotation(
        Line(points = {{50, 78}, {50, 78}, {50, 46}, {50, 46}}, color = {0, 127, 255}, thickness = 0.5));
      annotation(
        Documentation(info = "<html>
<p>
熱伝導率
http://japan-miyabi.com/thermal_light/data/03/conductivity.htm
</p>
</html>"),
        uses(Modelica(version = "3.2.2")),
        Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}})),
        Icon(coordinateSystem(extent = {{-200, -200}, {200, 200}})),
        version = "",
        __OpenModelica_commandLineOptions = "");
    end valveTest1;

    model valveTest2
      import pi = Modelica.Constants.pi;
      //cup parameter
      parameter Real R = 70 / 1000 "radius of cup";
      parameter Real L = 85 / 1000 "height of cup";
      parameter Real level_start = 40 / 1000 "初期水位";
      parameter Real cup_thick = 3 / 1000 "thichness of cup";
      parameter Real rho = 2200 "陶器密度　https://www.hakko.co.jp/qa/qakit/html/h01010.htm";
      parameter Real V = ((R + cup_thick) ^ 2 - R ^ 2) * 3.14 * L "volume of cup";
      parameter Real cp = 1050;
      //dripper parameter
      parameter Real drip_D = 5 / 1000 "ドリッパーの直径";
      parameter Real drip_L = 10 / 1000 "ドリッパーの長さ";
      replaceable package Medium = Modelica.Media.Water.StandardWater;
      Modelica.Fluid.Vessels.OpenTank cup(redeclare package Medium = Medium, T_start = 273.15 + 23, crossArea = R ^ 2 * 3.14, height = L, level_start = 0, nPorts = 1, portsData = {Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 15 / 1000, height = 70 / 1000)}, use_HeatTransfer = true, use_portsData = true) annotation(
        Placement(visible = true, transformation(origin = {48, -62}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      inner Modelica.Fluid.System system annotation(
        Placement(visible = true, transformation(origin = {-16, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Fluid.Vessels.OpenTank tank1(redeclare package Medium = Medium, T_start = 273.15 + 90, crossArea = R ^ 2 * 3.14, height = L, level_start = level_start, nPorts = 1, portsData = {Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 5 / 1000)}, use_HeatTransfer = false, use_portsData = true) annotation(
        Placement(visible = true, transformation(origin = {50, 98}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      Modelica.Fluid.Pipes.StaticPipe pipe(redeclare package Medium = Medium, diameter = 15 / 1000, height_ab = -50 / 1000, length = 50 / 1000) annotation(
        Placement(visible = true, transformation(origin = {50, 36}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
      Modelica.Fluid.Valves.ValveIncompressible valveIncompressible1(redeclare package Medium = Medium, dp_nominal = 100000, m_flow_nominal = 1) annotation(
        Placement(visible = true, transformation(origin = {50, -6}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
      Modelica.Blocks.Sources.Ramp ramp1(duration = 0, offset = 1e-6, startTime = 5) annotation(
        Placement(visible = true, transformation(origin = {0, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      connect(ramp1.y, valveIncompressible1.opening) annotation(
        Line(points = {{12, -6}, {42, -6}, {42, -6}, {42, -6}}, color = {0, 0, 127}));
      connect(pipe.port_b, valveIncompressible1.port_a) annotation(
        Line(points = {{50, 26}, {50, 4}}, color = {0, 127, 255}));
      connect(valveIncompressible1.port_b, cup.ports[1]) annotation(
        Line(points = {{50, -16}, {48, -16}, {48, -82}}, color = {0, 127, 255}));
      connect(tank1.ports[1], pipe.port_a) annotation(
        Line(points = {{50, 78}, {50, 78}, {50, 46}, {50, 46}}, color = {0, 127, 255}, thickness = 0.5));
      annotation(
        Documentation(info = "<html>
<p>
熱伝導率
http://japan-miyabi.com/thermal_light/data/03/conductivity.htm
</p>
</html>"),
        uses(Modelica(version = "3.2.2")),
        Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}})),
        Icon(coordinateSystem(extent = {{-200, -200}, {200, 200}})),
        version = "",
        __OpenModelica_commandLineOptions = "",
        experiment(StartTime = 0, StopTime = 100, Tolerance = 1e-6, Interval = 0.1));
    end valveTest2;

    model tankTest1
      import pi = Modelica.Constants.pi;
      //cup parameter
      parameter Real R = 70 / 1000 "radius of cup";
      parameter Real L = 85 / 1000 "height of cup";
      parameter Real level_start = 40 / 1000 "初期水位";
      parameter Real cup_thick = 3 / 1000 "thichness of cup";
      parameter Real rho = 2200 "陶器密度　https://www.hakko.co.jp/qa/qakit/html/h01010.htm";
      parameter Real V = ((R + cup_thick) ^ 2 - R ^ 2) * 3.14 * L "volume of cup";
      parameter Real cp = 1050;
      //dripper parameter
      parameter Real drip_D = 5 / 1000 "ドリッパーの直径";
      parameter Real drip_L = 10 / 1000 "ドリッパーの長さ";
      replaceable package Medium = Modelica.Media.Water.StandardWater;
      Modelica.Fluid.Vessels.OpenTank cup(redeclare package Medium = Medium, T_start = 273.15 + 23, crossArea = R ^ 2 * 3.14, height = L, level_start = 0, nPorts = 1, portsData = {Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 15 / 1000, height = 70 / 1000)}, use_HeatTransfer = true, redeclare model HeatTransfer = Modelica.Fluid.Vessels.BaseClasses.HeatTransfer.IdealHeatTransfer(k = 10), use_portsData = true) annotation(
        Placement(visible = true, transformation(origin = {48, -62}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      inner Modelica.Fluid.System system annotation(
        Placement(visible = true, transformation(origin = {-16, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Fluid.Vessels.OpenTank tank1(redeclare package Medium = Medium, T_start = 273.15 + 90, crossArea = R ^ 2 * 3.14, height = L, level_start = level_start, nPorts = 1, portsData = {Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 5 / 1000)}, use_HeatTransfer = false, use_portsData = true) annotation(
        Placement(visible = true, transformation(origin = {40, 102}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      Modelica.Fluid.Pipes.StaticPipe pipe(redeclare package Medium = Medium, diameter = 15 / 1000, height_ab = -50 / 1000, length = 50 / 1000) annotation(
        Placement(visible = true, transformation(origin = {50, 36}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
      Modelica.Fluid.Valves.ValveIncompressible valveIncompressible1(redeclare package Medium = Medium, dp_nominal = 100000, m_flow_nominal = 1) annotation(
        Placement(visible = true, transformation(origin = {50, -6}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
      Modelica.Blocks.Sources.Ramp ramp1(duration = 0, offset = 1e-6, startTime = 5) annotation(
        Placement(visible = true, transformation(origin = {0, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      connect(tank1.ports[1], pipe.port_a) annotation(
        Line(points = {{40, 82}, {40, 62}, {50, 62}, {50, 46}}, color = {0, 127, 255}, thickness = 0.5));
      connect(ramp1.y, valveIncompressible1.opening) annotation(
        Line(points = {{12, -6}, {42, -6}, {42, -6}, {42, -6}}, color = {0, 0, 127}));
      connect(pipe.port_b, valveIncompressible1.port_a) annotation(
        Line(points = {{50, 26}, {50, 4}}, color = {0, 127, 255}));
      connect(valveIncompressible1.port_b, cup.ports[1]) annotation(
        Line(points = {{50, -16}, {48, -16}, {48, -82}}, color = {0, 127, 255}));
      annotation(
        Documentation(info = "<html>
<p>
熱伝導率
http://japan-miyabi.com/thermal_light/data/03/conductivity.htm
</p>
</html>"),
        uses(Modelica(version = "3.2.2")),
        Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}})),
        Icon(coordinateSystem(extent = {{-200, -200}, {200, 200}})),
        version = "",
        __OpenModelica_commandLineOptions = "",
        experiment(StartTime = 0, StopTime = 100, Tolerance = 1e-06, Interval = 0.1));
    end tankTest1;
  end UnitTest;
  annotation(
    uses(Modelica(version = "3.2.2")));
end CoffeeTemperature;
