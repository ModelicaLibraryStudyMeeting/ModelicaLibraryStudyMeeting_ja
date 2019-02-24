within MoistureTransport;
model SingleLayerMoisture "Model for simultaneous heat and moisture transpot in single layer"
  extends Buildings.HeatTransfer.Conduction.BaseClasses.PartialConductor;
  Modelica.SIunits.Temperature T[nSta](start=
   {(T_a_start + (T_b_start - T_a_start)*(i-1)/(nSta-1)) for i in 1:nSta},
   each nominal=300)
    "Temperature at the states";
  Modelica.SIunits.HeatFlowRate Q_flow[nSta+1]
    "Heat flow rates to each state";

  parameter Modelica.SIunits.Temperature T_a_start=293.15
    "Initial temperature at surface a";
  parameter Modelica.SIunits.Temperature T_b_start=293.15
    "Initial temperature at surface b";
  parameter Integer nSta2=material.nSta
  "Number of states in a material";

  Real w[nSta](start=
    {(w_a_start + (w_b_start - w_a_start)*(i-1)/(nSta-1)) for i in 1:nSta},
    final quantity = "GravimetricWaterContent", final unit = "1",min = 0.0)
    "Water content";
  Real D_moisture[nX](final quantity = "MoistureDiffusion", final unit = "1")
    "Diffusion term for each state";
  Real D_vapor[nX](final quantity = "MoistureDiffusion", final unit = "1")
    "Diffusion term for each state";
  MoistureTransport.Interfaces.MoisturePort_a portMoi_a(final quantity = "AbsoluteHumidity", final unit = "1",
    min = 0.0) "Port at surface a for water mass fraction per mass of dry air";
  MoistureTransport.Interfaces.MoisturePort_b portMoi_b(final quantity = "AbsoluteHumidity", final unit = "1",
    min = 0.0) "Port at surface b for water mass fraction per mass of dry air";
  parameter Real w_a_start(final quantity = "GravimetricWaterContent", final unit = "1",min = 0.0)=0.1
    "Water content";
  parameter Real w_b_start(final quantity = "GravimetricWaterContent", final unit = "1",min = 0.0)=0.1
    "Water content";
  Modelica.SIunits.MassFraction XiDry_a "Water mass fraction per mass of dry air at [1]";
  Modelica.SIunits.MassFraction XiDry_b "Water mass fraction per mass of dry air at [end]";

  parameter Modelica.SIunits.Density d_air=1.205 "Air density";
  parameter Modelica.SIunits.Density d_water=1000.0 "Water density";
  parameter Modelica.SIunits.SpecificEnergy L=2500000.0 "Latent heat of vaporization";
  parameter Modelica.SIunits.SurfaceCoefficientOfHeatTransfer alpha=34.9 "Heat transfer coefficient";
  parameter Real alpha_moisture(final quantity = "CoefficientOfMoistureTransfer",
    final unit = "kg/m2h")=0.045 "Moisture transfer coefficient";
  parameter Modelica.SIunits.AbsolutePressure p = 101325 "Absolute pressure of the medium";

protected
  final parameter Integer nSta=max(nSta2, 2) "Number of state variables";
  final parameter Integer nX=nSta+1 "Number of thermal resistances";

  Modelica.SIunits.ThermalConductivity k_moisture[nSta] "Thermal conductivity";
  Real DT[nSta](final quantity = "MoistureDiffusionCoefficient_T", final unit = "kg/(m.h.K)")
    "Diffusion coefficient of water due to temperature gradient";
  Real DTv[nSta](final quantity = "MoistureDiffusionCoefficient_T", final unit = "kg/(m.h.K)")
    "Diffusion coefficient of vapor due to temperature gradient";
  Real Dw[nSta](final quantity = "MoistureDiffusionCoefficient_w", final unit = "kg/(m.h)")
    "Diffusion coefficient of water due to water content";
  Real Dwv[nSta](final quantity = "MoistureDiffusionCoefficient_w", final unit = "kg/(m.h)")
    "Diffusion coefficient of vapor due to water content";
  Real phi[nSta](final quantity = "Relativehumidity", final unit = "1", min = 0.0, max = 100.0)
    "Relative humidity";
  replaceable parameter Buildings.HeatTransfer.Conduction.Data.BaseClasses.Material material
  "Material from MoistureTransport.Data.SolidsMoisture";
  Real dXiDrydw_Tw[nSta] "Water content derivative of absolute humidity";
  Real dXiDrydT_Tw[nSta] "Temperature derivative of absolute humidity";
  parameter Modelica.SIunits.ThermalResistance dx[nX]=
        {(if i==1 or i==nX then 0 else material.x/(nSta-1)) for i in 1:nX};

  parameter Real dk_dw[:] "Support points for derivatives";
  parameter Real dDT_dw[:] "Support points for derivatives";
  parameter Real dDTv_dw[:] "Support points for derivatives";
  parameter Real dDw_dw[:] "Support points for derivatives";
  parameter Real dDwv_dw[:] "Support points for derivatives";
  parameter Real dphi_dw[:] "Support points for derivatives";

