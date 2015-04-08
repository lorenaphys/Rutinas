clear all

for ty=1:220
 clear {fi u}
    
    load(['iter' num2str(ty)])

figure(1)
clf
hold on
plot(u(25,:),'r')
plot(fi(25,:))
axis square
grid on
hold off
q=getframe;
qq(ty)=q;
end


figure(42)
clf
mm=0;
for i=1:22
   

%%
    Xn=frame2im(qq(i));
    image(Xn)
    axis equal
    axis off% axis equal
 
     mk(i)=getframe(gcf);
     %hold off
    
end
movie2avi(mk,'espDisA','compression','none')