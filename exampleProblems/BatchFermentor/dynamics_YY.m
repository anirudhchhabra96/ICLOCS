% This code was generated using ADiGator version 1.4
% �2010-2014 Matthew J. Weinstein and Anil V. Rao
% ADiGator may be obtained at https://sourceforge.net/projects/adigator/ 
% Contact: mweinstein@ufl.edu
% Bugs/suggestions may be reported to the sourceforge forums
%                    DISCLAIMER
% ADiGator is a general-purpose software distributed under the GNU General
% Public License version 3.0. While the software is distributed with the
% hope that it will be useful, both the software and generated code are
% provided 'AS IS' with NO WARRANTIES OF ANY KIND and no merchantability
% or fitness for any purpose or application.

function dx = dynamics_YY(x,u,p,t,vdat)
global ADiGator_dynamics_YY
if isempty(ADiGator_dynamics_YY); ADiGator_LoadData(); end
Gator1Data = ADiGator_dynamics_YY.dynamics_YY.Gator1Data;
Gator2Data = ADiGator_dynamics_YY.dynamics_YY.Gator2Data;
% ADiGator Start Derivative Computations
%User Line: % Fed-batch fermentor Dynamics
%User Line: %
%User Line: % Copyright (C) 2018 Yuanbo Nie, Omar Faqir, and Eric Kerrigan. All Rights Reserved.
%User Line: % The contribution of Paola Falugi, Eric Kerrigan and Eugene van Wyk for the work on ICLOCS Version 1 (2010) is kindly acknowledged.
%User Line: % This code is published under the BSD License.
%User Line: % Department of Aeronautics and Department of Electrical and Electronic Engineering,
%User Line: % Imperial College London London  England, UK
%User Line: % ICLOCS (Imperial College London Optimal Control) Version 2.0
%User Line: % 1 May 2018
%User Line: % iclocs@imperial.ac.uk
%User Line: %
%User Line: %------------- BEGIN CODE --------------
x1.dY = x.dY(:,1);
x1.f = x.f(:,1);
%User Line: x1 = x(:,1);
x2.dY = x.dY(:,2);
x2.f = x.f(:,2);
%User Line: x2 = x(:,2);
x3.dY = x.dY(:,3);
x3.f = x.f(:,3);
%User Line: x3 = x(:,3);
x4.dY = x.dY(:,4);
x4.f = x.f(:,4);
%User Line: x4 = x(:,4);
u1.dY = u.dY(:,1);
u1.f = u.f(:,1);
%User Line: u1 = u(:,1);
cada1f1dY = 0.006*x1.dY;
cada1f1 = 0.006*x1.f;
cada2f1 = size(cada1f1dY,1);
cada1td1 = zeros(cada2f1,2);
cada1td1(:,1) = cada1f1dY;
cada2f1 = cada1td1(:,2);
cada2f2 = cada2f1 + x3.dY;
cada1td1(:,2) = cada2f2;
cada1f2dY = cada1td1;
cada1f2 = cada1f1 + x3.f;
cada2f1 = size(x3.dY,1);
cada1td1 = zeros(cada2f1,2);
cada2tf1 = x3.dY(:,Gator2Data.Index1);
cada2tf2 = cada1f2(:,Gator2Data.Index2);
cada2f1dY = -cada2tf1./cada2tf2.^2.*cada1f2dY;
cada2f1 = x3.dY./cada1f2;
cada1td1dY = cada2f1dY;
cada1td1(:,2) = cada2f1;
cada1tf1dY = x3.dY(:,Gator2Data.Index3);
cada1tf1 = x3.f(:,Gator1Data.Index1);
cada1tf2dY = cada1f2dY(:,Gator2Data.Index4);
cada1tf2 = cada1f2(:,Gator1Data.Index2);
cada2f1dY = -cada1tf1dY;
cada2f1 = uminus(cada1tf1);
cada2tf2 = cada1tf2(:,Gator2Data.Index5);
cada2f2dY = 2.*cada2tf2.^(2-1).*cada1tf2dY;
cada2f2 = cada1tf2.^2;
cada2td1 = zeros(size(cada2f1dY,1),4);
cada2td1(:,Gator2Data.Index6) = cada2f1dY./cada2f2;
cada2tf1 = cada2f1(:,Gator2Data.Index7);
cada2tf2 = cada2f2(:,Gator2Data.Index8);
cada2td1 = cada2td1 + -cada2tf1./cada2tf2.^2.*cada2f2dY;
cada2f3dY = cada2td1;
cada2f3 = cada2f1./cada2f2;
cada2tf1 = cada1f2dY(:,Gator2Data.Index9);
cada2f4dY = cada2tf1.*cada2f3dY;
cada2f4 = cada2f3.*cada1f2dY;
cada2td1 = zeros(size(cada1td1dY,1),4);
cada2td1(:,Gator2Data.Index10) = cada1td1dY;
cada2td1 = cada2td1 + cada2f4dY;
cada1td1dY = cada2td1;
cada1td1 = cada1td1 + cada2f4;
cada1f3dYdY = cada1td1dY; cada1f3dY = cada1td1;
cada1f3 = x3.f./cada1f2;
h1.dYdY = 0.11.*cada1f3dYdY;
h1.dY = 0.11*cada1f3dY;
h1.f = 0.11*cada1f3;
%User Line: h1 = 0.11*(x3./(0.006*x1+x3));
cada1f1dY = 10*x3.dY;
cada1f1 = 10*x3.f;
cada1f2dY = cada1f1dY;
cada1f2 = 1 + cada1f1;
cada1td1dY = x3.dY.*cada1f2dY;
cada1td1 = cada1f2.*x3.dY;
cada2f1dY = cada1f2dY.*x3.dY;
cada2f1 = x3.f.*cada1f2dY;
cada2td1 = cada1td1dY;
cada2td1 = cada2td1 + cada2f1dY;
cada1td1dY = cada2td1;
cada1td1 = cada1td1 + cada2f1;
cada1f3dYdY = cada1td1dY; cada1f3dY = cada1td1;
cada1f3 = x3.f.*cada1f2;
cada1f4dYdY = cada1f3dYdY; cada1f4dY = cada1f3dY;
cada1f4 = 0.0001 + cada1f3;
cada1td1dY = -x3.dY./cada1f4.^2.*cada1f4dY;
cada1td1 = x3.dY./cada1f4;
cada2f1dY = -x3.dY;
cada2f1 = uminus(x3.f);
cada2f2dY = 2.*cada1f4.^(2-1).*cada1f4dY;
cada2f2 = cada1f4.^2;
cada2td1 = cada2f1dY./cada2f2;
cada2td1 = cada2td1 + -cada2f1./cada2f2.^2.*cada2f2dY;
cada2f3dY = cada2td1;
cada2f3 = cada2f1./cada2f2;
cada2td1 = cada1f4dY.*cada2f3dY;
cada2td1 = cada2td1 + cada2f3.*cada1f4dYdY;
cada2f4dY = cada2td1;
cada2f4 = cada2f3.*cada1f4dY;
cada2td1 = cada1td1dY;
cada2td1 = cada2td1 + cada2f4dY;
cada1td1dY = cada2td1;
cada1td1 = cada1td1 + cada2f4;
cada1f5dYdY = cada1td1dY; cada1f5dY = cada1td1;
cada1f5 = x3.f./cada1f4;
h2.dYdY = 0.0055.*cada1f5dYdY;
h2.dY = 0.0055*cada1f5dY;
h2.f = 0.0055*cada1f5;
%User Line: h2 = 0.0055*(x3./(0.0001+x3.*(1+10*x3)));
cada1tf1dY = x1.dY(:,Gator2Data.Index11);
cada1tf1 = x1.f(:,Gator1Data.Index3);
cada2td1 = zeros(size(cada1tf1dY,1),4);
cada2td1(:,Gator2Data.Index12) = h1.dY.*cada1tf1dY;
cada2tf1 = cada1tf1(:,Gator2Data.Index13);
cada2td1 = cada2td1 + cada2tf1.*h1.dYdY;
cada1td1dY = cada2td1;
cada1td1 = cada1tf1.*h1.dY;
cada2f1dY = cada1td1dY(:,Gator2Data.Index14);
cada2f1 = cada1td1(:,1);
cada2tf1 = x1.dY(:,Gator2Data.Index15);
cada2f2dY = cada2tf1.*h1.dY;
cada2f2 = h1.f.*x1.dY;
cada2td1 = cada2f1dY;
cada2td1 = cada2td1 + cada2f2dY;
cada2f3dY = cada2td1;
cada2f3 = cada2f1 + cada2f2;
cada2td1 = zeros(size(cada1td1,1),4);
cada2td1(:,Gator2Data.Index16) = cada2f3dY;
cada2td1(:,Gator2Data.Index17) = cada1td1dY(:,Gator2Data.Index18);
cada1td1dY = cada2td1;
cada1td1(:,1) = cada2f3;
cada1f1dYdY = cada1td1dY; cada1f1dY = cada1td1;
cada1f1 = h1.f.*x1.f;
cada1f2dY = x1.dY/500;
cada1f2 = x1.f/500;
cada2f1 = size(cada1f2dY,1);
cada1td1 = zeros(cada2f1,2);
cada2f1dY = -cada1f2dY./x4.f.^2.*x4.dY;
cada2f1 = cada1f2dY./x4.f;
cada1td1dY = cada2f1dY;
cada1td1(:,1) = cada2f1;
cada2f1 = cada1td1(:,2);
cada2f2dY = -cada1f2dY;
cada2f2 = uminus(cada1f2);
cada2f3dY = 2.*x4.f.^(2-1).*x4.dY;
cada2f3 = x4.f.^2;
cada2td1 = zeros(size(cada2f2dY,1),2);
cada2td1(:,1) = cada2f2dY./cada2f3;
cada2td1(:,2) = cada2td1(:,2) + -cada2f2./cada2f3.^2.*cada2f3dY;
cada2f4dY = cada2td1;
cada2f4 = cada2f2./cada2f3;
cada2tf1 = x4.dY(:,Gator2Data.Index19);
cada2f5dY = cada2tf1.*cada2f4dY;
cada2f5 = cada2f4.*x4.dY;
cada2f6dY = cada2f5dY;
cada2f6 = cada2f1 + cada2f5;
cada2td1 = zeros(size(cada1td1,1),3);
cada2td1(:,Gator2Data.Index20) = cada2f6dY;
cada2td1(:,2) = cada1td1dY(:,1);
cada1td1dY = cada2td1;
cada1td1(:,2) = cada2f6;
cada1f3dYdY = cada1td1dY; cada1f3dY = cada1td1;
cada1f3 = cada1f2./x4.f;
cada2f1 = size(u1.dY,1);
cada1td1 = zeros(cada2f1,3);
cada2tf1 = u1.dY(:,Gator2Data.Index21);
cada2f1dY = cada2tf1.*cada1f3dY;
cada2f1 = cada1f3.*u1.dY;
cada1td1dY = cada2f1dY;
cada1td1(:,3) = cada2f1;
cada1tf1dY = u1.dY(:,Gator2Data.Index22);
cada1tf1 = u1.f(:,Gator1Data.Index4);
cada2f1 = cada1td1(:,Gator1Data.Index5);
cada2td1 = zeros(size(cada1tf1dY,1),5);
cada2td1(:,Gator2Data.Index23) = cada1f3dY.*cada1tf1dY;
cada2tf1 = cada1tf1(:,Gator2Data.Index24);
cada2td1(:,Gator2Data.Index25) = cada2td1(:,Gator2Data.Index25) + cada2tf1.*cada1f3dYdY;
cada2f2dY = cada2td1;
cada2f2 = cada1tf1.*cada1f3dY;
cada2f3dY = cada2f2dY;
cada2f3 = cada2f1 + cada2f2;
cada2td1 = zeros(size(cada1td1,1),7);
cada2td1(:,Gator2Data.Index26) = cada2f3dY;
cada2td1(:,Gator2Data.Index27) = cada1td1dY(:,Gator2Data.Index28);
cada1td1dY = cada2td1;
cada1td1(:,Gator1Data.Index5) = cada2f3;
cada1f4dYdY = cada1td1dY; cada1f4dY = cada1td1;
cada1f4 = u1.f.*cada1f3;
cada2f1 = size(cada1f1dY,1);
cada1td1 = zeros(cada2f1,4);
cada1td1dY = cada1f1dYdY;
cada1td1(:,Gator1Data.Index6) = cada1f1dY;
cada2f1dY = cada1td1dY(:,Gator2Data.Index29);
cada2f1 = cada1td1(:,Gator1Data.Index7);
cada2f2dY = -cada1f4dYdY;
cada2f2 = uminus(cada1f4dY);
cada2td1 = zeros(size(cada2f1dY,1),9);
cada2td1(:,Gator2Data.Index30) = cada2f1dY;
cada2td1(:,Gator2Data.Index31) = cada2td1(:,Gator2Data.Index31) + cada2f2dY;
cada2f3dY = cada2td1;
cada2f3 = cada2f1 + cada2f2;
cada2td1 = zeros(size(cada1td1,1),11);
cada2td1(:,Gator2Data.Index32) = cada2f3dY;
cada2td1(:,Gator2Data.Index33) = cada1td1dY(:,Gator2Data.Index34);
cada1td1dY = cada2td1;
cada1td1(:,Gator1Data.Index7) = cada2f3;
cada1f5dYdY = cada1td1dY; cada1f5dY = cada1td1;
cada1f5 = cada1f1 - cada1f4;
cada1temp1 = Gator1Data.Data1;
dx.dYdY = cada1f5dYdY; dx.dY = cada1f5dY;
dx.f = cada1temp1;
dx.f(:,1) = cada1f5;
%User Line: dx(:,1) = (h1.*x1-u1.*(x1./500./x4));
cada2f1 = size(h2.dY,1);
cada1td1 = zeros(cada2f1,2);
cada2td1 = zeros(size(x1.dY,1),2);
cada2td1(:,1) = h2.dY.*x1.dY;
cada2td1(:,2) = cada2td1(:,2) + x1.f.*h2.dYdY;
cada2f1dY = cada2td1;
cada2f1 = x1.f.*h2.dY;
cada1td1dY = cada2f1dY;
cada1td1(:,2) = cada2f1;
cada2f1 = cada1td1(:,1);
cada2f2dY = x1.dY.*h2.dY;
cada2f2 = h2.f.*x1.dY;
cada2f3dY = cada2f2dY;
cada2f3 = cada2f1 + cada2f2;
cada2td1 = zeros(size(cada1td1,1),3);
cada2td1(:,2) = cada2f3dY;
cada2td1(:,Gator2Data.Index35) = cada1td1dY(:,Gator2Data.Index36);
cada1td1dY = cada2td1;
cada1td1(:,1) = cada2f3;
cada1f1dYdY = cada1td1dY; cada1f1dY = cada1td1;
cada1f1 = h2.f.*x1.f;
cada1f2dY = 0.01*x2.dY;
cada1f2 = 0.01*x2.f;
cada2f1 = size(cada1f1dY,1);
cada1td1 = zeros(cada2f1,3);
cada1td1dY = cada1f1dYdY;
cada1td1(:,Gator1Data.Index8) = cada1f1dY;
cada2f1 = cada1td1(:,2);
cada2f2 = uminus(cada1f2dY);
cada2f3 = cada2f1 + cada2f2;
cada1td1(:,2) = cada2f3;
cada1f3dYdY = cada1td1dY; cada1f3dY = cada1td1;
cada1f3 = cada1f1 - cada1f2;
cada1f4dY = x2.dY/500;
cada1f4 = x2.f/500;
cada2f1 = size(cada1f4dY,1);
cada1td1 = zeros(cada2f1,2);
cada2f1dY = -cada1f4dY./x4.f.^2.*x4.dY;
cada2f1 = cada1f4dY./x4.f;
cada1td1dY = cada2f1dY;
cada1td1(:,1) = cada2f1;
cada2f1 = cada1td1(:,2);
cada2f2dY = -cada1f4dY;
cada2f2 = uminus(cada1f4);
cada2f3dY = 2.*x4.f.^(2-1).*x4.dY;
cada2f3 = x4.f.^2;
cada2td1 = zeros(size(cada2f2dY,1),2);
cada2td1(:,1) = cada2f2dY./cada2f3;
cada2td1(:,2) = cada2td1(:,2) + -cada2f2./cada2f3.^2.*cada2f3dY;
cada2f4dY = cada2td1;
cada2f4 = cada2f2./cada2f3;
cada2tf1 = x4.dY(:,Gator2Data.Index37);
cada2f5dY = cada2tf1.*cada2f4dY;
cada2f5 = cada2f4.*x4.dY;
cada2f6dY = cada2f5dY;
cada2f6 = cada2f1 + cada2f5;
cada2td1 = zeros(size(cada1td1,1),3);
cada2td1(:,Gator2Data.Index38) = cada2f6dY;
cada2td1(:,2) = cada1td1dY(:,1);
cada1td1dY = cada2td1;
cada1td1(:,2) = cada2f6;
cada1f5dYdY = cada1td1dY; cada1f5dY = cada1td1;
cada1f5 = cada1f4./x4.f;
cada2f1 = size(u1.dY,1);
cada1td1 = zeros(cada2f1,3);
cada2tf1 = u1.dY(:,Gator2Data.Index39);
cada2f1dY = cada2tf1.*cada1f5dY;
cada2f1 = cada1f5.*u1.dY;
cada1td1dY = cada2f1dY;
cada1td1(:,3) = cada2f1;
cada1tf1dY = u1.dY(:,Gator2Data.Index40);
cada1tf1 = u1.f(:,Gator1Data.Index9);
cada2f1 = cada1td1(:,Gator1Data.Index10);
cada2td1 = zeros(size(cada1tf1dY,1),5);
cada2td1(:,Gator2Data.Index41) = cada1f5dY.*cada1tf1dY;
cada2tf1 = cada1tf1(:,Gator2Data.Index42);
cada2td1(:,Gator2Data.Index43) = cada2td1(:,Gator2Data.Index43) + cada2tf1.*cada1f5dYdY;
cada2f2dY = cada2td1;
cada2f2 = cada1tf1.*cada1f5dY;
cada2f3dY = cada2f2dY;
cada2f3 = cada2f1 + cada2f2;
cada2td1 = zeros(size(cada1td1,1),7);
cada2td1(:,Gator2Data.Index44) = cada2f3dY;
cada2td1(:,Gator2Data.Index45) = cada1td1dY(:,Gator2Data.Index46);
cada1td1dY = cada2td1;
cada1td1(:,Gator1Data.Index10) = cada2f3;
cada1f6dYdY = cada1td1dY; cada1f6dY = cada1td1;
cada1f6 = u1.f.*cada1f5;
cada2f1 = size(cada1f3dY,1);
cada1td1 = zeros(cada2f1,5);
cada1td1dY = cada1f3dYdY;
cada1td1(:,Gator1Data.Index11) = cada1f3dY;
cada2f1 = cada1td1(:,Gator1Data.Index12);
cada2f2dY = -cada1f6dYdY;
cada2f2 = uminus(cada1f6dY);
cada2f3dY = cada2f2dY;
cada2f3 = cada2f1 + cada2f2;
cada2td1 = zeros(size(cada1td1,1),10);
cada2td1(:,Gator2Data.Index47) = cada2f3dY;
cada2td1(:,Gator2Data.Index48) = cada1td1dY(:,Gator2Data.Index49);
cada1td1dY = cada2td1;
cada1td1(:,Gator1Data.Index12) = cada2f3;
cada1f7dYdY = cada1td1dY; cada1f7dY = cada1td1;
cada1f7 = cada1f3 - cada1f6;
cada2f1 = size(dx.f,1);
cada1td1 = zeros(cada2f1,9);
cada1td1dY = cada1f7dYdY;
cada1td1(:,Gator1Data.Index13) = cada1f7dY;
cada2f1dY = dx.dYdY(:,Gator2Data.Index50);
cada2f1 = dx.dY(:,Gator1Data.Index15);
cada2td1 = zeros(size(cada1td1,1),21);
cada2td1(:,Gator2Data.Index51) = cada2f1dY;
cada2td1(:,Gator2Data.Index52) = cada1td1dY(:,Gator2Data.Index53);
cada1td1dY = cada2td1;
cada1td1(:,Gator1Data.Index14) = cada2f1;
dx.dYdY = cada1td1dY; dx.dY = cada1td1;
dx.f(:,2) = cada1f7;
%User Line: dx(:,2) = (h2.*x1-0.01*x2-u1.*(x2./500./x4));
cada1f1dYdY = -h1.dYdY;
cada1f1dY = uminus(h1.dY);
cada1f1 = uminus(h1.f);
cada1tf1dY = x1.dY(:,Gator2Data.Index54);
cada1tf1 = x1.f(:,Gator1Data.Index16);
cada2td1 = zeros(size(cada1tf1dY,1),4);
cada2td1(:,Gator2Data.Index55) = cada1f1dY.*cada1tf1dY;
cada2tf1 = cada1tf1(:,Gator2Data.Index56);
cada2td1 = cada2td1 + cada2tf1.*cada1f1dYdY;
cada1td1dY = cada2td1;
cada1td1 = cada1tf1.*cada1f1dY;
cada2f1dY = cada1td1dY(:,Gator2Data.Index57);
cada2f1 = cada1td1(:,1);
cada2tf1 = x1.dY(:,Gator2Data.Index58);
cada2f2dY = cada2tf1.*cada1f1dY;
cada2f2 = cada1f1.*x1.dY;
cada2td1 = cada2f1dY;
cada2td1 = cada2td1 + cada2f2dY;
cada2f3dY = cada2td1;
cada2f3 = cada2f1 + cada2f2;
cada2td1 = zeros(size(cada1td1,1),4);
cada2td1(:,Gator2Data.Index59) = cada2f3dY;
cada2td1(:,Gator2Data.Index60) = cada1td1dY(:,Gator2Data.Index61);
cada1td1dY = cada2td1;
cada1td1(:,1) = cada2f3;
cada1f2dYdY = cada1td1dY; cada1f2dY = cada1td1;
cada1f2 = cada1f1.*x1.f;
cada1f3dYdY = cada1f2dYdY./0.47;
cada1f3dY = cada1f2dY/0.47;
cada1f3 = cada1f2/0.47;
cada2f1 = size(h2.dY,1);
cada1td1 = zeros(cada2f1,2);
cada2td1 = zeros(size(x1.dY,1),2);
cada2td1(:,1) = h2.dY.*x1.dY;
cada2td1(:,2) = cada2td1(:,2) + x1.f.*h2.dYdY;
cada2f1dY = cada2td1;
cada2f1 = x1.f.*h2.dY;
cada1td1dY = cada2f1dY;
cada1td1(:,2) = cada2f1;
cada2f1 = cada1td1(:,1);
cada2f2dY = x1.dY.*h2.dY;
cada2f2 = h2.f.*x1.dY;
cada2f3dY = cada2f2dY;
cada2f3 = cada2f1 + cada2f2;
cada2td1 = zeros(size(cada1td1,1),3);
cada2td1(:,2) = cada2f3dY;
cada2td1(:,Gator2Data.Index62) = cada1td1dY(:,Gator2Data.Index63);
cada1td1dY = cada2td1;
cada1td1(:,1) = cada2f3;
cada1f4dYdY = cada1td1dY; cada1f4dY = cada1td1;
cada1f4 = h2.f.*x1.f;
cada1f5dYdY = cada1f4dYdY./1.2;
cada1f5dY = cada1f4dY/1.2;
cada1f5 = cada1f4/1.2;
cada1td1dY = cada1f3dYdY; cada1td1 = cada1f3dY;
cada2f1dY = -cada1f5dYdY;
cada2f1 = uminus(cada1f5dY);
cada2td1 = cada1td1dY;
cada2td1(:,Gator2Data.Index64) = cada2td1(:,Gator2Data.Index64) + cada2f1dY;
cada1td1dY = cada2td1;
cada1td1 = cada1td1 + cada2f1;
cada1f6dYdY = cada1td1dY; cada1f6dY = cada1td1;
cada1f6 = cada1f3 - cada1f5;
cada1f7dY = 0.029*x3.dY;
cada1f7 = 0.029*x3.f;
cada1f8dY = x3.dY;
cada1f8 = 0.0001 + x3.f;
cada1td1dY = -cada1f7dY./cada1f8.^2.*cada1f8dY;
cada1td1 = cada1f7dY./cada1f8;
cada2f1dY = -cada1f7dY;
cada2f1 = uminus(cada1f7);
cada2f2dY = 2.*cada1f8.^(2-1).*cada1f8dY;
cada2f2 = cada1f8.^2;
cada2td1 = cada2f1dY./cada2f2;
cada2td1 = cada2td1 + -cada2f1./cada2f2.^2.*cada2f2dY;
cada2f3dY = cada2td1;
cada2f3 = cada2f1./cada2f2;
cada2f4dY = cada1f8dY.*cada2f3dY;
cada2f4 = cada2f3.*cada1f8dY;
cada2td1 = cada1td1dY;
cada2td1 = cada2td1 + cada2f4dY;
cada1td1dY = cada2td1;
cada1td1 = cada1td1 + cada2f4;
cada1f9dYdY = cada1td1dY; cada1f9dY = cada1td1;
cada1f9 = cada1f7./cada1f8;
cada2f1 = size(x1.dY,1);
cada1td1 = zeros(cada2f1,2);
cada2f1dY = x1.dY.*cada1f9dY;
cada2f1 = cada1f9.*x1.dY;
cada1td1dY = cada2f1dY;
cada1td1(:,1) = cada2f1;
cada2f1 = cada1td1(:,2);
cada2td1 = zeros(size(x1.dY,1),2);
cada2td1(:,1) = cada1f9dY.*x1.dY;
cada2td1(:,2) = cada2td1(:,2) + x1.f.*cada1f9dYdY;
cada2f2dY = cada2td1;
cada2f2 = x1.f.*cada1f9dY;
cada2f3dY = cada2f2dY;
cada2f3 = cada2f1 + cada2f2;
cada2td1 = zeros(size(cada1td1,1),3);
cada2td1(:,Gator2Data.Index65) = cada2f3dY;
cada2td1(:,2) = cada1td1dY(:,1);
cada1td1dY = cada2td1;
cada1td1(:,2) = cada2f3;
cada1f10dYdY = cada1td1dY; cada1f10dY = cada1td1;
cada1f10 = x1.f.*cada1f9;
cada1td1dY = cada1f6dYdY; cada1td1 = cada1f6dY;
cada2f1dY = -cada1f10dYdY;
cada2f1 = uminus(cada1f10dY);
cada2td1 = cada1td1dY;
cada2td1(:,Gator2Data.Index66) = cada2td1(:,Gator2Data.Index66) + cada2f1dY;
cada1td1dY = cada2td1;
cada1td1 = cada1td1 + cada2f1;
cada1f11dYdY = cada1td1dY; cada1f11dY = cada1td1;
cada1f11 = cada1f6 - cada1f10;
cada2f1 = size(u1.dY,1);
cada1td1 = zeros(cada2f1,2);
cada2f1dY = -u1.dY./x4.f.^2.*x4.dY;
cada2f1 = u1.dY./x4.f;
cada1td1dY = cada2f1dY;
cada1td1(:,2) = cada2f1;
cada2f1 = cada1td1(:,1);
cada2f2dY = -u1.dY;
cada2f2 = uminus(u1.f);
cada2f3dY = 2.*x4.f.^(2-1).*x4.dY;
cada2f3 = x4.f.^2;
cada2td1 = zeros(size(cada2f2dY,1),2);
cada2td1(:,2) = cada2f2dY./cada2f3;
cada2td1(:,1) = cada2td1(:,1) + -cada2f2./cada2f3.^2.*cada2f3dY;
cada2f4dY = cada2td1;
cada2f4 = cada2f2./cada2f3;
cada2tf1 = x4.dY(:,Gator2Data.Index67);
cada2f5dY = cada2tf1.*cada2f4dY;
cada2f5 = cada2f4.*x4.dY;
cada2f6dY = cada2f5dY;
cada2f6 = cada2f1 + cada2f5;
cada2td1 = zeros(size(cada1td1,1),3);
cada2td1(:,Gator2Data.Index68) = cada2f6dY;
cada2td1(:,2) = cada1td1dY(:,1);
cada1td1dY = cada2td1;
cada1td1(:,1) = cada2f6;
cada1f12dYdY = cada1td1dY; cada1f12dY = cada1td1;
cada1f12 = u1.f./x4.f;
cada1f13dY = x3.dY/500;
cada1f13 = x3.f/500;
cada1f14dY = uminus(cada1f13dY);
cada1f14 = 1 - cada1f13;
cada1tf1dY = cada1f14dY(:,Gator2Data.Index69);
cada1tf1 = cada1f14(:,Gator1Data.Index17);
cada2f1 = size(cada1f12dY,1);
cada1td1 = zeros(cada2f1,3);
cada2td1 = zeros(size(cada1tf1dY,1),5);
cada2td1(:,Gator2Data.Index70) = cada1f12dY.*cada1tf1dY;
cada2tf1 = cada1tf1(:,Gator2Data.Index71);
cada2td1(:,Gator2Data.Index72) = cada2td1(:,Gator2Data.Index72) + cada2tf1.*cada1f12dYdY;
cada2f1dY = cada2td1;
cada2f1 = cada1tf1.*cada1f12dY;
cada1td1dY = cada2f1dY;
cada1td1(:,Gator1Data.Index18) = cada2f1;
cada2f1 = cada1td1(:,1);
cada2tf1 = cada1f14dY(:,Gator2Data.Index73);
cada2f2dY = cada2tf1.*cada1f12dY;
cada2f2 = cada1f12.*cada1f14dY;
cada2f3dY = cada2f2dY;
cada2f3 = cada2f1 + cada2f2;
cada2td1 = zeros(size(cada1td1,1),7);
cada2td1(:,Gator2Data.Index74) = cada2f3dY;
cada2td1(:,Gator2Data.Index75) = cada1td1dY(:,Gator2Data.Index76);
cada1td1dY = cada2td1;
cada1td1(:,1) = cada2f3;
cada1f15dYdY = cada1td1dY; cada1f15dY = cada1td1;
cada1f15 = cada1f12.*cada1f14;
cada2f1 = size(cada1f11dY,1);
cada1td1 = zeros(cada2f1,4);
cada1td1dY = cada1f11dYdY;
cada1td1(:,Gator1Data.Index19) = cada1f11dY;
cada2f1dY = cada1td1dY(:,Gator2Data.Index77);
cada2f1 = cada1td1(:,Gator1Data.Index20);
cada2td1 = zeros(size(cada2f1dY,1),9);
cada2td1(:,Gator2Data.Index78) = cada2f1dY;
cada2td1(:,Gator2Data.Index79) = cada2td1(:,Gator2Data.Index79) + cada1f15dYdY;
cada2f2dY = cada2td1;
cada2f2 = cada2f1 + cada1f15dY;
cada2td1 = zeros(size(cada1td1,1),11);
cada2td1(:,Gator2Data.Index80) = cada2f2dY;
cada2td1(:,Gator2Data.Index81) = cada1td1dY(:,Gator2Data.Index82);
cada1td1dY = cada2td1;
cada1td1(:,Gator1Data.Index20) = cada2f2;
cada1f16dYdY = cada1td1dY; cada1f16dY = cada1td1;
cada1f16 = cada1f11 + cada1f15;
cada2f1 = size(dx.f,1);
cada1td1 = zeros(cada2f1,13);
cada1td1dY = cada1f16dYdY;
cada1td1(:,Gator1Data.Index21) = cada1f16dY;
cada2f1dY = dx.dYdY(:,Gator2Data.Index83);
cada2f1 = dx.dY(:,Gator1Data.Index23);
cada2td1 = zeros(size(cada1td1,1),32);
cada2td1(:,Gator2Data.Index84) = cada2f1dY;
cada2td1(:,Gator2Data.Index85) = cada1td1dY(:,Gator2Data.Index86);
cada1td1dY = cada2td1;
cada1td1(:,Gator1Data.Index22) = cada2f1;
dx.dYdY = cada1td1dY; dx.dY = cada1td1;
dx.f(:,3) = cada1f16;
%User Line: dx(:,3) = (-h1.*x1/0.47-h2.*x1/1.2-x1.*(0.029*x3./(0.0001+x3))+u1./x4.*(1-x3/500));
cada1f1dY = u1.dY/500;
cada1f1 = u1.f/500;
cada2f1 = size(dx.f,1);
cada1td1 = zeros(cada2f1,14);
cada1td1(:,14) = cada1f1dY;
cada2f1dY = dx.dYdY(:,Gator2Data.Index87);
cada2f1 = dx.dY(:,Gator1Data.Index25);
cada1td1dY = cada2f1dY;
cada1td1(:,Gator1Data.Index24) = cada2f1;
dx.dYdY = cada1td1dY; dx.dY = cada1td1;
dx.f(:,4) = cada1f1;
%User Line: dx(:,4) = u1/500;
%User Line: %------------- END OF CODE --------------
dx.dY_size = [4 5];
dx.dY_location = Gator1Data.Index26;
dx.dYdY_size = [dx.dY_size,5];
dx.dYdY_location = [dx.dY_location(Gator2Data.Index88,:), Gator2Data.Index89];
end


function ADiGator_LoadData()
global ADiGator_dynamics_YY
ADiGator_dynamics_YY = load('dynamics_YY.mat');
return
end