figure(42)
clf
%mm=0;
for i=1:2323
   

%%
    Xn=frame2im(MN(i));
    image(Xn)
    axis equal
    axis off% axis equal
    %%
    %axis(
% pause(.01)
  %   movie(gcf,QN(i));
    hold on
    mk(i)=getframe(gcf);

     hold off
end
movie2avi(mk,'rename','compression','none')