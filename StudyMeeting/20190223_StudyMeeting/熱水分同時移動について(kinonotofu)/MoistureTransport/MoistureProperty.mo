within MoistureTransport;
model MoistureProperty "Test model for moisture property"
  parameter MoistureTransport.Data.SolidsMoisture.Generic material
    "Material from MoistureTransport.Data.SolidsMoisture";
  Modelica.SIunits.ThermalConductivity k_moisture "Thermal conductivity";
  Real DT(final quantity = "MoistureDiffusionCoefficient_T", final unit = "kg/(m.h.K)")
    "Diffusion coefficient of water due to temperature gradient";
  Real DTv(final quantity = "MoistureDiffusionCoefficient_T", final unit = "kg/(m.h.K)")
    "Diffusion coefficient of vapor due to temperature gradient";
  Real Dw(final quantity = "MoistureDiffusionCoefficient_w", final unit = "kg/(m.h)")
    "Diffusion coefficient of water due to water content";
  Real Dwv(final quantity = "MoistureDiffusionCoefficient_w", final unit = "kg/(m.h)")
    "Diffusion coefficient of vapor due to water content";
  Real phi(final quantity = "Relativehumidity", final unit = "1", min = 0.0, max = 100.0)
    "Relative humidity";
  Modelica.Blocks.Interfaces.RealInput w(final quantity = "GravimetricWaterContent", final unit = "1",
    min = 0.0) "Water content" annotation(Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    
protected
  parameter Real dk_dw[:] "Support points for derivatives";
  parameter Real dDT_dw[:] "Support points for derivatives";
  parameter Real dDTv_dw[:] "Support points for derivatives";
  parameter Real dDw_dw[:] "Support points for derivatives";
  parameter Real dDwv_dw[:] "Support points for derivatives";
  parameter Real dphi_dw[:] "Support points for derivatives";

initial equation
  dk_dw = Buildings.Utilities.Math.Functions.splineDerivatives(
    x=material.wd_kd,
    y=material.kd,
    ensureMonotonicity=material.ensureMonotonicity_k);
  dDT_dw = Buildings.Utilities.Math.Functions.splineDerivatives(
    x=material.wd_DTd,
    y=material.DTd,
    ensureMonotonicity=material.ensureMonotonicity_DT);
  dDTv_dw = Buildings.Utilities.Math.Functions.splineDerivatives(
    x=material.wd_DTvd,
    y=material.DTvd,
    ensureMonotonicity=material.ensureMonotonicity_DTv);
  dDw_dw = Buildings.Utilities.Math.Functions.splineDerivatives(
    x=material.wd_Dwd,
    y=material.Dwd,
    ensureMonotonicity=material.ensureMonotonicity_Dw);
  dDwv_dw = Buildings.Utilities.Math.Functions.splineDerivatives(
    x=material.wd_Dwvd,
    y=material.Dwvd,
    ensureMonotonicity=material.ensureMonotonicity_Dwv);
  dphi_dw = Buildings.Utilities.Math.Functions.splineDerivatives(
    x=material.wd_phid,
    y=material.phid,
    ensureMonotonicity=material.ensureMonotonicity_phi);
equation
  k_moisture = MoistureTransport.BaseClasses.property_data(
     x=w,
     xd=material.wd_kd,
     yd=material.kd,
     dy_dx=dk_dw);
  DT = MoistureTransport.BaseClasses.property_data(
     x=w,
     xd=material.wd_DTd,
     yd=material.DTd,
     dy_dx=dDT_dw);
  DTv = MoistureTransport.BaseClasses.property_data(
     x=w,
     xd=material.wd_DTvd,
     yd=material.DTvd,
     dy_dx=dDTv_dw);
  Dw = MoistureTransport.BaseClasses.property_data(
     x=w,
     xd=material.wd_Dwd,
     yd=material.Dwd,
     dy_dx=dDw_dw);
  Dwv = MoistureTransport.BaseClasses.property_data(
     x=w,
     xd=material.wd_Dwvd,
     yd=material.Dwvd,
     dy_dx=dDwv_dw);
  phi = MoistureTransport.BaseClasses.property_data(
     x=w,
     xd=material.wd_phid,
     yd=material.phid,
     dy_dx=dphi_dw);
    annotation (
      defaultComponentName="proMoi");
end MoistureProperty;
