clear all

N = 2200;

qq = struct('cdata',[],'colormap',[]);

set(gca,'NextPlot','replaceChildren');

for ty = [1:199,200:10:N]
 clear {fi u}
    
    load(['iter' num2str(ty)])

    clf
    hold on
    plot(u(25,:),'r')
    plot(fi(25,:))
    axis equal
    axis square
    grid on
    %hold off
    qq(ty)=getframe(gcf);
    disp(ty)
end

movie2avi(qq,'espDisB','compression','none')