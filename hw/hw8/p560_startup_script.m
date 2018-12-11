clear all
clc;

%define the robotics toolbox Puma 560 arm
mdl_puma560;

%set the Coulomb friction terms to zero to help with numerical simulation
p560 = p560.nofriction;

%load the torque profile and open the simulink model
traj = gen_traj()
load puma560_torque_profile.mat
Kp = eye(6)
Kd = -eye(6)
%open sl_puma_hw5
