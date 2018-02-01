function [xl, xu ,xm ,w1 ,w2 ,w3,z]=norma(aaz)
%�ú����Ĺ����ǽ�������Ԥ������˹��׼��
%���룺
%     �账�������
%�����
%     xl���ɷ�λ�����õ��ı��������Чֵ
%     xu���ɷ�λ�����õ��ı��������Чֵ
%     xm�����ñ���δ��⵽ֵ������imputation�������Ը�ֵ���
%     w1��w2��w3��Ϊ�����ݽ��б�׼����Ҫ��Ȩֵϵ��
%��ȡ���ݣ�����Чֵ����
x=aaz;
x(x==0)=[]; 
xx=sort(x);
dxx=find(xx>0);
daxx=min(dxx);
xx=xx(daxx:length(xx));
%xx=log10(xx);
%���÷�λ�����õ���Ч�Ĳ�����Χ
N=length(xx);
for ii=1:N
    q(ii)=(ii-0.5)/N;
end
il=min(find(q>0.01));
iu=max(find(q<0.99));
xl=xx(il);
xu=xx(iu);
%���ݹ�ʽ�õ���׼����Ȩֵ
zhongx=xx(il:iu);
lzhongx=length(zhongx);
qii=q(il:iu);
for ix=1:N
    R(ix,1:3)=[1 xx(ix) log(1+xx(ix))];
end
miu=0;
sigma=1;
qcdf=normcdf(q,miu,sigma);
y=1./(3.*qcdf);
RT=R';
yT=y';
wa=inv(RT*R);
wb=RT*yT;
w=(wa*wb)';
%����Ч�������б�׼�����鿴ͼ���������֤
z=w(1,1)+w(1,2).*zhongx+w(1,3).*log(1+zhongx);
z=mapminmax(z,-1,1);

%�õ���׼�����ϵ����������Ч��Χ�����ֵ��Ȩֵ
w1=w(1,1);
w2=w(1,2);
w3=w(1,3);
xm=mean(z);
a=[xl, xu ,xm ,w1 ,w2 ,w3];
end







