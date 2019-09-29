% clear all; 
% close all;
% clc
% D = xlsread('C:\Users\lianxiang\Desktop\q1.xls');
% data=D(:,2:10);
S = cov(data);
SD = sqrt(diag(S)); R = S./(SD*SD'); % 相关系数矩阵
[pc1, latent1, explained1] = pcacov(S) % 对协方差矩阵分析
[pc2, latent2, explained2] = pcacov(R) % 对相关系数矩阵分析
[pc3, score, latent3, tsquare] = princomp(data) % 原数据
explained3 = latent3/sum(latent3)*100 % 贡献率
pc = [pc1, pc2, pc3]
latent = [latent1, latent2, latent3]
explained = [explained1, explained2, explained3]
biplot(pc3(:,1:2), 'Scores', score(:,1:2), 'VarLabels',[])