initial equation
  for i in 1:nSta loop
    T[i] = T_a_start + (T_b_start - T_a_start)*(i-1)/(nSta-1);
    w[i] = w_a_start + (w_b_start - w_a_start)*(i-1)/(nSta-1);
  end for;
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
    ensureMonotonicity=ensureMonotonicity_Dw);
  dDwv_dw = Buildings.Utilities.Math.Functions.splineDerivatives(
    x=material.wd_Dwvd,
    y=material.Dwvd,
    ensureMonotonicity=ensureMonotonicity_Dwv);
  dphi_dw = Buildings.Utilities.Math.Functions.splineDerivatives(
    x=material.wd_phid,
    y=material.phid,
    ensureMonotonicity=material.ensureMonotonicity_phi);

equation 
  port_a.Q_flow = +Q_flow[1];
  port_b.Q_flow = -Q_flow[end];
  A*alpha*(port_a.T-T[1]) = +Q_flow[1];
  A*alpha*(T[end]-port_b.T) = -Q_flow[end];

  XiDry_a = MoistureTransport.BaseClasses.XiDry_pTphi(
    p=p,
    T=T[1],
    phi=phi[1]);
  XiDry_b = MoistureTransport.BaseClasses.XiDry_pTphi(
    p=p,
    T=T[end],
    phi=phi[end]);
  portMoi_a.Mflow = A*alpha*(portMoi_a.XiDry-XiDry_a);
  portMoi_b.Mflow = A*alpha*(XiDry_b-portMoi_b.XiDry);

  D_moisture[1]=1;
  D_moisture[end]=1;
  D_vapor[1]=1;
  D_vapor[end]=1;

  port_a.T-T[1]    = if stateAtSurface_a then 0 else Q_flow[1]*RNod[1];
  T[nSta]-port_b.T = if stateAtSurface_b then 0 else Q_flow[end]*RNod[end];

  for i in 1:nSta-1 loop
    // Q_flow[i+1] is heat flowing from (i) to (i+1)xx
    // because T[1] has Q_flow[1] and Q_flow[2] acting on it.
  Q_flow[i+1]=(k_moisture[i]+k_moisture[i+1])/2*T[i]-T[i+1]/dx[i+1];
  D_moisture[i+1]=(Dw[i]+Dw[i+1])/2*(w[i]-w[i+1])/dx[i+1]+(DT[i]+DT[i+1])/2*(T[i]-T[i+1])/dx[i+1];
  D_vapor[i+1]=(Dwv[i]+Dwv[i+1])/2*(w[i]-w[i+1])/dx[i+1]+(DTv[i]+DTv[i+1])/2*(T[i]-T[i+1])/dx[i+1];
  end for;

  for i in 1:nSta loop
    k_moisture[i] = MoistureTransport.BaseClasses.property_data(
      x=w[i],
      xd=material.wd_kd,
      yd=material.kd,
      dy_dx=dk_dw);
    DT[i] = MoistureTransport.BaseClasses.property_data(
      x=w[i],
      xd=material.wd_DTd,
      yd=material.DTd,
      dy_dx=dDT_dw);
    DTv[i] = MoistureTransport.BaseClasses.property_data(
      x=w[i],
      xd=material.wd_DTvd,
      yd=material.DTvd,
      dy_dx=dDTv_dw);
    Dw[i] = MoistureTransport.BaseClasses.property_data(
      x=w[i],
      xd=material.wd_Dwd,
      yd=material.Dwd,
      dy_dx=dDw_dw);
    Dwv[i] = MoistureTransport.BaseClasses.property_data(
      x=w[i],
      xd=material.wd_Dwvd,
      yd=material.Dwvd,
      dy_dx=dDwv_dw);
    phi[i] = MoistureTransport.BaseClasses.property_data(
      x=w[i],
      xd=material.wd_phid,
      yd=material.phid,
      dy_dx=dphi_dw);
    dXiDrydw_Tw[i] =MoistureTransport.BaseClasses.dXiDrydT_Tw(
      T=T[i],
      w=w[i],
      phi=phi[i]);
    dXiDrydT_Tw[i] = MoistureTransport.BaseClasses.dXiDrydw_Tw(
      T=T[i],
      w=w[i],
      phid=material.phid,
      wd_phid=material.wd_phid,
      dphi_dw=dphi_dw);
    (d_water+material.a*d_air)*dXiDrydw_Tw[i]*der(w[i])+material.a*d_air*dXiDrydT_Tw[i]*der(T[i])
      = (D_moisture[i]-D_moisture[i+1])/(dx[i]+dx[i+1])*2;
    L*material.a*d_air*dXiDrydw_Tw[i]*der(w[i])+(material.d*material.c+L*material.a*d_air)*dXiDrydT_Tw[i]*der(T[i])
      = (Q_flow[i]-Q_flow[i+1]+D_vapor[i]-D_vapor[i+1])/(dx[i]+dx[i+1])*2;
  end for;

  annotation (defaultComponentName="layMoi");
end SingleLayerMoisture;
