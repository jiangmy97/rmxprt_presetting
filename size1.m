% Motor's general size parameters setting for Ansys Maxwell 1
% Created by Jiang Nicholas M.Y.
% ===================================================================
clear all
clc
% ===================================================================
% Basic constants:
pi=3.1415;
% ===================================================================
% Inputs:    
%       P(kW)   = Rated Power
%       m       = Phases
%       p       = Pairs of poles
%       z       = Number of slots
%       n(rpm)  = Rated speed
%       U_l(V)  = Rated Voltage(line)
%       K_T     = Torque density component (10-20, bigger the better)
%       lambda  = Size ratio
P=;
m=3;
p=;
z=;
n=;
U_l=;
K_T=;
lambda=;
% ===================================================================
omega=2*pi*n/60;
T=P/omega;
D2L=T/K_T/(pi/4)*1000;
D=ceil(((2*p*D2L)/(lambda*pi))^(1/3)*100)
L=ceil(lambda*pi*D/2/p)