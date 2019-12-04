function [tout,yout]=Balloon(ti,vi,zi,tf,dt,varargin)
% balloon
% function [tout,yout]=Balloon(ti,vi,zi,tf,dt,FB,FG,mG,cdp,mP,md,zd);
% Function to generate solutions of vertical velocity and elevation
% versus time with Eulers method to compute output
t = ti; y = [vi zi];
tout = t; yout = y;
while(1)
 if t + dt > tf, dt = tf - t; end
 dy=dydt(y,varargin{:});
 y = y + dy' * dt;
 t = t + dt;
 tout = [tout; t]; yout = [yout; y];
 if t >= tf, break, end
end
end
