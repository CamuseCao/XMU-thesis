clc; close all; clear all;
[X,Y]=meshgrid(-8:0.3:8);
R=sqrt(X.^2+Y.^2)+eps; 
Z=sin(R)./R 
surf(X,Y,Z); 
colormap; colorbar; 
xlabel('X Axis'); 
ylabel('Y Axis'); 
zlabel('Y Axis');