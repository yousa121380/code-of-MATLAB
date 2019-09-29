% n=input('please input a number');
% fi=[1,1];
% m=1;
% i=3;
% while (n>m)
%     m=fi(i-1)+fi(i-2);
%     fi=[fi,m];
%     i=i+1;
% end
% x=find(fi==n);
% if x~=0
%     disp('yes');
% else
%     disp('no');
% end
% n1=input('please input a number');
% i=2;
% while i<=n1
%     if mod(n1,i)==0
%         break;
%     end
%     i=i+1;
% end
% if i==n1
%     disp('yes');
% else
%     disp('no');
% end 
n=input('please input a number');
fi=[1,1];
m=1;
i=3;
while (n>m)
    m=fi(i-1)+fi(i-2);
    fi=[fi,m];
    i=i+1;
end
disp(['max is ' num2str(fi(i-1)) ' min is ' num2str(fi(i-2))])