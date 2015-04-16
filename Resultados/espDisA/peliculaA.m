N = 2200;
qq = struct('cdata',[],'colormap',[]);

for ty=1:N
 clear {fi u}
    
    load(['iter' num2str(ty)])

    figure(1)
    clf
    hold on
    plot(u(25,:),'r')
    plot(fi(25,:))
    axis square
    %axis([0 50 -1 1])
    grid on
    hold off
    qq(ty)=getframe(gcf);
    disp(ty)
end

movie2avi(qq,'espDisA','fps',100,'compression','none')