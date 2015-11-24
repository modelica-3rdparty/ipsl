within iPSL.Electrical.Events;
class PwFaultPQ

  iPSL.Connectors.PwPin p annotation (Placement(transformation(extent={{-40,-10},
            {-20,10}}), iconTransformation(extent={{-80,-10},{-60,10}})));
  parameter Real R "Resistance (pu)";
  parameter Real X "Reactance (pu)";
  parameter Real t1 "Start time of the fault (s)";
  parameter Real t2 "End time of the fault (s)";
  Real P "Active power supplied to the fault (pu)";
  Real Q "Reactive power supplied to the fault (pu)";
equation
  p.ir = if time < t1 then 0 else if time < t2 then 1 / X * (p.vi - R * p.ii) else 0;
  p.ii = if time < t1 then 0 else if time < t2 then (R * p.vi - X * p.vr) / (X * X + R * R) else 0;
  P = p.vr * p.ir + p.vi * p.ii;
  Q = (-p.vr * p.ii) + p.vi * p.ir;
  annotation(Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-60,-60},{60,60}},
        initialScale=0.1),
                  graphics={  Rectangle(extent={{-60,60},{60,-60}},      lineColor = {0, 0, 255}), Rectangle(extent={{
              -28,26},{12,6}},                                                                                                    lineColor = {0, 0, 0}, fillColor = {95, 95, 95},
            fillPattern =                                                                                                   FillPattern.Solid), Line(points={{
              12,16},{26,16},{26,-24}},                                                                                                    color = {0, 0, 255}, smooth = Smooth.None), Line(points={{
              14,-24},{38,-24}},                                                                                                    color = {0, 0, 255}, smooth = Smooth.None), Line(points={{
              16,-28},{36,-28}},                                                                                                    color = {0, 0, 255}, smooth = Smooth.None), Line(points={{
              20,-32},{34,-32}},                                                                                                    color = {0, 0, 255}, smooth = Smooth.None), Line(points={{
              22,-36},{30,-36}},                                                                                                    color = {0, 0, 255}, smooth = Smooth.None), Rectangle(extent={{
              -38,18},{-28,14}},                                                                                                    lineColor = {0, 0, 0}, fillColor = {0, 0, 0},
            fillPattern =                                                                                                   FillPattern.Solid), Line(points={{
              -12,34},{-4,16},{-18,16},{-6,-6}},                                                                                                    color = {255, 0, 0}, smooth = Smooth.None, thickness = 0.5), Line(points={{
              -12,-4},{-6,-6},{-6,0}},                                                                                                    color = {255, 0, 0}, smooth = Smooth.None)}), Diagram(
        coordinateSystem(
        extent={{-60,-60},{60,60}},
        preserveAspectRatio=true,
        initialScale=0.1),                                                                                                    graphics),
    Documentation(info="<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
end PwFaultPQ;
