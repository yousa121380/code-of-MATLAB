clear all; close all; clc
x = [143 145 146 147 149 150 153 154 155 156 157 158 159 160 162 164];
X = [ones(length(x),1), x(:)]; % ��������
Y = [88 85 88 91 92 93 93 95 96 98 97 96 98 99 100 102]';
[b, bint, r, rint, stats] = regress(Y, X, 0.05) % �ع����������
figure; rcoplot(r, rint) % �в���������в�ͼ
z = b(1)+b(2)*x % Ԥ��
figure; plot(x, Y, 'k+', x, z, 'r') % ��ͼ