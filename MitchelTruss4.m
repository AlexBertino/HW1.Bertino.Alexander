clear; clf; figure(1);

a=sin(pi()/6)/sin((pi()/6)+pi()/16);
phi=pi()/16;
r0=1;
r1=a*r0;
r2=a*r1;
r3=a*r2;
r4=a*r3;

n0=[1,0];
n1=[r1*cos(phi),r1*sin(phi)];
n2=[r1*cos(phi),-r1*sin(phi)];
n3=[r2*cos(2*phi),r2*sin(2*phi)];
n4=[r2,0];
n5=[r2*cos(2*phi),-r2*sin(2*phi)];
n6=[r3*cos(3*phi),r3*sin(3*phi)];
n7=[r3*cos(phi),r3*sin(phi)];
n8=[r3*cos(phi),-r3*sin(phi)];
n9=[r3*cos(3*phi),-r3*sin(3*phi)];
n10=[r4*cos(4*phi),r4*sin(4*phi)];
n11=[r4*cos(2*phi),r4*sin(2*phi)];
n12=[r4,0];
n13=[r4*cos(2*phi),-r4*sin(2*phi)];
n14=[r4*cos(4*phi),-r4*sin(4*phi)];
N=[n0;n1;n2;n3;n4;n5;n6;n7;n8;n9;n10;n11;n12;n13;n14];

C1=connectivity(1,0,15);
C2=connectivity(2,0,15);
C3=connectivity(3,1,15);
C4=connectivity(4,1,15);
C5=connectivity(4,2,15);
C6=connectivity(5,2,15);
C7=connectivity(6,3,15);
C8=connectivity(7,3,15);
C9=connectivity(7,4,15);
C10=connectivity(8,4,15);
C11=connectivity(8,5,15);
C12=connectivity(9,5,15);
C13=connectivity(10,6,15);
C14=connectivity(11,6,15);
C15=connectivity(11,7,15);
C16=connectivity(12,7,15);
C17=connectivity(12,8,15);
C18=connectivity(13,8,15);
C19=connectivity(13,9,15);
C20=connectivity(14,9,15);

C=[C1;C2;C3;C4;C5;C6;C7;C8;C9;C10;C11;C12;C13;C14;C15;C16;C17;C18;C19;C20];
Q=N(1:10,:)';
P=N(11:15,:)';

b = 20;
s = 0;
q = 10;
p = 5;
dim = 2;
U = zeros(2,q);
U(:,1) = [0; -10];

% Solve for the forces at equilibrium, and plot
[c_bars,t_strings,V]=tensegrity_statics(b,s,q,p,dim,Q,P,C,U);
tensegrity_plot(Q,P,C,b,s,U,V,true,2.0); grid on;
