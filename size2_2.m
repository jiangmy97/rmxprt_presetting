% Motor's general size parameters setting for Ansys Maxwell 2
% Created by Jiang Nicholas M.Y.

% ===================================================================
% ATTENTION:    RUN size1.m FIRST!
%               Use the D, L calculated in size1.m to set inputs below.
% ===================================================================

% Inputs:
%       D_so(mm)            = Outer Diameter of Stator 
%       D_si(mm)            = Inner Diameter of Stator 
%       delta(mm)           = Width of air gap
%       D_ri(mm)            = Inner Diameter of Rotor 
%       L(mm)               = Length of motor
%       PF                  = Power factor
%       delta_J(A/mm^2)     = Armature Current Density 
%       D_w(mm)             = Wire Diameter 
%       B_delta             = Pre-set flux density in the air gap
%       k                   = Adjusting component

D_so=;
delta=;
L=;
PF=0.95;
delta_J=5;
D_w=1;
B_delta=0.9;
k=1.1;
% ===================================================================
U_p=U_l/sqrt(3);
I_p=P*1000/(m*U_p*PF);
S_w=pi/4*D_w^2;
wires_per_conductor=ceil(I_p/delta_J/S_w);
D_si=0.65*D_so;
D_ro=D_si-2*delta;
flag=0;
while 1
N=U_p/(B_delta*L/1000*omega*D_si/2/1000);
z1=z/m;
N_1p=ceil(N/z1*1.25);
S_w1=wires_per_conductor*N_1p*((D_w+0.05*2)/2)^2/0.75;
t=pi*D_si/z;
b_t=(B_delta*0.95*(L+2*delta)/(1.5*L))*t*k;
b_cp=t-b_t;
h_cp=S_w1/b_cp;
b_m=pi*D_ro/z*0.7;
h_j=ceil((B_delta*b_m)/(2*1.5*1.125*0.95));
if (D_si<0.5*D_so)
    disp('ERROR')
    flag=1;
    break
end
if ((4+h_cp+h_j)>(D_so-D_si)/2*0.85)
    D_si=D_si-2;
else
    break
end

end

if (flag==0)
    D_so
    D_si=ceil(D_si)
    D_ro=D_si-delta*2
    D_ri=ceil(D_ro*0.6)
    L
    h_cp=ceil(S_w1/b_cp)
    b_t
    wires_per_conductor
    N_1p

end
