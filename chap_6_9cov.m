% clear all; 
% close all;
% clc
% D = xlsread('C:\Users\lianxiang\Desktop\q1.xls');
% data=D(:,2:10);
S = cov(data);
SD = sqrt(diag(S)); R = S./(SD*SD'); % ���ϵ������
[pc1, latent1, explained1] = pcacov(S) % ��Э����������
[pc2, latent2, explained2] = pcacov(R) % �����ϵ���������
[pc3, score, latent3, tsquare] = princomp(data) % ԭ����
explained3 = latent3/sum(latent3)*100 % ������
pc = [pc1, pc2, pc3]
latent = [latent1, latent2, latent3]
explained = [explained1, explained2, explained3]
biplot(pc3(:,1:2), 'Scores', score(:,1:2), 'VarLabels',[])