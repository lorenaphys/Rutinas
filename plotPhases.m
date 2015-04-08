function  plotPhases(H)
var =  load(H);
f1 = var.u(25,:);
f2 = var.fi(25,:);

figure(1)
hold on
plot(f1,'r'), axis square
plot(f2), grid on
hold off


