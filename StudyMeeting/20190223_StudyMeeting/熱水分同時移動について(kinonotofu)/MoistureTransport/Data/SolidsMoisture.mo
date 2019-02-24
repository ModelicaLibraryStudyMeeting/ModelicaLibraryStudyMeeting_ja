within MoistureTransport.Data;
package SolidsMoisture
  "Package with solid material, characterized by simultaneous heat and moisture transport"
    extends Modelica.Icons.MaterialPropertiesPackage;
  record Generic "Thermal and moisture properties of solids with storage"
      extends Buildings.HeatTransfer.Data.BaseClasses.Material(final R=x/k,
                                                               final TSol=293.15,
                                                               final TLiq=293.15,
                                                               final LHea=0,
                                                               final phasechange=false);

  parameter Real a(final quantity = "Porosity", final unit = "1", min = 0.0, max = 1.0)
    "Porosity";

  parameter Modelica.SIunits.ThermalConductivity kd[:] "Thermal conductivity at the support points";
  parameter Real wd_kd[:](each final quantity = "GravimetricWaterContent", each final unit = "1", each final min = 0.0)
    "Water content at the support points";
  input Boolean ensureMonotonicity_k = true
    "Set to true to force derivatives dk/dw to be monotone";

  parameter Real DTd[:](each final quantity = "MoistureDiffusionCoefficient_T", each final unit = "kg/(m.h.K)")
    "Diffusion coefficient of water due to temperature gradient at the support points";
  parameter Real wd_DTd[:](each final quantity = "GravimetricWaterContent", each final unit = "1", each final min = 0.0)
    "Water content at the support points";
  input Boolean ensureMonotonicity_DT = false
    "Set to true to force derivatives dDt/dw to be monotone";

  parameter Real DTvd[:](each final quantity = "MoistureDiffusionCoefficient_T", each final unit = "kg/(m.h.K)")
    "Diffusion coefficient of vapor due to temperature gradient at the support points";
  parameter Real wd_DTvd[:](each final quantity = "GravimetricWaterContent", each final unit = "1", each final min = 0.0)
    "Water content at the support points";
  input Boolean ensureMonotonicity_DTv = false
    "Set to true to force derivatives dDt/dw to be monotone";

  parameter Real Dwd[:](each final quantity = "MoistureDiffusionCoefficient_w", each final unit = "kg/(m.h)")
    "Diffusion coefficient of water due to water content at the support points";
  parameter Real wd_Dwd[:](each final quantity = "GravimetricWaterContent", each final unit = "1", each final min = 0.0)
    "Water content at the support points";
  input Boolean ensureMonotonicity_Dw = false
    "Set to true to force derivatives dDw/dw to be monotone";

  parameter Real Dwvd[:](each final quantity = "MoistureDiffusionCoefficient_w", each final unit = "kg/(m.h)")
    "Diffusion coefficient of vapor due to water content at the support points";
  parameter Real wd_Dwvd[:](each final quantity = "GravimetricWaterContent", each final unit = "1", each final min = 0.0)
    "Water content at the support points";
  input Boolean ensureMonotonicity_Dwv = false
    "Set to true to force derivatives dDw/dw to be monotone";

  parameter Real phid[:](each final quantity = "Relativehumidity", each final unit = "1", each final min = 0.0, each final max = 100.0)
    "Relative humidity at the support points";
  parameter Real wd_phid[:](each final quantity = "GravimetricWaterContent", each final unit = "1", each final min = 0.0)
    "Water content at the support points";
  input Boolean ensureMonotonicity_phi = true
    "Set to true to force derivatives dphi/dw to be monotone";

    annotation(
      defaultComponentPrefixes="parameter",
      defaultComponentName="datSolMoi");
  end Generic;
  record Fiberboard = MoistureTransport.Data.SolidsMoisture.Generic(
      k=0.063,
      d=240,
      c=1205,
      a=0.65,
      kd={0.0637300323343467,0.0637256889146276,0.0672621977703778,0.0840427585541238,0.0947980309830606,0.0985232372954973},
      wd_kd={5.06799864871386,7.2631629747599,39.9115872786062,99.0161671733989,123.301481588726,130.582211283239},
      DTd={7.05469329984531E-06,1.15825186809222E-05,3.61185310585509E-05,4.30289111988399E-05,7.01819872199596E-05,0.000212356814287002,0.000015688505595604,9.45806245707033E-06},
      wd_DTd={2.60388119141614,5.86445664013987,21.5106396264509,46.9895442340648,65.8994248288016,132.333779686535,169.256440321651,175.802568496714},
      DTvd={7.05469329984531E-06,1.15825186809222E-05,3.61185310585509E-05,4.30289111988399E-05,7.05469329984531E-06,0.0,0.0},
      wd_DTvd={2.60388119141614,5.86445664013987,21.5106396264509,46.9895442340648,110.0,150.0,160.0},
      Dwd={3.16390408754425E-09,3.6632530649267E-09,3.1025470345554E-09,3.4455189162302E-10,2.44901541972671E-10,1.50713198934956E-09,2.92953594522632E-09,3.40465810340287E-09,2.18629487667144E-09},
      wd_Dwd={2.88680984287679,5.73192497878691,9.79496444977617,30.8310413435936,60.9883840009363,98.9711648184451,127.128258770518,139.782602334903,157.000321853878},
      Dwvd={3.16390408754425E-09,3.6632530649267E-09,3.1025470345554E-09,7.94964449776164E-10,1.66142434970886E-10,0.0,0.0},
      wd_Dwvd={2.88680984287679,5.73192497878691,9.79496444977617,21.6966088305,40.2957398250285,140.0,150.0},
      phid={0.0,1.86891922467758,5.82442114789954,14.9341579304623,28.4442265630892,30.3783090730824},
      wd_phid={0.0,14.9038389018779,62.644241647183,89.7420619956256,98.321140357493,98.6348895090127}
    ) "Fiberboard (a=0.65)"
    annotation(
      defaultComponentPrefixes="parameter",
      defaultComponentName="datSolMoi");
end SolidsMoisture;
