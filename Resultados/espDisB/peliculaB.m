clear all
N = 2200;
qq = struct('cdata',[],'colormap',[]);

for lm=1:N
 clear {fi u}
    
    load(['iter' num2str(lm)])

    figure(1)
    clf
    hold on
    plot(u(25,:),'r')
    plot(fi(25,:))
    axis square
    axis([0 50 -1.3 1.3])
    grid on
    hold off
    qq(lm)=getframe(gcf);
    disp(lm)
end

movie2avi(qq,'espDisB','fps',100,'compression','none')