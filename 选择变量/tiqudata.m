function [az,laz]=tiqudata(time,para,value)
%�ú����Ĺ�������ȡһ����������Ҫ�õ��ı���
%���룺
%     time����������ʱ�䣬�ɸ�����Ҫ����
%     para����������
%     value��������ֵ
%�����
%     az����Ҫ��ȡ�ı�������
%     laz����ȡ�ı�������ĳ���

vari={{'Height'},...
    {'HCT'},{'PaCO2'},{'ALP'},{'HR'},{'PaO2'},{'ALT'},{'K'},...
    {'pH'},{'AST'},{'Lactate'},{'Platelets'},{'Bilirubin'},...
    {'Mg'},{'MAP'},{'RespRate'},{'BUN'},{'SaO2'},{'Cholesterol'},...
    {'SysABP'},{'Creatinine'},{'Na'},{'DiasABP'},{'NIDiasABP'},...
    {'Temp'},{'FiO2'},{'NIMAP'},{'Urine'},{'GCS'},{'NISysABP'},...
    {'WBC'},{'Glucose'},{'Weight'},{'HCO3'}};

for as=1:length(vari)
    asaps_var=vari{as};%������ȡ��������
    asig_ind= value.*0;
    for ia=1:length(asaps_var)
        asig_ind=asig_ind | strcmp(asaps_var(ia),para);
    end
    al=find(asig_ind==1);
    all(as)=length(al);
    atmp_data(as,1:all(as))=value(asig_ind);%��ȡ�����б�����˳����ֵ   
end
%����vari�еı��������趨��ֵ��ȡ���ñ���
az=atmp_data(1,:);
laz=length(az);

end



