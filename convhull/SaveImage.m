function [  ] = SaveImage( H, width, height, filename )
%SAVEIMAGE save an image specified by figure handle H using print command

set(H,'PaperPositionMode','auto')
pos=get(H,'Position');
pos(3)=0; 
pos(4)=0;
set(gcf,'Position',pos);
print('-r0','-dpng', filename);

end