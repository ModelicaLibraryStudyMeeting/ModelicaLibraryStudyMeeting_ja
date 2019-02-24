within MoistureTransport.Sources;
model PrescribedMoistureTransfer "Prescribed moisture transfer boundary condition"
  flow Modelica.SIunits.MassFlowRate M_flow;
  MoisturePort.Interfaces.MoisturePort_b port;
equation
  port.M_flow = -M_flow;
  annotation (defaultComponentName="preMoi");
end PrescribedMoistureTransfer;
