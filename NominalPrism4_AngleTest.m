clear; clc; clf;

C1=connectivity(0,6,8);
C2=connectivity(1,7,8);
C3=connectivity(2,4,8);
C4=connectivity(3,5,8);
C5=connectivity(0,2,8);
C6=connectivity(1,3,8);
C7=connectivity(0,5,8);
C8=connectivity(1,4,8);
C9=connectivity(1,6,8);
C10=connectivity(2,5,8);
C11=connectivity(2,7,8);
C12=connectivity(3,6,8);
C13=connectivity(0,7,8);
C14=connectivity(3,4,8);
C15=connectivity(5,7,8);
C16=connectivity(4,6,8);
C17=connectivity(0,1,8);
C18=connectivity(1,2,8);
C19=connectivity(2,3,8);
C20=connectivity(3,0,8);
C21=connectivity(0,4,8);
C22=connectivity(1,5,8);
C23=connectivity(2,6,8);
C24=connectivity(3,7,8);
C25=connectivity(4,5,8);
C26=connectivity(5,6,8);
C27=connectivity(6,7,8);
C28=connectivity(7,4,8);

C=[C1;C2;C3;C4;C5;C6;C7;C8;C9;C10;C11;C12;C13;C14;C15;C16;C17;C18;C19;C20;C21;C22;C23;C24;C25;C26;C27;C28];

b = 4;
s = 24;
q = 8;
p = 0;
dim = 3;
U = zeros(dim,q);
U(:,1) = [0; 10; 0];
U(:,2) = [0; 10; 0];
U(:,3) = [0; 10; 0];
U(:,4) = [0; 10; 0];
U(:,5) = [0; -10; 0];
U(:,6) = [0; -10; 0];
U(:,7) = [0; -10; 0];
U(:,8) = [0; -10; 0];

x = 0:180;
c_max = zeros(size(x));
t_max = zeros(size(x));
t_min = zeros(size(x));
for iter=1:length(x)
    theta = x(iter) * (pi/180);
    R = [cos(theta), 0, -sin(theta); 0, 1, 0; sin(theta), 0, cos(theta)];

    n0=[-1,0,-1];
    n1=[-1,0,1];
    n2=[1,0,1];
    n3=[1,0,-1];
    n4= [-1,2,-1] * R;
    n5= [-1,2,1] * R;
    n6= [1,2,1] * R;
    n7= [1,2,-1] * R;
    N=[n0;n1;n2;n3;n4;n5;n6;n7];
    
    Q=N';
    P=[];

    % Solve for the forces at equilibrium, and plot
    [c_bars,t_strings,V]=tensegrity_statics(b,s,q,p,dim,Q,P,C,U);
    
    c_max(iter) = max(abs(c_bars));
    t_max(iter) = max(t_strings);
    t_min(iter) = min(t_strings);
end

figure(1);
plot(x, c_max)

figure(2);
plot(x, t_max);

figure(3);
plot(x, t_min);