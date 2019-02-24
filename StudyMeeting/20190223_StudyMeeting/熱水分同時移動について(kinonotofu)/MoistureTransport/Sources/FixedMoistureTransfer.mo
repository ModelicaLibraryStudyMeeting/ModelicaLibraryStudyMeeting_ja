within MoistureTransport.Sources;
model FixedMoistureTransfer "Fixed moisture transfer boundary condition"
  flow Modelica.SIunits.MassFlowRate M_flow "Fixed moisture transfer at port";
  MoisturePort.Interfaces.MoisturePort_b port;
equation
  port.M_flow = -M_flow;
  annotation (defaultComponentName="fixMoi");
end FixedMoistureTransfer;
