clear all

N = 10;

qq = struct('cdata',[],'colormap',[]);

set(gca,'NextPlot','replaceChildren');

for ty=1:N
 clear {fi u}
    
    load(['iter' num2str(ty)])

    clf
    hold on
    plot(u(25,:),'r')
    plot(fi(25,:))
    axis square
    grid on
    %hold off
    qq(ty)=getframe;
    disp(ty)
end

movie2avi(qq,'espDisB','compression','none')