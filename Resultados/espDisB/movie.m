clear all

N = 2200;

for ty=1:N
 clear {fi u}
    
    load(['iter' num2str(ty)])

    clf
    hold on
    plot(u(25,:),'r')
    plot(fi(25,:))
    axis square
    grid on
    hold off
    qq(ty)=getframe;
    disp(ty)
end

for i = 1:N
    Xn = frame2im(qq(i));
    mk(i) = getframe(gcf);
end

movie2avi(mk,'espDisB','compression','none')