clear all;
close all;
%% direct to folder contain data demo 
cd ('D:\My Library\Project\Micro\Matlab\data demo');
% create PEF data
a=[];
b=[];
c=[];
d=[];
e=[];
for i=1:3
    a(i)=randi(1000,1,1);
if a(i)<1000
    b(i)=randi(1000-a(i),1,1);
    else b(i)=0;
    c(i)=0;
    d(i)=0;
    e(i)=0;
end
if b(i)<1000-a(i)
    c(i)=randi(1000-a(i)-b(i),1,1);
    else c(i)=0;
    d(i)=0;
    e(i)=0;
end
if c(i)<1000-a(i)-b(i)
    d(i)=randi(1000-a(i)-b(i)-c(i),1,1);
    else  d(i)=0;
    e(i)=0;
end
if d(i)<1000-a(i)-b(i)-c(i)
    e(i)=1000-a(i)-b(i)-c(i)-d(i);
    else e(i)=0;
end
end
% PEF=[ones(a(1),1)*100;randi([75 100],b(1),1); randi([51 74],c(1),1);randi([33 50],d(1),1);randi([1 33],e(1),1)];
% SPO2=[ones(a(2),1)*100;randi([93 100],b(2),1); randi([93 100],c(2),1);randi([93 100],d(2),1);randi([1 92],e(2),1)];
% HR=[ones(a(3),1)*80;randi([60 100],b(3),1); randi([60 100],c(3),1); randi([110 160],d(3),1);randi([1 60],e(3),1)];
PEF=ones(1000,1)*40;
SPO2=ones(1000,1)*100;
HR=ones(1000,1)*120;
T=table(PEF,SPO2,HR);
f=dir('demo-micro-test-*');
num=0;
if length(f)~=0
   l=length(f);
   so1=fix(l/10);
   so2=mod(l,10);
   if so1 ~=0
   select=length(1:so1)+length(0:so2)+(so1-1)*10;
   else
       select=l;
   end
   an=f(select); % the newest file name
   an=an.name;
   n=double(an); % change to ASCII
   change=n(16+1:end);
   ind=change(find(change>=48 & change<=57));
   num=char(ind);
   num=str2num(num);
end
num=num+1;
namef=['demo-micro-test-',num2str(num),'.txt'];
writetable(T,namef);

   




